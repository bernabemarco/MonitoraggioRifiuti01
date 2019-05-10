

CREATE FUNCTION SplitIDRIGHE_DRSV_MISS()
 RETURNS @Results TABLE (IDSESSIONE Decimal(5,0), 
                                                   PROGRESSIVODOC Decimal(10,0),
                                                    IDRIGADOC Int,
                    		             POSIZIONEDOC Int,
                                                      IDTESTADOCMISS Decimal(10,0))
			    

AS


    BEGIN

    DECLARE @IDSESSIONE                      DECIMAL(5,0) 
    DECLARE @PROGRESSIVODOC          DECIMAL(10,0)
    DECLARE @IDRIGADOC                        INT
    DECLARE @POSIZIONEDOC                 INT
    DECLARE @IDTESTADOCMISS            DECIMAL(10,0)

    DECLARE @StrIDRIGHE_DRSV  NVARCHAR(1000)
    
    DECLARE @Delimiter        NCHAR(1)
    DECLARE @INDEX          INT
    DECLARE @SLICE           NVARCHAR(500)

    DECLARE @String             NVARCHAR(185) 


        DECLARE TMPIDRIGHE_DRSV_Cursor CURSOR FOR
		SELECT IDSESSIONE,PROGRESSIVO,PROGRESSDOC,IDRIGHE_DRSV FROM TMPTabTesteDocumentiMiss WHERE IDRIGHE_DRSV <> ''
                
		
	OPEN TMPIDRIGHE_DRSV_Cursor

	FETCH NEXT FROM TMPIDRIGHE_DRSV_Cursor INTO @IDSESSIONE,@IDTESTADOCMISS,@PROGRESSIVODOC,@StrIDRIGHE_DRSV

	WHILE @@FETCH_STATUS = 0
		BEGIN


		                  -- HAVE TO SET TO 1 SO IT DOESNT EQUAL Z
		                  -- ERO FIRST TIME IN LOOP
		                 SELECT @INDEX = 1
		                 SELECT @Delimiter=','
		                 SELECT @String=@StrIDRIGHE_DRSV
		
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
					                      
				                          
			                                       BEGIN
										
			        			      SELECT @POSIZIONEDOC=POSIZIONE FROM TP_VISTARIGHEDOC_DRSV WHERE IDTESTA=@PROGRESSIVODOC AND IDRIGA=@SLICE
			
						       IF NOT (@POSIZIONEDOC=0 OR @POSIZIONEDOC IS NULL) 
			                                      
			                                                    BEGIN
			                                                            SELECT @IDRIGADOC=@SLICE                                 
			                                                             INSERT INTO @Results VALUES(@IDSESSIONE,@PROGRESSIVODOC,@IDRIGADOC,@POSIZIONEDOC,@IDTESTADOCMISS)
			                                                    END
						          
			                                       END   
			                                  
			                                       -- CHOP THE ITEM REMOVED OFF THE MAIN STRING
					             SELECT @STRING = RIGHT(@STRING,LEN(@STRING) - @INDEX)
				        	
						          -- BREAK OUT IF WE ARE DONE
					              IF LEN(@STRING) = 0 BREAK
		
				        END
		
                                        FETCH NEXT FROM TMPIDRIGHE_DRSV_Cursor INTO @IDSESSIONE,@IDTESTADOCMISS,@PROGRESSIVODOC,@StrIDRIGHE_DRSV

                     END


	   CLOSE TMPIDRIGHE_DRSV_Cursor
	   DEALLOCATE TMPIDRIGHE_DRSV_Cursor

    RETURN
END




GO
GRANT REFERENCES
    ON OBJECT::[dbo].[SplitIDRIGHE_DRSV_MISS] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[SplitIDRIGHE_DRSV_MISS] TO [Metodo98]
    AS [dbo];

