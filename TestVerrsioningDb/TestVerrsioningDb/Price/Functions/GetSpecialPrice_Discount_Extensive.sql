
CREATE FUNCTION [Price].[GetSpecialPrice_Discount_Extensive] (
    @CodCliFor varchar(7) ='*',
    @CodDest decimal(5,0) =0,
    @CodArt varchar(50) ='*',
    @Qta decimal(16,6)=1,
    @DataDoc datetime = NULL,
    @Esercizio Decimal(5,0) = 1900,
    @List decimal(5,0)=0,
    @UM varchar(3)=''
)
RETURNS @TempTable
 TABLE 
    (Price decimal(19,6)
    ,PriceVal decimal(19,6)
    ,idRegola int
    ,codDiscount varchar(5)
    ,strSpecialDiscount varchar(255)
    ,strStdDiscount varchar(255)
    ,NRSequenza int)
--ENCRY--
As
BEGIN

    DECLARE @Result varchar(max),
            @Price decimal(19,6),
            @PriceVal decimal(19,6),
            @Discount varchar(255) ='',
            @DiscountADD varchar(255) ='',
            @DiscountEx varchar(255) ='',
            @StrDiscount varchar(255)='',
            @PagCli varchar(5)  ,
            @Pagamento varchar(5) = '',
            @Operazionefase varchar(50)='' ,
            @CustomScript varchar(max) ='',
            @VarEsplicite varchar(max)
                

-- Esercizio non impostato, esercizio in corso ---------------------------------------------    
    IF @Esercizio = 1900
        SET @Esercizio = YEAR(getdate())

    --- recupero info articolo x esercizio -----------------------------------------------------
    DECLARE @ArtUsaPrzPrv bit,
            @GruppoPrzArt int,
            @GruppoPrvArt int,
            @Famiglia int,
            @Reparto int,
            @ScontoArt1 varchar(10),
            @ScontoArt2 varchar(10),
            @ScontoArt3 varchar(10),
            @PrvArt varchar(10),
            @AddPlusVariant BIT,
            @CodFeature int

    SELECT  @ArtUsaPrzPrv = ArtUsaPrzPrv 
            ,@GruppoPrzArt = GruppoPrzArt 
            ,@GruppoPrvArt = GruppoPrvArt 
            ,@ScontoArt1 = ScontoArt1 
            ,@ScontoArt2 = ScontoArt2 
            ,@ScontoArt3 = ScontoArt3 
            ,@PrvArt = PrvArt 
            ,@AddPlusVariant = AddPlusVariant
            ,@Famiglia = Famiglia
            ,@Reparto = Reparto
            ,@VarEsplicite = Varesplicite
            ,@CodFeature = Codfeature
            FROM [Price].[FunGetItem4year] (@codart,@Esercizio)
    
    --- recupero info cliente x esercizio -----------------------------------------------------     
    DECLARE @CliUsaPrzPrv bit,
            @GruppoPrzCli int,
            @CodSettore decimal(5,0),
            @CodZona decimal(5,0),
            @CodCategoria decimal(5,0),
            @GruppoPrvCli int,
            @ProvvCli1 varchar(10),
            @ProvvCli2 varchar(10),
            @ProvvCli3 varchar(10),
            @ScontoCli1 varchar(10),
            @AppScRiga varchar(10),
            @AppScFinale varchar(6),
            @ListinoCli decimal(5, 0),
            @NrContratto decimal(10, 0),
            @TipoPrezzo BIT = 1
            
    SELECT  @CliUsaPrzPrv = CliUsaPrzPrv
            ,@GruppoPrzCli = GruppoPrzCli
            ,@CodSettore = CodSettore
            ,@CodZona = CodZona
            ,@Codcategoria = CodCategoria 
            ,@GruppoPrvCli = GruppoPrvCli
            ,@ProvvCli1 = ProvvCli1 
            ,@ProvvCli2 = ProvvCli2 
            ,@ProvvCli3 = ProvvCli3 
            ,@ScontoCli1 = ScontoCli1 
            ,@AppScRiga = AppScRiga 
            ,@AppScFinale = AppScFinale 
            ,@ListinoCli = ListinoCli 
            ,@NrContratto = NrContratto 
            FROM [Price].[FUNGetCustomer4year] (@CodClifor, @TipoPrezzo, @Esercizio)

       
            
            
    INSERT INTO @TempTable(idRegola,codDiscount,strSpecialDiscount,strStdDiscount, NRSequenza)
            
    SELECT idRegola, codDiscount, strSpecialDiscount, strStdDiscount , NRSequenza
    FROM [Price].[FUNGetSpecialDiscount_Extensive] (@CodCliFor
                                          ,@CodArt
                                          ,@Qta
                                          ,@DataDoc
                                          ,@Esercizio
                                          ,@List
                                          ,@UM
                                          ,@Pagamento
                                          ,@VarEsplicite
                                          ,@CustomScript
                                          ,@ArtUsaPrzPrv
                                          ,@GruppoPrzArt
                                          ,@CodSettore
                                          ,@CodZona
                                          ,@CodCategoria
                                          ,@CodDest
                                          ,@GruppoPrvArt
                                          ,@ScontoArt1
                                          ,@ScontoArt2
                                          ,@ScontoArt3
                                          ,@CliUsaPrzPrv
                                          ,@GruppoPrzCli
                                          ,@GruppoPrvCli
                                          ,@Famiglia
                                          ,@Reparto
                                          ,@ScontoCli1
                                          ,@AppScRiga
                                          ,@AppScFinale
                                          ,@ListinoCli
                                          ,@NrContratto
                                          ,@PagCli
                                          ,@CodFeature)
                                                    
        
        DECLARE @resultcount int
        SET @resultcount = (Select COUNT(idregola) from @TempTable)
        
    
            SELECT @Price=Price , @Priceval = Priceval 
            FROM [Price].[FUNGetSpecialPrice_Extensive] ( @CodCliFor
                                      ,@CodArt
                                      ,@Qta
                                      ,@DataDoc
                                      ,@Esercizio
                                      ,@List
                                      ,@UM
                                      ,@Operazionefase
                                      ,@VarEsplicite
                                      ,@CustomScript
                                      ,@ArtUsaPrzPrv
                                      ,@CodDest
                                      ,@GruppoPrzArt
                                      ,@CodSettore 
                                      ,@CodZona 
                                      ,@CodCategoria  
                                      ,@GruppoPrvArt
                                      ,@ScontoArt1
                                      ,@ScontoArt2
                                      ,@ScontoArt3
                                      ,@CliUsaPrzPrv
                                      ,@GruppoPrzCli
                                      ,@GruppoPrvCli
                                      ,@Famiglia
                                      ,@Reparto
                                      ,@ScontoCli1
                                      ,@AppScRiga
                                      ,@AppScFinale
                                      ,@ListinoCli
                                      ,@NrContratto
                                      ,@PagCli
                                      ,@AddPlusVariant
                                      ,@CodFeature)
    

        IF @resultcount >0
            BEGIN
                UPDATE @TempTable SET Price = @Price
                UPDATE @TempTable SET PriceVal = @PriceVal
            END
        ELSE
            BEGIN
                INSERT INTO @TempTable(Price, PriceVal)
                    SELECT @Price, @PriceVal
                    
            END
            
    ------------------------------------------------------------------------------------------------                    
                            

    RETURN
END

GO
GRANT SELECT
    ON OBJECT::[Price].[GetSpecialPrice_Discount_Extensive] TO [Metodo98]
    AS [dbo];

