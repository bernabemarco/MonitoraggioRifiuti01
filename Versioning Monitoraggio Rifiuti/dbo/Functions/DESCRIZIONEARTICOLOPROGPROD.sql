create function [dbo].[DESCRIZIONEARTICOLOPROGPROD](@TIPORIGA int, @IDTESTA decimal(10,0), @IDRIGA int, @IDIMPEGNO int, @CODART varchar(50)) returns varchar(80) as
begin
	declare @DSCART varchar(80)

	-- documenti

	if (@TIPORIGA = 3 or @TIPORIGA=4 or @TIPORIGA=5)
	begin		
		declare CUR_DSCART cursor fast_forward read_only for 
			select DESCRIZIONEART from RIGHEDOCUMENTI RD where RD.IDTESTA=@IDTESTA and RD.IDRIGA=@IDRIGA
	end
	
	-- ordini di produzione
	if (@TIPORIGA = 6)
	begin
		declare CUR_DSCART cursor fast_forward read_only for
			select DESCRIZIONEART from RIGHEORDPROD RP where RP.IDTESTA=@IDTESTA and RP.IDRIGA=@IDRIGA
	end

	-- impegni di produzione
	if (@TIPORIGA = 7)
	begin
		declare CUR_DSCART cursor fast_forward read_only for
			select DESCRIZIONEART from IMPEGNIORDPROD IP where IP.IDTESTA=@IDTESTA and IP.IDRIGA=@IDRIGA and IP.IDIMPEGNO=@IDIMPEGNO
	end
	
	-- default
	if (@TIPORIGA not in (3,4,5,6,7))
	begin
		declare CUR_DSCART cursor fast_forward read_only for
			select DESCRIZIONE from ANAGRAFICAARTICOLI ART where ART.CODICE=@CODART
	end
	
	open CUR_DSCART
		
	fetch next from CUR_DSCART into @DSCART	
	if @@FETCH_STATUS <> 0
	begin
		set @DSCART = ''
	end
	
 	close CUR_DSCART
	deallocate CUR_DSCART
		
	return @DSCART

end

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[DESCRIZIONEARTICOLOPROGPROD] TO [Metodo98]
    AS [dbo];

