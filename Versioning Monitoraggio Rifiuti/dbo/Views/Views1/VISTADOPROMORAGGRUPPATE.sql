﻿
CREATE VIEW [dbo].[VISTADOPROMORAGGRUPPATE]
AS
SELECT     ART.CODICE, ART.DESCRIZIONE, EAP.progressivo, EAP.numerocampagna, EAP.descrizione AS DESCRPROMO, EAP.data_inizio, EAP.data_fine, 
                      EAP.clifor AS CODCLIFOR, CASE WHEN VISTARELPROMOCLIFOR.PROG_CONTRATTO IS NULL 
                      THEN 0 ELSE VISTARELPROMOCLIFOR.PROG_CONTRATTO END AS PROG_CONTRATTO, VISTARELPROMOCLIFOR.ESERCIZIO, EAP.gruppoprezzicf, 
                      EAP.CODSETTORE, EAP.CODZONA, EAP.CODCATEGORIA
FROM         dbo.ANAGRAFICAARTICOLI AS ART INNER JOIN
                      dbo.PROMOZIONI_ELENCOARTICOLI AS EAP ON EAP.codice = ART.CODICE LEFT OUTER JOIN
                      dbo.TP_VISTA_RELPROMOCLIFOR AS VISTARELPROMOCLIFOR ON EAP.progressivo = VISTARELPROMOCLIFOR.PROMOZIONE
WHERE     (EAP.tipo = 1) AND (ART.CODICE NOT IN
                          (SELECT     CODICE
                            FROM          dbo.VISTADOARTICOLINOPROMO))
GROUP BY ART.CODICE, ART.DESCRIZIONE, EAP.progressivo, EAP.numerocampagna, EAP.descrizione, EAP.data_inizio, EAP.data_fine, EAP.clifor, 
                      VISTARELPROMOCLIFOR.PROG_CONTRATTO, VISTARELPROMOCLIFOR.ESERCIZIO, EAP.gruppoprezzicf, EAP.CODSETTORE, EAP.CODZONA, EAP.CODCATEGORIA


GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTADOPROMORAGGRUPPATE] TO [Metodo98]
    AS [dbo];

