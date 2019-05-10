
-- =============================================
-- Author:      Pasquale De Biase
-- Create date: 06/03/2009
-- Description: Costo Medio Venduto
-- =============================================
CREATE FUNCTION dbo.FunCostoMedioGGRSdaData 
(
    -- Add the parameters for the function here
    @Codart Varchar(50),
    @Dep char(10)
)
RETURNS decimal(19,4)
AS
BEGIN
    DECLARE @Result decimal(19,4)
    DECLARE @giacenza decimal(16,6)
    DECLARE @Esercizio decimal(5,0)
    SET @Esercizio = YEAR(getdate())
    DECLARE @QTA decimal(16,6)
    DECLARE @Q1 decimal(16,6)
    DECLARE @P1 decimal(19,4)
    DECLARE @D1 datetime
    DECLARE @V1 decimal(19,4)
    SET @V1 = 0
    --SET @Dep ='mag01'
    DECLARE @Q2  decimal(16,6)
    DECLARE @P2 decimal(19,4)
    DECLARE @D2 datetime
    DECLARE @V2 decimal(19,4)
    SET @V2 = 0
    DECLARE @Q3 decimal(16,6)
    DECLARE @P3 decimal(19,4)
    DECLARE @D3 datetime
    DECLARE @V3 decimal(19,4)
    SET @V3 = 0
    DECLARE @Q4 decimal(16,6)
    DECLARE @P4 decimal(19,4)
    DECLARE @D4 datetime
    DECLARE @V4 decimal(19,4)
    SET @V4 = 0
    DECLARE @Q5 decimal(16,6)
    DECLARE @P5 decimal(19,4)
    DECLARE @D5 datetime
    DECLARE @V5 decimal(19,4)
    SET @V5 = 0
    DECLARE @C1 decimal(16,6)
            ,@C2 decimal(16,6)
            ,@C3 decimal(16,6)
            ,@C4 decimal(16,6)
            ,@C5 decimal(16,6)
    
    DECLARE @R1 decimal(16,6),
            @R2 decimal(16,6),
            @R3 decimal(16,6),
            @R4 decimal(16,6),
            @R5 decimal(16,6)
    
    DECLARE @CostoMedio Decimal(19,4)
    DECLARE @Giac decimal(16,6)
    
    SELECT @Giacenza=0
    IF @Dep <>''
        BEGIN
            SELECT @Giac=SUM(Carico+ResoDaScarico-Scarico-ResoDaCarico)
                 FROM VistaGiacenze where CodArt=@codart 
                 GROUP BY CodArt
        END
    ELSE
        BEGIN
            SELECT @Giac=SUM(Carico+ResoDaScarico-Scarico-ResoDaCarico)
                 FROM VistaGiacenze where CodArt=@codart 
                 GROUP BY CodArt
        END
        
        IF @Giac is null
            BEGIN
                SELECT @Giac=0
            END
        
        SELECT @Giacenza=@Giac
    SET @D1 = (SELECT top 1 
                data from dbo.STORICOPREZZIARTICOLO 
                WHERE codarticolo =@codart AND  TipoPrezzo ='F' and PrezzoEuro >=0 
                order by data desc)
    SET @P1 = (SELECT [dbo].[FunCostoMedioaData] ( @Codart, @D1, 1))
    SET @Q1 = (SELECT SUM(QtaCarico)  FROM VistaGiacenze 
                WHERE Esercizio = @Esercizio
                      AND @Codart = Codart AND DataMov = @D1)
    -----------------------------------------------------------
    SET @D2 = (SELECT top 1 
                data from dbo.STORICOPREZZIARTICOLO 
                WHERE codarticolo =@codart AND  TipoPrezzo ='F' and PrezzoEuro >=0 
                and Data < @D1
                order by data desc)
    SET @P2 = (SELECT [dbo].[FunCostoMedioaData] ( @Codart, @D2, 1))
    
    SET @Q2 = (SELECT SUM(QtaCarico)  FROM VistaGiacenze 
                WHERE Esercizio = @Esercizio
                      AND @Codart = Codart AND DataMov = @D2)
    ----------------------------------------------------------- 
    SET @D3 = (SELECT top 1 
                data from dbo.STORICOPREZZIARTICOLO 
                WHERE codarticolo =@codart AND  TipoPrezzo ='F' and PrezzoEuro >=0 
                and Data < @D2
                order by data desc)
    SET @P3 = (SELECT [dbo].[FunCostoMedioaData] ( @Codart, @D3, 1))
    SET @Q3 = (SELECT SUM(QtaCarico)  FROM VistaGiacenze 
                WHERE Esercizio = @Esercizio
                      AND @Codart = Codart AND DataMov = @D3)
    -----------------------------------------------------------
    SET @D4 = (SELECT top 1 
                data from dbo.STORICOPREZZIARTICOLO 
                WHERE codarticolo =@codart AND  TipoPrezzo ='F' and PrezzoEuro >=0 
                and Data < @D3
                order by data desc)
    SET @P4 = (SELECT [dbo].[FunCostoMedioaData] ( @Codart, @D4, 1))
    SET @Q4 = (SELECT SUM(QtaCarico)  FROM VistaGiacenze 
                WHERE Esercizio = @Esercizio
                      AND @Codart = Codart AND DataMov = @D4)
    -----------------------------------------------------------
    SET @D5 = (SELECT top 1 
                data from dbo.STORICOPREZZIARTICOLO 
                WHERE codarticolo =@codart AND  TipoPrezzo ='F' and PrezzoEuro >=0 
                and Data < @D4
                order by data desc)
    SET @P5 = (SELECT [dbo].[FunCostoMedioaData] ( @Codart, @D5, 1))
    SET @Q5 = (SELECT SUM(QtaCarico)  FROM VistaGiacenze 
                WHERE Esercizio = @Esercizio
                      AND @Codart = Codart AND DataMov = @D5)
                      
                      
                      
    -----------------------------------------------------------
    SET @QTA = (@giacenza - @Q1)
    SET @V1 = (@q1 * @p1)
    SET @C1 = (@giacenza - @q1)
    
    IF @C1 > 0
        Begin 
            SET @V1 = (@p1 * @q1) 
        End
    ELSE
        Begin
            SET @V1 = (@p1 * 1) 
        End
    SET @C2 = (@C1 - @Q2)
    
    IF @C2 > 0
        Begin
            SET @V2 = (@p2 * @q2)
        End
    ELSE
        Begin
            SET @V2 = (@C1 * @P2)
        End
    SET @C3 = (@C2 - @Q3)
    IF @C3 > 0
        Begin
            SET @V3 = (@p3 * @q3)
        End
    ELSE
        Begin
            SET @V3 = (@C2 * @P3)
        End
    SET @C4 = (@C3 - @Q4)
    IF @C4 > 0
        Begin
            SET @V4 = (@p4 * @q4)
        End
    ELSE
        Begin
            --Print @c3
            --Print @p4
            SET @V4 = (@C3 * @P4)
        End
    SET @C5 = (@C4 - @Q5)
        
    IF @C5 > 0
        Begin
            SET @V5 = (@p5 * @q5)
        End
    ELSE
        Begin
            --Print @c3
            --Print @p4
            SET @V5 = (@C4 * @P5)
        End
    --SET @C6 = (@C5 - @Q6)
    IF @V1 > 0
        Begin
            SET @CostoMedio = (@V1)
        End
    IF @V2 > 0
        Begin
            SET @CostoMedio = (@V1 + @V2)
        End
    IF @V3 > 0
        Begin
            SET @CostoMedio = (@V1 + @V2 + @V3)
        END
    IF @V4 > 0
        Begin
            SET @CostoMedio = (@V1 + @V2 + @V3 + @V4)
        End
    IF @V5 > 0
        Begin
            SET @CostoMedio = (@V1 + @V2 + @V3 + @V4 + @V5)
        End
    DECLARE @Res Decimal(19,4)
    DECLARE @daters as datetime
    
    SET @daters = @D5 
    
    IF @daters IS null or @daters = ''
        SET @Daters = @d4
    IF @daters IS null or @daters = ''
        SET @Daters = @d3
    IF @daters IS null or @daters = ''
        SET @Daters = @d2
    IF @daters IS null or @daters = ''
        SET @Daters = @d1
        
    
    --SET @P1 = (SELECT [dbo].[FunCostoMedioaData] ( @Codart, @D1, 1))
    
    --SET @CostoMedio = 
    --IF @GIACENZA <=0
    --  BEGIN
    --      SET @Res = @CostoMedio / 1
    --  END
    --ELSE
    --  BEGIN
    --      IF @C1 <=0
    --          BEGIN
    --              SET @Res = (@CostoMedio) / 1
    --          END
    --      ELSE
    --          BEGIN
    --              SET @Res = (@CostoMedio) / @GIACENZA
    --          END
    --  END
    Set @res = (SELECT [dbo].[FunCostoMediodaData] ( @Codart, @daters, 1))
    -- Add the T-SQL statements to compute the return value here
    if @Res IS NULL
        SET @RES=0
    SELECT @Result = @Res
   
    -- Return the result of the function
    RETURN @Result
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[FunCostoMedioGGRSdaData] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FunCostoMedioGGRSdaData] TO [Metodo98]
    AS [dbo];

