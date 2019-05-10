

CREATE PROCEDURE [dbo].[PROC_CREA_OF_STATISTICHE_ANNI](@ALL_STATISTICS SMALLINT)
AS

BEGIN

SET NOCOUNT ON

/*DOCUMENTI PREVISTI PER CALCOLARE LE STATISTICHE*/
DECLARE @VENDOC VARCHAR(250)
DECLARE @VENCAU VARCHAR(250)
DECLARE @ACQDOC VARCHAR(250)
DECLARE @ACQCAU VARCHAR(250)

/*VARIABILI GENEALI*/
DECLARE @OSSERVAZIONE    AS INT
    
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
            DELETE FROM TP_ANNI_ACQUISTATO;
            DELETE FROM TP_ANNI_VENDUTO;
        END

    /*ANNI VENDUTO*/
    INSERT INTO TP_ANNI_VENDUTO(CodArticolo,CodDeposito,Esercizio,UtenteModifica,DataModifica)
    SELECT DISTINCT
        TLR.CODART,
        TLR.TP_CODDEP,
        AAC.ESERCIZIO,
        USER_NAME(),
        GETDATE()
    FROM
        TABLOTTIRIORDINO TLR
    INNER JOIN
        TP_EXTRAMAG TEM
    ON
            TEM.CodArt = TLR.CODART 
        AND TEM.ConsidAcq = 1
    INNER JOIN
        ANAGRAFICAARTICOLICOMM AAC
    ON
        AAC.CODICEART = TEM.CODART
    WHERE
        ((TLR.TP_CODDEP <> '') AND (TLR.TP_CODDEP IS NOT NULL)) AND
        NOT EXISTS  (
                    SELECT
                        CODARTICOLO,
                        CODDEPOSITO
                    FROM
                        TP_ANNI_VENDUTO B
                    WHERE
                        B.CODARTICOLO = TLR.CODART AND B.CODDEPOSITO = TLR.TP_CODDEP AND B.Esercizio = AAC.ESERCIZIO
                    );
    
    /*Articolo di riferimento*/
    INSERT INTO TP_ANNI_VENDUTO(CodArticolo,CodDeposito,Esercizio,UtenteModifica,DataModifica)
    SELECT DISTINCT
        TEM.CODART,
        TLR.TP_CODDEP,
        AAC.ESERCIZIO,
        USER_NAME(),
        GETDATE()
    FROM
        TP_EXTRAMAG TEM
    INNER JOIN
        TABLOTTIRIORDINO TLR
    ON
            (TEM.OFCODARTRIF <> '' AND TEM.OFCODARTRIF IS NOT NULL)
        AND TLR.CODART = TEM.OFCODARTRIF
        --AND TEM.ConsidAcq = 1
    INNER JOIN
        ANAGRAFICAARTICOLICOMM AAC
    ON
        AAC.CODICEART = TEM.CODART
    WHERE
        ((TLR.TP_CODDEP <> '') AND (TLR.TP_CODDEP IS NOT NULL)) AND
        NOT EXISTS  (
                    SELECT
                        CODARTICOLO,
                        CODDEPOSITO
                    FROM
                        TP_ANNI_VENDUTO B
                    WHERE
                        B.CODARTICOLO = TEM.CODART AND B.CODDEPOSITO = TLR.TP_CODDEP AND B.Esercizio = AAC.ESERCIZIO
                    );
                    
    /*ANNI ACQUISTATO*/
    INSERT INTO TP_ANNI_ACQUISTATO(CodArticolo,CodDeposito,Esercizio,UtenteModifica,DataModifica)
    SELECT DISTINCT
        TLR.CODART,
        TLR.TP_CODDEP,
        AAC.ESERCIZIO,
        USER_NAME(),
        GETDATE()
    FROM
        TABLOTTIRIORDINO TLR
    INNER JOIN
        TP_EXTRAMAG TEM
    ON
            TEM.CodArt = TLR.CODART 
        AND TEM.ConsidAcq = 1
    INNER JOIN
        ANAGRAFICAARTICOLICOMM AAC
    ON
        AAC.CODICEART = TEM.CODART
    WHERE
        ((TLR.TP_CODDEP <> '') AND (TLR.TP_CODDEP IS NOT NULL)) AND
        NOT EXISTS  (
                    SELECT
                        CODARTICOLO,
                        CODDEPOSITO
                    FROM
                        TP_ANNI_ACQUISTATO B
                    WHERE
                        B.CODARTICOLO = TLR.CODART AND B.CODDEPOSITO = TLR.TP_CODDEP AND B.Esercizio = AAC.ESERCIZIO
                    );
                    
    /*Articolo di riferimento*/
    INSERT INTO TP_ANNI_ACQUISTATO(CodArticolo,CodDeposito,Esercizio,UtenteModifica,DataModifica)
    SELECT DISTINCT
        TEM.CODART,
        TLR.TP_CODDEP,
        AAC.ESERCIZIO,
        USER_NAME(),
        GETDATE()
    FROM
        TP_EXTRAMAG TEM
    INNER JOIN
        TABLOTTIRIORDINO TLR
    ON
            (TEM.OFCODARTRIF <> '' AND TEM.OFCODARTRIF IS NOT NULL)
        AND TLR.CODART = TEM.OFCODARTRIF
        --AND TEM.ConsidAcq = 1
    INNER JOIN
        ANAGRAFICAARTICOLICOMM AAC
    ON
        AAC.CODICEART = TEM.CODART
    WHERE
        ((TLR.TP_CODDEP <> '') AND (TLR.TP_CODDEP IS NOT NULL)) AND
        NOT EXISTS  (
                    SELECT
                        CODARTICOLO,
                        CODDEPOSITO
                    FROM
                        TP_ANNI_VENDUTO B
                    WHERE
                        B.CODARTICOLO = TEM.CODART AND B.CODDEPOSITO = TLR.TP_CODDEP AND B.Esercizio = AAC.ESERCIZIO
                    );

    /*AGGIORNO LE STATISTICHE DEGLI ANNI*/
    EXEC [dbo].[PROC_CALCOLA_OF_ANNIVENDUTO] 0, @OSSERVAZIONE, @VENDOC, @VENCAU, @ALL_STATISTICS
    EXEC [dbo].[PROC_CALCOLA_OF_ANNIACQUISTATO] 0, @OSSERVAZIONE, @ACQDOC, @ACQCAU, @ALL_STATISTICS
    
RETURN

END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[PROC_CREA_OF_STATISTICHE_ANNI] TO [Metodo98]
    AS [dbo];

