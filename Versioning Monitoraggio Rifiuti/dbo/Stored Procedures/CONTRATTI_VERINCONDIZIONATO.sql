
CREATE PROCEDURE [dbo].[CONTRATTI_VERINCONDIZIONATO] 
	-- Add the parameters for the stored procedure here
	@RIFPROGRESSIVO decimal(10,0),
	@RIFRIGA int,
	@RIFRIGAPERC int,
	@RES int OUTPUT,
	@ERRORNR int OUTPUT,
	@ERRORMS nvarchar(2048) OUTPUT
AS
BEGIN

	declare @righeSel int
	declare @cli varchar(7)
	declare @ripCFattInLiq as smallint

	print 'Start'

	SET @RES = 1
		
	Select	@ripCFattInLiq = LiqIntestaCFFatt
	From	CONTRATTI_CL 
	Where	RIFPROGRESSIVO = @RIFPROGRESSIVO and NRRIGA = @RIFRIGA 
	
	if @ripCFattInLiq = 1 
		begin
			select	@cli = codcontofatt
			From	anagraficariservaticf 
			Where	Esercizio in (Select ESERCIZIO From TESTE_CONTRATTI Where PROGRESSIVO In (@RIFPROGRESSIVO))
			And     CODCONTO In (Select CODICE From TESTE_CONTRATTI Where PROGRESSIVO In (@RIFPROGRESSIVO))
		end
	else
		begin
			select @cli = CODICE From TESTE_CONTRATTI Where PROGRESSIVO In (@RIFPROGRESSIVO)
		end
	
	print @cli
	
	-- Controllo delle scadenze --
	--Begin Try

	--	declare @ggmediscadenze decimal(16,6)

	--	-- recupero il numero di scadenze per quel cliente di contratto --
	--	declare @numscad int

	--	Select	@numscad = count(*)
	--	From	tabscadenze s
	--	where 	s.esercizio In (Select ESERCIZIO From TESTE_CONTRATTI Where PROGRESSIVO In (@RIFPROGRESSIVO))
	--	and		s.codclifor = @cli
	--	and		s.esito in (1,2,3,4)
	--	and     s.STATOSCADENZA <> 1 
		
	--	print @numscad
		
	--	-- recupera il valore totale delle scadenze --
	--	declare @ggscadenze decimal(16,6)
		
	--	Select @ggscadenze = sum(case s.esito
	--								when 1 then datediff(dd,s.datascadenza,getdate())
	--								when 2 then datediff(dd,s.datascadenza,s.datapageff)
	--								when 3 then datediff(dd,s.datascadenza,'9999-12-31')
	--								when 4 then datediff(dd,s.datascadenza,s.datapageff)					
	--							 end
	--							) 
	--	from tabscadenze s
	--	where 	s.esercizio In (Select ESERCIZIO From TESTE_CONTRATTI Where PROGRESSIVO In (@RIFPROGRESSIVO))
	--	and		s.codclifor = @cli
	--	and		s.esito in (1,2,3,4)
	--	and     s.STATOSCADENZA <> 1
		
	--	print @ggscadenze

	--	if (@numscad = 0) -- per evitare division by 0
	--	begin
	--		set @numscad = 1
	--	end			

	--	set @ggmediscadenze = @ggscadenze/@numscad		
	--	print @ggmediscadenze	
		
	--	Select ggtolleranza from contratti_cl 
	--    where rifprogressivo = @RIFPROGRESSIVO 
	--	and nrriga=@RIFRIGA 
	--	and ggtolleranza < @ggmediscadenze 
	--	and ggtolleranza <> 0

	--	if @@ROWCOUNT > 0
	--		begin

	--			Set @RES = 0

	--			if @RIFRIGAPERC>0 

	--				begin

	--					update	CONTRATTICL_QTA 
	--					Set		PREMIONONVALIDO = 1 
	--					Where	RIFPROGRESSIVOCL = @RIFPROGRESSIVO
	--					And     RIFPROGRESSIVO = @RIFRIGA
	--					And     NRRIGA = @RIFRIGAPERC
						
	--				end

	--			else

	--				begin

	--					update	CONTRATTI_CL
	--					Set		PREMIONONVALIDO = 1 
	--					Where	RIFPROGRESSIVO = @RIFPROGRESSIVO
	--					And     NRRIGA = @RIFRIGA

	--				end

	--			return

	--		end


	--End Try

	--Begin Catch

	--	Set @ERRORNR = ERROR_NUMBER()
	--	Set @ERRORMS = ERROR_MESSAGE()
	--	Set @RES =0		

	--End Catch


	-- Controllo dell'importo delle note di credito --
	-- 1)mette in join le condizioni con le teste filtrando per le condizioni per quel progressivo
	--   testa,riga per quel cliente, sul risultato fa l'having per i totali documenti < all'importo impostato come limite
	Begin Try
		
		-- Verifica se trattai si premio % o a valore --
		declare @isPerc smallint
		declare @valore decimal(19,6)

		Select	@isPerc = BOLISPERC,
				@valore = VALORE 
		From	CONTRATTI_CL 
		Where	RIFPROGRESSIVO = @RIFPROGRESSIVO and NRRIGA = @RIFRIGA 
		
-- se a %
		if (@isPerc = 1)
			begin

				-- Controlla premio a percentuali --
				Select		COND.PERCENTUALE,SUM(TESTE.TOTIMPONIBILE) As TOTIMP,SC.CONSUNTIVO,SC.DADATA,SC.ADATA
				From        TESTEDOCUMENTI TESTE
				Inner join  CONTRATTIDOC_NCIMP COND
				On          COND.TIPODOC = TESTE.TIPODOC
				And         COND.RIFPROGRESSIVO = @RIFPROGRESSIVO
				And			COND.NRRIGA = @RIFRIGA
				Inner join  CONTRATTICL_QTA SC
				On			SC.RIFPROGRESSIVOCL= @RIFPROGRESSIVO
				And         SC.RIFPROGRESSIVO = @RIFRIGA
				Where       TESTE.CODCLIFOR  in  (Select CODICE From TESTE_CONTRATTI Where PROGRESSIVO In (@RIFPROGRESSIVO))
				And         TESTE.ESERCIZIO In (Select ESERCIZIO From TESTE_CONTRATTI Where PROGRESSIVO In (@RIFPROGRESSIVO))
				And         TESTE.DATADOC between SC.DADATA And SC.ADATA
				And         SC.NRRIGA = @RIFRIGAPERC
				Group By    COND.PERCENTUALE,SC.CONSUNTIVO,SC.DADATA,SC.ADATA
				Having      (SC.CONSUNTIVO/SUM(TESTE.TOTIMPONIBILE)*100) > COND.PERCENTUALE

				set @righeSel = @@ROWCOUNT

				print 'Analisi SottoCondizioni percentuale'

				if (@righeSel > 0)  -- Significa che c'è almeno qualche riga che supera quindi non va bene --
					begin
					
						Set @RES = 0
					
					end
				
				-- else

						-- Significa, o che non ho messo condizioni quindi CONTRATTIDOC_NCIMP non contiene condizioni
						-- o che non ci sono sottorighe quindi CONTRATTICL_QTA è vuota
						-- o che tutti gli importi dei documenti sono inferiori alle condizioni, quindi ok e RES rimane =1

				-- Aggiorna lo stato del premio --
				if @RES = 0 
					begin
						update	CONTRATTICL_QTA 
						Set		PREMIONONVALIDO = 1 
						Where	RIFPROGRESSIVOCL = @RIFPROGRESSIVO
						And     RIFPROGRESSIVO = @RIFRIGA
						And     NRRIGA = @RIFRIGAPERC
					end
				else
					begin
						update	CONTRATTICL_QTA 
						Set		PREMIONONVALIDO = 0 
						Where	RIFPROGRESSIVOCL = @RIFPROGRESSIVO
						And     RIFPROGRESSIVO = @RIFRIGA
						And     NRRIGA = @RIFRIGAPERC
					end

			end
			

-- se a valore
		if (@valore > 0)
			begin

				-- Controlla premio a percentuali --
				Select		COND.PERCENTUALE,SUM(TESTE.TOTIMPONIBILE) As TOTIMP,@valore
				From        TESTEDOCUMENTI TESTE
				Inner join  CONTRATTIDOC_NCIMP COND
				On          COND.TIPODOC = TESTE.TIPODOC
				And         COND.RIFPROGRESSIVO = @RIFPROGRESSIVO
				And			COND.NRRIGA = @RIFRIGA
				Where       TESTE.CODCLIFOR  in  (Select CODICE From TESTE_CONTRATTI Where PROGRESSIVO In (@RIFPROGRESSIVO))
				And         TESTE.ESERCIZIO In (Select ESERCIZIO From TESTE_CONTRATTI Where PROGRESSIVO In (@RIFPROGRESSIVO))
				Group By    COND.PERCENTUALE
				Having      (@valore/SUM(TESTE.TOTIMPONIBILE)*100) > COND.PERCENTUALE

				set @righeSel = @@ROWCOUNT

				print 'Analisi SottoCondizioni valore'

				if (@righeSel > 0)  -- Significa che c'è almeno qualche riga che supera quindi non va bene --
					begin
					
						Set @RES = 0
					
					end
				
				-- else

						-- Significa, o che non ho messo condizioni quindi CONTRATTIDOC_NCIMP non contiene condizioni
						-- o che tutti gli importi dei documenti sono inferiori alle condizioni, quindi ok e RES rimane =1

				-- Aggiorna lo stato del premio --
				if @RES = 0 
					begin
						update	CONTRATTI_CL
						Set		PREMIONONVALIDO = 1 
						Where	RIFPROGRESSIVO = @RIFPROGRESSIVO
						And     NRRIGA = @RIFRIGA
					end
				else
					begin
						update	CONTRATTI_CL
						Set		PREMIONONVALIDO = 0
						Where	RIFPROGRESSIVO = @RIFPROGRESSIVO
						And     NRRIGA = @RIFRIGA
					end

			end

	End Try

	Begin Catch

		Set @ERRORNR = ERROR_NUMBER()
		Set @ERRORMS = ERROR_MESSAGE()		
		Set @RES =0

	End Catch

END



GO
GRANT EXECUTE
    ON OBJECT::[dbo].[CONTRATTI_VERINCONDIZIONATO] TO [Metodo98]
    AS [dbo];

