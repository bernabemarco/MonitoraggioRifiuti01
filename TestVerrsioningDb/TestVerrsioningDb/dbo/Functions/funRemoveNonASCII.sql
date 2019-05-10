CREATE FUNCTION [dbo].[funRemoveNonASCII]
(
@nstring NVARCHAR(MAX) 
)
RETURNS NVARCHAR(MAX)
AS
BEGIN

DECLARE @nchar NVARCHAR(1)
DECLARE @position INT 
 DECLARE @Result NVARCHAR(MAX)

SET @Result = ''
SET @position = 1

WHILE @position <= LEN(@nstring)

    BEGIN
        SET @nchar = SUBSTRING(@nstring, @position, 1)
        IF UNICODE(@nchar) >=32
           SET @Result = @Result + @nchar
        SET @position = @position + 1
    END
RETURN @Result
END
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[funRemoveNonASCII] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[funRemoveNonASCII] TO [Metodo98]
    AS [dbo];

