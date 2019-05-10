


CREATE VIEW  [dbo].[VISTA_MB_Righe_Pivot] AS

                WITH RigheRaggruppateArticolo AS ( 

                        SELECT     
                            D.CODART
                            ,IDTESTADOC
                            ,IDRIGADOC
                            ,(CodAgente1) AS CodAgente1
                            ,(CodAgente2) AS CodAgente2
                            ,(CodAgente3) AS CodAgente3
                            ,(ValoreProvv1) AS ValoreProvv1
                            ,(ValoreProvv2) AS ValoreProvv2
                            ,(ValoreProvv3) AS ValoreProvv3
                            ,(D.ValoreVend) AS ValoreVend
                            ,(D.ValoreVendLordo) AS ValoreVendLordo
                            ,(D.QtaVenduto) AS QtaVenduto
                            ,(D.QtaVenduto1) As QtaVenduto1
                            ,(D.ValoreReso) AS ValoreReso
                            ,(D.ValoreReso1) AS ValoreReso1
                            ,(D.ValoreResoStd) As ValoreResoStd
                            ,(D.VALOREPFA) AS VALOREPFA
                            ,(D.QTAPFA) AS QTAPFA

                            ,CASE WHEN  (D.QtaVenduto) > 0 AND (D.ValoreVend) >0 THEN  (D.ValoreVendLordo) / (D.QtaVenduto) ELSE 0 END AS PrezzoUnitarioLordo
                            ,(D.QtaReso) AS QtaReso
                            ,(D.QtaReso1) As QtaReso1
                            ,(D.QtaResoStd) as QtaResoStd
                            ,(D.ValoreMedioAcquistato) AS ValoreMedioAcquistato
                            ,ISNULL(QTATAX,0) AS QtaTraspTax
                            ,(D.ValoreTraspAcq )  ValoreTraspAcq
                            ,(D.QtaOma) AS QtaOma
                            ,(D.QtaOmaAcq) As QtaOmaAcq
                            ,ISNULL(QTAUM,0) AS QtaTrasp
                            ,(ScontoVendita) AS ScontoVendita
                            ,D.UMConv1
                            ,D.UMConv2
                            ,ISNULL(D.QtaTot,0) QtaTot
                            FROM  VISTA_MB_Righe AS D LEFT OUTER JOIN
                              VISTA_MB_Righe_Tipologie_in_Colonne AS C ON D.IDTestaDoc = C.IDTESTA AND D.IDRigaDoc = C.IDRIGA)
                            SELECT IDTESTADOC
                                ,IDRIGADOC
                                ,MAX(CodAgente1) AS CodAgente1
                                ,MAX(CodAgente2) AS CodAgente2
                                ,MAX(CodAgente3) AS CodAgente3
                                ,SUM(ValoreProvv1) AS ValoreProvv1
                                ,SUM(ValoreProvv2) AS ValoreProvv2
                                ,SUM(ValoreProvv3) AS ValoreProvv3
                                ,SUM(D.ValoreVend) AS ValoreVend
                                ,SUM(D.ValoreVendLordo) AS ValoreVendLordo
                                ,SUM(D.QtaVenduto) AS QtaVenduto
                                ,SUM(D.QtaVenduto1) As QtaVenduto1
                                ,SUM(D.ValoreReso) AS ValoreReso
                                ,SUM(D.ValoreReso1) AS ValoreReso1
                                ,SUM(D.ValoreResoStd) As ValoreResoStd
                                ,SUM(D.VALOREPFA) AS VALOREPFA
                                ,SUM(D.QTAPFA) AS QTAPFA
                                ,MAX(QtaTot) AS QtaTot
                                ,CASE WHEN  SUM(D.QtaVenduto) > 0 AND SUM(D.ValoreVend) >0 THEN  SUM(D.ValoreVendLordo) / SUM(D.QtaVenduto) ELSE 0 END AS PrezzoUnitarioLordo
                                ,SUM(D.QtaReso) AS QtaReso
                                ,SUM(D.QtaReso1) As QtaReso1
                                ,SUM(D.QtaResoStd) as QtaResoStd
                                ,AVG(D.ValoreMedioAcquistato) AS ValoreMedioAcquistato
                                ,SUM(D.QtaTraspTax) AS QtaTraspTax
                                ,SUM(D.ValoreTraspAcq)  As ValoreTraspAcq
                                ,SUM(D.QtaOma) AS QtaOma
                                ,SUM(D.QtaOmaAcq) As QtaOmaAcq
                                ,SUM(QtaTrasp) AS QtaTrasp
                                ,SUM(ScontoVendita) AS ScontoVendita
                                ,D.UMConv1
                                ,D.UMConv2
                            FROM  RigheRaggruppateArticolo D
                            GROUP BY  IDTESTADOC, IDRIGADOC,D.UMConv1,D.UmConv2

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTA_MB_Righe_Pivot] TO [Metodo98]
    AS [dbo];

