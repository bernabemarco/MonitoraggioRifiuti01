
CREATE VIEW TMP_VISARTULTPREZZFORCLI
AS

SELECT     P.CODAGENTE, P.CODCONTO, P.CODARTICOLO, P.TIPODOC, P.ESERCIZIO, P.NUMERODOC, P.NUMRIFDOC, P.UMGEST, P.QTAGEST, P.DATADOC, 
                      P.UTENTEMODIFICA, P.DATAMODIFICA
FROM         dbo.TP_ULTIMOPREZZO AS P INNER JOIN
                      dbo.TP_DOCTRASFAG AS t ON t .CODICEDOC  = P.TIPODOC AND t .CODAGENTE  = P.CODAGENTE AND t .TIPO = 'R'
WHERE     (P.CODCONTO  IN
                          (SELECT     Valore
                            FROM          dbo.TP_PARAMETRI
                            WHERE      (Nome = 'ClienteTablet')))
UNION
SELECT DISTINCT 
                      P.CODAGENTE, P.CODCONTO, P.CODARTICOLO, P.TIPODOC, NULL AS Expr1, NULL AS Expr2, NULL AS Expr3, NULL AS Expr4, NULL 
                      AS Expr5, NULL AS Expr6, NULL AS Expr7, NULL AS Expr8
FROM         dbo.TP_ULTIMOPREZZO AS P 
WHERE     (P.CODCONTO  IN
                          (SELECT     Valore
                            FROM          dbo.TP_PARAMETRI AS TP_PARAMETRI_1
                            WHERE      (Nome = 'ClienteTablet')))
and P.TIPODOC  not in (select codicedoc from tp_doctrasfag)
AND P.TIPODOC IS NOT NULL

GO
GRANT SELECT
    ON OBJECT::[dbo].[TMP_VISARTULTPREZZFORCLI] TO [Metodo98]
    AS [dbo];

