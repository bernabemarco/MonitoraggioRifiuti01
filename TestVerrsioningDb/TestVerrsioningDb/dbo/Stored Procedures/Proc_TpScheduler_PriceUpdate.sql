
CREATE PROCEDURE [dbo].[Proc_TpScheduler_PriceUpdate]
AS
BEGIN

SET NOCOUNT ON;

DECLARE @Sequence   as INT = 0

    --DECLARE PriceUpdate  cursor FAST_FORWARD for 
    --  SELECT DISTINCT Sequenza FROM View_TpScheduler_PriceUpdate 
    --OPEN PriceUpdate
       
    --FETCH NEXT FROM PriceUpdate
    --INTO @Sequence

    --WHILE @@FETCH_STATUS = 0
      
      SELECT @Sequence = ISNULL(Min(Sequenza),0) FROM View_TpScheduler_PriceUpdate;

      WHILE @Sequence <> 0
            BEGIN
                --PRINT 'OK1'

                /*Aggiornameto Storico*/
                UPDATE TP_LISTINIART
                SET
                    TP_LISTINIART.PREZZO = APP.Prezzo,
                    TP_LISTINIART.PREZZOEURO = APP.PrezzoEuro,
                    TP_LISTINIART.TP_PrezzoPart = APP.TP_PrezzoPart,
                    TP_LISTINIART.TP_PrezzoPartEuro = APP.TP_PREZZOPARTEURO
                --SELECT * 
                FROM
                    TP_LISTINIART
                INNER JOIN
                (
                    /*Vista Con i Prezzi Da Cambiare*/
                    SELECT
                         Sequenza
                        ,Ordinamento
                        ,LISTINO
                        ,CODART
                        ,UM
                        ,TP_PREZZOPART
                        ,TP_PREZZOPARTEURO
                        ,STRINGASCONTI
                        ,DATAVAL
                        ,Prezzo
                        ,PrezzoEuro
                        ,ISNEW
                    FROM
                        View_TpScheduler_PriceUpdate
                    WHERE  Sequenza = @Sequence
                ) APP
                ON
                        APP.LISTINO = TP_LISTINIART.NRLISTINO 
                    AND APP.UM = TP_LISTINIART.UM 
                    AND APP.CODART = TP_LISTINIART.CODART 
                    AND CONVERT(CHAR, APP.DataVal,112) = CONVERT(CHAR, TP_LISTINIART.DataVal, 112)
                Where
                    TP_LISTINIART.Aggiornato = 0;

                --PRINT 'OK2'

                /*Aggiornameto Listini*/
                UPDATE LISTINIARTICOLI
                SET
                    LISTINIARTICOLI.PREZZO = APP.Prezzo,
                    LISTINIARTICOLI.PREZZOEURO = APP.PrezzoEuro,
                    LISTINIARTICOLI.TP_PrezzoPart = APP.TP_PrezzoPart,
                    LISTINIARTICOLI.TP_PrezzoPartEuro = APP.TP_PREZZOPARTEURO,
                    LISTINIARTICOLI.TP_Sconti = (CASE WHEN APP.STRINGASCONTI <> '' THEN APP.STRINGASCONTI ELSE '' END),
                    LISTINIARTICOLI.DATAVALIDITA = CONVERT(varchar(8),GetDate(),112),
                    LISTINIARTICOLI.UTENTEMODIFICA = User_Name(),
                    LISTINIARTICOLI.DATAMODIFICA = GetDate()
                FROM
                    LISTINIARTICOLI
                INNER JOIN
                (
                    /*Vista Con i Prezzi Da Cambiare*/
                    SELECT
                         Sequenza
                        ,Ordinamento
                        ,LISTINO
                        ,CODART
                        ,UM
                        ,TP_PREZZOPART
                        ,TP_PREZZOPARTEURO
                        ,STRINGASCONTI
                        ,DATAVAL
                        ,Prezzo
                        ,PrezzoEuro
                        ,ISNEW
                    FROM
                        View_TpScheduler_PriceUpdate
                    WHERE  Sequenza = @Sequence
                ) APP
                ON
                        APP.LISTINO = LISTINIARTICOLI.NRLISTINO 
                    AND APP.UM = LISTINIARTICOLI.UM 
                    AND APP.CODART = LISTINIARTICOLI.CODART
                WHERE
                    APP.Sequenza = @Sequence And APP.ISNEW = 0;
                
                --PRINT 'OK3'

                /*Inserimento Listini*/
                INSERT INTO LISTINIARTICOLI(NRLISTINO,CODART,UM,PREZZO,PREZZOEURO,TP_PrezzoPart,TP_PrezzoPartEuro,TP_Sconti,DATAVALIDITA,UTENTEMODIFICA,DATAMODIFICA)
                SELECT LISTINO,CODART,UM,PREZZO,PREZZOEURO,TP_PrezzoPart,TP_PrezzoPartEuro,(CASE WHEN STRINGASCONTI <> '' THEN STRINGASCONTI ELSE '' END),CONVERT(varchar(8),GetDate(),112),User_Name(),GetDate() FROM View_TpScheduler_PriceUpdate
                WHERE  Sequenza = @Sequence And ISNEW = 1;

                --PRINT 'OK4'

                /*RcList & RcListVen*/
                UPDATE TP_LISTINIART
                SET
                    TP_LISTINIART.PREZZO = U.PREZZO,
                    TP_LISTINIART.PREZZOEURO = U.PREZZOEURO,
                    TP_LISTINIART.TP_PrezzoPart = U.TP_PrezzoPart,
                    TP_LISTINIART.TP_PrezzoPartEuro = U.TP_PrezzoPartEuro,
                    TP_LISTINIART.TP_SCONTI = U.TP_Sconti,
                    TP_LISTINIART.Aggiornato = 0,
                    TP_LISTINIART.UTENTEMODIFICA = User_Name(),
                    TP_LISTINIART.DATAMODIFICA = GetDate()
                FROM TP_LISTINIART
                INNER JOIN
                (
                    SELECT 
                        L.NRLISTINO,L.CODART,L.UM,CONVERT(varchar(8),GetDate(),112) AS DATAVAL,L.PREZZO,L.PREZZOEURO,L.TP_PrezzoPart,L.TP_PrezzoPartEuro,L.TP_SCONTI
                    FROM 
                        LISTINIARTICOLI L
                    INNER JOIN
                        View_TpScheduler_PriceUpdate T
                    ON
                            (CASE WHEN CHARINDEX('L',L.TP_SCONTI) > 0 THEN ISNULL(NULLIF(REPLACE(REPLACE(REPLACE(LEFT(L.TP_SCONTI,CHARINDEX('(',L.TP_SCONTI)),'L',''),'+(',''),'-(',''),''),0) ELSE 0 END) = T.LISTINO
                        AND L.CODART = T.CODART
                        AND L.UM = T.UM
                    WHERE
                        T.Sequenza = @Sequence AND 
                        NOT EXISTS(SELECT * FROM TP_LISTINIART TP WHERE TP.NRLISTINO = L.NRLISTINO AND TP.CODART = L.CODART AND TP.UM = L.UM AND CONVERT(varchar(8),TP.DataVal,112) = CONVERT(varchar(8),GetDate(),112))
                ) U
                ON
                        U.NRLISTINO = TP_LISTINIART.NRLISTINO
                    AND U.CODART = TP_LISTINIART.CODART
                    AND U.UM = TP_LISTINIART.UM
                    AND U.DATAVAL = TP_LISTINIART.DataVal;

                --PRINT '4.1'

                INSERT INTO TP_LISTINIART(NRLISTINO,CODART,UM,DATAVAL,PREZZO,PREZZOEURO,TP_PrezzoPart,TP_PrezzoPartEuro,TP_SCONTI,Aggiornato,UTENTEMODIFICA,DATAMODIFICA)
                SELECT 
                    L.NRLISTINO,L.CODART,L.UM,CONVERT(varchar(8),GetDate(),112),L.PREZZO,L.PREZZOEURO,L.TP_PrezzoPart,L.TP_PrezzoPartEuro,L.TP_SCONTI,0,User_Name(),GetDate() 
                FROM 
                    LISTINIARTICOLI L
                INNER JOIN
                    View_TpScheduler_PriceUpdate T
                ON
                        (CASE WHEN CHARINDEX('L',L.TP_SCONTI) > 0 THEN ISNULL(NULLIF(REPLACE(REPLACE(REPLACE(LEFT(L.TP_SCONTI,CHARINDEX('(',L.TP_SCONTI)),'L',''),'+(',''),'-(',''),''),0) ELSE 0 END) = T.LISTINO
                    AND L.CODART = T.CODART
                    AND L.UM = T.UM
                WHERE
                    T.Sequenza = @Sequence AND 
                    NOT EXISTS(SELECT * FROM TP_LISTINIART TP WHERE TP.NRLISTINO = L.NRLISTINO AND TP.CODART = L.CODART AND TP.UM = L.UM AND TP.Aggiornato = 0 /*CONVERT(varchar(8),TP.DataVal,112) = CONVERT(varchar(8),GetDate(),112)*/);
                /*******************/

                --PRINT 'OK5'
                /*Aggiornato = 1*/                     
                UPDATE TP_LISTINIART
                SET
                    TP_LISTINIART.Aggiornato = 1
                FROM
                    TP_LISTINIART
                INNER JOIN
                (
                    /*Vista Con i Prezzi Da Cambiare*/
                    SELECT
                         LISTINO
                        ,CODART
                        ,UM
                        ,DATAVAL
                    FROM
                        View_TpScheduler_PriceUpdate
                    WHERE  Sequenza = @Sequence
                ) APP
                ON
                        APP.LISTINO = TP_LISTINIART.NRLISTINO 
                    AND APP.UM = TP_LISTINIART.UM 
                    AND APP.CODART = TP_LISTINIART.CODART 
                    AND CONVERT(CHAR, APP.DataVal,112) = CONVERT(CHAR, TP_LISTINIART.DataVal, 112)
                Where
                    TP_LISTINIART.Aggiornato = 0;

                SELECT @Sequence = ISNULL(Min(Sequenza),0) FROM View_TpScheduler_PriceUpdate;
                --FETCH NEXT FROM PriceUpdate
                --INTO @Sequence                
            END

    /*
    Alla fine di tutto il ciclo dovrebbe aver aggiornato tutti gli articoli
    gli articoli che non ha aggiornato hanno un problema e vengono segnalati
    in Tp_Scheduler_Error con ActionID = 0 and ActionCod = 'RCLIST_SCH'
    */
    --PRINT 'OK6'

    INSERT INTO Tp_Scheduler_Error(ID,ActionID,ActionCod,ErrorID,ErrorMessage,ErrorDate,UtenteModifica,DataModifica)
    Select
         ISNULL(
            Prog.ID,
            CAST(CONVERT(varchar(6), getdate(),12) + REPLACE(CONVERT(varchar(8), getdate(),108),':','') AS Decimal(12,0))
            ) - Row_Number() Over(Order By CodArt) As [ID]
        ,0 As [ActionID]
        ,'RCLIST_SCH' As [ActionCod]
        ,0 As [ErrorID]
        ,('Si e'' verificato un errore durante l''inserimento dell''articolo=[' + Cast(L.CODART as varchar(50)) + '] listino=[' + Cast(L.NRLISTINO as varchar(50)) + '] um=[' + Cast(L.UM as varchar(50)) + '] regola=[' + Cast(ISNULL(L.TP_Sconti,'') as varchar(50)) + ']') As [ErrorMessage]
        ,GetDate() As ErrorDate
        ,User_Name() As UtenteModifica
        ,GetDate() As DataModifica
    from
        TP_LISTINIART L
    Cross Join
        (Select Min(ID) As ID From Tp_Scheduler_Error) Prog
    Where
        L.Aggiornato = 0 And CONVERT(CHAR, L.DataVal,112) <= CONVERT(CHAR, GetDate(), 112)

    --PRINT 'OK7'

    /*Aggiorno il Campo Aggiornato anche per quelli andati in errore*/
    Update
        TP_LISTINIART
    Set
        Aggiornato = 1
    Where 
        Aggiornato = 0 And CONVERT(CHAR, DataVal,112) <= CONVERT(CHAR, GetDate(), 112)

    --CLOSE PriceUpdate
    --DEALLOCATE PriceUpdate
    RETURN

--  If @@ERROR <> 0 GoTo ErrorHandler
--    Set NoCount OFF
--    Return(0)
  
--ErrorHandler:
--    Return(@@ERROR)
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[Proc_TpScheduler_PriceUpdate] TO [Metodo98]
    AS [dbo];

