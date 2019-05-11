﻿CREATE VIEW dbo.BRIOVISTACLIFOR
AS
SELECT     AF.TIPOCONTO, AF.CODCONTO, AF.CODMASTRO, AF.CAP, AF.LOCALITA, AF.PROVINCIA, AF.CODNAZIONE, AF.CODICEISO, RF.ESERCIZIO, 
                      RF.CODSETTORE, RF.CODZONA, RF.CODCATEGORIA, RF.CODSPED, RF.CODPAG,
                          (SELECT     CAB
                            FROM          BANCAAPPCF
                            WHERE      CODCONTO = RF.CODCONTO AND CODICE = BANCAANAGR) AS CAB,
                          (SELECT     ABI
                            FROM          BANCAAPPCF
                            WHERE      CODCONTO = RF.CODCONTO AND CODICE = BANCAANAGR) AS ABI,
                          (SELECT     CONTOCORRENTE
                            FROM          BANCAAPPCF
                            WHERE      CODCONTO = RF.CODCONTO AND CODICE = BANCAANAGR) AS CCDEBITORE, RF.CODAGENTE1, RF.CODAGENTE2, RF.CODAGENTE3, 
                      RF.DESTDIVMERCI, RF.FIDOEURO, RF.CODGRUPPOPREZZIPART, RF.CODGRUPPOPROVPART, AF.DSCCONTO1
FROM         dbo.ANAGRAFICACF AF INNER JOIN
                      dbo.ANAGRAFICARISERVATICF RF ON AF.CODCONTO = RF.CODCONTO
WHERE     (RF.ESERCIZIO =
                          (SELECT     MAX(CODICE)
                            FROM          TABESERCIZI))

GO
GRANT SELECT
    ON OBJECT::[dbo].[BRIOVISTACLIFOR] TO [Metodo98]
    AS [dbo];
