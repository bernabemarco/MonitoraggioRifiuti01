

create view [dbo].Ald_VistaAgente1_ClientiAnagrConFatturato
as
/*raggr per agente + dsc; provincia
idtrust==>*1,10,11,15,99*
Fatturato per cliente */
SELECT     AnaRis.ESERCIZIO, AnaRis.CODAGENTE1, AAg.DSCAGENTE, AnaCF.PROVINCIA, AnaRis.CODCONTO AS CodCliAnagr, AnaCF.DSCCONTO1, ISNULL
                          ((SELECT     SUM(td.TOTIMPONIBILEEURO * td.SEGNO) AS Expr1
                              FROM         TESTEDOCUMENTI AS td INNER JOIN
                                                    PARAMETRIDOC AS PD ON td.TIPODOC = PD.CODICE
                              WHERE     (PD.TIPO IN ('f', 'n')) AND (td.ESERCIZIO = AnaRis.ESERCIZIO) AND (td.CODCLIFOR = AnaRis.CODCONTO)), 0) AS TotFatturato
FROM         ANAGRAFICACF AS AnaCF INNER JOIN
                      ANAGRAFICARISERVATICF AS AnaRis ON AnaCF.CODCONTO = AnaRis.CODCONTO INNER JOIN
                      ANAGRAFICAAGENTI AS AAg ON AnaRis.CODAGENTE1 = AAg.CODAGENTE LEFT OUTER JOIN
                      EXTRACLIENTI AS ExC ON AnaCF.CODCONTO = ExC.CODCONTO
WHERE     (ExC.IdTrust IN (1, 10, 11, 15, 99))
GROUP BY AAg.DSCAGENTE, AnaRis.CODAGENTE1, AnaCF.PROVINCIA, AnaRis.ESERCIZIO, AnaRis.CODCONTO, AnaCF.DSCCONTO1


GO
GRANT DELETE
    ON OBJECT::[dbo].[Ald_VistaAgente1_ClientiAnagrConFatturato] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Ald_VistaAgente1_ClientiAnagrConFatturato] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[Ald_VistaAgente1_ClientiAnagrConFatturato] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Ald_VistaAgente1_ClientiAnagrConFatturato] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Ald_VistaAgente1_ClientiAnagrConFatturato] TO [Metodo98]
    AS [dbo];

