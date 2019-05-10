
CREATE FUNCTION [Price].[FUNGetSpecialDiscount] (
    -- Add the parameters for the stored procedure here
    @CodCliFor varchar(7) ='',
    @CodArt varchar(50) ='',
    @Qta decimal(16,6),
    @DataDoc datetime = NULL,
    @Esercizio Decimal(5,0) = 1900,
    @List decimal(5,0)=0,
    @UM varchar(3)='',
    @Pagamento varchar(5) ,
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
    @ScontoCli1 varchar(10),
    @AppScRiga varchar(10),
    @AppScFinale varchar(6),
    @ListinoCli decimal(5, 0),
    @NrContratto decimal(10, 0),
    @PagCli varchar(5),
    @CodFeature INT,
    @TipoPrezzo bit
    
)
RETURNS @TempTable
 TABLE 
(List decimal(5,0), Discount varchar(255), DiscountAdd varchar(255), DiscountEx varchar(255), Progr decimal(12,0))
--ENCRY--
As
BEGIN
    
    DECLARE @CodicePrimario VARCHAR(50)
    DECLARE @Result varchar(max)
    DECLARE @Discount varchar(255) ='',
            @DiscountADD varchar(255) ='',
            @DiscountEx varchar(255) ='',
            @StrDiscount varchar(255)=''
    DECLARE @CGFPrice Int
    DECLARE @FunCheckPrice4Item Smallint
    DECLARE @CheckPrice4Customer Smallint
    DECLARE @TypePrice Bit
    DECLARE @PriceType as int = 0
    ---------------------------------------------------------------------------------------------

    
    SET @CodicePrimario= SUBSTRING(@Codart, 0, CHARINDEX('#',@Codart,1))
    
    -- Esercizio non impostato, esercizio in corso ---------------------------------------------    
    IF @Esercizio = 1900
        SET @Esercizio = YEAR(getdate())
    

    SET @FunCheckPrice4Item = (SELECT [Price].[FUSCheckSpecialPrice4Item] (@Codart, @Esercizio))
    SET @CheckPrice4Customer = (SELECT [Price].[FUSCheckSpecialPrice4Customer] (@CodClifor, @Esercizio))

    
    ------------------Inizio ------------------------------------------------------------

    DECLARE @ParmDefinition nvarchar(500)
        ,@Res decimal(12,0) 
        ,@NRList decimal(5,0)
        ,@UsaNrListino decimal(5,0)
        ,@Prezzo_Magg decimal(19,6)
        ,@Prezzo_MaggEuro decimal(19,6)
        
    DECLARE @Prezzo decimal(19, 6),
        @PrezzoValuta decimal(19, 6),
        @NrListino decimal(5, 0),
        @QtaMinima decimal(16, 6),
        @Sconto varchar(255)='',
        @ScontoAgg varchar(255)='',
        @Tipo decimal(5, 0),
        @TipoArrot varchar(1),
        @ArrEuro decimal(19,4),
        @ArrVal decimal(19,4),
        @TipoRiga decimal(5,0)

IF  @CheckPrice4Customer =1 And @FunCheckPrice4Item =1 
    BEGIN
        DECLARE @Progr decimal(12,0) = 0

        SET @List = (SELECT [price].[FUSCheckChangeListPrice] (@CodCliFor
                                                                        ,@CodArt
                                                                         ,@Qta
                                                                          ,@DataDoc
                                                                          ,@Esercizio
                                                                          ,@List
                                                                          ,@UM
                                                                          ,@VarEsplicite
                                                                          ,@CodicePrimario 
                                                                          ,@CodFeature 
                                                                          ,@ArtUsaPrzPrv
                                                                          ,@GruppoPrzArt
                                                                          ,@GruppoPrvArt
                                                                          ,@ScontoArt1
                                                                          ,@ScontoArt2
                                                                          ,@ScontoArt3
                                                                          ,@CliUsaPrzPrv
                                                                          ,@GruppoPrzCli
                                                                          ,@GruppoPrvCli
                                                                          ,@ScontoCli1
                                                                          ,@AppScRiga
                                                                          ,@AppScFinale
                                                                          ,@ListinoCli
                                                                          ,@NrContratto
                                                                          ,@PagCli))
                            
                            
                                
                IF Len(@CodCliFor) = 7
                    BEGIN
                
                        SELECT  TOP 1 @Progr = GR.IDRIGA
                            ,@NRList = GR.NRLISTINO
                            ,@UsaNrListino= USANRLISTINO
                            ,@Sconto = ISNULL(GR.SCONTO_UNICO,'') 
                            ,@ScontoAgg = ISNULL(GR.SCONTO_AGGIUNTIVO,'')
                        FROM GestionePrezzi GT Inner JOIN 
                             GESTIONEPREZZIRIGHE GR On GT.PROGRESSIVO = GR.RIFPROGRESSIVO
                        WHERE (GT.CodCliFor =@CodCliFor) 
                                        AND (@CodArt LIKE GT.CODARTRIC OR Gt.CODART ='*' OR Gt.CODART ='') 
                                        AND ((@VarEsplicite LIKE GT.VarEsplicite+'%') OR GT.VarEsplicite= '*')
                                        AND ((@CodicePrimario LIKE GT.CodicePrimario) OR GT.CodicePrimario='*')
                                        AND ((@CodFeature = GT.CODFEATURE) OR GT.CODFEATURE =0)
                                        AND (Gt.CODGRUPPOPREZZIMAG =0 OR Gt.CODGRUPPOPREZZIMAG =@GruppoPrzArt)
                                        AND (GR.Sconto_Unico <> '' OR GR.Sconto_Aggiuntivo <> '' )  
                                        AND @Qta >=GR.QtaMinima  
                                        AND (GR.UM='' OR GR.UM= @UM)
                                        AND @DataDoc BETWEEN GT.InizioValidita AND GT.FineValidita
                                        AND ((GR.NRLISTINO = 1  AND GT.USANRLISTINO= 0) OR (GR.NRLISTINO =@List  AND GT.USANRLISTINO= 1))  

                        ORDER BY 
                            CASE 

                                WHEN CODART =  '*' and CODGRUPPOPREZZIMAG  = 0  THEN 4
                            
                                WHEN CODART <> ''  and CODGRUPPOPREZZIMAG  = 0  THEN 1
                                WHEN CODART =  ''  and CODGRUPPOPREZZIMAG <> 0  THEN 2
                                WHEN CODART =  ''  and GT.CODFEATURE      <> 0  THEN 3
                                WHEN CODART =  ''  and CODGRUPPOPREZZIMAG  = 0  THEN 5


                            END
                            , UTILS.EditDistance(@Codart,CODARTRIC)   ASC                       
                            ,(@Qta - QTAMINIMA) ASC
                            , NRLISTINO DESC
                            ,GT.INIZIOVALIDITA DESC
                            --Anomalia 11843 ------
                            ,GR.IDRIGA DESC                            
                                        
                
                
                        
                    END

                                
                IF @Progr = 0 And @GruppoPrzCli  > 0 

                    BEGIN
                        SELECT  TOP 1 @Progr = GR.IDRIGA
                                ,@NRList = GR.NRLISTINO
                                ,@UsaNrListino= USANRLISTINO
                                ,@Sconto = ISNULL(GR.SCONTO_UNICO,'') 
                                ,@ScontoAgg = ISNULL(GR.SCONTO_AGGIUNTIVO,'')
                        FROM GestionePrezzi GT Inner JOIN 
                             GESTIONEPREZZIRIGHE GR On GT.PROGRESSIVO = GR.RIFPROGRESSIVO
                             
                        WHERE (GT.CODGRUPPOPREZZICF =@GruppoPrzCli) 
                                        AND (@CodArt LIKE GT.CODARTRIC OR Gt.CODART ='*' OR Gt.CODART ='') 
                                        AND ((@VarEsplicite LIKE GT.VarEsplicite + '%' ) OR GT.VarEsplicite= '*')
                                        AND ((@CodicePrimario LIKE GT.CodicePrimario) OR GT.CodicePrimario='*')
                                        AND ((@CodFeature = GT.CODFEATURE) OR GT.CODFEATURE =0)
                                        AND (Gt.CODGRUPPOPREZZIMAG =0  OR Gt.CODGRUPPOPREZZIMAG =@GruppoPrzArt) 
                                        AND (GR.Sconto_Unico <> '' OR GR.Sconto_Aggiuntivo <> '') 
                                        AND @Qta >=GR.QtaMinima  
                                        AND (GR.UM='' OR GR.UM= @UM)
                                        AND @DataDoc BETWEEN GT.InizioValidita AND GT.FineValidita 
                                        AND ((GR.NRLISTINO = 1  AND GT.USANRLISTINO= 0) OR (GR.NRLISTINO =@List  AND GT.USANRLISTINO= 1))   

                        ORDER BY 
                            CASE 
                                WHEN CODART =  '*' and CODGRUPPOPREZZIMAG  = 0  THEN 4
                            
                                WHEN CODART <> ''  and CODGRUPPOPREZZIMAG  = 0  THEN 1
                                WHEN CODART =  ''  and CODGRUPPOPREZZIMAG <> 0  THEN 2
                                WHEN CODART =  ''  and GT.CODFEATURE      <> 0  THEN 3
                                WHEN CODART =  ''  and CODGRUPPOPREZZIMAG  = 0  THEN 5
                            END  
                            , UTILS.EditDistance(@Codart,CODARTRIC)   ASC 
                            ,CASE WHEN @list -  gr.NRLISTINO=0 THEN  0 ELSE USANRLISTINO + @list END
                            ,(@Qta - QTAMINIMA) ASC
                            , NRLISTINO DESC
                            ,GT.INIZIOVALIDITA DESC
                            --Anomalia 11843 ------
                            ,GR.IDRIGA DESC                            
                            
                    END 
                
            
            
             
                     SET @CodClifor = LEFT(@CodClifor,1)
            
            
                    IF @Progr = 0 And (@CodCliFor ='*' OR @CodCliFor='C' OR @CodCliFor ='F')  

                        BEGIN
                            SELECT  TOP 1 @Progr = GR.IDRIGA
                                    ,@NRList = GR.NRLISTINO
                                    ,@UsaNrListino= USANRLISTINO
                                    ,@Sconto = ISNULL(GR.SCONTO_UNICO,'') 
                                    ,@ScontoAgg = ISNULL(GR.SCONTO_AGGIUNTIVO,'')
                            FROM GestionePrezzi GT Inner JOIN 
                                 GESTIONEPREZZIRIGHE GR On GT.PROGRESSIVO = GR.RIFPROGRESSIVO
                                 
                            WHERE  (GT.CODCLIFOR ='*' OR GT.CODCLIFOR =@CodClifor)  
                                            AND (@CodArt LIKE GT.CODARTRIC OR Gt.CODART ='*' OR Gt.CODART ='') 
                                            AND ((@VarEsplicite LIKE GT.VarEsplicite + '%') OR GT.VarEsplicite= '*')
                                            AND ((@CodicePrimario LIKE GT.CodicePrimario) OR GT.CodicePrimario='*')
                                            AND ((@CodFeature = GT.CODFEATURE) OR GT.CODFEATURE =0)
                                            AND (Gt.CODGRUPPOPREZZIMAG =0  OR Gt.CODGRUPPOPREZZIMAG =@GruppoPrzArt) 
                                            AND (GR.Sconto_Unico <> '' OR GR.Sconto_Aggiuntivo <> '') 
                                            AND @Qta >=GR.QtaMinima  
                                            AND (GR.UM='' OR GR.UM= @UM)
                                            AND @DataDoc BETWEEN GT.InizioValidita AND GT.FineValidita 
                                            AND ((GR.NRLISTINO = 1  AND GT.USANRLISTINO= 0) OR (GR.NRLISTINO =@List  AND GT.USANRLISTINO= 1))    
                                 

                            ORDER BY 
                                CASE 
                                    WHEN CODART =  '*' and CODGRUPPOPREZZIMAG  = 0  THEN 4
                            
                                    WHEN CODART <> ''  and CODGRUPPOPREZZIMAG  = 0  THEN 1
                                    WHEN CODART =  ''  and CODGRUPPOPREZZIMAG <> 0  THEN 2
                                    WHEN CODART =  ''  and GT.CODFEATURE      <> 0  THEN 3
                                    WHEN CODART =  ''  and CODGRUPPOPREZZIMAG  = 0  THEN 5
                                END  
                                , UTILS.EditDistance(@Codart,CODARTRIC)   ASC 
                                ,CASE WHEN @list -  gr.NRLISTINO=0 THEN  0 ELSE USANRLISTINO + @list END
                                ,(@Qta - QTAMINIMA) ASC
                                , NRLISTINO DESC
                                ,GT.INIZIOVALIDITA DESC
                                --Anomalia 11843 ------
                                ,GR.IDRIGA DESC                                
                                
                        END 
            
            
        END
        
        BEGIN

        --------Inizio sequenza sconti-------------------------------------------------
            DECLARE @SeqSconti varchar(255)
            DECLARE @StrSconti varchar(255)
            DECLARE @tmpSconti varchar(255) =''

                BEGIN
                    SET @StrSconti = @AppScRiga
                    WHILE @StrSconti <>''
                        
                        BEGIN

                            IF @Pagamento =''
                                SET @Pagamento = @PagCli
    
                            SET @SeqSconti = (CASE LEFT(@StrSconti,2)
                                                    WHEN 'C1' THEN  @ScontoCli1
                                                    --WHEN 'P1' THEN  (Select Sconto from TABPAGAMENTI Where CODICE = @Pagamento)
                                                    WHEN 'M1' THEN  @ScontoArt1
                                                    WHEN 'M2' THEN  @ScontoArt2
                                                    WHEN 'M3' THEN  @ScontoArt3
                                                END)
                    
                            IF @tmpSconti =''
                                SET @tmpSconti = ISNULL(@SeqSconti,'')
                            ELSE
                                BEGIN
                                    IF @SeqSconti <> '' 
                                        SET @tmpSconti = @tmpSconti + '+' + @SeqSconti
                                END
                            
                            SET @StrSconti = LTRIM(SUBSTRING(@StrSconti, 3,100))
                        END 
                                
                            
                        IF @Sconto = '' 
                            BEGIN
                                IF @ScontoAgg <>''
                                    SET @DiscountEx = @tmpSconti + '+' + @ScontoAgg
                                ELSE
                                    SET @DiscountEx = @tmpSconti 
                            END
                        ELSE
                            BEGIN 
                                IF @ScontoAgg = '' 
                                    SET @DiscountEx = @Sconto
                                ELSE
                                    SET @DiscountEx =  @Sconto + '+' + @ScontoAgg
                            END
                        
                        SET @Discount = @Sconto
                        SET @DiscountADD = @ScontoAgg 
                       
            END
        
        END
    --------------------------------------------------------------------------------------'                 

    Insert @TempTable   
                            
    Select @List as ListPrice
            ,@Discount as DiscountStd   
            ,@DiscountADD as DiscountADD
            ,@DiscountEX as DiscountEX
            ,@Progr 
    RETURN
END


GO
GRANT SELECT
    ON OBJECT::[Price].[FUNGetSpecialDiscount] TO [Metodo98]
    AS [dbo];

