


CREATE PROCEDURE [dbo].[MB_SET_MB_PFA_Acquisti]

AS


BEGIN


DECLARE @DATADOC DATETIME, @VALOREPFA DECIMAL(19,6), @QTAGEST DECIMAL(16,6), @CODART VARCHAR(20)

    DECLARE @VALOREPFANEW DECIMAL(19,6), @QTAGESTNEW DECIMAL(16,6)

    DECLARE ViewPFA CURSOR LOCAL  FAST_FORWARD FOR
                        SELECT DATADOC, VALOREPFA, QTAGEST, CODART FROM MB_PFA_Acquisti  WITH (NOLOCK) 
                        WHERE 
                        --CODART= '5131'  --AND YEAR(datadoc) = 2012 --AND MONTH(datadoc) =11 --AND DAY(DATADOC)= 29
                        --AND  
                        TIPOINSERT=2
                        --AND DATADOC ='20120430'
                        ORDER BY DATADOC



                    OPEN ViewPFA
                    FETCH NEXT FROM ViewPFA
                    INTO @DATADOC, @VALOREPFA, @QTAGEST, @CODART


                    WHILE @@FETCH_STATUS = 0
                        BEGIN   
                            --IF @VALOREPFA =0
                                BEGIN
                                    --SELECT TOP 1 @VALOREPFANEW= VALOREPFA, @QTAGESTNEW=QTAGEST 
                                    --FROM MB_PFA_Acquisti WHERE CODART = @CODART 
                                    --AND DATADOC<= @DATADOC 


                                 --   SELECT   @CODART
                                    --, @DATADOC
                                    --, @VALOREPFANEW
                                    --, DATEADD(YEAR, DATEDIFF(YEAR, 0, DATEADD(YEAR, 0, @DATADOC)), 0)  

                                    SELECT  
                                    @VALOREPFANEW= SUM(VALOREPFA)
                                    , @QTAGESTNEW=SUM(QTAGEST) 
                                    FROM MB_PFA_Acquisti
                                    WHERE CODART = @CODART 
                                    AND DATADOC  BETWEEN 
                                    DATEADD(YEAR, DATEDIFF(YEAR, 0, DATEADD(YEAR, 0, @DATADOC)), 0)  
                                    AND @DATADOC 
                                    AND TIPOINSERT=1



                                 --SELECT   @CODART
                                    --, @DATADOC
                                    --, @VALOREPFANEW
                                    --,@QTAGESTNEW
                                    --, DATEADD(YEAR, DATEDIFF(YEAR, 0, DATEADD(YEAR, 0, @DATADOC)), 0)  

                                    --SELECT  SUM(VALOREPFA), SUM(QTAGEST) , @DATADOC
                                    --FROM MB_PFA_Acquisti
                                    --WHERE CODART = '5131' 
                                    --AND  DATADOC  BETWEEN 
                                    --DATEADD(YEAR, DATEDIFF(YEAR, 0, DATEADD(YEAR, 0,  @DATADOC)), 0)  
                                    --AND  @DATADOC
                                    --AND TIPOINSERT=1
                                    --AND @DATADOC ='20121130'



                                END
                            UPDATE MB_PFA_Acquisti SET QTAGEST= @QTAGESTNEW , ValorePFA =@VALOREPFANEW WHERE CODART=@CODART AND DATADOC=@DATADOC  AND @VALOREPFANEW <>0 AND TipoInsert=2

                            SET @VALOREPFANEW=0
                            SET @QTAGESTNEW=0

                        FETCH NEXT FROM ViewPFA
                                        INTO @DATADOC, @VALOREPFA, @QTAGEST, @CODART


                        END 
END


RETURN 0 



GO
GRANT EXECUTE
    ON OBJECT::[dbo].[MB_SET_MB_PFA_Acquisti] TO [Metodo98]
    AS [dbo];

