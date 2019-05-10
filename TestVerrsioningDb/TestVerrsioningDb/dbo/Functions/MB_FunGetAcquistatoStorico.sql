

CREATE FUNCTION dbo.MB_FunGetAcquistatoStorico(@DATARIFERIMENTO DECIMAL(8,0),
                                                    @ARTICOLO VARCHAR(50), 
                                                     @DEPOSITO VARCHAR(10), 
                                                      @PARTITA VARCHAR(15),
                                                       @UMRIFERIMENTO VARCHAR(3))
RETURNS TABLE 
AS
RETURN
(
    SELECT
       @DATARIFERIMENTO AS DATA
      ,CODARTICOLO
      ,CODDEPOSITO
      ,NRRIFPARTITA
      ,QTA
      ,UM
      ,(CASE WHEN QTA > 0 THEN (VALORENETTO/QTA) ELSE 0 END) AS COSTOMEDIO
    FROM
    (
        SELECT
          CODARTICOLO
          ,CODDEPOSITO
          ,NRRIFPARTITA
          ,SUM(QTA) AS QTA
          ,SUM(VALORENETTO) AS VALORENETTO
          ,UM
        FROM
        (
            SELECT
               ROW_NUMBER() OVER(PARTITION BY CODARTICOLO,MB.CODDEPOSITO,NRRIFPARTITA ORDER BY DATA DESC) AS IDRIGA 
              ,MB.[DATA]
              ,MB.[CODARTICOLO]
              ,MB.[CODDEPOSITO]
              ,MB.[NRRIFPARTITA]
              ,(MB.[QTA] * FC.[FATTORE]) AS QTA
              ,MB.[VALORENETTO]
              ,FC.[UM2] AS UM
            FROM 
                [dbo].[MB_ACQUISTATO_STORICO] MB
            INNER JOIN
                [dbo].[ARTICOLIFATTORICONVERSIONE] FC
            ON      MB.CODARTICOLO = FC.CODART 
                AND FC.UM1 = MB.UM
                AND FC.UM2 = @UMRIFERIMENTO
            WHERE
                    ((MB.DATA <= @DATARIFERIMENTO) OR (MB.ULTIMO = 1))
                AND MB.CODARTICOLO = @ARTICOLO
                AND ((MB.CODDEPOSITO = (CASE WHEN (SELECT COUNT(CODDEPOSITOCOLL) FROM [dbo].[MB_ACQUISTATO_DEPOSITI] WHERE CODDEPOSITO = @DEPOSITO) = 0
                                           THEN @DEPOSITO
                                           ELSE (SELECT CODDEPOSITOCOLL FROM [dbo].[MB_ACQUISTATO_DEPOSITI] WHERE CODDEPOSITO = @DEPOSITO)
                                      END)) OR
                     (MB.CODDEPOSITO = ''))
                AND ((MB.NRRIFPARTITA = @PARTITA) OR (MB.NRRIFPARTITA=''))
        ) AS A
        WHERE
            A.IDRIGA = 1
        GROUP BY
           CODARTICOLO
          ,CODDEPOSITO
          ,NRRIFPARTITA
          ,UM
    ) AS B
)

GO
GRANT DELETE
    ON OBJECT::[dbo].[MB_FunGetAcquistatoStorico] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[MB_FunGetAcquistatoStorico] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[MB_FunGetAcquistatoStorico] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[MB_FunGetAcquistatoStorico] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[MB_FunGetAcquistatoStorico] TO [Metodo98]
    AS [dbo];

