

CREATE VIEW dbo.TP_VISTAPARAMETRIARTICOLI_RIORDINO AS
SELECT
    DATI_BASE.CODARTICOLO,
    DATI_BASE.CODDEPOSITO,
    DATI_BASE.TOTALEVENDUTO,
    DATI_BASE.DEVIAZIONESTD_VEN,
    DATI_BASE.GIORNILAVOROPERIODOPREVISTI_VEN,
    DATI_BASE.TOTALEPREVISIONE,
    DATI_BASE.DEVIAZIONESTD,
    DATI_BASE.GIORNILAVOROPERIODOPREVISTI,
    TEM.COSTOORDINAZIONE AS COSTOORDINAZIONE,
    TEM.INDICECOSTOMANTENIMENTO AS INDICECOSTOMANTENIMENTO,
    TEM.TASSOMANTENIMENTO AS TASSOMANTENIMENTO,
    TEM.FATTORESCOSTAMENTO AS FATTORESCOSTAMENTO,
    (CASE TEM.LIVELLOSERVIZIO
        WHEN 50 THEN 0.00
        WHEN 55 THEN 0.13
        WHEN 60 THEN 0.25
        WHEN 65 THEN 0.39
        WHEN 70 THEN 0.52
        WHEN 75 THEN 0.67
        WHEN 80 THEN 0.84
        WHEN 85 THEN 1.04
        WHEN 90 THEN 1.28
        WHEN 91 THEN 1.34
        WHEN 92 THEN 1.41
        WHEN 93 THEN 1.48
        WHEN 94 THEN 1.55
        WHEN 95 THEN 1.64
        WHEN 96 THEN 1.75
        WHEN 97 THEN 1.88
        WHEN 98 THEN 2.05
        WHEN 99 THEN 2.33
        WHEN 100 THEN 4.00
     END) AS VALOREZ,
    TEM.COSTOACQUISTO,
    TEM.CODLISTINOCA
FROM
(
    SELECT
        VENDUTO.CODARTICOLO,
        VENDUTO.CODDEPOSITO,
        VENDUTO.TOTALEVENDUTO,
        VENDUTO.DEVIAZIONESTD_VEN,
        VENDUTO.GIORNILAVOROPERIODOPREVISTI_VEN,
        PREVISIONE.TOTALEPREVISIONE,
        PREVISIONE.DEVIAZIONESTD,
        PREVISIONE.GIORNILAVOROPERIODOPREVISTI
    FROM
        (
            SELECT
                CODARTICOLO,
                CODDEPOSITO,
                SUM(VENDUTO) AS TOTALEVENDUTO,
                STDEV(VENDUTO) AS DEVIAZIONESTD_VEN,
                GIORNI AS GIORNILAVOROPERIODOPREVISTI_VEN
            FROM
            (
                SELECT 
                    CODARTICOLO,
                    CODDEPOSITO,
                    TP_PERIODO_OSSERVAZIONE.GIORNI,
                    [1],
                    [2],
                    [3],
                    [4],
                    [5],
                    [6],
                    [7],
                    [8],
                    [9],
                    [10],
                    [11],
                    [12]
                FROM 
                    TP_PERIODI_VENDUTO ,
                    TP_EXTRAMAG,
                    TP_PERIODO_OSSERVAZIONE
                WHERE 
                    TP_EXTRAMAG.CODART = TP_PERIODI_VENDUTO.CODARTICOLO AND
                    TP_PERIODO_OSSERVAZIONE.PROGRESSIVO = TP_EXTRAMAG.TP_PERIODODIOSSERVAZIONE
            ) P
            UNPIVOT
               (VENDUTO  FOR PERIODO IN([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12])
            )AS UNPVT
            GROUP BY
                CODARTICOLO,
                CODDEPOSITO,
                GIORNI
        ) VENDUTO,
        (
            SELECT
                CODARTICOLO,
                CODDEPOSITO,
                SUM(PREVISIONE) AS TOTALEPREVISIONE,
                STDEV(PREVISIONE) AS DEVIAZIONESTD,
                GIORNI AS GIORNILAVOROPERIODOPREVISTI
            FROM
            (
                SELECT 
                    CODARTICOLO,
                    CODDEPOSITO,
                    TP_PERIODO_OSSERVAZIONE.GIORNI,
                    [1],
                    [2],
                    [3],
                    [4],
                    [5],
                    [6],
                    [7],
                    [8],
                    [9],
                    [10],
                    [11],
                    [12]
                FROM 
                    TP_STAGIONALE_PREVISIONI ,
                    TP_EXTRAMAG,
                    TP_PERIODO_OSSERVAZIONE
                WHERE 
                    TP_EXTRAMAG.CODART = TP_STAGIONALE_PREVISIONI.CODARTICOLO AND
                    TP_STAGIONALE_PREVISIONI.TIPO = (
                                                    CASE GESTSTAG 
                                                        WHEN 0 THEN (
                                                                    CASE OFSMOOTHINGSTAGIONALE
                                                                        WHEN 0 THEN 'MQ'
                                                                        WHEN 1 THEN 'WT'
                                                                    END
                                                                    )
                                                        WHEN 1 THEN (
                                                                    CASE OFTIPOPREVISIONALE
                                                                        WHEN 0 THEN 'SE'
                                                                        WHEN 1 THEN 'MM'
                                                                    END
                                                                    )
                                                        WHEN 2 THEN 'SM'
                                                        WHEN 3 THEN 'PR'
                                                    END
                                                    ) AND
                    TP_PERIODO_OSSERVAZIONE.PROGRESSIVO = TP_EXTRAMAG.TP_PERIODODIOSSERVAZIONE
            ) P
            UNPIVOT
               (PREVISIONE  FOR PERIODO IN([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12])
            )AS UNPVT
            GROUP BY
                CODARTICOLO,
                CODDEPOSITO,
                GIORNI
        ) PREVISIONE
    WHERE
        VENDUTO.CODARTICOLO = PREVISIONE.CODARTICOLO AND
        VENDUTO.CODDEPOSITO = PREVISIONE.CODDEPOSITO
) DATI_BASE,
TP_EXTRAMAG TEM
WHERE
    TEM.CODART = DATI_BASE.CODARTICOLO

GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_VISTAPARAMETRIARTICOLI_RIORDINO] TO [Metodo98]
    AS [dbo];

