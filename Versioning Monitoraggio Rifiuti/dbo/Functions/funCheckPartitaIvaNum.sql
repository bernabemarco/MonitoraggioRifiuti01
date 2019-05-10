CREATE FUNCTION [dbo].[funCheckPartitaIvaNum]
(
@nstring NVARCHAR(30) 
)
RETURNS smallint
AS
BEGIN
    DECLARE @Result SMALLINT
    DECLARE @FirstChar NVARCHAR(1)
    SET @Result=0
    

    SET @FirstChar=LEFT(@nstring,1)
    IF @FirstChar IS NULL OR @FirstChar=''
       SET @FirstChar='A'    --Se viene passata una partita iva vuota metto A cos� la funzione ritorna False

    --IF ISNUMERIC(@FirstChar)<>0
    IF UNICODE(@FirstChar) BETWEEN 48 AND 55     -- Valore unicode/ascii dei numeri da 0 a 7
       SET @Result=1
    ELSE
       SET @Result=0

    RETURN @Result

END 
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[funCheckPartitaIvaNum] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[funCheckPartitaIvaNum] TO [Metodo98]
    AS [dbo];

