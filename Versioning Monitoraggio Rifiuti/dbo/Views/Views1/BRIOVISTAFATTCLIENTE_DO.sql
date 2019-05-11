﻿CREATE VIEW dbo.BRIOVISTAFATTCLIENTE_DO
AS
SELECT				  TD.ESERCIZIO,YEAR(TD.DATADOC) AS ANNODOC,MONTH(TD.DATADOC) AS MESE, STR(MONTH(TD.DATADOC), 2, 0) + ' - ' + DATENAME(MM, TD.DATADOC) AS MESEDOC, 
					  { fn WEEK(TD.DATADOC)} AS SETTDOC, DAY(TD.DATADOC) AS GIORNODOC, 
					  TD.TIPODOC + ' - ' + PARAMETRIDOC.DESCRIZIONE AS TIPODOC, TD.NUMERODOC, TD.DATADOC, TD.CODCLIFOR, TD.CODAGENTE1, TD.CODAGENTE2, TD.CODAGENTE3, 
					  TD.NUMDESTDIVERSAMERCI, TD.RAGSOCDDM, TD.PROVINCIADDM, TD.LOCALITADDM,
                      RD.IDRIGA AS PROGRIGADOC, RD.TIPORIGA, RD.CODART, RD.DATACONSEGNA, RD.RIFCOMMCLI, RD.NOMECOMMESSAPROD, 
                      RD.CODDEPOSITO, RD.QTAGEST * FC.FATTORE * TD.SEGNO AS QTASTAT, RD.QTAGESTRES * FC.FATTORE * TD.SEGNO AS QTASTATRES, 
					  CASE WHEN(RD.TIPORIGA='O') THEN 0 ELSE ( RD.QTAGEST * FC.FATTORE * TD.SEGNO) END AS QTASTAT_SENZAOMAGGI,
                      RD.TOTNETTORIGAEURO * TD.SEGNO AS TOTNETTORIGAEURO, RD.TOTLORDORIGAEURO*TD.SEGNO AS TOTLORDORIGAEURO,
					  RD.TOTNETTORIGA * TD.SEGNO AS TOTNETTORIGADIVISA,
					  RD.TOTNETTORIGAEURORES * TD.SEGNO AS TOTNETTORIGAEURORES, 
                      RD.TOTNETTORIGAEURO * TD.SEGNO * (CAST(REPLACE(TD.PRCPROVVFINALEAG1,',','.') as decimal(9,4))) / 100 + RD.TOTPROVVAGEURO1 * TD.SEGNO AS TOTPROVVAG1EURO, 
                      RD.TOTNETTORIGAEURO * TD.SEGNO * (CAST(REPLACE(TD.PRCPROVVFINALEAG2,',','.') as decimal(9,4)))/ 100 + RD.TOTPROVVAGEURO2 * TD.SEGNO AS TOTPROVVAG2EURO, 
                      RD.TOTNETTORIGAEURO * TD.SEGNO * (CAST(REPLACE(TD.PRCPROVVFINALEAG3,',','.') as decimal(9,4))) / 100 + RD.TOTPROVVAGEURO3 * TD.SEGNO AS TOTPROVVAG3EURO,
                          (SELECT     UM
                            FROM          ARTICOLIUMPREFERITE UMP
                            WHERE      UMP.CODART = RD.CODART AND UMP.TIPOUM = 8) AS UMSTATART, TD.INCIDENZASCONTI, 
                      CASE WHEN RD.TIPORIGA='O' THEN RD.TOTNETTORIGAEURO * TD.SEGNO ELSE TD.INCIDENZASCONTI * RD.TOTNETTORIGAEURO * TD.SEGNO END AS TOTNETTISSIMO, 
					  CASE WHEN RD.TIPORIGA='O' THEN RD.TOTNETTORIGA * TD.SEGNO ELSE TD.INCIDENZASCONTI * RD.TOTNETTORIGA * TD.SEGNO END AS TOTNETTISSIMODIVISA,
					  TD.CODCAMBIO, 
                      CASE WHEN RD.TIPORIGA='O' THEN RD.TOTNETTORIGAEURORES * TD.SEGNO ELSE TD.INCIDENZASCONTI * RD.TOTNETTORIGAEURORES * TD.SEGNO END AS TOTNETTISSIMORES, 
					  dbo.LEGGIULTIMOPREZZO(RD.CODART, TD.DATADOC)* RD.QTAGEST * FC.FATTORE * TD.SEGNO AS TOTCOSTOEURO, 
                      (CASE WHEN RD.TIPORIGA='O' THEN RD.TOTNETTORIGAEURO * TD.SEGNO ELSE TD.INCIDENZASCONTI * RD.TOTNETTORIGAEURO * TD.SEGNO END) - dbo.LEGGIULTIMOPREZZO(RD.CODART, TD.DATADOC)* RD.QTAGEST * FC.FATTORE * TD.SEGNO AS MARGNETTISSIMO, 
					  dbo.LEGGIULTIMOPREZZO(RD.CODART, TD.DATADOC)* RD.QTAGESTRES * FC.FATTORE * TD.SEGNO AS TOTCOSTOEURORES, 
                      (CASE WHEN RD.TIPORIGA='O' THEN RD.TOTNETTORIGAEURORES * TD.SEGNO ELSE TD.INCIDENZASCONTI * RD.TOTNETTORIGAEURORES * TD.SEGNO END)- dbo.LEGGIULTIMOPREZZO(RD.CODART, TD.DATADOC)* RD.QTAGESTRES * FC.FATTORE * TD.SEGNO AS MARGNETTISSIMORES, 
                      RD.TOTNETTORIGAEURO * TD.SEGNO - dbo.LEGGIULTIMOPREZZO(RD.CODART, TD.DATADOC)* RD.QTAGEST * FC.FATTORE * TD.SEGNO AS MARGNETTO, 
					  RD.TOTNETTORIGAEURORES * TD.SEGNO - dbo.LEGGIULTIMOPREZZO(RD.CODART,TD.DATADOC) * RD.QTAGESTRES * FC.FATTORE * TD.SEGNO AS MARGNETTORES,
					  dbo.LEGGICLIENTEINTESTATARIO(RD.IDTESTARP) AS CLIENTEBOLLA,
					  TE.NCAMPAGNA,TE.DESCCAMPAGNA, TE.NPROMOZIONE,TE.DESCPROMOZIONE,TE.RIGAPADRE, RD.IDRIGA, TD.PROGRESSIVO
FROM         dbo.TESTEDOCUMENTI TD INNER JOIN
                      dbo.RIGHEDOCUMENTI RD ON TD.PROGRESSIVO = RD.IDTESTA INNER JOIN
					  dbo.TP_EXTRARIGHEDOC TE ON TE.IDTESTA=RD.IDTESTA AND TE.IDRIGA=RD.IDRIGA INNER JOIN
                      dbo.PARAMETRIDOC ON dbo.PARAMETRIDOC.CODICE = TD.TIPODOC AND dbo.PARAMETRIDOC.TIPO IN ('F', 'N','O') AND 
                      dbo.PARAMETRIDOC.CLIFOR = 'C' INNER JOIN
                      dbo.ARTICOLIFATTORICONVERSIONE FC ON RD.CODART = FC.CODART AND FC.UM1 = RD.UMGEST
WHERE     (FC.UM2 =
                          (SELECT     UM
                            FROM          ARTICOLIUMPREFERITE UMP
                            WHERE      UMP.CODART = RD.CODART AND UMP.TIPOUM = 8))

GO
GRANT SELECT
    ON OBJECT::[dbo].[BRIOVISTAFATTCLIENTE_DO] TO [Metodo98]
    AS [dbo];
