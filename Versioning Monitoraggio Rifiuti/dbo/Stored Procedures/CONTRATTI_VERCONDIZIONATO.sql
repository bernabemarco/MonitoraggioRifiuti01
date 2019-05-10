
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CONTRATTI_VERCONDIZIONATO]
	-- Add the parameters for the stored procedure here
	@RIFCONTRATTO Decimal(18,0),
	@RIFPROGRESSIVO Decimal(10,0), 
	@RES int OUTPUT,
	@ERRORNR int OUTPUT,
	@ERRORMS nvarchar(2048) OUTPUT
AS
BEGIN

	set @RES = 0

	begin try		

	-- Creazione della tabella temporanea di appoggio --
	create table #appoart(esercizio int,
						  contratto decimal(18),
						  progressivo decimal(10),
						  articolo varchar(80) )


	insert into #appoart (esercizio, contratto, progressivo, articolo )

	-- gruppo --
	Select		teste.esercizio,
				con.rifcontratto,
				grpcon.rifprogressivo,
				art.codice
	From		anagraficaarticoli art
	inner join	contrattigrp_con grpcon
	on			art.gruppo = grpcon.codice
	inner join  contratti_con con
	on          con.progressivo = grpcon.rifprogressivo
	inner join  teste_contratti teste
	on			teste.progressivo = con.rifcontratto

	union
	
	-- categoria --
	Select      teste.esercizio,
				con.rifcontratto,
				catcon.rifprogressivo,
				art.codice
	from		anagraficaarticoli art
	inner join  contratticat_con catcon
	on          art.categoria = catcon.codice
	inner join  contratti_con con
	on          con.progressivo = catcon.rifprogressivo
	inner join  teste_contratti teste
	on			teste.progressivo = con.rifcontratto

	union

	-- categoriastat --
	Select      teste.esercizio,
				con.rifcontratto,
				catscon.rifprogressivo,
				art.codice
	from		anagraficaarticoli art
	inner join  contratticatst_con catscon
	on          art.categoria = catscon.codice
	inner join  contratti_con con
	on          con.progressivo = catscon.rifprogressivo
	inner join  teste_contratti teste
	on			teste.progressivo = con.rifcontratto

	union

	-- famiglia reparto --
	select		teste.esercizio,
				con.rifcontratto,
				famrep.rifprogressivo,
				art.codice
	from		anagraficaarticoli art
	inner join  tp_extramag extra
	on			extra.codart = art.codice
	inner join  contrattifamrep_con famrep
	on          famrep.famiglia = extra.codfamigliapos
	and         famrep.reparto = extra.codrepartopos
	inner join  contratti_con con
	on			con.progressivo = famrep.rifprogressivo
	inner join  teste_contratti teste
	on			teste.progressivo = con.rifcontratto

	union

	-- gruppo prezzi --
	select		teste.esercizio,
				con.rifcontratto,
				grpprz.rifprogressivo,
				art.codice
	from		anagraficaarticoli art
	inner join	anagraficaarticolicomm comm
	on			comm.codiceart = art.codice
	and			comm.esercizio in (select esercizioattivo from tabutenti where userdb in (Select User_name()) )
	inner join  contrattigrpprz_con grpprz
	on			grpprz.codice = comm.gruppoprzpart
	inner join  contratti_con con
	on			con.progressivo = grpprz.rifprogressivo	
	inner join  teste_contratti teste
	on			teste.progressivo = con.rifcontratto

	union

	-- articoli --
	select		teste.esercizio,
				con.rifcontratto,
				artcon.rifprogressivo,
				art.codice
	from		anagraficaarticoli art
	inner join  contrattiart_con artcon
	on			art.codice like (replace(artcon.articolo,'?','_'))
	inner join  contratti_con con
	on			con.progressivo = artcon.rifprogressivo
	inner join  teste_contratti teste
	on			teste.progressivo = con.rifcontratto

	if @@ROWCOUNT > 0
		
		begin

			-- metto che il premio ?valido --
			update contrattirange_con 
			set premiononvalido = @RES
			where rifprogressivo = @RIFPROGRESSIVO
		
			select sum(totnettoriga) 
			from righedocumenti r 
			inner join testedocumenti t
			on t.progressivo  = r.idtesta
			where r. tipodoc in(Select tipodoc From contrattidoc_nccimp Where rifprogressivo=@RIFPROGRESSIVO)
			and t.codclifor in (Select codice from teste_contratti where progressivo = @RIFCONTRATTO)
			and t.esercizio in (Select esercizio from teste_contratti where progressivo = @RIFCONTRATTO)
			and codart in (select articolo from #appoart where contratto=@RIFCONTRATTO and progressivo = @RIFPROGRESSIVO)
			having sum(totnettoriga) >= (select valore from contrattidoc_nccimp where rifprogressivo = @RIFPROGRESSIVO)

			if @@ROWCOUNT > 0
				begin

					-- se il premio non ?valido --
					set @RES = 1
					update contrattirange_con set premiononvalido = @RES
					where rifprogressivo = @RIFPROGRESSIVO
				
				end


		end

	end try

	begin catch

		Set @ERRORNR = ERROR_NUMBER()
		Set @ERRORMS = ERROR_MESSAGE()
		Set @RES =0		

	end catch

END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[CONTRATTI_VERCONDIZIONATO] TO [Metodo98]
    AS [dbo];

