CREATE VIEW [dbo].[Vista_MYTHO_Articoli_Profilo]
As 
SELECT     '' AS SelArt, ISNULL(MYTHO_Codici_Articoli.ProductEntityId,0) ProductEntityId, ISNULL(TMP.ItemSKU, MYTHO_Codici_Articoli.SKU) AS ItemSKU
, TMP.IdSessione, TMP.Enabled, TMP.Changed, TMP.CODICEMETODO, 
                      TMP.CreationDate, TMP.ExecutedDate, TMP.ParentItemID, TMP.ParentItemSKU, TMP.ProductLanguage, TMP.ProductType, TMP.AdditionalImagesHeight, 
                      TMP.AdditionalImagesThumbnailChangeMode, TMP.AdditionalImagesThumbnailWidth, TMP.AdditionalImagesWidth, TMP.AdditionalImagesZoomHeight, 
                      TMP.AdditionalImagesZoomPosition, TMP.AdditionalImagesZoomWidth, TMP.BigImageFileName, TMP.BrandName, TMP.BrandOxID, 
                      TMP.CanonicalURLCustomizedContent, TMP.Category1Name, TMP.Category1OxId, TMP.Category1Language, TMP.Category1ParentOxId, TMP.Category2Name, 
                      TMP.Category2OxId, TMP.Category2Language, TMP.Category2ParentOxId, TMP.Category3Name, TMP.Category3OxId, TMP.Category3Language, 
                      TMP.Category3ParentOxId, TMP.Cost, TMP.DaysToShip, TMP.Description, TMP.DimensionHeight, TMP.DimensionLength, TMP.DimensionWidth, 
                      TMP.DiscountGridCode, TMP.EANCode, TMP.EcotaxTI, TMP.Guarantee, TMP.HandlingSurcharge1ST, TMP.HandlingSurchargeOthers, TMP.ItemCondition, 
                      TMP.LinkedItemID, TMP.LinkedItemLanguage, TMP.LinkedItemSKU, TMP.LinkedUpdating, TMP.LongDescription, TMP.MetaDescription, TMP.MetaKeywords, 
                      TMP.MetaTitle, TMP.MPN, TMP.Name, TMP.OptionIsDefault, TMP.OptionTypes1OxId, TMP.OptionTypes1Name, TMP.OptionTypes1SystemName, 
                      TMP.OptionTypes2OxId, TMP.OptionTypes2Name, TMP.OptionTypes2SystemName, TMP.OptionTypes3OxId, TMP.OptionTypes3Name, 
                      TMP.OptionTypes3SystemName, TMP.OptionValues1OxId, TMP.OptionValues1Code, TMP.OptionValues1Name, TMP.OptionValues2OxId, TMP.OptionValues2Code, 
                      TMP.OptionValues2Name, TMP.OptionValues3OxId, TMP.OptionValues3Code, TMP.OptionValues3Name, TMP.Position, TMP.PriceValue, TMP.PriceVATIncluded, 
                      TMP.Price1Value, TMP.Price1VATIncluded, TMP.Price2Value, TMP.Price2VATIncluded, TMP.Price3Value, TMP.Price3VATIncluded, TMP.Price4Value, 
                      TMP.Price4VATIncluded, TMP.ReviewCount, TMP.ReviewRating, TMP.QuantityInstockValue, TMP.QuantityInstockAppend, TMP.QuantityReorderValue, 
                      TMP.QuantityReorderAppend, TMP.SaleIfOutOfStock, TMP.SaleIfOutOfStockScenario, TMP.ShipPrice, TMP.ShowDaysToship, TMP.ShowIfOutOfStock, 
                      TMP.ShowInStockNote, TMP.ShowStockLevel, TMP.SmallImgFileName, TMP.StrikethroughPriceValue, TMP.StrikethroughPriceVATIncluded, 
                      TMP.StrikethroughPrice1Value, TMP.StrikethroughPrice1VATIncluded, TMP.StrikethroughPrice2Value, TMP.StrikethroughPrice2VATIncluded, 
                      TMP.StrikethroughPrice3Value, TMP.StrikethroughPrice3VATIncluded, TMP.StrikethroughPrice4Value, TMP.StrikethroughPrice4VATIncluded, TMP.TaxCountryISOCode, 
                      TMP.TaxRate, TMP.UnitsForSale, TMP.UnitsForSale1, TMP.UnitsForSale2, TMP.UnitsForSale3, TMP.UnitsForSale4, TMP.Visible, TMP.Weight,
                    CASE WHEN  ISNULL(dbo.MYTHO_ProductEntities.ActionCode,0)  = 0 THEN 0 ELSE 1 END As Sincronizzato
                      
FROM MYTHO_Articoli_TMP TMP 
        INNER JOIN  ANAGRAFICAARTICOLI ON ANAGRAFICAARTICOLI.CODICE = TMP.CODICEMETODO
        LEFT OUTER JOIN MYTHO_Codici_Articoli ON MYTHO_Codici_Articoli.CODICEMETODO = TMP.CODICEMETODO  
        LEFT OUTER JOIN MYTHO_ProductEntities ON MYTHO_ProductEntities.ItemSKU = TMP.ItemSKU
        INNER JOIN ANAGRAFICAARTICOLICOMM ON ANAGRAFICAARTICOLI.CODICE = ANAGRAFICAARTICOLICOMM.CODICEART 
        INNER JOIN TABUTENTI ON ANAGRAFICAARTICOLICOMM.ESERCIZIO = TABUTENTI.ESERCIZIOATTIVO
WHERE      (TABUTENTI.USERDB = CAST(USER_NAME() AS VARCHAR(25))) AND (TABUTENTI.SUPERVISOR = 1)
  /* Implementare giacenze
  
  /****** Script per comando SelectTopNRows da SSMS  ******/
SELECT TOP 1000 [CODART]
      ,[CODDEPOSITO]
      ,[CODUBICAZIONE]
      ,[NRIFPARTITA]
      ,[ESERCIZIO]
      ,(CARICO - SCARICO + RESODASCARICO - RESODACARICO)  AS GIACENZA
      ,(CARICO - SCARICO + RESODASCARICO - RESODACARICO + ORDINATO - IMPEGNATO) AS DISPONIBILITA
  FROM [Test_Embyon_1620].[dbo].[VISTAGIACENZETOT]
  Where ESERCIZIO = YEAR(getdate())

  
  
  */
  --LEFT OUTER JOIN [MYTHO_Codici_Articoli] RIF
  --ON RIF.CODICEMETODO = [TMP].CODICEMETODO
  --WHERE Enabled= 1

GO
GRANT SELECT
    ON OBJECT::[dbo].[Vista_MYTHO_Articoli_Profilo] TO [Metodo98]
    AS [dbo];

