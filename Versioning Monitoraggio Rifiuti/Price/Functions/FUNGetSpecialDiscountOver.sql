

CREATE FUNCTION [Price].[FUNGetSpecialDiscountOver] (
    @CodCliFor varchar(7) ='',
    @CodArt varchar(50) ='',
    @Qta decimal(16,6),
    @DataDoc datetime = NULL,
    @Esercizio Decimal(5,0) = 1900,
    @List decimal(5,0)=0,
    @UM varchar(3)='',
    @Pagamento varchar(5) ,
    @VarEsplicite varchar(max) ='',
    @CustomScript varchar(max) ='',
    @ArtUsaPrzPrv bit,
    @Coddest decimal(5,0) =0,
    @GruppoPrzArt int,
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
    @CodFeature INT,
    @tipoPrezzo bit,
    @ExtendedPrice int,
    @CodSettore decimal(5,0),
    @CodZona decimal(5,0),
    @CodCategoria decimal(5,0),
    @ScontoAggiuntivo varchar(255)
)

RETURNS @TempTable
 TABLE 
(List decimal(5,0), Discount varchar(255), DiscountAdd varchar(255), DiscountEx varchar(255), Progr decimal(12,0),discountxml XML)

As
BEGIN
    DECLARE @DiscountList varchar(255),@DiscountEx varchar(255), @DiscountListEx varchar(255), @Price Decimal(19,6), @XML XML, @Discount VARCHAR(255), @Progr decimal(12,0)            
    DECLARE @BaseDiscount As XML = '<ds codsconto="SB001" sconto="" tipo="b" valsconto="0" />'

        IF @ScontoAggiuntivo <>'' AND @CustomScript <>''
            BEGIN

                DECLARE @Add xml = '<ds codsconto="SB008" sconto="" tipo="a" valsconto="0" />'
                DECLARE @DisconutPar XML  = @CustomScript

                SET @Add.modify('replace value of (/ds/@sconto)[1] with sql:variable("@ScontoAggiuntivo")')
                SET @DisconutPar.modify('delete  (/scontiestesi/ds [@tipo="a"])')
                SET @DisconutPar.modify('insert sql:variable("@Add")    into (/scontiestesi)[1]')



                SET @DiscountEx = STUFF(@DisconutPar.query('for $i in scontiestesi/ds/@sconto return <a>{concat("+", $i)}</a>').value('.', 'varchar(max)') , 1, 1, '') 


                SET @DisconutPar.modify('replace value of (scontiestesi/@scontoesteso)[1] with sql:variable("@DiscountEx")') 
                
                INSERT INTO @TempTable (List , Discount , DiscountAdd, DiscountEx,Progr,discountxml )
                                    SELECT 0, @DiscountList, @DiscountEx,@DiscountEx, @Progr,  @DisconutPar
            END
       ELSE
        BEGIN                   
                
    
                -- NoSconto Classificato --
                IF(@ExtendedPrice = 0)
                    BEGIN
                        INSERT INTO @TempTable
                        SELECT  f1.List,
                                f1.Discount,
                                f1.DiscountAdd,
                                f1.DiscountEx, 
                                f1.Progr,
                               '<scontiestesi scontoesteso="" />' AS XML 
                        FROM  Price.FUNGetSpecialDiscount(@CodCliFor,
                                                            @CodArt,
                                                            @Qta,
                                                            @DataDoc,
                                                            @Esercizio,
                                                            @List,
                                                            @UM,
                                                            @Pagamento,
                                                            @VarEsplicite,
                                                            @ArtUsaPrzPrv,
                                                            @GruppoPrzArt,
                                                            @GruppoPrvArt,
                                                            @ScontoArt1,
                                                            @ScontoArt2,
                                                            @ScontoArt3,
                                                            @CliUsaPrzPrv,
                                                            @GruppoPrzCli,
                                                            @GruppoPrvCli,
                                                            @ScontoCli1,
                                                            @AppScRiga,
                                                            @AppScFinale,
                                                            @ListinoCli,
                                                            @NrContratto,
                                                            @PagCli,
                                                            @CodFeature,
                                                            @tipoPrezzo) f1

                        UPDATE @TempTable SET discountxml.modify('insert sql:variable("@BaseDiscount") into (/scontiestesi)[1]') WHERE DiscountEx <>''
                        UPDATE @TempTable SET discountxml.modify('replace value of (scontiestesi/ds/@sconto)[1] with sql:column("DiscountEx")') WHERE DiscountEx <>''

                        UPDATE @TempTable SET discountxml.modify('replace value of (scontiestesi/@scontoesteso)[1] with sql:column("DiscountEx")') WHERE DiscountEx <>''
                    END

                ELSE
                    BEGIN
                        --Classificato ---------------------------------------------------------------------------------------------------------------------------------------------------------
                
                        SELECT @DiscountListEx = COALESCE(@DiscountListEx + CASE strSpecialDiscount WHEN '' THEN '' ELSE '+' END, '') + CAST((strSpecialDiscount) AS varchar(5)) , @DiscountList=strStdDiscount,@Progr = idRegola
                        FROM   Price.FUNGetSpecialDiscount_Extensive(@CodCliFor,
                                                                  @CodArt,
                                                                  @Qta,
                                                                  @DataDoc,
                                                                  @Esercizio,
                                                                  @List,
                                                                  @UM,
                                                                  @Pagamento,
                                                                  @VarEsplicite,
                                                                  @CustomScript,
                                                                  @ArtUsaPrzPrv,
                                                                  @GruppoPrzArt,
                                                                  @CodSettore,
                                                                  @CodZona,
                                                                  @CodCategoria,
                                                                  @Coddest,
                                                                  @GruppoPrvArt,
                                                                  @ScontoArt1,
                                                                  @ScontoArt2,
                                                                  @ScontoArt3,
                                                                  @CliUsaPrzPrv,
                                                                  @GruppoPrzCli,
                                                                  @GruppoPrvCli,
                                                                  @Famiglia,
                                                                  @Reparto,
                                                                  @ScontoCli1,
                                                                  @AppScRiga,
                                                                  @AppScFinale,
                                                                  @ListinoCli,
                                                                  @NrContratto,
                                                                  @PagCli,
                                                                  @CodFeature)  /*WHERE strSpecialDiscount <>''*/
                
                        IF @DiscountListEx <>''
                            SET @DiscountEx = @DiscountList + CASE @DiscountList WHEN '' THEN  '' ELSE '+' END+ @DiscountListEx
                        ELSE
                            SET @DiscountEx = @DiscountList 
                
            
                        BEGIN
                            SET @XML = (SELECT scontiestesi.Discount scontoesteso, codDiscount AS  codsconto, CASE WHEN LTRIM(strStdDiscount) ='' THEN strSpecialDiscount ELSE strStdDiscount   END  sconto, 
                                        CASE WHEN LTRIM(strStdDiscount) ='' THEN 'e' ELSE  'b' END As tipo, 0 AS valsconto
                                        FROM  (SELECT @DiscountEx Discount ) AS scontiestesi, 
                                             Price.FUNGetSpecialDiscount_Extensive(@CodCliFor,
                                                                                  @CodArt,
                                                                                  @Qta,
                                                                                  @DataDoc,
                                                                                  @Esercizio,
                                                                                  @List,
                                                                                  @UM,
                                                                                  @Pagamento,
                                                                                  @VarEsplicite,
                                                                                  @CustomScript,
                                                                                  @ArtUsaPrzPrv,
                                                                                  @GruppoPrzArt,
                                                                                  @CodSettore,
                                                                                  @CodZona,
                                                                                  @CodCategoria,
                                                                                  @Coddest,
                                                                                  @GruppoPrvArt,
                                                                                  @ScontoArt1,
                                                                                  @ScontoArt2,
                                                                                  @ScontoArt3,
                                                                                  @CliUsaPrzPrv,
                                                                                  @GruppoPrzCli,
                                                                                  @GruppoPrvCli,
                                                                                  @Famiglia,
                                                                                  @Reparto,
                                                                                  @ScontoCli1,
                                                                                  @AppScRiga,
                                                                                  @AppScFinale,
                                                                                  @ListinoCli,
                                                                                  @NrContratto,
                                                                                  @PagCli,
                                                                                  @CodFeature)      As ds 
                                        ORDER BY NRSequenza
                                        FOR XML AUTO
                                              )
            
         
                                    INSERT INTO @TempTable (List , Discount , DiscountAdd, DiscountEx,Progr,discountxml )
                                    SELECT @List, @DiscountList, @DiscountListEx,@DiscountEx, @Progr,  @XML
                                END
                END                                               
        END
        

        RETURN  

END





GO
GRANT SELECT
    ON OBJECT::[Price].[FUNGetSpecialDiscountOver] TO [Metodo98]
    AS [dbo];

