
CREATE FUNCTION [Price].[FUNMaggArtVariant]
(
    @codart varchar(50),
    @VarEsplicite varchar(255)='',
    @List int=0,
    @Sep nvarchar(1) =''

)
RETURNS 
@ReturnTable TABLE 
(
    PERC decimal(16,9) DEFAULT 0,
    PREZZOEURO decimal(16,9) DEFAULT 0
)
AS
BEGIN
    IF @Sep =''
        SET @Sep =';'
    IF @VarEsplicite =''
        SET @VarEsplicite =(SELECT VARESPLICITE FROM ANAGRAFICAARTICOLI WHERE CODICE = @codart)

    
    
    
    
    DECLARE @TempTb TABLE (prezzo decimal(16,6), Perc decimal(16,6))
    DECLARE @MasterSep nvarchar(1) ='#',
            @MasterItem Varchar(50)
    IF charindex(@MasterSep, @codart) >0
        BEGIN
            SET @MasterItem = LEFT(@codart, charindex(@MasterSep, @codart)-1)
        END
    
    ------Start------------------------------------------------------------------------------------------------
    
    DECLARE @Articolo varchar(50)
        ,@PERC decimal(16,6) 
  
        ,@Variante varchar(255)
        ,@SEGNO nvarchar(1)
        ,@VARIANTE1 varchar(255)
        ,@VARIANTE2 varchar(255)
    
    
    DECLARE View4Insert  CURSOR FAST_FORWARD for 
        SELECT Articolo, PERC ,   Variante, SEGNO, VARIANTE1, VARIANTE2
        FROM  TabMaggiorazVar TMV
        Inner JOIN(SELECT Tipologia, Variante  FROM [dbo].[Split] (@VarEsplicite,@sep) Where Tipologia <>'') TP
        ON TMV.TIPOLOGIA = Tp.Tipologia 
        WHERE TmV.ARTICOLO = @MasterItem
        AND tmv.NRLISTINO = @List
		And Variante= TMV.VARIANTE1 
		GROUP BY Articolo, PERC ,   Variante, SEGNO, VARIANTE1, VARIANTE2

    OPEN View4Insert


    FETCH NEXT FROM View4Insert
    INTO @Articolo 
        ,@PERC  
        ,@Variante 
        ,@SEGNO 
        ,@VARIANTE1 
        ,@VARIANTE2 
        
        
    Declare @Row int
    SET @Row =1
    WHILE @@FETCH_STATUS = 0
        BEGIN

        

            DECLARE @return_value int,
                    @Result nvarchar(4000)

        
                --Segno "=" Standard ------
                
                INSERT INTO @TempTb
                SELECT CASE @SEGNO WHEN '=' THEN (Select  SUM(PERC) PERC FROM  TabMaggiorazVar TMV
                                                    Inner JOIN(SELECT Tipologia, Variante  FROM [dbo].[Split] (@VarEsplicite,@sep)
                                                                Where Tipologia <>'') TP
                                                 ON TMV.TIPOLOGIA = Tp.Tipologia 
                                                WHERE TmV.ARTICOLO = @MasterItem
                                                and TMV.NRLISTINO = @List
                                                and Variante= TMV.VARIANTE1
                                                and @Variante1= TMV.VARIANTE1 
                                                and MAGGNORMAL = 1
                                                and PERC <> 0
                                                and @SEGNO = Segno
                                                )   
                                            END Perc,
                      CASE @SEGNO WHEN '='THEN (Select SUM(PREZZO) PREZZO FROM  TabMaggiorazVar TMV
                                                    Inner JOIN(SELECT Tipologia, Variante  FROM [dbo].[Split] (@VarEsplicite,@sep)
                                                                Where Tipologia <>'') TP
                                                ON TMV.TIPOLOGIA = Tp.Tipologia 
                                                WHERE TmV.ARTICOLO = @MasterItem
                                                and TMV.NRLISTINO = @List
                                                and Variante= TMV.VARIANTE1 
                                                and @Variante1= TMV.VARIANTE1 
                                                and MAGGNORMAL = 1
                                                and @SEGNO = Segno
                                                and Prezzo <>0 )   
                                            END Prezzo
                
                --Segno ">" Fuori Standard ---                          
                                            
                INSERT INTO @TempTb
                SELECT CASE @SEGNO WHEN '>' THEN (Select  SUM(PERC)  PERC FROM  TabMaggiorazVar TMV
                                                    Inner JOIN(SELECT Tipologia, Variante  FROM [dbo].[Split] (@VarEsplicite,@sep)
                                                                Where Tipologia <>'') TP
                                                    ON TMV.TIPOLOGIA = Tp.Tipologia 
                                                    WHERE TmV.ARTICOLO = @MasterItem
                                                    and TMV.NRLISTINO = @List
                                                    and Segno = @SEGNO
                                                    and MAGGNORMAL = 0
                                                    and PERC <> 0)   
                                            END Perc,
                        CASE @SEGNO WHEN '>'THEN (SELECT SUM(PREZZO) PREZZO FROM  TabMaggiorazVar TMV
                                                    Inner JOIN(SELECT Tipologia, Variante  FROM [dbo].[Split] (@VarEsplicite,@sep)
                                                                Where Tipologia <>'') TP
                                                    ON TMV.TIPOLOGIA = Tp.Tipologia 
                                                    WHERE TmV.ARTICOLO = @MasterItem
                                                    and Variante> TMV.VARIANTE1 
                                                    and Segno = @SEGNO
                                                    and MAGGNORMAL = 0
                                                    and Segno ='>'
                                                    and Prezzo <>0)   
                                            END Prezzo

                --Segno "<" Fuori Standard ---                          
                                            
                INSERT INTO @TempTb
                SELECT CASE @SEGNO WHEN '<' THEN (Select SUM(PERC) PERC FROM  TabMaggiorazVar TMV
                                                    Inner JOIN(SELECT Tipologia, Variante  FROM [dbo].[Split] (@VarEsplicite,@sep)
                                                                Where Tipologia <>'') TP
                                                    ON TMV.TIPOLOGIA = Tp.Tipologia 
                                                    WHERE TmV.ARTICOLO = @MasterItem
                                                    and TMV.NRLISTINO = @List
                                                    and Variante< TMV.VARIANTE1
                                                    and Segno = @SEGNO
                                                    and MAGGNORMAL = 0
                                                    and PERC <> 0)   
                                            END Perc,
                        CASE @SEGNO WHEN '<'THEN (Select  SUM(PREZZO)  PREZZO FROM  TabMaggiorazVar TMV
                                                    Inner JOIN(SELECT Tipologia, Variante  FROM [dbo].[Split] (@VarEsplicite,@sep)
                                                                Where Tipologia <>'') TP
                                                    ON TMV.TIPOLOGIA = Tp.Tipologia 
                                                    WHERE TmV.ARTICOLO = @MasterItem
                                                    and TMV.NRLISTINO = @List
                                                    and Variante< TMV.VARIANTE1 
                                                    and Segno = @SEGNO
                                                    and MAGGNORMAL = 0
                                                    and Prezzo <>0)   
                                            END Prezzo



                --Segno "><" Fuori Standard ---
                
                INSERT INTO @TempTb
                SELECT CASE @SEGNO WHEN '><' THEN (Select  SUM(PERC) PERC FROM  TabMaggiorazVar TMV
                                                    Inner JOIN(SELECT Tipologia, Variante  FROM [dbo].[Split] (@VarEsplicite,@sep)
                                                                Where Tipologia <>'') TP
                                                    ON TMV.TIPOLOGIA = Tp.Tipologia 
                                                    WHERE TmV.ARTICOLO = @MasterItem
                                                    and TMV.NRLISTINO = @List
                                                    and Variante between TMV.VARIANTE1 and TMV.VARIANTE2 
                                                    --and @Variante1 between TMV.VARIANTE1 and TMV.VARIANTE2 
                                                    --AND TMV.IDRIGA = @Row
                                                    and MAGGNORMAL = 0
                                                    and PERC <> 0)   
                                            END Perc,
                        CASE @SEGNO WHEN '><'THEN (Select  SUM(PREZZO) PREZZO FROM  TabMaggiorazVar TMV
                                                    Inner JOIN(SELECT Tipologia, Variante  FROM [dbo].[Split] (@VarEsplicite,@sep)
                                                                Where Tipologia <>'') TP
                                                    ON TMV.TIPOLOGIA = Tp.Tipologia 
                                                    WHERE TmV.ARTICOLO = @MasterItem
                                                    and TMV.NRLISTINO = @List
                                                    and Variante between TMV.VARIANTE1 and TMV.VARIANTE2
                                                    and Segno = @SEGNO
                                                    and MAGGNORMAL = 0
                                                    and Prezzo <>0)   
                                            END Prezzo
                                            
                                            
                        
            SET @Row= @Row +1
            
           FETCH NEXT FROM View4Insert
            INTO @Articolo 
                ,@PERC  
                   ,@Variante 
                ,@SEGNO 
                ,@VARIANTE1 
                ,@VARIANTE2   
        END

    CLOSE View4Insert
    DEALLOCATE View4Insert
    
    INSERT INTO @ReturnTable
    SELECT SUM(isnull(prezzo,0)) Prezzo, SUM(isnull(Perc,0)) Perc from @TempTb
    RETURN
 END
 
 

GO
GRANT SELECT
    ON OBJECT::[Price].[FUNMaggArtVariant] TO [Metodo98]
    AS [dbo];

