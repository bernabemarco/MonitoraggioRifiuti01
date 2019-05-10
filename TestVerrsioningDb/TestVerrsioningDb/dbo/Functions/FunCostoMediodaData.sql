

CREATE FUNCTION dbo.FunCostoMediodaData 
(
    -- Add the parameters for the function here
    @Codart varchar(50),
    @daData datetime ,
    @NoMovValore int = 1
)
RETURNS decimal(19,4)
AS
BEGIN
    -- Declare the return variable here
    
    
    DECLARE @Qta1Um decimal(16,6)
    DECLARE @TotNetto decimal(19,6)
    DECLARE @TotNettoEuro decimal(19,6)
    DECLARE @Result decimal(19,4)
    DECLARE @Esercizio decimal(5,0)
    SET @Esercizio = YEAR(getdate())
    -- Add the T-SQL statements to compute the return value here
         IF  @daData <> '' 
            BEGIN
                IF @NoMovValore = 1
                    BEGIN
                        SELECT @Qta1Um = SUM(QtaCarico) 
                            , @TotNetto = SUM(ValoreCarico) 
                            , @TotNettoEuro = SUM(ValoreCaricoEuro) 
                        FROM VistaGiacenze 
                        WHERE Esercizio = @Esercizio
                              AND @Codart = Codart AND DataMov >=  @daData AND ValoreCaricoEuro >=0
                         GROUP BY CodArt
                    END
                ELSE
                    BEGIN
                        SELECT @Qta1Um = SUM(QtaCarico) 
                            , @TotNetto = SUM(ValoreCarico) 
                            , @TotNettoEuro = SUM(ValoreCaricoEuro) 
                        FROM VistaGiacenze 
                        WHERE Esercizio = @Esercizio
                              AND @Codart = Codart AND DataMov >=  @daData  
                         GROUP BY CodArt
                    END 
            END
        ELSE
            BEGIN
                IF @NoMovValore = 1
                    BEGIN
                        SELECT @Qta1Um = SUM(QtaCarico) 
                            , @TotNetto = SUM(ValoreCarico) 
                            , @TotNettoEuro = SUM(ValoreCaricoEuro) 
                        FROM VistaGiacenze 
                        WHERE Esercizio = @Esercizio
                              AND @Codart = Codart  And ValoreCaricoEuro >=0
                         GROUP BY CodArt
                    END
                ELSE
                    BEGIN
                        SELECT @Qta1Um = SUM(QtaCarico) 
                            , @TotNetto = SUM(ValoreCarico) 
                            , @TotNettoEuro = SUM(ValoreCaricoEuro) 
                        FROM VistaGiacenze 
                        WHERE Esercizio = @Esercizio
                              AND @Codart = Codart 
                         GROUP BY CodArt
                    END
             END
      --      Set hSS = MXDB.dbCreaSS(hndDBArchivi, strSQL, TIPO_TABELLA)
        
        DECLARE @CalcolaPrezzoMedio decimal(19,6)
                ,@TotQtaCarico decimal(16,6)
                ,@TotValCarico decimal(19,6)
                ,@TotValCaricoEuro decimal(19,6)
        
         SET @TotQtaCarico = @Qta1Um
         SET @TotValCarico = @TotNetto
         SET @TotValCaricoEuro = @TotNettoEuro
        --  DECLARE @Um varchar(3)
            --SELECT @UM=UM FROM ArticoliUMPreferite WHERE CodArt=@Codart AND TipoUM=1
        
        --UM = MXDB.dbGetCampo(hSS, TIPO_SNAPSHOT, "UM", "")
        --Call MXDB.dbChiudiSS(hSS)
         DECLARE  @PrezzoMedioEuro decimal(19,6)
           
        If @TotQtaCarico <> 0 
            BEGIN
          --  @PrezzoMedio = TotValCarico / TotQtaCarico
                SET @PrezzoMedioEuro = @TotValCaricoEuro / @TotQtaCarico
            END
        Else
            BEGIN
           -- @PrezzoMedio = 0
                SET @PrezzoMedioEuro = 0
            END
        
        SET @Result = @PrezzoMedioEuro
    --SET @Result = 1
    -- Return the result of the function
    RETURN @Result
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[FunCostoMediodaData] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FunCostoMediodaData] TO [Metodo98]
    AS [dbo];

