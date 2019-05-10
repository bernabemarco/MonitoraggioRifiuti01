

CREATE VIEW [dbo].[TP_VISTANOTEDOCEURITMO]
AS

SELECT DISTINCT
    PROGRESSIVO,
    (
        CASE POSIZIONE WHEN 1 THEN 'ZZZ'
                       WHEN 2 THEN 'ZZZ'
                       WHEN 3 THEN (CASE WHEN STPCONAI = 1 THEN 'AAI' ELSE 'ZZZ' END)
                       ELSE ''
        END
    ) AS TIPONOTA,
    (
        CASE POSIZIONE WHEN 1 THEN NOTE1
                       WHEN 2 THEN NOTE2
                       WHEN 3 THEN (CASE WHEN STPCONAI = 1 THEN 'Contributo CONAI assolto ove dovuto' ELSE NOTE1 END) 
                              ELSE ''
        END
    ) AS NOTE,
    (
        CASE POSIZIONE WHEN 1 THEN POSIZIONE
                       WHEN 2 THEN POSIZIONE
                       WHEN 3 THEN (CASE WHEN STPCONAI = 1 THEN 3 ELSE 1 END) 
                              ELSE ''
        END
    ) AS POSIZIONE
FROM
(
    SELECT
        T.PROGRESSIVO,
        DE.STPCONAI,
        ISNULL(C.NOTE,'')           AS NOTE1,
        ISNULL(D.ANNOTAZIONI,'')    AS NOTE2,
        X.POSIZIONE
    FROM    
        TESTEDOCUMENTI T
    INNER JOIN
        TabEserciziEuritmo EE
    ON
        EE.CODICE = T.ESERCIZIO
    INNER JOIN
        TabDocumentiEuritmo DE
    ON
        DE.CODICE = T.TIPODOC
    INNER JOIN
        tabcliforeuritmo CE
    ON
        CE.CODICE = T.CODCLIFOR
    INNER JOIN
        PARAMETRIDOC D
    ON
        D.CODICE = T.TIPODOC
    LEFT JOIN
        NOTECFINDOC C
    ON
        C.TIPODOC = D.CODICE
    CROSS JOIN
    (
        SELECT 1 
        UNION 
        SELECT 2 
        UNION 
        SELECT 3
    ) X (POSIZIONE)
) A



GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_VISTANOTEDOCEURITMO] TO [Metodo98]
    AS [dbo];

