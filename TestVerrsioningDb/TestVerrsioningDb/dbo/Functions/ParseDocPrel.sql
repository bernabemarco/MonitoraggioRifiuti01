﻿CREATE FUNCTION ParseDocPrel(@pRIFDOC VARCHAR(MAX)) RETURNS VARCHAR(MAX)  
AS
BEGIN
	DECLARE @RIFDOC VARCHAR(MAX)
	DECLARE @TMP VARCHAR(MAX)
	DECLARE @TMPRIFDOC VARCHAR(100)
	DECLARE @I SMALLINT

	SET @TMP = @pRIFDOC
	SET @RIFDOC = ''
	WHILE @TMP <> ''
		BEGIN
		SET @I = CHARINDEX(';', @TMP)
		IF @I > 0 
			BEGIN
			SET @TMPRIFDOC = LEFT(@TMP, @I - 1)
			IF CHARINDEX(@TMPRIFDOC, @RIFDOC) = 0 SET @RIFDOC = @RIFDOC + @TMPRIFDOC + ';'
			SET @TMP = SUBSTRING(@TMP, @I + 1, LEN(@TMP) - LEN(@TMPRIFDOC))
			END
		ELSE
			BEGIN
			IF CHARINDEX(@TMP, @RIFDOC) = 0 SET @RIFDOC = @RIFDOC + @TMP 
			SET @TMP = ''
			END
		END	
	RETURN @RIFDOC
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[ParseDocPrel] TO [Metodo98]
    AS [dbo];

