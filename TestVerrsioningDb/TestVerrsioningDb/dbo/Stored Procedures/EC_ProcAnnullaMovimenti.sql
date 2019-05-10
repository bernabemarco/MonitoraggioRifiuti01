

CREATE PROCEDURE [dbo].[EC_ProcAnnullaMovimenti](@CodBanca Varchar(7) = '',
                                                  @CodFlusso Decimal(10,0),
                                                   @Progressivo Decimal(10,0) = -1) 
AS

DECLARE @TempTable TABLE(
                            [Progressivo] [decimal](18, 0) NOT NULL,
                            [RifProgressivoPN] [decimal](18, 0) NOT NULL,
                            [RifRigaPN] [smallint] NOT NULL,
                            [RifProgressivoEC] [decimal](18, 0) NOT NULL,
                            [CodBanca] [varchar](7) NOT NULL,
                            [CodFlusso] [Decimal](10,0) NOT NULL
                        );
    
    BEGIN TRY
        BEGIN TRAN;
            /*Tabella (Variabile) Temporanea*/
            Insert Into @TempTable(Progressivo,RifProgressivoPN,RifRigaPN,RifProgressivoEC,CodBanca,CodFlusso)
            Select
                 EMEP.Progressivo
                ,EMEP.RifProgressivoPN
                ,EMEP.RifRigaPN
                ,EMEP.RifProgressivoEC
                ,EC.CodBanca
                ,EC.CodFlusso
            From
                EC_MovimentiEcPn EMEP
            Inner Join
                TesteContabilita TC
            ON
                    TC.Progressivo = EMEP.RifProgressivoPN
            Inner Join
                RigheContabilita RC
            ON
                    RC.NRREG = TC.Progressivo
                And RC.NRRIGA = EMEP.RifRigaPN
            Inner Join
                EC_EstrattoConto EC
            ON
                EC.Progressivo = EMEP.RifProgressivoEC
            WHERE
                    EC.CodBanca = @CodBanca
                And EC.CodFlusso = @CodFlusso 
                And ((@Progressivo <> -1 And EMEP.Progressivo = @Progressivo) Or (@Progressivo = -1));

            /*Aggiorno Testecontabilita*/
            UPDATE TESTECONTABILITA
            SET FLGMOVRICONCILIATOEC = 0
            FROM TESTECONTABILITA
            INNER JOIN @TempTable T
            ON
                T.RifProgressivoPN = TESTECONTABILITA.Progressivo;

            /*Cancello Estrattoconto*/
            DELETE EC_EstrattoConto
            FROM EC_EstrattoConto
            INNER JOIN @TempTable T
            ON
                T.RifProgressivoEC = EC_EstrattoConto.Progressivo;

            /*Cancello Link*/
            DELETE EC_MovimentiEcPn
            FROM EC_MovimentiEcPn
            INNER JOIN @TempTable T
            ON
                T.Progressivo = EC_MovimentiEcPn.Progressivo;
        COMMIT TRAN;
    END TRY
    BEGIN CATCH
        IF(@@TRANCOUNT > 0)
            ROLLBACK TRAN;

        RETURN(@@ERROR)
    END CATCH


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[EC_ProcAnnullaMovimenti] TO [Metodo98]
    AS [dbo];

