﻿CREATE VIEW dbo.BRIOVISTAFATTFORNITORE
AS
SELECT     YEAR(TD.DATADOC) AS ANNODOC, MONTH(TD.DATADOC) AS MESE,STR(MONTH(TD.DATADOC), 2, 0) + ' - ' + DATENAME(MM, TD.DATADOC) AS MESEDOC, { fn WEEK(TD.DATADOC) 
                      } AS SETTDOC, DAY(TD.DATADOC) AS GIORNODOC, TD.TIPODOC + ' - ' + PARAMETRIDOC.DESCRIZIONE AS TIPODOC, TD.NUMERODOC, TD.DATADOC, TD.CODCLIFOR,TD.CODCAMBIO, RD.IDRIGA AS PROGRIGADOC, RD.TIPORIGA, RD.CODART, RD.DATACONSEGNA, RD.RIFCOMMCLI, 
                      RD.NOMECOMMESSAPROD, RD.CODDEPOSITO, RD.QTAGEST * FC.FATTORE * TD.SEGNO AS QTASTAT, 
                      RD.QTAGESTRES * FC.FATTORE * TD.SEGNO AS QTASTATRES, RD.TOTNETTORIGAEURO * TD.SEGNO AS TOTNETTORIGAEURO, 
					  RD.TOTNETTORIGA * TD.SEGNO AS TOTNETTORIGADIVISA,
                      RD.TOTNETTORIGAEURORES * TD.SEGNO AS TOTNETTORIGAEURORES, 
                      (SELECT UM FROM  ARTICOLIUMPREFERITE UMP  WHERE      UMP.CODART = RD.CODART AND UMP.TIPOUM = 8) AS UMSTATART, TD.INCIDENZASCONTI, 
                      CASE WHEN RD.TIPORIGA='O' THEN RD.TOTNETTORIGAEURO * TD.SEGNO ELSE TD.INCIDENZASCONTI * RD.TOTNETTORIGAEURO * TD.SEGNO END AS TOTNETTISSIMO, 
                      CASE WHEN RD.TIPORIGA='O' THEN RD.TOTNETTORIGA * TD.SEGNO ELSE TD.INCIDENZASCONTI * RD.TOTNETTORIGA * TD.SEGNO END AS TOTNETTISSIMODIVISA, 
                      CASE WHEN RD.TIPORIGA='O' THEN RD.TOTNETTORIGAEURORES * TD.SEGNO ELSE TD.INCIDENZASCONTI * RD.TOTNETTORIGAEURORES * TD.SEGNO END AS TOTNETTISSIMORES
FROM         dbo.TESTEDOCUMENTI TD INNER JOIN
                      dbo.RIGHEDOCUMENTI RD ON TD.PROGRESSIVO = RD.IDTESTA INNER JOIN
                      dbo.PARAMETRIDOC ON dbo.PARAMETRIDOC.CODICE = TD.TIPODOC AND dbo.PARAMETRIDOC.TIPO IN ('F', 'N') AND 
                      dbo.PARAMETRIDOC.CLIFOR = 'F' INNER JOIN
                      dbo.ARTICOLIFATTORICONVERSIONE FC ON RD.CODART = FC.CODART AND FC.UM1 = RD.UMGEST
WHERE     (FC.UM2 =
                          (SELECT     UM
                            FROM          ARTICOLIUMPREFERITE UMP
                            WHERE      UMP.CODART = RD.CODART AND UMP.TIPOUM = 8))

GO
GRANT SELECT
    ON OBJECT::[dbo].[BRIOVISTAFATTFORNITORE] TO [Metodo98]
    AS [dbo];

