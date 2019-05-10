

CREATE FUNCTION [dbo].[IE_FunFormatSconto](@s_xml varchar(max))
RETURNS nVARCHAR(6)
AS
BEGIN

DECLARE @Result nVARCHAR(6)
declare @x_xml  xml

    set @x_xml = @s_xml

    select 
        @Result =   (case when C.query('//PosChrStatus').value('.','varchar(1)') = 'C'
                        then '+(' + C.query('//PosChrPercentage').value('.','varchar(3)') + ')'
                        else '+' + C.query('//PosChrPercentage').value('.','varchar(3)') 
                     end)
    from
        @x_xml.nodes('/Chr') T(C)

    RETURN(ISNULL(@Result,''))
END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[IE_FunFormatSconto] TO [Metodo98]
    AS [dbo];

