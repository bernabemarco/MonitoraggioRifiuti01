


CREATE VIEW [dbo].[VISTA_MB_Righe]
AS

    SELECT 
        IDTestaDoc
        ,IDRigaDoc
        ,Tipo
        ,tmp.SEGNO
        ,tmp.CodAgente1
        ,tmp.CodAgente2
        ,tmp.CodAgente3
        ,ISNULL(tmp.codart  , '') CODART
        ,CASE TIPO WHEN 1 THEN SUM([ValoreNettoRiga] * tmp.segno) ELSE 0 END AS ValoreVend
        ,CASE TIPO WHEN 1 THEN SUM([ValoreLordoRiga] * tmp.segno) ELSE 0 END AS ValoreVendLordo
        ,CASE TIPO WHEN 1 THEN SUM([QtaConv1] * tmp.segno)ELSE 0 END AS QtaVenduto
        ,CASE TIPO WHEN 1 THEN SUM([QtaConv2] * tmp.segno)ELSE 0 END AS QtaVenduto1
        ,CASE TIPO WHEN 2 THEN SUM([ValoreNettoRiga] * tmp.segno) ELSE 0 END AS ValoreReso
        ,CASE TIPO WHEN 2 THEN SUM([QtaConv1] * tmp.segno) ELSE 0 END AS QtaReso
        ,CASE TIPO WHEN 3 THEN SUM([ValoreNettoRiga] * tmp.segno) ELSE 0 END AS ValoreReso1
        ,CASE TIPO WHEN 3 THEN SUM([QtaConv1] * tmp.segno) ELSE 0 END AS QtaReso1
        ,CASE TIPO WHEN 8 THEN SUM([QtaConv1] * tmp.segno) ELSE 0 END As QtaResoStd
        ,CASE TIPO WHEN 8 THEN SUM([ValoreNettoRiga] * tmp.segno) ELSE 0 END As ValoreResoStd
        ,CASE TIPO WHEN 4 THEN SUM([QtaConv1] * tmp.segno) ELSE 0 END As QtaOma
        ,SUM(PFA.VALOREPFA) VALOREPFA
        ,SUM(PFA.QTAGEST) QTAPFA
        --,CASE TIPO WHEN 5 THEN SUM([QtaConv1]) ELSE 0 END As QtaExtra
        --,CASE TIPO WHEN 5 THEN SUM([ValoreNettoRiga]) ELSE 0 END As ValoreExtra
        ---------------------------------------------------------------------------
        ,CASE TIPO WHEN 6 THEN SUM([QtaConv1]) ELSE 0 END As QtaAcq
        ,CASE TIPO WHEN 7 THEN SUM([QtaConv1]) ELSE 0 END As QtaOmaAcq
        --------------------Sconto Riga -------------------------------------------
        ,CASE TIPO WHEN 1 THEN SUM(tmp.ScontoRiga * tmp.segno) ELSE 0 END AS ScontoVendita
        ---------------------------------------------------------------------------
        ,AVG(ValoreAcquistato) AS ValoreMedioAcquistato
        ,CASE TIPO WHEN 1 THEN SUM(([QtaConv1]* ValoreTrasporto) * tmp.segno) ELSE 0 END AS ValoreTraspAcq
        ,CASE TIPO WHEN 1 THEN SUM(TOTPROVVAG1EURO) ELSE 0 END As ValoreProvv1
        ,CASE TIPO WHEN 1 THEN SUM(TOTPROVVAG2EURO) ELSE 0 END As ValoreProvv2
        ,CASE TIPO WHEN 1 THEN SUM(TOTPROVVAG3EURO) ELSE 0 END As ValoreProvv3
        ,UMConv1
        ,UMConv2
        ,MAX(VEN.QTATOT) QTATOT
        
    FROM
        (SELECT DAT_BASE_CONVERTITI.RAGGRUPPAMENTO,
            DAT_BASE_CONVERTITI.TIPO,
            DAT_BASE_CONVERTITI.IDTESTA As IDTestaDoc,
            DAT_BASE_CONVERTITI.IDRIGA As IDRigaDoc,
            DAT_BASE_CONVERTITI.ESERCIZIO,
            DAT_BASE_CONVERTITI.CODAGENTE1,
            DAT_BASE_CONVERTITI.CODAGENTE2,
            DAT_BASE_CONVERTITI.CODAGENTE3,
            DAT_BASE_CONVERTITI.CODART,
            DAT_BASE_CONVERTITI.DATADOC,
            DAT_BASE_CONVERTITI.TOTLORDORIGAEURO As ValoreLordoRiga,
            DAT_BASE_CONVERTITI.TOTNETTORIGAEURO As ValoreNettoRiga,
            ISNULL(DAT_BASE_CONVERTITI.ValoreAcquistato,0) AS ValoreAcquistato,
            ISNULL(TTCAA.ValoreQtaConv1,0) AS ValoreTrasporto,
            DAT_BASE_CONVERTITI.QTAPREZZO As QtaOrigine,
            DAT_BASE_CONVERTITI.QtaConv1,
            DAT_BASE_CONVERTITI.QtaConv2,
            DAT_BASE_CONVERTITI.UMPREZZO As UmOrigine,
            DAT_BASE_CONVERTITI.UmConv1,
            DAT_BASE_CONVERTITI.UmConv2,
            DAT_BASE_CONVERTITI.SCONTORIGA,
            DAT_BASE_CONVERTITI.FLGPROVV,

            DAT_BASE_CONVERTITI.TOTPROVVAG1EURO,
            DAT_BASE_CONVERTITI.TOTPROVVAG2EURO,
            DAT_BASE_CONVERTITI.TOTPROVVAG3EURO,
            CASE FlgProvv WHEN 0 THEN 1 ELSE 0 END SEGNO
        FROM
        (SELECT
            DATI_BASE.CODART,
            DATI_BASE.DATADOC,
            DATI_BASE.CODDEPOSITO,
            DATI_BASE.NRRIFPARTITA,
            DATI_BASE.RAGGRUPPAMENTO,
            DATI_BASE.TIPO,
            DATI_BASE.IDTESTA,
            DATI_BASE.IDRIGA,
            DATI_BASE.ESERCIZIO,
            DATI_BASE.TOTLORDORIGAEURO,
            DATI_BASE.TOTNETTORIGAEURO,
            DATI_BASE.CODAGENTE1,
            DATI_BASE.CODAGENTE2,
            DATI_BASE.CODAGENTE3,
            DATI_BASE.QTAPREZZO,
            (SELECT COSTOMEDIO FROM dbo.MB_FunGetAcquistatoStorico(
            (SELECT CAST(CONVERT(VARCHAR(8),(DATI_BASE.DATADOC),112) AS DECIMAL(8,0)) )
            ,DATI_BASE.CODART,DATI_BASE.CODDEPOSITO,ISNULL(DATI_BASE.NRRIFPARTITA,''),AUP1.UM)) AS ValoreAcquistato,
            CAST((DATI_BASE.QTAPREZZO * AFC1.FATTORE) AS DECIMAL(16,6)) AS QtaConv1,
            CAST((DATI_BASE.QTAPREZZO * AFC2.FATTORE) AS DECIMAL(16,6)) AS QtaConv2,
            DATI_BASE.UMPREZZO,
            AUP1.UM AS UmConv1,
            AUP2.UM AS UmConv2,
            DATI_BASE.SCONTORIGA,

            DATI_BASE.FLGPROVV,
            DATI_BASE.TOTPROVVAG1EURO,
            DATI_BASE.TOTPROVVAG2EURO,
            DATI_BASE.TOTPROVVAG3EURO
        FROM
            (
                SELECT 
                    MRD.CODRAGGRUPPAMENTO AS RAGGRUPPAMENTO,
                    MPD.CODTIPO AS TIPO,
                    RD.IDTESTA,
                    RD.PROGRIGADOC IDRIGA,
                    RD.ESERCIZIO,
                    RD.CODAGENTE1,
                    RD.CODAGENTE2,
                    RD.CODAGENTE3,
                    RD.CODART,
                    RD.CODDEPOSITO,
                    RD.NRRIFPARTITA,
                    RD.QTAPREZZO,
                    RD.UMPREZZO,
                    RD.SCONTORIGA,
                    RD.TOTLORDORIGAEURO,
                    RD.TOTNETTORIGAEURO,
                    rd.TOTPROVVAG1EURO,
                    rd.TOTPROVVAG2EURO,
                    rd.TOTPROVVAG3EURO,
                    Rd.DATADOC,
                    MRD.PROVVIGIONI AS FLGPROVV
                FROM
                    VISTADOCUMENTIBASE RD
                INNER JOIN
                    MB_RAGGRUPPAMENTO_DOCUMENTI MRD
                ON
                    MRD.CODICEDOC = RD.TIPODOC 
                INNER JOIN
                    MB_RAGGRUPPAMENTI MPD
                ON
                    MPD.CODICE = MRD.CODRAGGRUPPAMENTO
                WHERE
                    (
                        (
                            MPD.CODTIPO IN(1,6) AND (((RD.TIPORIGA <> 'O') AND (RD.TIPORIGA <> 'N')) OR (RD.TIPORIGA = 'N' AND RD.SCONTIESTESI <> '100'))
                        )
                        OR
                        (
                            MPD.CODTIPO IN(4,7) AND ((RD.TIPORIGA =  'O') OR (RD.TIPORIGA = 'N' AND RD.SCONTIESTESI =  '100'))
                        )
                        OR
                        (
                            (MPD.CODTIPO = 5 AND (MRD.CODICEDOC = RD.TIPODOC AND (MRD.CODDEPOSITO = RD.CODDEPOSITO OR MRD.CODDEPOSITO = '' OR MRD.CODDEPOSITO IS NULL))) 
                        )
                        OR
                        (
                            MPD.CODTIPO NOT IN(1,2,3,4,5,6,7)
                        )
                    )
            ) DATI_BASE
        CROSS APPLY
            (SELECT TIPOUM1,TIPOUM2 FROM MB_PARAMETRI WHERE PROGRESSIVO = 1) MP_TMP
        INNER JOIN
            ARTICOLIUMPREFERITE AUP1
        ON
            AUP1.CODART = DATI_BASE.CODART AND
            AUP1.TIPOUM = MP_TMP.TIPOUM1
        INNER JOIN
            ARTICOLIFATTORICONVERSIONE AFC1
        ON
            AFC1.CODART = AUP1.CODART AND
            AFC1.UM1 = DATI_BASE.UMPREZZO AND
            AFC1.UM2 = AUP1.UM
        INNER JOIN
            ARTICOLIUMPREFERITE AUP2
        ON
            AUP2.CODART = DATI_BASE.CODART AND
            AUP2.TIPOUM = MP_TMP.TIPOUM2
        INNER JOIN
            ARTICOLIFATTORICONVERSIONE AFC2
        ON
            AFC2.CODART = AUP2.CODART AND
            AFC2.UM1 = DATI_BASE.UMPREZZO AND
            AFC2.UM2 = AUP2.UM
    ) DAT_BASE_CONVERTITI

    LEFT OUTER JOIN
        VISTA_MB_TrasportoAcq TTCAA
    ON 
        TTCAA.CODART = DAT_BASE_CONVERTITI.CODART AND
        TTCAA.NRRIFPARTITA = DAT_BASE_CONVERTITI.NRRIFPARTITA AND
        TTCAA.CODDEPOSITO = DAT_BASE_CONVERTITI.CODDEPOSITO

        )
        tmp

        --LEFT OUTER JOIN [Ship].[GetExtraTypedata]() EXTRA ON EXTRA.CODART = tmp.CODART AND EXTRA.DATADOC = tmp.DATADOC
        LEFT OUTER JOIN 
        (SELECT        TipoInsert, CODART, datadoc, QTAGEST, ValorePFA
        FROM            MB_PFA_Acquisti WHERE   tipoinsert= 2) PFA ON tmp.CODART = PFA.CODART AND  PFA.DATADOC =tmp.DATADOC 
        LEFT OUTER JOIN
         MB_Venduto_Cliente_Esercizio VEN
       ON VEN.ESERCIZIO = tmp.ESERCIZIO AND VEN.CODART = tmp.CODART
    GROUP BY
        Tipo
        ,tmp.SEGNO
        ,IDTestaDoc
        ,IDRigaDoc
        ,tmp.CODART
        ,UMConv1
        ,UmConv2
        ,CodAgente1
        ,CodAgente2
        ,CodAgente3



GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTA_MB_Righe] TO [Metodo98]
    AS [dbo];

