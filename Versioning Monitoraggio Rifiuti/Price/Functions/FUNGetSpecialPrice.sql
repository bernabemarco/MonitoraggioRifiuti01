                                                                                                                                                                                                                                  

CREATE FUNCTION [price].[FUNGetSpecialPrice] (
    
    @CodCliFor varchar(7) ='',
    @CodArt varchar(50) ='',
    @Qta decimal(16,6),
    @DataDoc datetime = NULL,
    @Esercizio Decimal(5,0) = 1900,
    @List decimal(5,0)=0,
    @UM varchar(3)='',
    @Operazionefase varchar(5)='' ,
    @VarEsplicite varchar(max) ='',
    @ArtUsaPrzPrv bit,
    @GruppoPrzArt int,
    @GruppoPrvArt int,
    @ScontoArt1 varchar(10),
    @ScontoArt2 varchar(10),
    @ScontoArt3 varchar(10),
    @CliUsaPrzPrv bit,
    @GruppoPrzCli int,
    @GruppoPrvCli int,
    @ScontoCli1 varchar(20),
    @AppScRiga varchar(10),
    @AppScFinale varchar(6),
    @ListinoCli decimal(5, 0),
    @NrContratto decimal(10, 0),
    @PagCli varchar(5),
    @AddPlusVariant bit,
    @CodFeature INT,
    @UltPrzAcqvend BIT=0,
    @TipoPrezzo bit
)
RETURNS @TempTable
 TABLE 
(Price decimal(19,6), PriceVal decimal(19,6),UM varchar(3), Progr decimal(12,0), OriginePrezzo int , codCambio DECIMAL(5,0))
--ENCRY--
As
BEGIN

    IF @TipoPrezzo =1
        BEGIN
            INSERT INTO @TempTable
                    ( UM ,
                      PriceVal ,
                      Price ,
                      codCambio ,
                      OriginePrezzo ,
                      Progr
                    )
            SELECT UM , PriceVal ,Price ,codCambio , OriginePrezzo ,Progr 
            FROM PRICE.FUNGetSpecialPriceTrasf(@CodCliFor,
                                                        @CodArt ,
                                                        @Qta,
                                                        @DataDoc,
                                                        @Esercizio ,
                                                        @List ,
                                                        @UM ,
                                                        @Operazionefase,
                                                        @VarEsplicite ,
                                                        @ArtUsaPrzPrv ,
                                                        @GruppoPrzArt ,
                                                        @GruppoPrvArt ,
                                                        @ScontoArt1 ,
                                                        @ScontoArt2 ,
                                                        @ScontoArt3 ,
                                                        @CliUsaPrzPrv ,
                                                        @GruppoPrzCli ,
                                                        @GruppoPrvCli,
                                                        @ScontoCli1 ,
                                                        @AppScRiga ,
                                                        @AppScFinale ,
                                                        @ListinoCli ,
                                                        @NrContratto ,
                                                        @PagCli ,
                                                        @AddPlusVariant ,
                                                        @CodFeature ,
                                                        @UltPrzAcqvend,
                                                        @TipoPrezzo )
            RETURN
        END
    ELSE
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
                    ,@Prezzo_Magg decimal(19,6)
                    ,@Prezzo_MaggEuro decimal(19,6)
                    ,@UMReturn As varchar(3)
                    ,@Progr decimal(12,0) = 0
                    ,@TrovatoPrezzo int = -1


    




            SET @CodicePrimario= SUBSTRING(@Codart, 0, CHARINDEX('#',@Codart,1))
                
            IF @Esercizio = 1900
                SET @Esercizio = YEAR(getdate())
    
            SET @FunCheckPrice4Item = (SELECT [Price].[FUSCheckSpecialPrice4Item] (@Codart, @Esercizio))
            SET @CheckPrice4Customer = (SELECT [Price].[FUSCheckSpecialPrice4Customer] (@CodClifor, @Esercizio))

            
            IF  @CheckPrice4Customer =1 And @FunCheckPrice4Item =1 
                BEGIN


                    IF Len(@CodCliFor) = 7
                        BEGIN
                
                
                        SELECT  TOP 1 @Progr = GR.IDRIGA
                                    ,@NRList = GR.NRLISTINO
                                    ,@Prezzo_Magg = GR.PREZZO_MAGG 
                                    ,@Prezzo_MaggEuro = GR.PREZZO_MAGGEURO 
                                    ,@UseNrListino = GT.USANRLISTINO
                            FROM GestionePrezzi GT Inner JOIN 
                                 GESTIONEPREZZIRIGHE GR On GT.PROGRESSIVO = GR.RIFPROGRESSIVO
                            WHERE (GT.CodCliFor =@CodCliFor) 
                                    AND (@CodArt LIKE GT.CODARTRIC OR Gt.CODART ='*' OR Gt.CODART ='') 
                                    AND ((@VarEsplicite LIKE GT.VarEsplicite+'%') OR GT.VarEsplicite= '*')
                                    AND ((@CodicePrimario LIKE GT.CodicePrimario) OR GT.CodicePrimario='*')
                                    AND ((@CodFeature = GT.CODFEATURE) OR GT.CODFEATURE =0)
                                    AND (Gt.CODGRUPPOPREZZIMAG =0 OR Gt.CODGRUPPOPREZZIMAG =@GruppoPrzArt)
                                    AND (GR.PREZZO_MAGG <> 0 OR GR.PREZZO_MAGGEURO <> 0) 
                                    AND @Qta >=GR.QtaMinima  
                                    AND (GR.UM='' OR GR.UM= @UM)
                                    AND @DataDoc BETWEEN GT.InizioValidita AND GT.FineValidita
                                    AND ((GR.NRLISTINO = 1  AND GT.USANRLISTINO= 0) OR (GR.NRLISTINO =@List  AND GT.USANRLISTINO= 1))   
                        
                            ORDER BY 
                                CASE 
                                    WHEN CODART <> ''  and GT.CODFEATURE          = 0  THEN 1
                                    WHEN CODART <> ''  and GT.CODGRUPPOPREZZIMAG  = 0  THEN 2
                                    --WHEN CODART <> ''  and GT.FAMIGLIA            = 0  THEN 3
                            
                                    WHEN CODART =  ''  and GT.CODFEATURE         <> 0  THEN 4
                                    WHEN CODART =  ''  and GT.CODGRUPPOPREZZIMAG <> 0  THEN 5
                                    --WHEN CODART =  ''  and GT.FAMIGLIA           <> 0  THEN 6

                                    WHEN CODART =  '*' and GT.CODFEATURE          = 0  THEN 7
                                    WHEN CODART =  '*' and GT.CODGRUPPOPREZZIMAG  = 0  THEN 8
                                    --WHEN CODART =  '*' and GT.FAMIGLIA            = 0  THEN 9
                                END 
                                ,UTILS.EditDistance(@Codart,CODARTRIC)   ASC 
                                , NRLISTINO DESC
                                ,(@Qta - QTAMINIMA) ASC
                                ,GT.INIZIOVALIDITA DESC
                                --Anomalia 11843 ------
                                ,GR.IDRIGA DESC                                  
                                    
                            
                        END
                    
        
                    IF @Progr = 0 And @GruppoPrzCli  > 0 
    
                        BEGIN
                            SELECT  TOP 1 @Progr = GR.IDRIGA
                                    ,@NRList = GR.NRLISTINO
                                    ,@Prezzo_Magg = GR.PREZZO_MAGG 
                                    ,@Prezzo_MaggEuro = GR.PREZZO_MAGGEURO 
									,@UseNrListino = GT.USANRLISTINO
                            FROM GestionePrezzi GT Inner JOIN 
                                 GESTIONEPREZZIRIGHE GR On GT.PROGRESSIVO = GR.RIFPROGRESSIVO
                            WHERE (GT.CODGRUPPOPREZZICF =@GruppoPrzCli) 
                                    AND (@CodArt LIKE GT.CODARTRIC OR Gt.CODART ='*' OR Gt.CODART ='') 
                                    AND ((@VarEsplicite LIKE GT.VarEsplicite + '%' ) OR GT.VarEsplicite= '*')
                                    AND ((@CodicePrimario LIKE GT.CodicePrimario) OR GT.CodicePrimario='*')
                                    AND ((@CodFeature = GT.CODFEATURE) OR GT.CODFEATURE =0)
                                    AND (Gt.CODGRUPPOPREZZIMAG =0  OR Gt.CODGRUPPOPREZZIMAG =@GruppoPrzArt) 
                                    AND (GR.PREZZO_MAGG <> 0 OR GR.PREZZO_MAGGEURO <> 0) 
                                    AND @Qta >=GR.QtaMinima  
                                    AND (GR.UM='' OR GR.UM= @UM)
                                    AND @DataDoc BETWEEN GT.InizioValidita AND GT.FineValidita 
                                    AND ((GR.NRLISTINO = 1  AND GT.USANRLISTINO= 0) OR (GR.NRLISTINO =@List  AND GT.USANRLISTINO= 1))  
                            ORDER BY 
                                CASE 
                                    WHEN CODART <> ''  and GT.CODFEATURE          = 0  THEN 1
                                    WHEN CODART <> ''  and GT.CODGRUPPOPREZZIMAG  = 0  THEN 2
                                    --WHEN CODART <> ''  and GT.FAMIGLIA            = 0  THEN 3
                            
                                    WHEN CODART =  ''  and GT.CODFEATURE         <> 0  THEN 4
                                    WHEN CODART =  ''  and GT.CODGRUPPOPREZZIMAG <> 0  THEN 5
                                    --WHEN CODART =  ''  and GT.FAMIGLIA           <> 0  THEN 6

                                    WHEN CODART =  '*' and GT.CODFEATURE          = 0  THEN 7
                                    WHEN CODART =  '*' and GT.CODGRUPPOPREZZIMAG  = 0  THEN 8
                                    --WHEN CODART =  '*' and GT.FAMIGLIA            = 0  THEN 9
                                END 
                                , UTILS.EditDistance(@Codart,CODARTRIC)   ASC 
                                , NRLISTINO DESC
                                ,(@Qta - QTAMINIMA) ASC
                                ,GT.INIZIOVALIDITA DESC
                                --Anomalia 11843 ------
                                ,GR.IDRIGA DESC                                
                        END 
            
       
                     SET @CodClifor = LEFT(@CodClifor,1)
            
                    IF @Progr = 0 And (@CodCliFor ='*' OR @CodCliFor='C' OR @CodCliFor ='F')  
                        BEGIN
                            SELECT  TOP 1 @Progr = GR.IDRIGA
                                    ,@NRList = GR.NRLISTINO
                                    ,@Prezzo_Magg = GR.PREZZO_MAGG 
                                    ,@Prezzo_MaggEuro = GR.PREZZO_MAGGEURO 
									,@UseNrListino = GT.USANRLISTINO
                            FROM GestionePrezzi GT Inner JOIN 
                                 GESTIONEPREZZIRIGHE GR On GT.PROGRESSIVO = GR.RIFPROGRESSIVO
                            WHERE  (GT.CODCLIFOR ='*' OR GT.CODCLIFOR =@CodClifor)  
                                    AND (@CodArt LIKE GT.CODARTRIC OR Gt.CODART ='*' OR Gt.CODART ='') 
                                    AND ((@VarEsplicite LIKE GT.VarEsplicite + '%') OR GT.VarEsplicite= '*')
                                    AND ((@CodicePrimario LIKE GT.CodicePrimario) OR GT.CodicePrimario='*')
                                    AND ((@CodFeature = GT.CODFEATURE) OR GT.CODFEATURE =0)
                                    AND (Gt.CODGRUPPOPREZZIMAG =0  OR Gt.CODGRUPPOPREZZIMAG =@GruppoPrzArt) 
                                    AND (GR.PREZZO_MAGG <> 0 OR GR.PREZZO_MAGGEURO <> 0) 
                                    AND @Qta >=GR.QtaMinima  
                                    AND (GR.UM='' OR GR.UM= @UM)
                                    AND @DataDoc BETWEEN GT.InizioValidita AND GT.FineValidita 
                                    AND ((GR.NRLISTINO = 1  AND GT.USANRLISTINO= 0) OR (GR.NRLISTINO =@List  AND GT.USANRLISTINO= 1))  

                            ORDER BY 
                                CASE 
                                    WHEN CODART <> ''  and GT.CODFEATURE          = 0  THEN 1
                                    WHEN CODART <> ''  and GT.CODGRUPPOPREZZIMAG  = 0  THEN 2
                                    --WHEN CODART <> ''  and GT.FAMIGLIA            = 0  THEN 3
                            
                                    WHEN CODART =  ''  and GT.CODFEATURE         <> 0  THEN 4
                                    WHEN CODART =  ''  and GT.CODGRUPPOPREZZIMAG <> 0  THEN 5
                                    --WHEN CODART =  ''  and GT.FAMIGLIA           <> 0  THEN 6

                                    WHEN CODART =  '*' and GT.CODFEATURE          = 0  THEN 7
                                    WHEN CODART =  '*' and GT.CODGRUPPOPREZZIMAG  = 0  THEN 8
                                    --WHEN CODART =  '*' and GT.FAMIGLIA            = 0  THEN 9
                                END 
                                , UTILS.EditDistance(@Codart,CODARTRIC)   ASC 
                                , NRLISTINO DESC
                                ,(@Qta - QTAMINIMA) ASC
                                ,GT.INIZIOVALIDITA DESC
                                --Anomalia 11843 ------
                                ,GR.IDRIGA DESC                                 
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
                @TipoRiga decimal(5,0),
                @CodCambio decimal(5,0) = 0


                SET @CodCambio = (SELECT CodCambio FROM TabListini WHERE NrListino=@List)

                SET @TipoRiga = (SELECT  Tipo 
                                    FROM GestionePrezzi GT INNER JOIN  GestionePrezziRighe GR 
                                    ON GT.PROGRESSIVO=GR.RIFPROGRESSIVO WHERE  IDRiga=@Progr) 

            IF @Progr > 0
                BEGIN

    
                    If @TipoRiga > 0
                        BEGIN 

                            SET @TipoRiga = (SELECT  Tipo FROM GestionePrezzi GT INNER JOIN GestionePrezziRighe GR ON GT.PROGRESSIVO=GR.RIFPROGRESSIVO  
                            WHERE  
                            IDRiga=@Progr   
                            /* 
                            Anomalia gestione prezzi particolarui senza alcun lsitino 
                            AND NrListino =@List) 
                            */
                            AND (NrListino =@List OR NrListino=1)
                            /* fine correzione anomalia */
                            )
                    
                            SET @Progr = (SELECT Idriga FROM GestionePrezzi GT INNER JOIN GestionePrezziRighe GR  ON GT.PROGRESSIVO=GR.RIFPROGRESSIVO WHERE IDRiga=@Progr AND NrListino =@List)
                                        
                            SELECT  @Prezzo = Prezzo
                                    ,@PrezzoValuta = PrezzoVal
                                    ,@NrListino = NrListino 
                                    ,@QtaMinima = QtaMinima 
                                    ,@Sconto = Sconto 
                                    ,@ScontoAgg = ScontoAgg 
                                    ,@Tipo = Tipo 
                                    ,@TipoArrot = TipoArrot 
                                    ,@ArrEuro = ArrEuro 
                                    ,@ArrVal = ArrVal 
                                FROM 
                                    [Price].[FUNSpecialPrice4Item] (@Progr)
                   
                        END
    
                    
                
            
                    IF @TipoRiga = 0 
                                BEGIN
                    
                            
                        
                                        SET @Progr = (SELECT Idriga FROM GestionePrezzi GT, GestionePrezziRighe GR 
                                          WHERE GT.PROGRESSIVO=GR.RIFPROGRESSIVO  
                                            AND IDRiga=@Progr 
                                            )

                                        IF @Progr > 0
                                            BEGIN
                    
                                        
                                            SELECT  @Prezzo = Prezzo
                                                ,@PrezzoValuta = PrezzoVal
                                                ,@NrListino = NrListino 
                                                ,@QtaMinima = QtaMinima 
                                                ,@Sconto = Sconto 
                                                ,@ScontoAgg = ScontoAgg 
                                                ,@Tipo = Tipo 
                                                ,@TipoArrot = TipoArrot 
                                                ,@ArrEuro = ArrEuro 
                                                ,@ArrVal = ArrVal 
                                            FROM 
                                                [Price].[FUNSpecialPrice4Item] (@Progr)                                     
                                        
                                    
                                                SET @Price = @Prezzo
                                                SET @PriceVal = @PrezzoValuta
                                            END
                                        ELSE
                                            BEGIN
                                                SET @NRList = @List
                                                                  
                                                --Sviluppo #3994 -----------------------------------------------
                                                Select  @Prezzo= PREZZOEURO, @PrezzoValuta=PREZZO FROM Price.FUNGetPricetoDate(@Codart,@DataDoc,@List,@UM)

                                                IF @Prezzo = 0
                                                    SELECT @Prezzo= PREZZOEURO, @PrezzoValuta=PREZZO  FROM Listiniarticoli WHERE UM=@UM AND CODART =@CodArt And NRLISTINO = @List
                                                    
                                                ----------------------------------------------------------------
                                                SET @Price = @Prezzo
                                                SET @PriceVal = @PrezzoValuta
                                            END 
                                IF @List > 0 
                                
                                        BEGIN
            
                                    
                                            IF @List > 0
                                                BEGIN
                                                    SET @CodCambio = (SELECT CodCambio FROM TabListini WHERE NrListino=@List)
                                                END
                                            ELSE
                                                BEGIN
                                                    SET @CodCambio = (SELECT CodCambio FROM TabListiniTrasformazione WHERE NrListino=@List)
                                                END
                
                                        END
                                    Else
                                        BEGIN
                                            SET @CodCambio = 0
                                        END
                                
                                    SET @TrovatoPrezzo = 0
                                END
        
                        
                         ELSE

                                BEGIN
                                    SELECT  @Prezzo = Prezzo
                                            ,@PrezzoValuta = PrezzoVal
                                            ,@NrListino = NrListino 
                                            ,@QtaMinima = QtaMinima 
                                            ,@Sconto = Sconto 
                                            ,@ScontoAgg = ScontoAgg 
                                            ,@Tipo = Tipo 
                                            ,@TipoArrot = TipoArrot 
                                            ,@ArrEuro = ArrEuro 
                                            ,@ArrVal = ArrVal 
                                        FROM 
                                            [Price].[FUNSpecialPrice4Item] (@Progr)
                                                 
                                       
                                        --Sviluppo #3994 -----------------------------------------------
                                        SELECT  @Price= PREZZOEURO, @PriceVal=PREZZO  FROM Price.FUNGetPricetoDate(@Codart,@DataDoc,@List,@UM)
                                        
                                        IF @Price = 0
                                            SELECT @Price= PREZZOEURO, @PriceVal=PREZZO FROM Listiniarticoli WHERE UM=@UM AND CODART =@CodArt AND NRLISTINO = @List
                                        ----------------------------------------------------------------



                                        IF @List > 0  
                                            BEGIN
                                                SET @CodCambio = (SELECT CodCambio FROM TabListini WHERE NrListino=@List)
                                                SET @TrovatoPrezzo = 1
                                            END
                                        ELSE
                                            BEGIN
                                                SET @CodCambio = (SELECT CodCambio FROM TabListiniTrasformazione WHERE NrListino=@List)
                                    
                                        
                                                --Sviluppo #3994 -----------------------------------------------
                                                SELECT  @Prezzo= PREZZOEURO, @PrezzoValuta=PREZZO  FROM Price.FUNGetPricetoDate(@Codart,@DataDoc,@List,@UM)
                                                IF @Prezzo = 0
                                                    SELECT @Prezzo= PREZZOEURO, @PrezzoValuta=PREZZO FROM Listiniarticoli WHERE UM=@UM AND CODART =@CodArt And NRLISTINO = @List
                                                ----------------------------------------------------------------



                                                SET @Price = @Prezzo
                                                SET @PriceVal = @PrezzoValuta
                                        
                                                SET @TrovatoPrezzo = 1
                                            END
                                    IF @TipoRiga = -1
                                        BEGIN
											IF @UseNrListino =0
												BEGIN
													SET @Price = @Price + @Prezzo
													SET @PriceVal = @PriceVal + @PrezzoValuta
												END
											ELSE
												BEGIN 
													SET @Price = @Price + @Prezzo_MaggEuro
													SET @PriceVal = @PriceVal + @Prezzo_Magg 
												END 
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

                                    SET @Price    = (SELECT Price.ROUNDS(@Price,@ArrEuro,@TipoArrot))
                                    SET @PriceVal = (SELECT Price.ROUNDS(@PriceVal,@ArrVal,@TipoArrot))
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
                                            -- Sviluppo #3994 -----------------------------------------------
                                            SELECT  @Price= PREZZOEURO, @PriceVal=PREZZO  FROM Price.FUNGetPricetoDate(@Codart,@DataDoc,@List,@UM)

                                            IF @Price = 0
                                                SELECT @Price= PREZZOEURO, @PriceVal=PREZZO FROM Listiniarticoli  WHERE UM=@UM AND CODART =@CodArt And NRLISTINO = @List
                                            ---------------------------------------------------------------
                                        END
                                    ELSE
                                        BEGIN
                                            IF @TypePrice = 1
                                                BEGIN
                                                    --Sviluppo #3994 -----------------------------------------------
                                                    SELECT  @Price= PREZZOEURO, @PriceVal=PREZZO  FROM Price.FUNGetPricetoDate(@Codart,@DataDoc,@List,@UM)
                                                    IF @Price = 0
                                                        SELECT @Price= PREZZOEURO, @PriceVal=PREZZO  FROM Listiniarticoli   WHERE UM=@UM AND CODART =@CodArt And NRLISTINO = @List
                                                    ----------------------------------------------------------------
                                                END
                                                    
                                        END
                                    END
                                
                                
                                       
    
                            ELSE
                                BEGIN
                                    IF @UltPrzAcqvend = 1
                                        BEGIN
                                            DECLARE @TipoClifor As varchar(1)
                                            /* Anomalia 12544 * Modificatoa Selezione da Codart a CodClifor */
                                            IF Left(@CodCLifor, 1) = 'F' 
                                                SET @TipoClifor = 'F'
                                            ELSE
                                                SET @TipoClifor = 'C'
    
										
											--- Anomalia ---- 100443 ----------------------------------------------------------------------------

                                           	SELECT @Price = PrezzoRigheDocEuro,@PriceVal= PrezzoRigheDoc , @UMReturn=ISNULL(RD.UMPREZZO, '')
                                                FROM STORICOPREZZIARTICOLO 
												LEFT OUTER JOIN StoricoMag ST ON ST.PROGRESSIVO = STORICOPREZZIARTICOLO.RifStoricomag
												INNER JOIN RigheDocumenti RD ON RD.IdTesta=ST.IdTesta AND RD.IdRiga=ST.RigaDoc
												WHERE codarticolo = @codart and TIPOPREZZO = @TipoClifor
                                            IF @UM<>@UMReturn
                                               SET @UM=@UMReturn

											-------------------------------------------------------------------------------------------------------
                                            SET @TrovatoPrezzo = 2
                                        END
                                END
                            END
                    END
    
            IF @ArtUsaPrzPrv >0 or @AddPlusVariant >0
                BEGIN
                    DECLARE @PrezzoEuroPlus decimal(16,6)
                    DECLARE @PercPlus decimal(16,6)
                    DECLARE @ExchangeValue AS DECIMAL(13,6)

                    SET @ExchangeValue = (Select [Price].[GetExchangeValue] (@CodCambio, @DataDoc))

                    SELECT TOP 1 @PrezzoEuroPlus = PREZZOEURO, @PercPlus = PERC FROM [price].[FUNMaggArtVariant] (@CodArt,@VarEsplicite,@List,'')
                    

                    IF @PercPlus <>0
                        BEGIN
                            IF @CodCambio = 1
                                BEGIN
                                    SET @Price = @Price * (100 + @PercPlus) / 100
                                    --aggiunta gestione cambio-------------------------
                                    SET @PriceVal= @PriceVal*@ExchangeValue
                                    SET @PriceVal = @PriceVal * (100 + @PercPlus) /100
                                    ---------------------------------------------------
                                END
                            ELSE
                                BEGIN
  
                                    --aggiunta gestione cambio-------------------------
                                    SET @Price= @PriceVal/@ExchangeValue                           
                                    SET @Price=@PriceVal * (100 + @PercPlus) /100
                                    ---------------------------------------------------
                                    SET @PriceVal = @PriceVal * (100 + @PercPlus) /100

                                    
                                END
                        END
                    IF @PrezzoEuroPlus <>0
                        BEGIN
                            IF @CodCambio = 1
                                BEGIN
                                    SET @Price = @Price + @PrezzoEuroPlus
                                    --aggiunta gestione cambio-------------------------
                                    SET @PriceVal= @PriceVal*@ExchangeValue
                                    SET @PriceVal = @PriceVal + @PrezzoEuroPlus
                                    ---------------------------------------------------
                                END
                            ELSE
                                BEGIN
  
                                    --aggiunta gestione cambio-------------------------
                                    SET @Price= @PriceVal/@ExchangeValue                     
                                    SET @Price= @PriceVal + @PrezzoEuroPlus
                                    ---------------------------------------------------
                                    SET @PriceVal = @PriceVal + @PrezzoEuroPlus
                                END
                        END
        
                END
    
            ------------------------------------------------------------------------------------------------'                   
            Insert @TempTable                   
            Select TOP 1 ISNULL(@Price,0), ISNULL(@PriceVal,0),@UM,@Progr, @TrovatoPrezzo Trovaprezzo, @CodCambio   
            
        END  
    RETURN

    
END



                                                                                                                                                                                                                                  
GO
GRANT SELECT
    ON OBJECT::[Price].[FUNGetSpecialPrice] TO [Metodo98]
    AS [dbo];

