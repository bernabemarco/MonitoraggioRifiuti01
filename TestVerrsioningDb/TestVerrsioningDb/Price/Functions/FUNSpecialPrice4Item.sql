
CREATE Function[Price].[FUNSpecialPrice4Item]  (@Progr decimal(10,0))
RETURNS TABLE
--ENCRY-- 
AS
RETURN 
        SELECT top 1 PREZZO_MAGGEURO As Prezzo
               , PREZZO_MAGG As PrezzoVal
                ,NRLISTINO
                ,QTAMINIMA
                ,ISNULL(SCONTO_UNICO,'') as Sconto
                ,ISNULL(SCONTO_AGGIUNTIVO,'') as ScontoAgg
                ,TIPO
                ,TIPOARROT
                ,ARROTAEURO as ArrEuro
                ,ARROTALIRE as ArrVal
                FROM GESTIONEPREZZIRIGHE 
                    INNER JOIN GESTIONEPREZZI 
                ON GESTIONEPREZZIRIGHE.RIFPROGRESSIVO =  GESTIONEPREZZI.PROGRESSIVO
                WHERE IDRIGA = @Progr

