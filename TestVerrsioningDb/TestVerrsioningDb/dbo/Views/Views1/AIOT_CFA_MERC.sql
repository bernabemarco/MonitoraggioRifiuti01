﻿
CREATE VIEW AIOT_CFA_MERC
AS
SELECT     'GRP' AS TIPO, CAST(GRP.Codice AS VARCHAR) + ': ' + TB.DESCRIZIONE AS DEF, CON.RIFCONTRATTO, CON.PROGRESSIVO
FROM         dbo.ContrattiGrp_CON AS GRP INNER JOIN
                      dbo.CONTRATTI_CON AS CON ON CON.PROGRESSIVO = GRP.RIFPROGRESSIVO INNER JOIN
                      dbo.TABGRUPPI AS TB ON TB.CODICE = GRP.Codice
UNION
SELECT     'CAT' AS TIPO, CAST(CAT.Codice AS VARCHAR) + ': ' + TB.DESCRIZIONE AS DEF, CON.RIFCONTRATTO, CON.PROGRESSIVO
FROM         dbo.ContrattiCat_CON AS CAT INNER JOIN
                      dbo.CONTRATTI_CON AS CON ON CON.PROGRESSIVO = CAT.RIFPROGRESSIVO INNER JOIN
                      dbo.TABCATEGORIE AS TB ON TB.CODICE = CAT.Codice
UNION
SELECT     'SOT' AS TIPO, CAST(CAT.Codice AS VARCHAR) + ': ' + TB.DESCRIZIONE AS DEF, CON.RIFCONTRATTO, CON.PROGRESSIVO
FROM         dbo.ContrattiCatSt_CON AS CAT INNER JOIN
                      dbo.CONTRATTI_CON AS CON ON CON.PROGRESSIVO = CAT.RIFPROGRESSIVO INNER JOIN
                      dbo.TABCATEGORIESTAT AS TB ON TB.CODICE = CAT.Codice
UNION
SELECT     'GPZ' AS TIPO, CAST(PRZ.Codice AS VARCHAR) + ': ' + TB.DESCRIZIONE AS DEF, CON.RIFCONTRATTO, CON.PROGRESSIVO
FROM         dbo.ContrattiGrpPrz_CON AS PRZ INNER JOIN
                      dbo.CONTRATTI_CON AS CON ON CON.PROGRESSIVO = PRZ.RIFPROGRESSIVO INNER JOIN
                      dbo.TABRAGGRUPPAPREZZI AS TB ON TB.CODICE = PRZ.Codice
UNION
SELECT     'FRP' AS TIPO, CAST(RF.Famiglia AS VARCHAR) + ': ' + FA.Descrizione + ' - ' + CAST(RF.Reparto AS VARCHAR) + ': ' + RE.Descrizione AS DEF, CON.RIFCONTRATTO, 
                      CON.PROGRESSIVO
FROM         dbo.ContrattiFamRep_CON AS RF INNER JOIN
                      dbo.CONTRATTI_CON AS CON ON CON.PROGRESSIVO = RF.RIFPROGRESSIVO INNER JOIN
                      dbo.TabFamigliePOS AS FA ON FA.Codice = RF.Famiglia INNER JOIN
                      dbo.TabRepartiPOS AS RE ON RF.Reparto = RE.Codice
UNION
SELECT     'ART' AS TIPO, ART.Articolo + ': ' + A.DESCRIZIONE AS DEF, CON.RIFCONTRATTO, CON.PROGRESSIVO
FROM         dbo.ContrattiArt_CON AS ART INNER JOIN
                      dbo.CONTRATTI_CON AS CON ON CON.PROGRESSIVO = ART.RIFPROGRESSIVO INNER JOIN
                      dbo.ANAGRAFICAARTICOLI AS A ON A.CODICE = ART.Articolo


GO
GRANT SELECT
    ON OBJECT::[dbo].[AIOT_CFA_MERC] TO [Metodo98]
    AS [dbo];

