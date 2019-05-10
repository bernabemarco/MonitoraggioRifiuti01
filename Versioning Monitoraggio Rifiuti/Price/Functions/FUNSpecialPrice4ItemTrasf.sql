
CREATE Function[Price].[FUNSpecialPrice4ItemTrasf] 
    (
        @Progr decimal(10,0)
    )
RETURNS TABLE
--ENCRY-- 
AS
RETURN 
        SELECT PREZZO_MAGGEURO As Prezzo
               , PREZZO_MAGG As PrezzoVal
                ,NRLISTINO
                ,QTAMINIMA
                ,ISNULL(SCONTO_UNICO,'') as Sconto
                ,ISNULL(SCONTO_AGGIUNTIVO,'') as ScontoAgg
                ,TIPO
                ,TIPOARROT
                ,ARROTAEURO as ArrEuro
                ,ARROTALIRE as ArrVal
                FROM GESTIONEPREZZITRASF GT INNER JOIN  GESTIONEPREZZIRIGHETRASF  GR
                ON GR.RIFPROGRESSIVO =  GT.PROGRESSIVO
                WHERE IDRIGA = @Progr

