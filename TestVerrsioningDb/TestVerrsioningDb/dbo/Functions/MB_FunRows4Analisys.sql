
-- User Defined Function

CREATE FUNCTION [dbo].[MB_FunRows4Analisys]
(
 @IdSession decimal(5,0)
)

RETURNS TABLE

AS

RETURN

(
 SELECT
  IDTestaDoc
  ,IDRigaDoc
  ,CodAgente1
  ,CodAgente2
  ,CodAgente3
  ,CASE TIPO WHEN 1 THEN SUM([ValoreNettoRiga]) ELSE 0 END AS ValoreVend
  ,CASE TIPO WHEN 1 THEN SUM([ValoreLordoRiga]) ELSE 0 END AS ValoreVendLordo
  ,CASE TIPO WHEN 1 THEN SUM([QtaConv1])ELSE 0 END AS QtaVenduto
  ,CASE TIPO WHEN 1 THEN SUM([QtaConv2])ELSE 0 END AS QtaVenduto1
  ,CASE TIPO WHEN 2 THEN SUM([ValoreNettoRiga]) ELSE 0 END AS ValoreReso
  ,CASE TIPO WHEN 2 THEN SUM([QtaConv1]) ELSE 0 END AS QtaReso
  ,CASE TIPO WHEN 3 THEN SUM([ValoreNettoRiga]) ELSE 0 END AS ValoreReso1
  ,CASE TIPO WHEN 3 THEN SUM([QtaConv1]) ELSE 0 END AS QtaReso1
  ,CASE TIPO WHEN 8 THEN SUM([QtaConv1]) ELSE 0 END As QtaResoStd
  ,CASE TIPO WHEN 8 THEN SUM([ValoreNettoRiga]) ELSE 0 END As ValoreResoStd
  ,CASE TIPO WHEN 4 THEN SUM([QtaConv1]) ELSE 0 END As QtaOma
  --,CASE TIPO WHEN 5 THEN SUM([QtaConv1]) ELSE 0 END As QtaExtra
  --,CASE TIPO WHEN 5 THEN AVG([ValoreNettoRiga]) ELSE 0 END As ValoreExtra

  ,MAX(QtaExtra) QtaExtra
  ,MAX(ValoreExtra) ValoreExtra
  ,CASE TIPO WHEN 6 THEN SUM([QtaConv1]) ELSE 0 END As QtaAcq
  ,CASE TIPO WHEN 7 THEN SUM([QtaConv1]) ELSE 0 END As QtaOmaAcq
  --------------------Sconto Riga -------------------------------------------
  ,CASE TIPO WHEN 1 THEN SUM(ScontoRiga) ELSE 0 END AS ScontoVendita
  ---------------------------------------------------------------------------
  ,AVG(ValoreMedioAcquistato) AS ValoreMedioAcquistato
  ,AVG(ValoreTraspAcq) AS ValoreTraspAcq
  ,SUM(ValoreProvv1) As ValoreProvv1
  ,SUM(ValoreProvv2) As ValoreProvv2
  ,SUM(ValoreProvv3) As ValoreProvv3
  ,UMConv1
  ,UMConv2
  ,Sel_1
  ,Sel_2
  ,Sel_3
  ,Sel_4
  ,Sel_5
  ,Sel_6
 FROM
  dbo.MB_DettaglioRighe_Tmp
 WHERE
  IDSessione = @IdSession
 GROUP BY
  Tipo
  ,
  IDTestaDoc
  ,IDRigaDoc
  ,UMConv1
  ,UmConv2
  ,Sel_1
  ,Sel_2
  ,Sel_3
  ,Sel_4
  ,Sel_5
  ,Sel_6
  ,CodAgente1
  ,CodAgente2
  ,CodAgente3
)

--SELECT * FROM dbo.MB_DettaglioRighe_Tmp


GO
GRANT SELECT
    ON OBJECT::[dbo].[MB_FunRows4Analisys] TO [Metodo98]
    AS [dbo];

