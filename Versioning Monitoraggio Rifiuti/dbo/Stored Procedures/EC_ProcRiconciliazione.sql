

CREATE PROCEDURE [dbo].[EC_ProcRiconciliazione](@IdSessione Decimal(5,0),
                                                 @flgStato smallint = 0) 

AS


    /*Se Non Esiste Inserisco la riga in tabprogressivi*/
    If Not Exists(Select progr from tabprogressivi where NOMETABELLA = 'EC_MovimentiEcPn')
    Insert into tabprogressivi(PROGR,NOMETABELLA)
    select 0, 'EC_MovimentiEcPn';

    BEGIN TRY
        BEGIN TRAN;
            /*Aggiorno Tabella EstrattoConto*/
            INSERT INTO [dbo].[EC_EstrattoConto] ([Progressivo],[CliForGen],[CodBanca],[CodFlusso],[ABIBanca],[ContoCorrente],[DataOpBanca],[DataValuta],[Importo]
                                                    ,[Segno],[CausaleABI],[NrAssegno],[DataRiconc],[Stato],[RowKey],[UTENTEMODIFICA],[DATAMODIFICA])
            SELECT 
                 [Progressivo],[CliForGen]
                ,[CodBanca],[CodFlusso],[ABIBanca],[ContoCorrente],[DataOpBanca],[DataValuta],[Importo]
                ,[Segno],[CausaleABI],[NrAssegno],GetDate(),@flgStato As [Stato],[RowKey],User_Name(),GetDate()
            FROM 
                [dbo].[EC_EstrattoConto_Tmp]
            WHERE
                IDSessione = @IdSessione and SelRiconc = 1 and IsNew = 1 and Stato IN(0,1);

            /*Link Tra EstrattoConto e PrimaNota*/
            INSERT INTO EC_MovimentiEcPn(Progressivo,RifProgressivoPN,RifRigaPN,RifProgressivoEC,UTENTEMODIFICA,DATAMODIFICA)
            select 
                 TP.Progr       AS Progressivo
                ,PN.RifNrReg    As PrgPN
                ,PN.RifRiga     As RRgPN
                ,EC.Progressivo As PrgEC
                ,User_Name()    As UtenteModifica
                ,GetDate()      As DataModifica
            from 
                EC_EstrattoConto_Tmp EC
            inner join
                EC_TabMovimentiPN_Tmp PN
            ON
                    PN.IDSessione = EC.IDSessione
                And PN.SelRiconc = EC.SelRiconc
                And PN.IsNew = EC.IsNew
            Cross Join
                (
                    Select (Progr + 1) As Progr 
                    From TABPROGRESSIVI 
                    Where NomeTabella = 'EC_MovimentiEcPn'
                ) TP
            where 
                EC.IDSessione = @IdSessione and EC.SelRiconc = 1 and EC.IsNew = 1 and EC.Stato IN(0,1) And PN.RifRiga > 0 --0 = Riga Intestazione

            /*Aggiorno Flag Su Teste Contabilita*/
            UPDATE TESTECONTABILITA
            SET FLGMOVRICONCILIATOEC = RR.Stato
            FROM TESTECONTABILITA
            INNER JOIN
            (
                Select RifNrReg,@flgStato As Stato
                From EC_TabMovimentiPN_Tmp PN
                Where
                        PN.IDSessione = @IDSessione
                    And PN.SelRiconc = 1
                    And PN.IsNew = 1
            ) RR
            ON TESTECONTABILITA.PROGRESSIVO = RR.RifNrReg;

            /*Aggiorno TabProgressivi*/
            Update TABPROGRESSIVI
            SET Progr = (Select ISNULL(Max(Progressivo),0) From EC_MovimentiEcPn)
            Where NomeTabella = 'EC_MovimentiEcPn';

        COMMIT TRAN;
    END TRY
    BEGIN CATCH
        IF(@@TRANCOUNT > 0)
            ROLLBACK TRAN;

        RETURN(@@ERROR)
    END CATCH


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[EC_ProcRiconciliazione] TO [Metodo98]
    AS [dbo];

