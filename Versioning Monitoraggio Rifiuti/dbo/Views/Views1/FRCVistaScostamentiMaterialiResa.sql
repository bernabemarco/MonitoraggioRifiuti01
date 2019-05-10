



/****** Object:  View [dbo].[FRCVistaScostamentiMaterialiResa]    Script Date: 08/05/2014 15:46:37 ******/

CREATE VIEW [dbo].[FRCVistaScostamentiMaterialiResa]
AS
SELECT        dbo.FRCScostamentiMaterialiResa.ID, dbo.FRCScostamentiMaterialiResa.ANNO, dbo.FRCScostamentiMaterialiResa.MESEINIZIO AS Mese_Inizio, 
                         dbo.FRCScostamentiMaterialiResa.MESEFINE AS Mese_Fine, dbo.FRCScostamentiMaterialiResa.COMPOSTO, 
                         dbo.FRCScostamentiMaterialiResa.DSCCOMPOSTO AS Descrizione_Composto, RIGHT(dbo.FRCScostamentiMaterialiResa.COMPOSTO, 50) 
                         + ' - ' + RIGHT(dbo.FRCScostamentiMaterialiResa.DSCCOMPOSTO, 150) AS ARTICOLO, dbo.FRCVistaArticoli.GRUPPO, dbo.FRCVistaArticoli.DESCGRPART, 
                         dbo.FRCVistaArticoli.CATEGORIA, dbo.FRCVistaArticoli.DESCCATART, dbo.FRCVistaArticoli.CODCATEGORIASTAT, dbo.FRCVistaArticoli.DESCCATSTATART, 
                         dbo.FRCVistaArticoli.SERIE, dbo.FRCVistaArticoli.DESCSERIEART, dbo.FRCVistaArticoli.MODELLO, dbo.FRCVistaArticoli.DESCMODART, 
                         dbo.FRCScostamentiMaterialiResa.UM_BASE, dbo.FRCScostamentiMaterialiResa.AMBIENTE1 AS Ambiente_1, ISNULL
                             ((SELECT        Descrizione
                                 FROM            dbo.CGesAmbienti
                                 WHERE        (Codice = dbo.FRCScostamentiMaterialiResa.AMBIENTE1)), '') AS Descrizione_Ambiente_1, 
                         dbo.FRCScostamentiMaterialiResa.NomeEsplosione1 AS Nome_Esplosione_1, dbo.FRCScostamentiMaterialiResa.QTABASE1 AS [Quantita'_Base_1], 
                         dbo.FRCScostamentiMaterialiResa.COSTOUNITARIODIBA1 AS Costo_Unitario_DiBa_1, 
                         dbo.FRCScostamentiMaterialiResa.COSTOTOTALEDIBA1 AS Costo_Totale_DiBa_1, dbo.FRCScostamentiMaterialiResa.AMBIENTE2 AS Ambiente_2, ISNULL
                             ((SELECT        Descrizione
                                 FROM            dbo.CGesAmbienti AS CGesAmbienti_1
                                 WHERE        (Codice = dbo.FRCScostamentiMaterialiResa.AMBIENTE2)), '') AS Descrizione_Ambiente_2, 
                         dbo.FRCScostamentiMaterialiResa.QTABASE2 AS [Quantita'_Base_2], dbo.FRCScostamentiMaterialiResa.COSTOUNITARIODIBA2 AS Costo_Unitario_DiBa_2, 
                         dbo.FRCScostamentiMaterialiResa.COSTOTOTALEDIBA2 AS Costo_Totale_DiBa_2, dbo.FRCScostamentiMaterialiResa.DELTATOTALE AS Delta_Totale, 
                         dbo.FRCScostamentiMaterialiResa.DELTAVOLUME AS Delta_Volume, dbo.FRCScostamentiMaterialiResa.DELTAPREZZO AS Delta_Prezzo
FROM            dbo.FRCScostamentiMaterialiResa LEFT OUTER JOIN
                         dbo.FRCVistaArticoli ON dbo.FRCScostamentiMaterialiResa.COMPOSTO = dbo.FRCVistaArticoli.CODART


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCVistaScostamentiMaterialiResa] TO [Metodo98]
    AS [dbo];

