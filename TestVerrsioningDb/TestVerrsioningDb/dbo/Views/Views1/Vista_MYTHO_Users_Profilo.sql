﻿CREATE VIEW [dbo].[Vista_MYTHO_Users_Profilo]
As 
SELECT  '' as SelCli,    MYTHO_Users_TMP.IdSessione, MYTHO_Users_TMP.Enabled, ISNULL(dbo.MYTHO_Users_TMP.CHANGED,0) CHANGED, MYTHO_Users_TMP.CODICEMETODO, MYTHO_Users_TMP.IdUser, 
                      MYTHO_Users_TMP.Email, MYTHO_Users_TMP.ExecutedDate, MYTHO_UserEntities.UserOxID, MYTHO_Users_TMP.BillingAddress, 
                      MYTHO_Users_TMP.BillingAddressFloor, MYTHO_Users_TMP.BillingAddressL1, MYTHO_Users_TMP.BillingAddressL2, MYTHO_Users_TMP.BillingAddressL3, 
                      MYTHO_Users_TMP.BillingAddressL4, MYTHO_Users_TMP.BillingAddressOtherInfo, MYTHO_Users_TMP.BillingAddressStreet, 
                      MYTHO_Users_TMP.BillingCellPhone, MYTHO_Users_TMP.BillingCity, MYTHO_Users_TMP.BillingCountryISOCode, MYTHO_Users_TMP.BillingCountryName, 
                      MYTHO_Users_TMP.BillingFax, MYTHO_Users_TMP.BillingPhone, MYTHO_Users_TMP.BillingState, MYTHO_Users_TMP.BillingZipCode, 
                      MYTHO_Users_TMP.BirthDate, MYTHO_Users_TMP.Category1Name, MYTHO_Users_TMP.Category1OxId, MYTHO_Users_TMP.Category1Language, 
                      MYTHO_Users_TMP.Category1ParentOxId, MYTHO_Users_TMP.Category2Name, MYTHO_Users_TMP.Category2OxId, MYTHO_Users_TMP.Category2Language, 
                      MYTHO_Users_TMP.Category2ParentOxId, MYTHO_Users_TMP.Category3Name, MYTHO_Users_TMP.Category3OxId, MYTHO_Users_TMP.Category3Language, 
                      MYTHO_Users_TMP.Category3ParentOxId, MYTHO_Users_TMP.Category4Name, MYTHO_Users_TMP.Category4OxId, MYTHO_Users_TMP.Category4Language, 
                      MYTHO_Users_TMP.Category4ParentOxId, MYTHO_Users_TMP.Comments, MYTHO_Users_TMP.Company, MYTHO_Users_TMP.CustomerAccount, 
                      MYTHO_Users_TMP.Discount, MYTHO_Users_TMP.DiscountGridCode, MYTHO_Users_TMP.FirstName, MYTHO_Users_TMP.LastName, 
                      MYTHO_Users_TMP.Password, MYTHO_Users_TMP.PriceIndex, MYTHO_Users_TMP.RewardPoints, MYTHO_Users_TMP.SalesRepCode, 
                      MYTHO_Users_TMP.ShippingAddress, MYTHO_Users_TMP.ShippingAddressBuilding, MYTHO_Users_TMP.ShippingAddressFloor, 
                      MYTHO_Users_TMP.ShippingAddressL1, MYTHO_Users_TMP.ShippingAddressL2, MYTHO_Users_TMP.ShippingAddressL3, 
                      MYTHO_Users_TMP.ShippingAddressL4, MYTHO_Users_TMP.ShippingAddressOtherInfo, MYTHO_Users_TMP.ShippingAddressStreet, 
                      MYTHO_Users_TMP.ShippingCity, MYTHO_Users_TMP.ShippingCompany, MYTHO_Users_TMP.ShippingCountryISOCode, 
                      MYTHO_Users_TMP.ShippingCountryName, MYTHO_Users_TMP.ShippingFirstName, MYTHO_Users_TMP.ShippingLastName, MYTHO_Users_TMP.ShippingPhone, 
                      MYTHO_Users_TMP.ShippingState, MYTHO_Users_TMP.ShippingTitle, MYTHO_Users_TMP.ShippingZipCode, MYTHO_Users_TMP.SubscribeToNewsLetters, 
                      MYTHO_Users_TMP.SubscribeToSMSCampaign, MYTHO_Users_TMP.UserLanguage, MYTHO_Users_TMP.VATNumber,
                      CASE WHEN  ISNULL(dbo.MYTHO_UserEntities.UserOxID,0) = 0 THEN 0 ELSE 1 END As Sincronizzato
FROM         ANAGRAFICACF 
    INNER JOIN MYTHO_Users_TMP ON MYTHO_Users_TMP.CODICEMETODO = ANAGRAFICACF.CODCONTO 
	INNER JOIN MYTHO_Codici_User On MYTHO_Codici_User.CODICEMETODO = ANAGRAFICACF.CODCONTO
	LEFT OUTER JOIN MYTHO_UserEntities ON MYTHO_UserEntities.UserEntityId= MYTHO_Codici_User.IDUSER
	INNER JOIN ANAGRAFICARISERVATICF ON ANAGRAFICACF.CODCONTO = ANAGRAFICARISERVATICF.CODCONTO 
	INNER JOIN TABUTENTI ON ANAGRAFICARISERVATICF.ESERCIZIO = TABUTENTI.ESERCIZIOATTIVO
WHERE    ANAGRAFICACF.TIPOCONTO ='C'  AND  (TABUTENTI.USERDB = CAST(USER_NAME() AS VARCHAR(25))) AND (TABUTENTI.SUPERVISOR = 1)


GO
GRANT SELECT
    ON OBJECT::[dbo].[Vista_MYTHO_Users_Profilo] TO [Metodo98]
    AS [dbo];

