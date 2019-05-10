create function [dbo].[LEGGIANNOTAZIONIFASE](@TIPORIGA int, @IDTESTA decimal(10,0), @IDRIGA int) returns varchar(2000) as
begin
	declare @NOTERIGA varchar(2000)
	
	if (@TIPORIGA = 0)
		begin		
			-- ciclo emesso
			declare CUR_NOTE cursor fast_forward read_only for 
				select NOTERIGA from RIGHECICLOORDINE where PROGRESSIVO=@IDTESTA and NUMEROFASE=@IDRIGA
		end
	else		
		begin		
			-- ciclo standard
			declare CUR_NOTE cursor fast_forward read_only for 
				select NOTERIGA from RIGHECICLOPROD where PROGRESSIVO=@IDTESTA and NUMEROFASE=@IDRIGA
		end

	open CUR_NOTE
		
	fetch next from CUR_NOTE into @NOTERIGA	
	if @@FETCH_STATUS <> 0
	begin
		set @NOTERIGA = ''
	end
	
 	close CUR_NOTE
	deallocate CUR_NOTE
		
	return @NOTERIGA

end

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[LEGGIANNOTAZIONIFASE] TO [Metodo98]
    AS [dbo];

