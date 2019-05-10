

CREATE VIEW [dbo].[VISTA_MB_ULTIMAELABORAZIONEUTENTE]

AS

SELECT    
       FU.Sel_1, FU.Sel_2, FU.Sel_3, FU.Sel_4, FU.Sel_5, FU.Sel_6,
       RD.TIPODOC, RD.NUMERODOC, RD.CODART, RD.NRRIFPARTITA, FU.UMConv1, FU.UMConv2,
       FU.ValoreVend, FU.ValoreVendLordo, FU.QtaVenduto, FU.QtaVenduto1, FU.ValoreReso,
       FU.QtaReso, FU.ValoreReso1, FU.QtaReso1, FU.QtaOma, FU.QtaExtra,
       FU.ValoreExtra, 0 QtaAcq, FU.QtaOmaAcq, FU.CodAgente1, FU.CodAgente2, FU.CodAgente3,
       FU.ValoreProvv1, FU.ValoreProvv2, FU.ValoreProvv3,
       FU.ValoreMedioAcquistato, FU.ValoreTraspAcq, RD.IDTESTA, RD.IDRIGA
FROM       
    ( 
        SELECT 
            _PIVOT.*, Sel_1, Sel_2, Sel_3, Sel_4, Sel_5, Sel_6, ValoreExtra, QtaExtra 
        FROM 
            dbo.MB_RIGHE_PIVOT _PIVOT                  
        INNER JOIN
            MB_DETTAGLIORIGHE_TMp TMP 
        ON TMP.IDTestaDoc = [_PIVOT].IDTESTADOC AND tmp.IDRigaDoc=[_PIVOT].IDRIGADOC
        WHERE tmp.IdSessione =  (
                                SELECT
                                    MAX(IdSessione) AS IdSessione
                                FROM
                                    dbo.MB_DettaglioRighe_Tmp AS TMP
                                WHERE
                                    (UtenteModifica = USER_NAME())
                                )
    ) AS FU
INNER JOIN
       dbo.RIGHEDOCUMENTI AS RD
ON FU.IDTestaDoc = RD.IDTESTA AND FU.IDRigaDoc = RD.IDRIGA


GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTA_MB_ULTIMAELABORAZIONEUTENTE] TO [Metodo98]
    AS [dbo];

