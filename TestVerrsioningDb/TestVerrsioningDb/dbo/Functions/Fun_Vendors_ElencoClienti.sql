

CREATE FUNCTION [dbo].[Fun_Vendors_ElencoClienti](@CodAgente varchar(7) = '')
RETURNS TABLE AS RETURN
(
    SELECT
        CC.CODCONTO
    FROM
    (   
        SELECT
            ACF.CODCONTO,
            1 AS Tipo
        FROM
            ANAGRAFICACF ACF
        INNER JOIN
            ANAGRAFICARISERVATICF ARCF
        ON
                ARCF.ESERCIZIO = (SELECT ESERCIZIOATTIVO FROM TABUTENTI WHERE USERDB = USER_NAME())
            AND ARCF.CODCONTO = ACF.CODCONTO
        INNER JOIN
            (
                SELECT 
                    TGR.CODCONTO
                FROM 
                    TP_GIROVISITE_TESTA TGT
                INNER JOIN
                    TP_GIROVISITE_RIGHE TGR
                ON 
                    TGR.RIFProgressivo = TGT.Progressivo
                WHERE
                    TGT.CODAGENTE = @CodAgente
            ) GV
        ON
            GV.CODCONTO = ACF.CODCONTO
        UNION
        SELECT
            ACF.CODCONTO,
            0 AS Tipo
        FROM
            ANAGRAFICACF ACF
        INNER JOIN
            ANAGRAFICARISERVATICF ARCF
        ON
                ARCF.ESERCIZIO = (SELECT ESERCIZIOATTIVO FROM TABUTENTI WHERE USERDB = USER_NAME())
            AND ARCF.CODCONTO = ACF.CODCONTO
            AND (
                    ARCF.CODAGENTE1 = @CodAgente 
                 OR ARCF.CODAGENTE2 = @CodAgente
                 OR ARCF.CODAGENTE3 = @CodAgente
                )
    ) CC
    INNER JOIN
        (
            SELECT
                COUNT(CODICE) As Tipo
            FROM 
                tp_ConfigEsportaz 
            WHERE 
                    CODICE = @CodAgente
                AND TIPORIGA='T' 
                AND TABELLEINESPORTAZIONE = 7
        ) CA
    ON
        CA.Tipo = CC.Tipo
)




GO
GRANT SELECT
    ON OBJECT::[dbo].[Fun_Vendors_ElencoClienti] TO [Metodo98]
    AS [dbo];

