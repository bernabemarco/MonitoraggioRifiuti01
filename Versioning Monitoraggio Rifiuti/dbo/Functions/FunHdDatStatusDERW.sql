

CREATE FUNCTION [dbo].[FunHdDatStatusDERW](@Tipodoc varchar(3))
RETURNS nVARCHAR(3)
AS
BEGIN

DECLARE @Result nVARCHAR(3)
       
       SET @Result = ''

       

       select 
             @Result = (
                              case Tipo
                                  when 'B' then '345'
                                  when 'F' then ' '
                                  when 'N' then ' '
                                  else '231'
                              end
                             )
       from 
             PARAMETRIDOC 
       where 
             CODICE = @TipoDoc
       
       RETURN(@Result)
END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[FunHdDatStatusDERW] TO [Metodo98]
    AS [dbo];

