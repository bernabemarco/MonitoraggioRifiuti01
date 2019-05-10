


/****** Object:  View [dbo].[FRCVistaScostamentiCicli]    Script Date: 08/05/2014 15:48:33 ******/

CREATE VIEW [dbo].[FRCVistaScostamentiCicli]
AS
SELECT        dbo.FRCScostamentiCicli.ID, dbo.FRCScostamentiCicli.ANNO, dbo.FRCScostamentiCicli.MESEINIZIO AS Mese_Inizio, 
                         dbo.FRCScostamentiCicli.MESEFINE AS Mese_Fine, dbo.FRCScostamentiCicli.COMPOSTO, dbo.FRCScostamentiCicli.DSCCOMPOSTO AS Descrizione_Composto, 
                         RIGHT(dbo.FRCScostamentiCicli.COMPOSTO, 50) + ' - ' + RIGHT(dbo.FRCScostamentiCicli.DSCCOMPOSTO, 150) AS ARTICOLO, dbo.FRCVistaArticoli.GRUPPO, 
                         dbo.FRCVistaArticoli.DESCGRPART, dbo.FRCVistaArticoli.CATEGORIA, dbo.FRCVistaArticoli.DESCCATART, dbo.FRCVistaArticoli.CODCATEGORIASTAT, 
                         dbo.FRCVistaArticoli.DESCCATSTATART, dbo.FRCVistaArticoli.SERIE, dbo.FRCVistaArticoli.DESCSERIEART, dbo.FRCVistaArticoli.MODELLO, 
                         dbo.FRCVistaArticoli.DESCMODART, dbo.FRCScostamentiCicli.UM_BASE, dbo.FRCScostamentiCicli.QTABASE1 AS [Quantita'_Base_1], 
                         dbo.FRCScostamentiCicli.QTABASE2 AS [Quantita'_Base_2], dbo.FRCScostamentiCicli.AMBIENTE1 AS Ambiente_1, ISNULL
                             ((SELECT        Descrizione
                                 FROM            dbo.CGesAmbienti
                                 WHERE        (Codice = dbo.FRCScostamentiCicli.AMBIENTE1)), '') AS Descrizione_Ambiente_1, dbo.FRCScostamentiCicli.AMBIENTE2 AS Ambiente_2, 
                         ISNULL
                             ((SELECT        Descrizione
                                 FROM            dbo.CGesAmbienti AS CGesAmbienti_1
                                 WHERE        (Codice = dbo.FRCScostamentiCicli.AMBIENTE2)), '') AS Descrizione_Ambiente_2, dbo.FRCScostamentiCicli.CDCProd AS Centro_Produzione, 
                         dbo.FRCScostamentiCicli.DESCDCProd AS Descrizione_Centro_Produzione, dbo.FRCScostamentiCicli.TEMPOUNIRISORSA1 AS Tempo_Unitario_Risorsa_1, 
                         dbo.FRCScostamentiCicli.TEMPOTOTRISORSA1 AS Tempo_Totale_Risorsa_1, dbo.FRCScostamentiCicli.COSTOORARISORSA1 AS Costo_Orario_Risorsa_1, 
                         dbo.FRCScostamentiCicli.COSTOTOTRISORSA1 AS Costo_Totale_Risorsa_1, dbo.FRCScostamentiCicli.TEMPOUNIRISORSA2 AS Tempo_Unitario_Risorsa_2, 
                         dbo.FRCScostamentiCicli.TEMPOTOTRISORSA2 AS Tempo_Totale_Risorsa_2, dbo.FRCScostamentiCicli.COSTOORARISORSA2 AS Costo_Orario_Risorsa_2, 
                         dbo.FRCScostamentiCicli.COSTOTOTRISORSA2 AS Costo_Totale_Risorsa_2, dbo.FRCScostamentiCicli.DELTATOTALEPROD AS Delta_Totale_Risorsa, 
                         dbo.FRCScostamentiCicli.DELTAVOLUMEPROD AS Delta_Volume_Risorsa, dbo.FRCScostamentiCicli.DELTAEFFICIENZAPROD AS Delta_Efficienza_Risorsa, 
                         dbo.FRCScostamentiCicli.DELTAPREZZOPROD AS Delta_Prezzo_Risorsa, dbo.FRCScostamentiCicli.CDCSetup AS Centro_Setup, 
                         dbo.FRCScostamentiCicli.DESCDCSetup AS Descrizione_Centro_Setup, dbo.FRCScostamentiCicli.TEMPOUNISETUP1 AS Tempo_Unitario_Setup_1, 
                         dbo.FRCScostamentiCicli.TEMPOTOTSETUP1 AS Tempo_Totale_Setup_1, dbo.FRCScostamentiCicli.COSTOORASETUP1 AS Costo_Orario_Setup_1, 
                         dbo.FRCScostamentiCicli.COSTOTOTSETUP1 AS Costo_Totale_Setup_1, dbo.FRCScostamentiCicli.TEMPOUNISETUP2 AS Tempo_Unitario_Setup_2, 
                         dbo.FRCScostamentiCicli.TEMPOTOTSETUP2 AS Tempo_Totale_Setup_2, dbo.FRCScostamentiCicli.COSTOORASETUP2 AS Costo_Orario_Setup_2, 
                         dbo.FRCScostamentiCicli.COSTOTOTSETUP2 AS Costo_Totale_Setup_2, dbo.FRCScostamentiCicli.DELTATOTALESETUP AS Delta_Totale_Setup, 
                         dbo.FRCScostamentiCicli.DELTAVOLUMESETUP AS Delta_Volume_Setup, dbo.FRCScostamentiCicli.DELTAEFFICIENZASETUP AS Delta_Efficienza_Setup, 
                         dbo.FRCScostamentiCicli.DELTAPREZZOSETUP AS Delta_Prezzo_Setup, dbo.FRCScostamentiCicli.CDCMop AS Centro_Uomo, 
                         dbo.FRCScostamentiCicli.DESCDCMop AS Descrizione_Centro_Uomo, dbo.FRCScostamentiCicli.TEMPOUNIUOMO1 AS Tempo_Unitario_Uomo_1, 
                         dbo.FRCScostamentiCicli.TEMPOTOTUOMO1 AS Tempo_Totale_Uomo_1, dbo.FRCScostamentiCicli.COSTOORAUOMO1 AS Costo_Orario_Uomo_1, 
                         dbo.FRCScostamentiCicli.COSTOTOTUOMO1 AS Costo_Totale_Uomo_1, dbo.FRCScostamentiCicli.TEMPOUNIUOMO2 AS Tempo_Unitario_Uomo_2, 
                         dbo.FRCScostamentiCicli.TEMPOTOTUOMO2 AS Tempo_Totale_Uomo_2, dbo.FRCScostamentiCicli.COSTOORAUOMO2 AS Costo_Orario_Uomo_2, 
                         dbo.FRCScostamentiCicli.COSTOTOTUOMO2 AS Costo_Totale_Uomo_2, dbo.FRCScostamentiCicli.DELTATOTALEUOMO AS Delta_Totale_Uomo, 
                         dbo.FRCScostamentiCicli.DELTAVOLUMEUOMO AS Delta_Volume_Uomo, dbo.FRCScostamentiCicli.DELTAEFFICIENZAUOMO AS Delta_Efficienza_Uomo, 
                         dbo.FRCScostamentiCicli.DELTAPREZZOUOMO AS Delta_Prezzo_Uomo
FROM            dbo.FRCScostamentiCicli LEFT OUTER JOIN
                         dbo.FRCVistaArticoli ON dbo.FRCScostamentiCicli.COMPOSTO = dbo.FRCVistaArticoli.CODART


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCVistaScostamentiCicli] TO [Metodo98]
    AS [dbo];

