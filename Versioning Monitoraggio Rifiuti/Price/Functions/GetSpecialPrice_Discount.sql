
CREATE FUNCTION [Price].[GetSpecialPrice_Discount] (
    @CodCliFor varchar(7) ='',
    @CodArt varchar(50) ='',
    @Qta decimal(16,6),
    @DataDoc datetime = NULL,
    @Esercizio Decimal(5,0) = 1900,
    @List decimal(5,0)=0,
    @UM varchar(3)='',
    @Pagamento varchar(5) = '',
    @TipoPrezzo bit,
    @Operazionefase varchar(50)='' ,
    @UltPrzAcqVend BIT = 0,
    @CustomScript varchar(max) =''
    
)
RETURNS @TempTable
 TABLE 
    (Price decimal(19,6)
    ,PriceVal decimal(19,6)
    ,NrList DECIMAL(10,0)
    ,Discount varchar(255)
    ,DiscountADD varchar(255)
    ,DiscountEX varchar(255)
    ,UM varchar(3)
    ,RifGPPrezzo decimal(10,0)
    ,RifGPSconto Decimal(10,0)
    ,OriginePrezzo INT
    ,CodCambio DECIMAL(5,0))
--ENCRY--
As
BEGIN

    DECLARE @Result varchar(max)
    DECLARE @Price decimal(19,6),
            @PriceVal decimal(19,6)
    DECLARE @Discount varchar(255) ='',
            @DiscountADD varchar(255) ='',
            @DiscountEx varchar(255) ='',
            @StrDiscount varchar(255)='',
            @UMReturn as varchar(3)='',
            @RifGPPrezzo decimal(12,0)=0,
            @RifGPSconto decimal(12,0)=0,
            @VarEsplicite varchar(max)
    DECLARE @PagCli varchar(5)      

-- Esercizio non impostato, esercizio in corso ---------------------------------------------    
    IF @Esercizio = 1900
        SET @Esercizio = YEAR(getdate())

    --- recupero info articolo x esercizio -----------------------------------------------------
    DECLARE @ArtUsaPrzPrv bit,
            @GruppoPrzArt int,
            @GruppoPrvArt int,
            @ScontoArt1 varchar(10),
            @ScontoArt2 varchar(10),
            @ScontoArt3 varchar(10),
            @PrvArt varchar(10),
            @AddPlusVariant bit,
            @CodFeature int,
            @CodCambio DECIMAL(5,0)

    SELECT  @ArtUsaPrzPrv = ArtUsaPrzPrv 
            ,@GruppoPrzArt = GruppoPrzArt 
            ,@GruppoPrvArt = GruppoPrvArt 
            ,@ScontoArt1 = ScontoArt1 
            ,@ScontoArt2 = ScontoArt2 
            ,@ScontoArt3 = ScontoArt3 
            ,@PrvArt = PrvArt 
            ,@AddPlusVariant = AddPlusVariant
            ,@VarEsplicite = Varesplicite
            ,@CodFeature = Codfeature
            FROM [Price].[FunGetItem4year] (@codart,@Esercizio)
    
    --- recupero info cliente x esercizio -----------------------------------------------------     
    DECLARE @CliUsaPrzPrv bit,
            @GruppoPrzCli int,
            @GruppoPrvCli int,
            @ProvvCli1 varchar(10),
            @ProvvCli2 varchar(10),
            @ProvvCli3 varchar(10),
            @ScontoCli1 varchar(10),
            @AppScRiga varchar(10),
            @AppScFinale varchar(6),
            @ListinoCli decimal(5, 0),
            @NrContratto decimal(10, 0),
            @OriginePrezzo INT,
            @NrList decimal(5, 0)
            
            
    SELECT  @CliUsaPrzPrv = CliUsaPrzPrv
            ,@GruppoPrzCli = GruppoPrzCli 
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

       
    SELECT @Price=Price , @Priceval = Priceval,@UMReturn = UM,@RifGPPrezzo=Progr , @OriginePrezzo = OriginePrezzo, @CodCambio = CodCambio
    FROM [Price].[FUNGetSpecialPrice] ( @CodCliFor
                                      ,@CodArt
                                      ,@Qta
                                      ,@DataDoc
                                      ,@Esercizio
                                      ,@List
                                      ,@UM
                                      ,@Operazionefase
                                      ,@VarEsplicite
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
                                      ,@PagCli
                                      ,@AddPlusVariant
                                      ,@CodFeature
                                      ,@UltPrzAcqVend
                                      ,@TipoPrezzo)
    
    
    SELECT @NrList = List, @Discount = Discount, @DiscountAdd = DiscountAdd, @DiscountEX = DiscountEX, @RifGPSconto =Progr
    FROM [Price].[FUNGetSpecialDiscount] (@CodCliFor
                                          ,@CodArt
                                          ,@Qta
                                          ,@DataDoc
                                          ,@Esercizio
                                          ,@List
                                          ,@UM
                                          ,@Pagamento
                                          ,@VarEsplicite
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
                                          ,@PagCli
                                          ,@CodFeature
                                          ,@TipoPrezzo
                                          )
                                                    



    ------------------------------------------------------------------------------------------------'                   
    Insert @TempTable   
    Select TOP 1 ISNULL(@Price,0), ISNULL(@PriceVal,0) , @NrList,  @discount, @discountAdd, @DiscountEX, @UMReturn, @RifGPPrezzo,@RifGPSconto   , @OriginePrezzo, @codCambio            

    RETURN
END


GO
GRANT SELECT
    ON OBJECT::[Price].[GetSpecialPrice_Discount] TO [Metodo98]
    AS [dbo];

