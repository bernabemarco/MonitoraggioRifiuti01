

CREATE FUNCTION [dbo].[MB_FunRows4Analisys_Pivot] 
                (   
                    @IdSession decimal(5,0)
                )
                RETURNS TABLE 
                AS
                RETURN 
                (WITH RigheRaggruppateArticolo AS ( 
                    SELECT     
                            rd.CODART
                            ,ISNULL(tmp.Sel_1,'Vuoto') As Sel_1,ISNULL(tmp.Sel_2,'Vuoto') As Sel_2,ISNULL(tmp.Sel_3,'Vuoto') As Sel_3,ISNULL(tmp.Sel_4,'Vuoto') As Sel_4,ISNULL(tmp.Sel_5,'Vuoto') As Sel_5,ISNULL(tmp.Sel_6,'Vuoto') As Sel_6
                            ,(D.CodAgente1) AS CodAgente1,(D.CodAgente2) AS CodAgente2,(D.CodAgente3) AS CodAgente3
                            ,(D.ValoreProvv1) AS ValoreProvv1,(D.ValoreProvv2) AS ValoreProvv2,(D.ValoreProvv3) AS ValoreProvv3
                            ,(D.ValoreVend) AS ValoreVend
                            ,(D.ValoreVendLordo) AS ValoreVendLordo
                            ,(D.QtaVenduto) AS QtaVenduto
                            ,(D.QtaVenduto1) As QtaVenduto1
                            ,(D.ValoreReso) AS ValoreReso
                            ,(D.ValoreReso1) AS ValoreReso1
                            ,(D.ValoreResoStd) As ValoreResoStd
                            ,(tmp.QtaExtra) AS QtaExtra
                            ,(Tmp.QtaExtra01) AS QtaExtra01
                            ,(Tmp.QtaExtra02) AS QtaExtra02
                            ,(Tmp.QtaExtra03) AS QtaExtra03
                            ,(Tmp.QtaExtra04) AS QtaExtra04
                            ,(Tmp.QtaExtra05) AS QtaExtra05
                            ,(Tmp.QtaExtra06) AS QtaExtra06
                            ,(Tmp.QtaExtra07) AS QtaExtra07
                            ,(Tmp.QtaExtra08) AS QtaExtra08
                            ,(Tmp.QtaExtra09) AS QtaExtra09
                            ,(Tmp.QtaExtra10) AS QtaExtra10
                            ,(Tmp.ValoreExtra) AS ValoreExtra
                            ,(Tmp.ValoreExtra01) AS ValoreExtra01
                            ,(Tmp.ValoreExtra02) AS ValoreExtra02
                            ,(Tmp.ValoreExtra03) AS ValoreExtra03
                            ,(Tmp.ValoreExtra04) AS ValoreExtra04
                            ,(Tmp.ValoreExtra05) AS ValoreExtra05
                            ,(Tmp.ValoreExtra06) AS ValoreExtra06
                            ,(Tmp.ValoreExtra07) AS ValoreExtra07
                            ,(Tmp.ValoreExtra08) AS ValoreExtra08
                            ,(Tmp.ValoreExtra09) AS ValoreExtra09
                            ,(Tmp.ValoreExtra10) AS ValoreExtra10
                            ,CASE WHEN  (D.QtaVenduto) > 0 AND (D.ValoreVend) >0 THEN  (D.ValoreVendLordo) / (D.QtaVenduto) ELSE 0 END AS PrezzoUnitarioLordo
                            ,(D.QtaReso) AS QtaReso
                            ,(D.QtaReso1) As QtaReso1
                            ,(D.QtaResoStd) as QtaResoStd
                            ,(D.ValoreMedioAcquistato) AS ValoreMedioAcquistato
                            ,(D.QtaTraspTax) AS QtaTraspTax
                            ,(D.ValoreTraspAcq )  ValoreTraspAcq
                            ,(D.QtaOma) AS QtaOma
                            ,(D.QtaOmaAcq) As QtaOmaAcq
                            ,(D.QtaTrasp) AS QtaTrasp
                            ,(ScontoVendita) AS ScontoVendita
                            ,D.UMConv1
                            ,D.UMConv2
                            ,D.ValorePFA
                            ,D.QTAPFA
                            ,D.QTATOT
                    FROM  [MB_Righe_Pivot] AS D 
                            INNER JOIN dbo.RIGHEDOCUMENTI RD
                            ON Rd.IDTESTA = D.IDTestaDoc AND rd.IDRIGA = d.IDRigaDoc
                            INNER JOIN dbo.MB_DettaglioRighe_Tmp tmp
                            ON  tmp.IDTestaDoc = d.Idtestadoc AND tmp.IDRigaDoc= d.idrigadoc
                    WHERE  tmp.Sel_1 <>'' AND tmp.IdSessione = @IdSession )
                    SELECT  ISNULL(D.Sel_1,'Vuoto') As Sel_1, ISNULL(D.Sel_2,'Vuoto') As Sel_2, ISNULL(D.Sel_3,'Vuoto') As Sel_3, ISNULL(D.Sel_4,'Vuoto') As Sel_4, ISNULL(D.Sel_5,'Vuoto') As Sel_5, ISNULL(D.Sel_6,'Vuoto') As Sel_6
                            ,MAX(CodAgente1) AS CodAgente1, MAX(CodAgente2) AS CodAgente2, MAX(CodAgente3) AS CodAgente3
                            ,SUM(ValoreProvv1) AS ValoreProvv1, SUM(ValoreProvv2) AS ValoreProvv2,SUM(ValoreProvv3) AS ValoreProvv3
                            ,SUM(D.ValoreVend) AS ValoreVend
                            ,SUM(D.ValoreVendLordo) AS ValoreVendLordo
                            ,SUM(D.QtaVenduto) AS QtaVenduto
                            ,SUM(D.QtaVenduto1) As QtaVenduto1
                            ,SUM(D.ValoreReso) AS ValoreReso
                            ,SUM(D.ValoreReso1) AS ValoreReso1
                            ,SUM(D.ValoreResoStd) As ValoreResoStd
                            ,MAX(D.QtaExtra) AS QtaExtra,MAX(D.QtaExtra01) AS QtaExtra01,MAX(D.QtaExtra02) AS QtaExtra02,MAX(D.QtaExtra03) AS QtaExtra03,MAX(D.QtaExtra04) AS QtaExtra04,MAX(D.QtaExtra05) AS QtaExtra05,MAX(D.QtaExtra06) AS QtaExtra06,MAX(D.QtaExtra07) AS QtaExtra07,MAX(D.QtaExtra08) AS QtaExtra08,MAX(D.QtaExtra09) AS QtaExtra09,MAX(D.QtaExtra10) AS QtaExtra10
                            ,AVG(D.ValoreExtra) AS ValoreExtra,AVG(D.ValoreExtra01) AS ValoreExtra01,AVG(D.ValoreExtra02) AS ValoreExtra02,AVG(D.ValoreExtra03) AS ValoreExtra03,AVG(D.ValoreExtra04) AS ValoreExtra04,AVG(D.ValoreExtra05) AS ValoreExtra05,AVG(D.ValoreExtra06) AS ValoreExtra06,AVG(D.ValoreExtra07) AS ValoreExtra07,AVG(D.ValoreExtra08) AS ValoreExtra08,AVG(D.ValoreExtra09) AS ValoreExtra09,AVG(D.ValoreExtra10) AS ValoreExtra10
                            ,CASE WHEN  SUM(VALOREPFA)>0    THEN  SUM(VALOREPFA) / SUM(QTAPFA) ELSE 0 END AS ValoreUnitarioPFA_Acq
                            ,CASE WHEN  SUM(D.QtaVenduto) > 0 AND SUM(D.ValoreVend) >0 THEN  SUM(D.ValoreVendLordo) / SUM(D.QtaVenduto) ELSE 0 END AS PrezzoUnitarioLordo
                            ,SUM(D.QtaReso) AS QtaReso
                            ,SUM(D.QtaReso1) As QtaReso1
                            ,SUM(D.QtaResoStd) as QtaResoStd
                            ,AVG(D.ValoreMedioAcquistato) AS ValoreMedioAcquistato
                            ,SUM(D.QtaTraspTax) AS QtaTraspTax
                            ,CASE WHEN SUM(D.QtaVenduto) > 0 THEN (SUM(D.ValoreTraspAcq  ) / SUM(QtaVenduto)) ELSE 0 END As ValoreTraspAcq
                            ,SUM(D.QtaOma) AS QtaOma
                            ,SUM(D.QtaOmaAcq) As QtaOmaAcq
                            ,SUM(QtaTrasp) AS QtaTrasp
                            ,SUM(ScontoVendita) AS ScontoVendita
                            ,D.UMConv1
                            ,D.UMConv2
                            ,MAX(QtaTot) AS Qtatot
                            ,ISNULL((SELECT EUROKG FROm VISTA_TARIFFASMALTIMENTO  WHERE ESERCIZIO =(SELECT YEAR(MAX(DATADOC)) FROM dbo.MB_RIFRIGHEDOCUMENTI_TMP WHERE IDSESSIONE=@IdSession)) ,0) TariffaSmaltimento
                    FROM  RigheRaggruppateArticolo D
                    GROUP BY  D.Sel_1, D.Sel_2, D.Sel_3, D.Sel_4, D.Sel_5, D.UMConv1,D.UmConv2, D.Sel_6 )

GO
GRANT SELECT
    ON OBJECT::[dbo].[MB_FunRows4Analisys_Pivot] TO [Metodo98]
    AS [dbo];

