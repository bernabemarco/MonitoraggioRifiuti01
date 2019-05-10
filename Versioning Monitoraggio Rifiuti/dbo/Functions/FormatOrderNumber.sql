
CREATE FUNCTION [dbo].[FormatOrderNumber] (

    @number decimal(38,15)
)   RETURNS varchar(256)
AS  BEGIN 

DECLARE @parsetxt varchar(50)
 
	IF @number IS NULL 
		RETURN  '{ERR-null passed}' 

	SET @parsetxt = CONVERT(varchar(100),CAST(@number as money),1)
	SET @parsetxt = REPLACE(@parsetxt,'.00','')
	SET @parsetxt = REPLACE(@parsetxt,',','.')
	SET @parsetxt = REPLICATE('0', 10 - LEN(@parsetxt)) + @parsetxt

RETURN @parsetxt
 
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[FormatOrderNumber] TO [Metodo98]
    AS [dbo];

