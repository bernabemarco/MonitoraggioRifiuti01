
CREATE FUNCTION [dbo].[Z_Costo_Ultimo](@Codart varchar(80), @Data datetime)
RETURNS decimal(19,6)
AS  
BEGIN 
	Declare @Risultato decimal(19,6)
	
	set @Risultato = 0
	set @Risultato = (select top 1 prezzoeuro from storicoprezziarticolo where codarticolo=@codart and data<=@data and tipoprezzo='F' order by data desc )
	set @Risultato = coalesce(@Risultato,0)
	 
	RETURN  @Risultato

ErrorHandler:
	return 0
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[Z_Costo_Ultimo] TO [Metodo98]
    AS [dbo];

