
CREATE VIEW [dbo].[AIOT_VISTALIV4TO]
AS

SELECT DISTINCT R.IDTESTARP, T.PROGRESSIVO, T.ESERCIZIO, T.TIPODOC, T.NUMERODOC, T.BIS, T.DATADOC, T.DATARIFDOC, F.CODCONTO, F.DSCCONTO1
FROM         dbo.RIGHEDOCUMENTI AS R INNER JOIN
                      dbo.TESTEDOCUMENTI AS T ON T.PROGRESSIVO = R.IDTESTA INNER JOIN
                      dbo.ANAGRAFICACF AS F ON F.CODCONTO = T.CODCLIFOR
WHERE     (R.IDTESTARP IN
                          (SELECT DISTINCT T.PROGRESSIVO
                            FROM          dbo.RIGHEDOCUMENTI AS R INNER JOIN
                                                   dbo.TESTEDOCUMENTI AS T ON T.PROGRESSIVO = R.IDTESTA
                            WHERE      (R.IDTESTARP IN
                                                       (SELECT DISTINCT T.PROGRESSIVO
                                                         FROM          dbo.RIGHEDOCUMENTI AS R INNER JOIN
                                                                                dbo.TESTEDOCUMENTI AS T ON T.PROGRESSIVO = R.IDTESTA
                                                         WHERE      (R.IDTESTARP IN
                                                                                    (SELECT     T.PROGRESSIVO
                                                                                      FROM          dbo.TESTEDOCUMENTI AS T INNER JOIN
                                                                                                             dbo.ACQ_TESTAOFFERTA AS A ON A.PROGRESSIVO = T.RifTransferOrder
                                                                                      WHERE      (T.RifTransferOrder > 0)))))))


GO
GRANT DELETE
    ON OBJECT::[dbo].[AIOT_VISTALIV4TO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[AIOT_VISTALIV4TO] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[AIOT_VISTALIV4TO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[AIOT_VISTALIV4TO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[AIOT_VISTALIV4TO] TO [Metodo98]
    AS [dbo];

