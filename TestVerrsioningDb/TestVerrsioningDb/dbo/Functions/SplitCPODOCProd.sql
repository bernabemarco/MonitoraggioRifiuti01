﻿
create FUNCTION SplitCPODOCProd ()
RETURNS @Results TABLE (Items NVARCHAR(500) )
AS


    BEGIN

    DECLARE @DOC1 NVARCHAR(60)
    DECLARE @DOC2 NVARCHAR(60)
    DECLARE @DOC3 NVARCHAR(60)
    DECLARE @DOC4 NVARCHAR(60)

    DECLARE @Delimiter NCHAR(1)
    DECLARE @INDEX INT
    DECLARE @SLICE NVARCHAR(500)

    DECLARE @String NVARCHAR(185)

    --Prelevo i Documenti    
             BEGIN
		SELECT  @DOC1=TIPIPOCONSDAPROD1 FROM TP_VINCOLIPIANIFICATORE WHERE PROGRESSIVO=1
		SELECT  @DOC2=TIPIPOCONSDAPROD2 FROM TP_VINCOLIPIANIFICATORE WHERE PROGRESSIVO=1
		SELECT  @DOC3=TIPIPOCONSDADOC3 FROM TP_VINCOLIPIANIFICATORE WHERE PROGRESSIVO=1
		SELECT  @DOC4=TIPIPOCONSDADOC4 FROM TP_VINCOLIPIANIFICATORE WHERE PROGRESSIVO=1
	END
	

	IF ((@DOC1 IS NULL)) 
		BEGIN
			SET @DOC1 = ''
		END

	IF ((@DOC2 IS NULL)) 
		BEGIN
			SET @DOC2 = ''
		END

	IF ((@DOC3 IS NULL)) 
		BEGIN
			SET @DOC3 = ''
		END

	IF ((@DOC4 IS NULL)) 
		BEGIN
			SET @DOC4 = ''
		END

    -- HAVE TO SET TO 1 SO IT DOESNT EQUAL Z
    --     ERO FIRST TIME IN LOOP
    SELECT @INDEX = 1
    SELECT @Delimiter=','
    SELECT @String=@DOC1 + CASE WHEN @DOC2<>''
			  THEN (',' + @DOC2)
			  ELSE @DOC2 END
		   	 + CASE WHEN @DOC3<>''
			  THEN (',' + @DOC3)
			  ELSE @DOC3 END
		   	 + CASE WHEN @DOC4<>''
			  THEN (',' + @DOC4)
			  ELSE @DOC4 END
	
	    WHILE @INDEX !=0
	        BEGIN
	            -- GET THE INDEX OF THE FIRST OCCURENCE OF THE SPLIT NCHARACTER
	            SELECT @INDEX = CHARINDEX(@Delimiter,@STRING)
	            
	            -- NOW PUSH EVERYTHING TO THE LEFT OF IT INTO THE SLICE VARIABLE
	            IF @INDEX !=0
	                SELECT @SLICE = LEFT(@STRING,@INDEX - 1)
	            ELSE
		        SELECT @SLICE = @STRING
	        	-- PUT THE ITEM INTO THE RESULTS SET
		        INSERT INTO @Results(Items) VALUES(@SLICE)
	        	
			-- CHOP THE ITEM REMOVED OFF THE MAIN STRING
		        SELECT @STRING = RIGHT(@STRING,LEN(@STRING) - @INDEX)
	        	
			-- BREAK OUT IF WE ARE DONE
		        IF LEN(@STRING) = 0 BREAK
		END
    RETURN
END

GO
GRANT SELECT
    ON OBJECT::[dbo].[SplitCPODOCProd] TO [Metodo98]
    AS [dbo];
