



/****** Object:  View [dbo].[FRCVistaScostamentiLE]    Script Date: 08/05/2014 15:46:16 ******/

CREATE VIEW [dbo].[FRCVistaScostamentiLE]
AS
SELECT        dbo.FRCScostamentiLE.ID, dbo.FRCScostamentiLE.ANNO, dbo.FRCScostamentiLE.MESEINIZIO AS Mese_Inizio, dbo.FRCScostamentiLE.MESEFINE AS Mese_Fine, 
                         dbo.FRCScostamentiLE.COMPOSTO, dbo.FRCScostamentiLE.DSCCOMPOSTO AS Descrizione_Composto, RIGHT(dbo.FRCScostamentiLE.COMPOSTO, 50) 
                         + ' - ' + RIGHT(dbo.FRCScostamentiLE.DSCCOMPOSTO, 150) AS ARTICOLO, dbo.FRCVistaArticoli.GRUPPO, dbo.FRCVistaArticoli.DESCGRPART, 
                         dbo.FRCVistaArticoli.CATEGORIA, dbo.FRCVistaArticoli.DESCCATART, dbo.FRCVistaArticoli.CODCATEGORIASTAT, dbo.FRCVistaArticoli.DESCCATSTATART, 
                         dbo.FRCVistaArticoli.SERIE, dbo.FRCVistaArticoli.DESCSERIEART, dbo.FRCVistaArticoli.MODELLO, dbo.FRCVistaArticoli.DESCMODART, 
                         dbo.FRCScostamentiLE.UM_BASE, dbo.FRCScostamentiLE.AMBIENTE1 AS Ambiente_1, ISNULL
                             ((SELECT        Descrizione
                                 FROM            dbo.CGesAmbienti
                                 WHERE        (Codice = dbo.FRCScostamentiLE.AMBIENTE1)), '') AS Descrizione_Ambiente_1, dbo.FRCScostamentiLE.QTABASE1 AS [Quantita'_Base_1], 
                         dbo.FRCScostamentiLE.COSTOUNITARIOESTERNO1 AS Costo_Unitario_Esterno_1, dbo.FRCScostamentiLE.COSTOTOTALEESTERNO1 AS Costo_Totale_Esterno_1, 
                         dbo.FRCScostamentiLE.AMBIENTE2 AS Ambiente_2, ISNULL
                             ((SELECT        Descrizione
                                 FROM            dbo.CGesAmbienti AS CGesAmbienti_1
                                 WHERE        (Codice = dbo.FRCScostamentiLE.AMBIENTE2)), '') AS Descrizione_Ambiente_2, dbo.FRCScostamentiLE.QTABASE2 AS [Quantita'_Base_2], 
                         dbo.FRCScostamentiLE.COSTOUNITARIOESTERNO2 AS Costo_Unitario_Esterno_2, dbo.FRCScostamentiLE.COSTOTOTALEESTERNO2 AS Costo_Totale_Esterno_2, 
                         dbo.FRCScostamentiLE.DELTATOTALE AS Delta_Totale, dbo.FRCScostamentiLE.DELTAVOLUME AS Delta_Volume, 
                         dbo.FRCScostamentiLE.DELTAPREZZO AS Delta_Prezzo
FROM            dbo.FRCScostamentiLE LEFT OUTER JOIN
                         dbo.FRCVistaArticoli ON dbo.FRCScostamentiLE.COMPOSTO = dbo.FRCVistaArticoli.CODART


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCVistaScostamentiLE] TO [Metodo98]
    AS [dbo];

