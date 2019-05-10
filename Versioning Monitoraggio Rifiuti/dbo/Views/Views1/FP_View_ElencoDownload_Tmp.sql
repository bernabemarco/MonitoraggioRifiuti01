

CREATE VIEW [dbo].[FP_View_ElencoDownload_Tmp]
AS

SELECT
    FLEST.IDSESSIONE,
    FLEST.ProgressivoWS,
    FLEST.ProgressivoSDI,
    FLEST.Anno,
    FLEST.Numero,
    FLEST.Denominazione,
    FLEST.NomeFile,
    FLEST.DimensioneFile,
    ISNULL(FLE.Esito,'') As Esito,
    ISNULL(FLE.MsgEsito,'') As MsgEsito,
    FLEST.CodStatoWorkFlow,
    (CASE WHEN (FLE.Progressivo <> 0) THEN 1 ELSE 0 END) AS Esiste
FROM
    FP_LISTA_ESITI_SEL_TMP FLEST
LEFT JOIN
    FP_LISTA_ESITI FLE
ON 
    FLE.ProgressivoWS = FLEST.ProgressivoWS AND
    FLE.ProgressivoSDI = FLEST.ProgressivoSDI



GO
GRANT SELECT
    ON OBJECT::[dbo].[FP_View_ElencoDownload_Tmp] TO [Metodo98]
    AS [dbo];

