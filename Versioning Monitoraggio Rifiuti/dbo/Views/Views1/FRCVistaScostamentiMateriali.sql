



/****** Object:  View [dbo].[FRCVistaScostamentiMateriali]    Script Date: 08/05/2014 15:46:29 ******/

CREATE VIEW [dbo].[FRCVistaScostamentiMateriali]
AS
SELECT        dbo.FRCScostamentiMateriali.ID, dbo.FRCScostamentiMateriali.ANNO, dbo.FRCScostamentiMateriali.MESEINIZIO AS Mese_Inizio, 
                         dbo.FRCScostamentiMateriali.MESEFINE AS Mese_Fine, dbo.FRCScostamentiMateriali.COMPOSTO, 
                         dbo.FRCScostamentiMateriali.DSCCOMPOSTO AS Descrizione_Composto, RIGHT(dbo.FRCScostamentiMateriali.COMPOSTO, 50) 
                         + ' - ' + RIGHT(dbo.FRCScostamentiMateriali.DSCCOMPOSTO, 150) AS ARTICOLO, dbo.FRCVistaArticoli.GRUPPO, dbo.FRCVistaArticoli.DESCGRPART, 
                         dbo.FRCVistaArticoli.CATEGORIA, dbo.FRCVistaArticoli.DESCCATART, dbo.FRCVistaArticoli.CODCATEGORIASTAT, dbo.FRCVistaArticoli.DESCCATSTATART, 
                         dbo.FRCVistaArticoli.SERIE, dbo.FRCVistaArticoli.DESCSERIEART, dbo.FRCVistaArticoli.MODELLO, dbo.FRCVistaArticoli.DESCMODART, 
                         dbo.FRCScostamentiMateriali.UM_BASE, dbo.FRCScostamentiMateriali.AMBIENTE1 AS Ambiente_1, ISNULL
                             ((SELECT        Descrizione
                                 FROM            dbo.CGesAmbienti
                                 WHERE        (Codice = dbo.FRCScostamentiMateriali.AMBIENTE1)), '') AS Descrizione_Ambiente_1, 
                         dbo.FRCScostamentiMateriali.NomeEsplosione1 AS Nome_Esplosione_1, dbo.FRCScostamentiMateriali.QTABASE1 AS [Quantita'_Base_1], 
                         dbo.FRCScostamentiMateriali.COSTOUNITARIODIBA1 AS Costo_Unitario_DiBa_1, dbo.FRCScostamentiMateriali.COSTOTOTALEDIBA1 AS Costo_Totale_DiBa_1, 
                         dbo.FRCScostamentiMateriali.AMBIENTE2 AS Ambiente_2, ISNULL
                             ((SELECT        Descrizione
                                 FROM            dbo.CGesAmbienti AS CGesAmbienti_1
                                 WHERE        (Codice = dbo.FRCScostamentiMateriali.AMBIENTE2)), '') AS Descrizione_Ambiente_2, 
                         dbo.FRCScostamentiMateriali.QTABASE2 AS [Quantita'_Base_2], dbo.FRCScostamentiMateriali.COSTOUNITARIODIBA2 AS Costo_Unitario_DiBa_2, 
                         dbo.FRCScostamentiMateriali.COSTOTOTALEDIBA2 AS Costo_Totale_DiBa_2, dbo.FRCScostamentiMateriali.DELTATOTALE AS Delta_Totale, 
                         dbo.FRCScostamentiMateriali.DELTAVOLUME AS Delta_Volume, dbo.FRCScostamentiMateriali.DELTAPREZZO AS Delta_Prezzo
FROM            dbo.FRCScostamentiMateriali LEFT OUTER JOIN
                         dbo.FRCVistaArticoli ON dbo.FRCScostamentiMateriali.COMPOSTO = dbo.FRCVistaArticoli.CODART


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCVistaScostamentiMateriali] TO [Metodo98]
    AS [dbo];

