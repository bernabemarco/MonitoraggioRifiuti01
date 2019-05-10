

CREATE PROCEDURE [dbo].[PROC_CREA_OF_STATISTICHE_PERIODI](@ALL_STATISTICS SMALLINT)
AS

BEGIN

SET NOCOUNT ON

/*VARIABILI GENEALI*/
DECLARE @OSSERVAZIONE    AS INT

/*DOCUMENTI PREVISTI PER CALCOLARE LE STATISTICHE*/
DECLARE @VENDOC VARCHAR(250)
DECLARE @VENCAU VARCHAR(250)
DECLARE @ACQDOC VARCHAR(250)
DECLARE @ACQCAU VARCHAR(250)

/*AGGIORNAMENTO DEI PERIODI*/
DECLARE @PERIODI_CAMBIATI   AS INT
DECLARE @PERIODI_CORRENTE   AS INT
DECLARE @PERIODI_TOTALE     AS INT
DECLARE @SqlQuery           AS nVARCHAR(MAX)
    
    /*PRELEVO DOCUMENTI E CAUSALI PER LE STATISTICHE*/
    SELECT  
        @VENDOC = ISNULL(NULLIF(TIPICCVMVEN1,''),'') + ',' + ISNULL(NULLIF(TIPICCVMVEN2,''),'') + ',' + ISNULL(NULLIF(TIPICCVMVEN3,''),''),
        @ACQDOC = ISNULL(NULLIF(TIPICCVMACQ4,''),'') + ',' + ISNULL(NULLIF(TIPICCVMACQ5,''),'') + ',' + ISNULL(NULLIF(TIPICCVMACQ6,''),''),
        @VENCAU = ISNULL(NULLIF(CAUSMAGCCVMVEN1,''),0) + ',' + ISNULL(NULLIF(CAUSMAGCCVMVEN2,''),0) + ',' +  ISNULL(NULLIF(CAUSMAGCCVMVEN3,''),0),
        @ACQCAU = ISNULL(NULLIF(CAUSMAGCCVMACQ4,''),0) + ',' + ISNULL(NULLIF(CAUSMAGCCVMACQ5,''),0) + ',' +  ISNULL(NULLIF(CAUSMAGCCVMACQ6,''),0)
    FROM 
        TP_VINCOLIPIANIFICATORE WHERE PROGRESSIVO=1

    SET @VENDOC = '''' + REPLACE(@VENDOC,',',''',''') + ''''
    SET @ACQDOC = '''' + REPLACE(@ACQDOC,',',''',''') + ''''
    
    /*Se devo ricalcolare tutti i periodi cancello e ricreo tutto*/
    IF (@ALL_STATISTICS = 0)
        BEGIN
            DELETE FROM TP_PERIODI_ACQUISTATO;
            DELETE FROM TP_PERIODI_VENDUTO;
            DELETE FROM TP_PERIODI_ORDINATO;
        END
    
    /*VERIFICO L'ESISTENZA DI NUOVI ARTICOLI*/
    /*VENDUTO*/
    INSERT INTO TP_PERIODI_VENDUTO(CODARTICOLO,CODDEPOSITO,PERIODOOSSERVAZIONE,UTENTEMODIFICA,DATAMODIFICA)
    SELECT
        VENDUTI.CODARTICOLO,
        VENDUTI.CODDEPOSITO,
        VENDUTI.OSSERVAZIONE,
        VENDUTI.UTENTEMODIFICA,
        VENDUTI.DATAMODIFICA
    FROM
        (
        SELECT
            TLR.CODART AS CODARTICOLO,
            TLR.TP_CODDEP AS CODDEPOSITO,
            TEM.TP_PERIODODIOSSERVAZIONE AS OSSERVAZIONE,
            USER_NAME() AS UTENTEMODIFICA,
            GETDATE() AS DATAMODIFICA
        FROM
            (
            SELECT
                A.CODART,
                A.TP_CODDEP
            FROM

                TABLOTTIRIORDINO A
            WHERE
                ((A.TP_CODDEP <> '' AND A.TP_CODDEP IS NOT NULL)) AND
                ((A.TP_FORNFATTURAZIONE <> '' AND A.TP_FORNFATTURAZIONE IS NOT NULL)) AND
                NOT EXISTS  (
                            SELECT
                                CODARTICOLO,
                                CODDEPOSITO
                            FROM
                                TP_PERIODI_VENDUTO B
                            WHERE
                                B.CODARTICOLO = A.CODART AND B.CODDEPOSITO = A.TP_CODDEP
                            )
            GROUP BY
                A.CODART,
                A.TP_CODDEP
            ) TLR,
            TP_EXTRAMAG TEM
        WHERE
            TEM.CODART = TLR.CODART AND
            TEM.CONSIDACQ = 1
        GROUP BY
            TLR.CODART,
            TLR.TP_CODDEP,
            TEM.TP_PERIODODIOSSERVAZIONE
        ) VENDUTI
        
    /*ACQUISTATO*/
    INSERT INTO TP_PERIODI_ACQUISTATO(CODARTICOLO,CODDEPOSITO,PERIODOOSSERVAZIONE,UTENTEMODIFICA,DATAMODIFICA)
    SELECT
        ACQUISTATO.CODARTICOLO,
        ACQUISTATO.CODDEPOSITO,
        ACQUISTATO.OSSERVAZIONE,
        ACQUISTATO.UTENTEMODIFICA,
        ACQUISTATO.DATAMODIFICA
    FROM
        (
        SELECT
            TLR.CODART AS CODARTICOLO,
            TLR.TP_CODDEP AS CODDEPOSITO,
            TEM.TP_PERIODODIOSSERVAZIONE AS OSSERVAZIONE,
            USER_NAME() AS UTENTEMODIFICA,
            GETDATE() AS DATAMODIFICA
        FROM
            (
            SELECT
                A.CODART,
                A.TP_CODDEP
            FROM
                TABLOTTIRIORDINO A
            WHERE
                ((A.TP_CODDEP <> '' AND A.TP_CODDEP IS NOT NULL)) AND
                ((A.TP_FORNFATTURAZIONE <> '' AND A.TP_FORNFATTURAZIONE IS NOT NULL)) AND
                NOT EXISTS  (
                            SELECT
                                CODARTICOLO,
                                CODDEPOSITO
                            FROM
                                TP_PERIODI_ACQUISTATO B
                            WHERE
                                B.CODARTICOLO = A.CODART AND B.CODDEPOSITO = A.TP_CODDEP
                            )
            GROUP BY
                A.CODART,
                A.TP_CODDEP
            ) TLR,
            TP_EXTRAMAG TEM
        WHERE
            TEM.CODART = TLR.CODART AND
            TEM.CONSIDACQ = 1
        GROUP BY
            TLR.CODART,
            TLR.TP_CODDEP,
            TEM.TP_PERIODODIOSSERVAZIONE
        ) ACQUISTATO
    
    /*ORDINATO*/
    INSERT INTO TP_PERIODI_ORDINATO(CODARTICOLO,CODDEPOSITO,PERIODOOSSERVAZIONE,UTENTEMODIFICA,DATAMODIFICA)
    SELECT
        ORDINATO.CODARTICOLO,
        ORDINATO.CODDEPOSITO,
        ORDINATO.OSSERVAZIONE,
        ORDINATO.UTENTEMODIFICA,
        ORDINATO.DATAMODIFICA
    FROM
        (
        SELECT
            TLR.CODART AS CODARTICOLO,
            TLR.TP_CODDEP AS CODDEPOSITO,
            TEM.TP_PERIODODIOSSERVAZIONE AS OSSERVAZIONE,
            USER_NAME() AS UTENTEMODIFICA,
            GETDATE() AS DATAMODIFICA
        FROM
            (
            SELECT
                A.CODART,
                A.TP_CODDEP
            FROM
                TABLOTTIRIORDINO A
            WHERE
                ((A.TP_CODDEP <> '' AND A.TP_CODDEP IS NOT NULL)) AND
                ((A.TP_FORNFATTURAZIONE <> '' AND A.TP_FORNFATTURAZIONE IS NOT NULL)) AND
                NOT EXISTS  (
                            SELECT
                                CODARTICOLO,
                                CODDEPOSITO
                            FROM
                                TP_PERIODI_ORDINATO B
                            WHERE
                                B.CODARTICOLO = A.CODART AND B.CODDEPOSITO = A.TP_CODDEP
                            )
            GROUP BY
                A.CODART,
                A.TP_CODDEP
            ) TLR,
            TP_EXTRAMAG TEM
        WHERE
                TEM.CODART = TLR.CODART
            AND TEM.CONSIDACQ = 1
        GROUP BY
            TLR.CODART,
            TLR.TP_CODDEP,
            TEM.TP_PERIODODIOSSERVAZIONE
        ) ORDINATO
                        
    /*PROCEDO CON L'AGGIORNAMENTO DEI VALORI*/
    DECLARE PERIODI_CUR CURSOR FAST_FORWARD FOR
        SELECT TP_PERIODODIOSSERVAZIONE FROM TP_EXTRAMAG WHERE CONSIDACQ = 1 AND ((TP_PERIODODIOSSERVAZIONE IS NOT NULL AND TP_PERIODODIOSSERVAZIONE <> 0)) GROUP BY TP_PERIODODIOSSERVAZIONE
    OPEN PERIODI_CUR    
        FETCH NEXT FROM PERIODI_CUR
            INTO @OSSERVAZIONE

        WHILE @@FETCH_STATUS = 0
            BEGIN
                SET @PERIODI_TOTALE = 36
                SET @PERIODI_CAMBIATI = 0
                SET @SqlQuery = N''
    
                SELECT @PERIODI_CAMBIATI = COUNT(Periodo) FROM TP_PERIODI_CALCOLATI WHERE OSSERVAZIONE = @OSSERVAZIONE AND CAMBIATO = 1
                
                --PRINT 'periodo: ' + CAST(@OSSERVAZIONE AS VARCHAR(2)) + ' = ' + CAST(@PERIODI_CAMBIATI AS VARCHAR(2))
                
                IF (@PERIODI_CAMBIATI > 0)
                    BEGIN
                        /*SE ESISTONO DEI PERIODI NUOVI FACCIO LO SWITCH DEI VALORI*/
                        SET @PERIODI_CORRENTE = (@PERIODI_TOTALE - @PERIODI_CAMBIATI)
                        
                        WHILE (@PERIODI_CORRENTE > 0)
                            BEGIN
                                --PRINT CAST(@PERIODI_TOTALE AS VARCHAR(2)) + ' = ' + CAST(@PERIODI_CORRENTE AS VARCHAR(2))
                                
                                /*VENDUTI*/
                                SET @SqlQuery = N'UPDATE TP_PERIODI_VENDUTO SET [' + CAST(@PERIODI_TOTALE AS nVARCHAR(2)) + '] = [' + CAST(@PERIODI_CORRENTE AS nVARCHAR(2)) + '],
                                                                                [P_' + CAST(@PERIODI_TOTALE AS nVARCHAR(2)) + '] = [P_' + CAST(@PERIODI_CORRENTE AS nVARCHAR(2)) + '],
                                                                                [M_' + CAST(@PERIODI_TOTALE AS nVARCHAR(2)) + '] = [M_' + CAST(@PERIODI_CORRENTE AS nVARCHAR(2)) + '] 
                                                  WHERE PERIODOOSSERVAZIONE = ' + CAST(@OSSERVAZIONE AS nVARCHAR(2))
                                
                                exec sp_executesql @SqlQuery
                                
                                /*ACQUISTATI*/
                                SET @SqlQuery = N'UPDATE TP_PERIODI_ACQUISTATO SET [' + CAST(@PERIODI_TOTALE AS VARCHAR(2)) + '] = [' + CAST(@PERIODI_CORRENTE AS VARCHAR(2)) + '] 
                                                  WHERE PERIODOOSSERVAZIONE = ' + CAST(@OSSERVAZIONE AS VARCHAR(2))
                                
                                exec sp_executesql @SqlQuery
                                
                                /*ORDINATO*/
                                SET @SqlQuery = N'UPDATE TP_PERIODI_ORDINATO SET [' + CAST(@PERIODI_TOTALE AS VARCHAR(2)) + '] = [' + CAST(@PERIODI_CORRENTE AS VARCHAR(2)) + '] 
                                                  WHERE PERIODOOSSERVAZIONE = ' + CAST(@OSSERVAZIONE AS VARCHAR(2))
                                
                                exec sp_executesql @SqlQuery
                                
                                SET @PERIODI_CORRENTE = (@PERIODI_CORRENTE - 1)
                                SET @PERIODI_TOTALE = (@PERIODI_TOTALE - 1)
                            END
                        
                        /*CALCOLO I VALORI DEI NUOVI PERIODI*/
                        SET @PERIODI_CORRENTE = 3
                        WHILE (@PERIODI_CORRENTE <= @PERIODI_CAMBIATI)
                            BEGIN
                                --PRINT CAST(@PERIODI_CORRENTE AS VARCHAR(2))
                                
                                EXEC PROC_CALCOLA_OF_PERIODOVENDUTO @PERIODI_CORRENTE, @OSSERVAZIONE, @VENDOC, @VENCAU, @ALL_STATISTICS
                                EXEC PROC_CALCOLA_OF_PERIODOACQUISTATO @PERIODI_CORRENTE, @OSSERVAZIONE, @ACQDOC, @ACQCAU, @ALL_STATISTICS
                                EXEC PROC_CALCOLA_OF_PERIODOORDINATO @PERIODI_CORRENTE, @OSSERVAZIONE, @ALL_STATISTICS
                                
                                SET @PERIODI_CORRENTE = (@PERIODI_CORRENTE + 1)
                            END
                    END
                    
                /*AGGIORNO SEMPRE IL PERIODO CORRENTE ED IL PERIODO PRECEDENTE*/
                EXEC PROC_CALCOLA_OF_PERIODOVENDUTO 1, @OSSERVAZIONE, @VENDOC, @VENCAU, @ALL_STATISTICS
                EXEC PROC_CALCOLA_OF_PERIODOACQUISTATO 1, @OSSERVAZIONE, @ACQDOC, @ACQCAU, @ALL_STATISTICS
                EXEC PROC_CALCOLA_OF_PERIODOORDINATO 1, @OSSERVAZIONE, @ALL_STATISTICS
    
                EXEC PROC_CALCOLA_OF_PERIODOVENDUTO 2, @OSSERVAZIONE, @VENDOC, @VENCAU, @ALL_STATISTICS
                EXEC PROC_CALCOLA_OF_PERIODOACQUISTATO 2, @OSSERVAZIONE, @ACQDOC, @ACQCAU, @ALL_STATISTICS
                EXEC PROC_CALCOLA_OF_PERIODOORDINATO 2, @OSSERVAZIONE, @ALL_STATISTICS
                            
            FETCH NEXT FROM PERIODI_CUR
            INTO @OSSERVAZIONE
        END

    CLOSE PERIODI_CUR
    DEALLOCATE PERIODI_CUR

RETURN

END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[PROC_CREA_OF_STATISTICHE_PERIODI] TO [Metodo98]
    AS [dbo];

