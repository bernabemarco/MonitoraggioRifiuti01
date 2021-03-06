﻿
CREATE PROCEDURE dbo.CHIAVEPRIMARIA @STRNOMETABELLA VARCHAR(128), @STRCAMPICHIAVE VARCHAR(200) OUTPUT AS
BEGIN
  DECLARE @STRRES VARCHAR(200)
  DECLARE @STRNOME VARCHAR(128)

  SET @STRRES=''
  DECLARE CURCOLONNE CURSOR FOR 
  SELECT column_name
  FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
  WHERE OBJECTPROPERTY(OBJECT_ID(constraint_name), 'IsPrimaryKey') = 1 AND table_name = @STRNOMETABELLA
  OPEN CURCOLONNE
  FETCH NEXT FROM CURCOLONNE INTO @STRNOME
  WHILE @@FETCH_STATUS = 0
    BEGIN
      IF @STRRES=''
        SET @STRRES=@STRNOME
      ELSE
        SET @STRRES=@STRRES + ';' + @STRNOME
      FETCH NEXT FROM CURCOLONNE INTO @STRNOME
   END
  SELECT @STRCAMPICHIAVE = @STRRES
  CLOSE CURCOLONNE
  DEALLOCATE CURCOLONNE
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[CHIAVEPRIMARIA] TO [Metodo98]
    AS [dbo];

