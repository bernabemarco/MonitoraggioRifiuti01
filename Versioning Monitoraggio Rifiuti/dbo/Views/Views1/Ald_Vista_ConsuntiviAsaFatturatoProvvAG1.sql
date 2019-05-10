


CREATE  view [dbo].[Ald_Vista_ConsuntiviAsaFatturatoProvvAG1]
as
SELECT     ExC.IdASA, TD.ESERCIZIO, MONTH(TD.DATADOC) AS MeseDoc, 
td.codagente1,
(select DSCAGENTE FROM ANAGRAFICAAGENTI where CODAGENTE=td.codagente1) as DSCAGENTE,
SUM(RD.TOTNETTORIGAEURO*td.SEGNO) AS TotRigheFatturato, SUM(RD.TOTPROVVAGEURO1*td.SEGNO) 
                      AS TotRigheProv1
					  --, SUM(RD.TOTPROVVAGEURO2*td.SEGNO) AS TotRigheProv2, 
					  --SUM(RD.TOTPROVVAGEURO3*td.SEGNO) AS TotRigheProv3
FROM         RIGHEDOCUMENTI AS RD INNER JOIN
                      TESTEDOCUMENTI AS TD ON RD.IDTESTA = TD.PROGRESSIVO INNER JOIN
                      PARAMETRIDOC AS PDC ON TD.TIPODOC = PDC.CODICE LEFT OUTER JOIN
                      AnagraficaCommesse AS AnaCom ON RD.RIFCOMMCLI = AnaCom.RifComm LEFT OUTER JOIN
                      ExtraCommCli AS ExC ON AnaCom.Progressivo = ExC.RifProgressivo
WHERE     (PDC.TIPO IN ('f', 'n')) AND (PDC.CLIFOR = 'C') AND (NOT (TD.TIPODOC IN ('ftx', 'ndx'))) 
AND (ISNULL(ExC.IdASA, 0) > 0)

GROUP BY ExC.IdASA, TD.ESERCIZIO, MONTH(TD.DATADOC), td.codagente1



GO
GRANT DELETE
    ON OBJECT::[dbo].[Ald_Vista_ConsuntiviAsaFatturatoProvvAG1] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Ald_Vista_ConsuntiviAsaFatturatoProvvAG1] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[Ald_Vista_ConsuntiviAsaFatturatoProvvAG1] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Ald_Vista_ConsuntiviAsaFatturatoProvvAG1] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Ald_Vista_ConsuntiviAsaFatturatoProvvAG1] TO [Metodo98]
    AS [dbo];

