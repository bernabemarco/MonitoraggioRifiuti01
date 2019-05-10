

create view [dbo].Ald_VistaAgente1_ClientiFatturati
as
SELECT     TD.ESERCIZIO, TD.CODAGENTE1, AAg.DSCAGENTE, COUNT(DISTINCT TD.CODCLIFOR) AS CountCli
FROM         PARAMETRIDOC AS PD INNER JOIN
                      TESTEDOCUMENTI AS TD ON PD.CODICE = TD.TIPODOC INNER JOIN
                      ANAGRAFICAAGENTI AS AAg ON TD.CODAGENTE1 = AAg.CODAGENTE
WHERE     (PD.TIPO = 'F') AND (PD.CLIFOR = 'C')
GROUP BY TD.ESERCIZIO, TD.CODAGENTE1, AAg.DSCAGENTE


GO
GRANT DELETE
    ON OBJECT::[dbo].[Ald_VistaAgente1_ClientiFatturati] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Ald_VistaAgente1_ClientiFatturati] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[Ald_VistaAgente1_ClientiFatturati] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Ald_VistaAgente1_ClientiFatturati] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Ald_VistaAgente1_ClientiFatturati] TO [Metodo98]
    AS [dbo];

