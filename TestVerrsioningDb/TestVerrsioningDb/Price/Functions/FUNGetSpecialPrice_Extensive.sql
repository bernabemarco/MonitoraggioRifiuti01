
CREATE FUNCTION [Price].[FUNGetSpecialPrice_Extensive] (
    @CodCliFor varchar(7) ='',
    @CodArt varchar(50) ='',
    @Qta decimal(16,6),
    @DataDoc datetime = NULL,
    @Esercizio Decimal(5,0) = 1900,
    @List decimal(5,0)=0,
    @UM varchar(3)='',
    @Operazionefase varchar(50)='' ,
    @VarEsplicite varchar(max) ='',
    @CustomScript varchar(max) ='',
    @ArtUsaPrzPrv bit,
    @CodDest decimal(5,0),
    @GruppoPrzArt int,
    @CodSettore decimal(5,0),
    @CodZona decimal(5,0),
    @CodCategoria decimal(5,0), 
    @GruppoPrvArt int,
    @ScontoArt1 varchar(10),
    @ScontoArt2 varchar(10),
    @ScontoArt3 varchar(10),
    @CliUsaPrzPrv bit,
    @GruppoPrzCli int,
    @GruppoPrvCli int,
    @Famiglia int,
    @Reparto int,   
    @ScontoCli1 varchar(10),
    @AppScRiga varchar(10),
    @AppScFinale varchar(6),
    @ListinoCli decimal(5, 0),
    @NrContratto decimal(10, 0),
    @PagCli varchar(5),
    @AddPlusVariant BIT,
    @CodFeature int
)
RETURNS @TempTable
 TABLE 
(Price decimal(19,6), PriceVal decimal(19,6),UM varchar(3), Progr decimal(12,0), OriginePrezzo int , codCambio DECIMAL(5,0))
--ENCRY--
As
BEGIN
    DECLARE @CodicePrimario VARCHAR(50)


    DECLARE @Result varchar(max)
    DECLARE @Price decimal(19,6)
    DECLARE @PriceVal decimal(19,6)
    DECLARE @CGFPrice Int
    DECLARE @FunCheckPrice4Item Smallint
    DECLARE @CheckPrice4Customer Smallint
    DECLARE @TypePrice Bit = 0
    DECLARE @SQLGenericwithprice nvarchar(max)
    DECLARE @SQLGenericiWithoutPrice nvarchar(max)
    DECLARE @SQLSelect nvarchar(max)
            ,@SQLFrom nvarchar(max)
            ,@PriceType as int = 0
            ,@UseNrListino decimal(5,0) 
            ,@NRList decimal(5,0)
			,@UMReturn As varchar(3)
            ,@Prezzo_Magg decimal(19,6)
            ,@Prezzo_MaggEuro decimal(19,6)
            ,@Progr decimal(12,0) = 0
    Declare @CodCambio decimal(5,0) = 0

    SET @CodicePrimario= SUBSTRING(@Codart, 0, CHARINDEX('#',@Codart,1))
    
                
    IF @Esercizio = 1900
        SET @Esercizio = YEAR(getdate())
    
    SET @FunCheckPrice4Item = (SELECT [Price].[FUSCheckSpecialPrice4Item] (@Codart, @Esercizio))
    SET @CheckPrice4Customer = (SELECT [Price].[FUSCheckSpecialPrice4Customer] (@CodClifor, @Esercizio))

    IF LEFT(@CodCliFor,1) = '?' OR  LEFT(@CodCliFor,1)='@'
        SET @CodClifor='C'

        BEGIN
        
            IF Len(@CodCliFor) = 7
                BEGIN
                    SELECT  TOP 1 @Progr = PT.PROGRESSIVO
                            ,@Prezzo_Magg = PT.IMPORTOVALUTA 
                            ,@Prezzo_MaggEuro = PT.IMPORTO 
                    FROM REGOLEPREZZIESTESI PT
                    WHERE (PT.CodCliFor =@CodCliFor) 
                            AND (@CodArt LIKE PT.CODARTTIPOLOGIA OR PT.CODART ='*' )
                            AND ((@VarEsplicite LIKE PT.VarEsplicite+'%') OR PT.VarEsplicite= '*')
                            AND ((@CodicePrimario = PT.CodicePrimario) OR PT.CodicePrimario='*')
                            AND ((@CodFeature = PT.CODFEATURE) OR PT.CODFEATURE =0)
                            AND (PT.CODGRUPPOPREZZIMAG =0 OR PT.CODGRUPPOPREZZIMAG =@GruppoPrzArt)
                            AND (PT.IMPORTOVALUTA <> 0 OR PT.IMPORTO <> 0) 
                            AND @Qta >=PT.QtaMinima  
                            AND (PT.UM='' OR PT.UM= @UM)
                            AND @DataDoc BETWEEN PT.InizioValidita AND PT.FineValidita
                            AND (PT.CODDESTINAZIONE =0 OR PT.CODDESTINAZIONE =@Coddest)
                            AND (PT.FAMIGLIA = 0 OR PT.FAMIGLIA =@Famiglia)
                            AND (PT.REPARTO = 0 OR PT.REPARTO = @Reparto)
                        
                    ORDER BY 
                        CASE 
                            WHEN CODART =  '*' and PT.CODGRUPPOPREZZIMAG  = 0  THEN 6
                            WHEN CODART =  ''  and PT.CODGRUPPOPREZZIMAG <> 0  THEN 4
                            WHEN CODART <> ''  and PT.CODGRUPPOPREZZIMAG  = 0  THEN 2
                            WHEN CODART =  '*' and PT.FAMIGLIA            = 0  THEN 5
                            WHEN CODART =  ''  and PT.FAMIGLIA           <> 0  THEN 3
                            WHEN CODART <> ''  and PT.FAMIGLIA            = 0  THEN 1
                        END 
                        , CODDESTINAZIONE DESC
                        ,(@Qta - QTAMINIMA) ASC
                END
                    
        
            IF @Progr = 0 And (@GruppoPrzCli  > 0  OR  @CodSettore > 0 OR @CodZona >0 OR @CodCategoria > 0)
    
                BEGIN
                    SELECT  TOP 1 @Progr = PT.PROGRESSIVO
                            ,@Prezzo_Magg = PT.IMPORTOVALUTA 
                            ,@Prezzo_MaggEuro = PT.IMPORTO 
                    FROM REGOLEPREZZIESTESI PT
                    WHERE 
                           ((@CodArt LIKE PT.CODARTTIPOLOGIA OR  PT.CODART = @codart  OR PT.CODART ='*' OR PT.Codart =''))
                            AND ((@VarEsplicite LIKE PT.VarEsplicite+'%') OR PT.VarEsplicite= '*')
                            AND ((@CodicePrimario = PT.CodicePrimario) OR PT.CodicePrimario='*')
                            AND ((@CodFeature = PT.CODFEATURE) OR PT.CODFEATURE =0)
                            AND (PT.CODGRUPPOPREZZIMAG =0  OR PT.CODGRUPPOPREZZIMAG =@GruppoPrzArt) 
                            AND (PT.IMPORTOVALUTA <> 0 OR PT.IMPORTO <> 0)
                            AND @Qta >=PT.QtaMinima  
                            AND (PT.UM='' OR PT.UM= @UM)
                            AND @DataDoc BETWEEN PT.InizioValidita AND PT.FineValidita 
                            AND (PT.CODDESTINAZIONE =0 OR PT.CODDESTINAZIONE =@Coddest)
                            AND (PT.CODGRUPPOPREZZICF =@GruppoPrzCli OR PT.CODGRUPPOPREZZICF =0)
                            AND (PT.CODSETTORE =@CodSettore OR PT.CODSETTORE =0)
                            AND (PT.CODZONA =@CodZona OR PT.CODZONA =0) 
                            AND (PT.CODCATEGORIA =@CodCategoria OR PT.CODCATEGORIA =0) 
                            AND (PT.FAMIGLIA = 0 OR PT.FAMIGLIA =@Famiglia)
                            AND (PT.REPARTO = 0 OR PT.REPARTO = @Reparto)   
                            AND (PT.CODGRUPPOPREZZICF + PT.CODSETTORE + PT.CODCATEGORIA  + PT.CODZONA) >0                       
                    ORDER BY 
                        CASE 
                            WHEN CODART =  '*' and PT.CODGRUPPOPREZZICF  <> 0  THEN 9  
                            WHEN CODART =  ''  and PT.CODGRUPPOPREZZICF  <> 0  THEN 6  
                            WHEN CODART <> ''  and PT.CODGRUPPOPREZZICF  <> 0  THEN 3  
                            -----------------------------------------------------------
                            WHEN CODART =  '*' and PT.CODGRUPPOPREZZIMAG  = 0  THEN 8  
                            WHEN CODART =  ''  and PT.CODGRUPPOPREZZIMAG <> 0  THEN 5  
                            WHEN CODART <> ''  and PT.CODGRUPPOPREZZIMAG  = 0  THEN 2  
                            ---------------------------------------------------------
                            WHEN CODART =  '*' and PT.FAMIGLIA            = 0  THEN 7  
                            WHEN CODART =  ''  and PT.FAMIGLIA           <> 0  THEN 4 
                            WHEN CODART <> ''  and PT.FAMIGLIA            = 0  THEN 1  
                        END 
                        ,PT.CODGRUPPOPREZZIMAG,PT.CODSETTORE DESC, PT.CODZONA DESC, PT.CODCATEGORIA DESC
                        ,(@Qta - QTAMINIMA) ASC
                END 
            
            SET @CodClifor = LEFT(@CodClifor,1)
            
            
          
            IF @Progr = 0 
                BEGIN
                    SELECT  TOP 1 @Progr = PT.PROGRESSIVO
                            ,@Prezzo_Magg = PT.IMPORTOVALUTA 
                            ,@Prezzo_MaggEuro = PT.IMPORTO 
                    FROM REGOLEPREZZIESTESI PT
                    WHERE  (Pt.CODCLIFOR ='*' OR Pt.CODCLIFOR= @CodClifor)  
                            AND ((@CodArt LIKE PT.CODARTTIPOLOGIA OR PT.CODART = @codart  OR PT.CODART ='*' ))
                            AND ((@VarEsplicite LIKE PT.VarEsplicite+'%') OR PT.VarEsplicite= '*')
                            AND ((@CodicePrimario = PT.CodicePrimario) OR PT.CodicePrimario='*')
                            AND ((@CodFeature = PT.CODFEATURE) OR PT.CODFEATURE =0)
                            AND (PT.CODGRUPPOPREZZIMAG =0  OR PT.CODGRUPPOPREZZIMAG =@GruppoPrzArt) 
                            AND (PT.IMPORTOVALUTA <> 0 OR PT.IMPORTO <> 0)
                            AND @Qta >=PT.QtaMinima  
                            AND (PT.UM='' OR PT.UM= @UM)
                            AND @DataDoc BETWEEN PT.InizioValidita AND PT.FineValidita 
                            AND (PT.CODDESTINAZIONE =0 OR PT.CODDESTINAZIONE =@Coddest)
                            AND (PT.FAMIGLIA = 0 OR PT.FAMIGLIA =@Famiglia)
                            AND (PT.REPARTO = 0 OR PT.REPARTO = @Reparto)                           
                    ORDER BY 
                        CASE 
                            WHEN CODART =  '*' and PT.CODGRUPPOPREZZIMAG  = 0  THEN 6
                            WHEN CODART =  ''  and PT.CODGRUPPOPREZZIMAG <> 0  THEN 4
                            WHEN CODART <> ''  and PT.CODGRUPPOPREZZIMAG  = 0  THEN 2
                            WHEN CODART =  '*' and PT.FAMIGLIA            = 0  THEN 5
                            WHEN CODART =  ''  and PT.FAMIGLIA           <> 0  THEN 3
                            WHEN CODART <> ''  and PT.FAMIGLIA            = 0  THEN 1
                        END 
                        ,PT.CODSETTORE DESC, PT.CODZONA DESC, PT.CODCATEGORIA DESC
                        ,(@Qta - QTAMINIMA) ASC
                END 
            
        END 
    
    ---------------------------------Calcolo Prezzo ----------------------------------------------
    DECLARE @Prezzo decimal(19, 6),
        @PrezzoValuta decimal(19, 6),
        @NrListino decimal(5, 0),
        @QtaMinima decimal(16, 6),
        @Sconto varchar(20),
        @ScontoAgg varchar(20),
        @Tipo decimal(5, 0),
        @TipoArrot varchar(1),
        @ArrEuro decimal(19,4),
        @ArrVal decimal(19,4),
        @TipoRiga decimal(5,0)
        
        SET @TipoRiga = (SELECT  TIPORIGA FROM REGOLEPREZZIESTESI PT WHERE  PROGRESSIVO=@Progr) 
        SET @TipoRiga = (SELECT CASE @TipoRiga 
                            WHEN  1 THEN 0
                            WHEN  2 THEN -1
                            WHEN  3 THEN -2
                            END)
    IF @Progr > 0
        BEGIN

    
            If @TipoRiga > 0
                BEGIN 
                                    
                        SELECT  @Prezzo = Importo
                                ,@PrezzoValuta = IMPORTOVALUTA
                                ,@QtaMinima = QtaMinima 
                                ,@Tipo = TIPORIGA 
                                ,@TipoArrot = TipoArrot 
                                ,@ArrEuro = ARROTONDA 
                                ,@ArrVal = ARROTAVALUTA 
                            FROM 
                                REGOLEPREZZIESTESI 
                            WHERE Progressivo =  @Progr
                   
                END
    
            
            IF @TipoRiga = 0 
                        BEGIN
                    
                            
                            IF @Progr > 0
                                    BEGIN
                    
                                        
                                        SELECT  @Prezzo = Importo
                                            ,@PrezzoValuta = IMPORTOVALUTA
                                            ,@QtaMinima = QtaMinima 
                                            ,@Tipo = TIPORIGA 
                                            ,@TipoArrot = TipoArrot 
                                            ,@ArrEuro = ARROTONDA 
                                            ,@ArrVal = ARROTAVALUTA 
                                        FROM 
                                            REGOLEPREZZIESTESI 
                                        WHERE Progressivo =  @Progr                                 
                                        
                                    
                                            SET @Price = @Prezzo
                                            SET @PriceVal = @PrezzoValuta
                                    END
                                ELSE
                                    BEGIN
                                        SET @NRList = @List


                                            --Sviluppo #3994 -----------------------------------------------
                                            SELECT  @Price= PREZZOEURO, @PrezzoValuta=PREZZO FROM Price.FUNgetPricetoDate(@Codart,@DataDoc,@List,@UM)

                                        IF @Price = 0
                                            SELECT @Prezzo= PREZZOEURO, @PrezzoValuta=PREZZO    FROM Listiniarticoli WHERE UM=@UM AND CODART =@CodArt And NRLISTINO = @List
                                            ----------------------------------------------------------------        
                            


                                      
                                        SET @Price = @Prezzo
                                        SET @PriceVal = @PrezzoValuta
            
                                    END 
                                IF @List > 0 
                                    BEGIN
                                        SET @CodCambio = (SELECT CodCambio FROM TabListini WHERE NrListino=@List)
                                    END
    
                                    
                                Else
                                    BEGIN
                                        SET @CodCambio = 0
                                    END
                        END
        
                        
                 ELSE

                        BEGIN
                                SELECT  @Prezzo = Importo
                                    ,@PrezzoValuta = IMPORTOVALUTA
                                    ,@QtaMinima = QtaMinima 
                                    ,@Tipo = TIPORIGA 
                                    ,@TipoArrot = TipoArrot 
                                    ,@ArrEuro = ARROTONDA 
                                    ,@ArrVal = ARROTAVALUTA 
                                FROM 
                                    dbo.REGOLEPREZZIESTESI 
                                WHERE Progressivo =  @Progr
                                        
                                        
                                        
                                        
                                --Sviluppo #3994 -----------------------------------------------
                                SELECT  @Price= PREZZOEURO, @PriceVal=PREZZO FROM Price.FUNgetPricetoDate(@Codart,@DataDoc,@List,@UM)

                                IF @Price = 0
                                    SELECT @Price= PREZZOEURO, @PriceVal=PREZZO       FROM Listiniarticoli WHERE UM=@UM AND CODART =@CodArt AND NRLISTINO = @List           
                                ----------------------------------------------------------------        
                                                                        
                            
                            
                                IF @List > 0  
                                    BEGIN
                                        SET @CodCambio = (SELECT CodCambio FROM TabListini WHERE NrListino=@List)
                                    END
                                ELSE
                                    BEGIN
                                        SET @CodCambio = (SELECT CodCambio FROM TabListiniTrasformazione WHERE NrListino=@List)
                                    

                                        --Sviluppo #3994 -----------------------------------------------
                                        SELECT  @Price= PREZZOEURO, @PrezzoValuta=PREZZO FROM Price.FUNgetPricetoDate(@Codart,@DataDoc,@List,@UM)

                                        IF @Price = 0
                                        SELECT @Prezzo= PREZZOEURO, @PrezzoValuta=PREZZO  FROM Listiniarticoli WHERE UM=@UM AND CODART =@CodArt And NRLISTINO = @List   
                                        ----------------------------------------------------------------


                            
                                        SET @Price = @Prezzo
                                        SET @PriceVal = @PrezzoValuta
                                    END
                            IF @TipoRiga = -1
                                BEGIN
                                    SET @Price = @Price + @Prezzo
                                    SET @PriceVal = @PriceVal + @PrezzoValuta
                                END
                            IF @TipoRiga = -2
                                BEGIN
                                    SET @Price = @Price - @Prezzo
                                    SET @PriceVal = @PriceVal - @PrezzoValuta
                                END
                            IF @TipoRiga = -3
                                BEGIN
                                    SET @Price = @Price * (100 + @Prezzo) / 100
                                    SET @PriceVal = @PriceVal * (100 + @PrezzoValuta) /100
                                END
                    END
                            

        END       
    ELSE 
        BEGIN
            If @Codart <> '' 
                BEGIN
    
                    IF @List <> 0 
                        BEGIN
                            IF @TypePrice = 0
                                BEGIN

                                
                                    --Sviluppo #3994 -----------------------------------------------
                                    SELECT  @Price= PREZZOEURO, @PriceVal=PREZZO FROM Price.FUNgetPricetoDate(@Codart,@DataDoc,@List,@UM)

                                    IF @Price = 0
                                        SELECT @Price= PREZZOEURO, @PriceVal=PREZZO  FROM Listiniarticoli WHERE UM=@UM AND CODART =@CodArt And NRLISTINO = @List
                                    ----------------------------------------------------------------

                                END
                            ELSE
                                BEGIN
                                    IF @TypePrice = 1

                                        --Sviluppo #3994 -----------------------------------------------
                                        SELECT  @Price= PREZZOEURO, @PriceVal=PREZZO FROM Price.FUNgetPricetoDate(@Codart,@DataDoc,@List,@UM)

                                        IF @Price = 0
                                            SELECT @Price= PREZZOEURO, @PriceVal=PREZZO FROM Listiniarticoli WHERE UM=@UM AND CODART =@CodArt And NRLISTINO = @List
                                        ----------------------------------------------------------------

                                        
                                    
                                END
                            END
                        END       
    
                    ELSE
                        BEGIN
        
                            DECLARE @TipoClifor As varchar(1)
                        
                            IF Left(@CodArt, 1) = 'F' 
                                SET @TipoClifor = 'F'
                            ELSE
                                SET @TipoClifor = 'C'
    
							-- Anomalia 100443 -------------------------------------------------------------------------------------------
							SELECT @Price = PrezzoRigheDocEuro,@PriceVal= PrezzoRigheDoc , @UMReturn=ISNULL(RD.UMPREZZO, '')
                                                FROM STORICOPREZZIARTICOLO 
												LEFT OUTER JOIN StoricoMag ST ON ST.PROGRESSIVO = STORICOPREZZIARTICOLO.RifStoricomag
												INNER JOIN RigheDocumenti RD ON RD.IdTesta=ST.IdTesta AND RD.IdRiga=ST.RigaDoc
												WHERE codarticolo = @codart and TIPOPREZZO = @TipoClifor
                            IF @UM<>@UMReturn
                                SET @UM=@UMReturn
                            

							
        
                        END
            END
    
    IF @ArtUsaPrzPrv >0 and @AddPlusVariant >0
        BEGIN
            DECLARE @PrezzoEuroPlus decimal(16,6)
            DECLARE @PercPlus decimal(16,6)
            
            SELECT @PrezzoEuroPlus = PREZZOEURO, @PercPlus = PERC FROM [price].[FUNMaggArtVariant] (@CodArt,'',@List,'')
            IF @PrezzoEuroPlus >0
                BEGIN
                    IF @CodCambio = 1
                        BEGIN
                            SET @Price = @Price + @PrezzoEuroPlus
                            SET @PriceVal = @PriceVal + @PrezzoEuroPlus
                        END
                    ELSE
                        BEGIN
                            SET @Price=0
                            SET @PriceVal = @PriceVal + @PrezzoEuroPlus
                        END
                END

            IF @PercPlus >0
                BEGIN
                    IF @CodCambio = 1
                        BEGIN
                            SET @Price = @Price * (100 + @PercPlus) / 100
                            SET @PriceVal = @PriceVal * (100 + @PercPlus) /100
                        END
                    ELSE
                        BEGIN
                            SET @Price=0
                            SET @PriceVal = @PriceVal * (100 + @PercPlus) /100
                        END
                END
        
        
        END
        
    ------------------------------------------------------------------------------------------------'                   
    Insert @TempTable   
    Select TOP 1 ISNULL(@Price,0), ISNULL(@PriceVal,0),@UM,0,0, @CodCambio                            

    RETURN
END



GO
GRANT SELECT
    ON OBJECT::[Price].[FUNGetSpecialPrice_Extensive] TO [Metodo98]
    AS [dbo];

