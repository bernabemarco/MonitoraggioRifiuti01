

CREATE VIEW [dbo].[VISTADOCLIFORNOPROMO]
AS

SELECT DISTINCT
    Promozione,Campagna,CODCONTO
FROM
    ANAGRAFICARISERVATICF ARC
INNER JOIN
(
    Select Distinct
        TFP.Promozione,
        TFP.Campagna,
        ISNULL(TFP.Zona,0) AS Zona,
        ISNULL(TFP.Settore,0) AS Settore,
        ISNULL(TFP.Categoria,0) AS Categoria,
        ISNULL(TFP.GruppoPrezziParticolari,0) AS GruppoPrezziParticolari
    from 
        TP_FiltroPromo TFP
    INNER JOIN
        TP_PROMOZIONI_TESTE TPT
    ON
        TPT.Progressivo = TFP.Promozione AND
        TPT.NumeroCampagna = TFP.Campagna AND
        TPT.Attiv_Disat = 0 AND
        CONVERT(Varchar(8),GETDATE(),112) BETWEEN CONVERT(Varchar(8),TPT.Data_Inizio,112) AND CONVERT(Varchar(8),TPT.Data_Fine,112)
) FP
ON
    (FP.Zona = ARC.CODZONA AND ARC.CODZONA <> 0) OR
    (FP.Settore = ARC.CODSETTORE AND ARC.CODSETTORE <> 0) OR
    (FP.Categoria = ARC.CODCATEGORIA AND ARC.CODCATEGORIA <> 0) OR
    (FP.GruppoPrezziParticolari = ARC.CODGRUPPOPREZZIPART AND ARC.CODGRUPPOPREZZIPART <> 0)
INNER JOIN
    TABUTENTI TU
ON
    ARC.ESERCIZIO = TU.ESERCIZIOATTIVO AND
    TU.USERDB = USER_NAME()
    

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTADOCLIFORNOPROMO] TO [Metodo98]
    AS [dbo];

