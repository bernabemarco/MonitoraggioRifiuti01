
CREATE FUNCTION [Price].[GetSpecialPrice_Discount_Extensive_Sintetic]
(
    @CodCliFor varchar(7) ='*',
    @CodDest decimal(5,0) =0,
    @CodArt varchar(50) ='*',
    @Qta decimal(16,6)=1,
    @DataDoc datetime = NULL,
    @Esercizio Decimal(5,0) = 1900,
    @List decimal(5,0)=0,
    @UM varchar(3)=''
)
RETURNS @returntable TABLE 
(   
    Price Decimal(19,6),
    Discount VARCHAR(255),

    DiscountXML XML
)
AS
BEGIN
     DECLARE @DiscountList varchar(255), @Price Decimal(19,6), @XML XML, @Discount VARCHAR(255)
      SELECT @Price=price,  @DiscountList = COALESCE(@DiscountList + '+', '') + CAST(strSpecialDiscount AS varchar(5)) 
      FROM  price.GetSpecialPrice_Discount_Extensive(@CodCliFor,@CodDest,@CodArt, @Qta, @DataDoc, @Esercizio,@List,@UM)
      SET @discount = ''

      SET @XML =(SELECT scontiestesi.Discount scontoesteso, codDiscount AS  codsconto, strSpecialDiscount sconto, CASE  
                WHEN LTRIM(strStdDiscount) ='' THEN 'e' ELSE  'b' END As Tipo, 0 AS valsconto
                FROM  (SELECT @DiscountList Discount ) AS scontiestesi, price.GetSpecialPrice_Discount_Extensive(@CodCliFor,@CodDest,@CodArt, @Qta, @DataDoc, @Esercizio,@List,@UM) AS  ds
                
                FOR XML AUTO
                )


      INSERT INTO @returntable
              ( Discount, Price, DiscountXML )
      VALUES  ( @DiscountList, @Price, @XML)
    RETURN 
END


GO
GRANT SELECT
    ON OBJECT::[Price].[GetSpecialPrice_Discount_Extensive_Sintetic] TO [Metodo98]
    AS [dbo];

