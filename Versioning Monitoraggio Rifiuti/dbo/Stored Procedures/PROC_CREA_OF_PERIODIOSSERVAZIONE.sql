

CREATE PROCEDURE dbo.PROC_CREA_OF_PERIODIOSSERVAZIONE(@DATAODIERNA DATETIME)
AS
BEGIN
/*DECLARE @DATAODIERNA DATETIME
    
    SET @DATAODIERNA = GETDATE()
    --SET @DATAODIERNA = DATEADD(mm,-6,GETDATE())*/
SET NOCOUNT ON
DECLARE @TP_PERIODI_CALCOLATI_TMP TABLE (
                                        [Inizio] [datetime] NOT NULL,
                                        [Fine] [datetime] NOT NULL,
                                        [Osservazione] [int] DEFAULT(0) NOT NULL,
                                        [GiorniLavoro] [int] DEFAULT(0) NOT NULL,
                                        [GiorniPeriodo] [int] DEFAULT(0) NOT NULL,
                                        [Stato] [smallint] DEFAULT(1) NOT NULL
                                        )
DECLARE @TP_STAGIONALE_CALCOLATI_TMP TABLE (
                                            [Inizio] [datetime] NOT NULL,
                                            [Fine] [datetime] NOT NULL,
                                            [Osservazione] [int] DEFAULT(0) NOT NULL,
                                            [GiorniLavoro] [int] DEFAULT(0) NOT NULL,
                                            [GiorniPeriodo] [int] DEFAULT(0) NOT NULL,
                                            [Stato] [smallint] DEFAULT(1) NOT NULL
                                            )
                                            
DECLARE @DATACALCOLATA   AS DATETIME
DECLARE @PERIODOCORRENTE AS INT
DECLARE @PERIODOTOTALE   AS INT
DECLARE @OSSERVAZIONE    AS INT
DECLARE @INIZIOPERIODO          AS DATETIME
DECLARE @FINEPERIODO            AS DATETIME
DECLARE @GIORNILAVOROPERIODO    AS INT
DECLARE @GIORNIPERIODO          AS INT
DECLARE @TEMPOSICUREZZA         AS INT
DECLARE @USAPERIODIOSS          AS SMALLINT
DECLARE @USACORREZIONE          AS SMALLINT
DECLARE @DAPERIODO                  AS SMALLINT
DECLARE @APERIODO                   AS SMALLINT
    SET DATEFIRST 1
    
    SET @DATACALCOLATA = @DATAODIERNA
    SET @PERIODOTOTALE = 36
            
    /*SE NON ESISTE IL CALENDARIO SI DEVONO PRENDERE I GIORNI DI LAVORO IMPOSTATO NEL PERIODO(TP_PERIODIOSSERVAZIONE)*/ 
    SELECT 
            @USAPERIODIOSS = ISNULL(OFNCAL,1)
    FROM TP_VINCOLIPIANIFICATORE
    /**********************************/
    
    DECLARE PERIODI_CUR CURSOR FAST_FORWARD FOR
        SELECT TP_PERIODODIOSSERVAZIONE AS TP_PERIODODIOSSERVAZIONE FROM TP_EXTRAMAG WHERE CONSIDACQ = 1 AND ((TP_PERIODODIOSSERVAZIONE IS NOT NULL AND TP_PERIODODIOSSERVAZIONE <> 0)) GROUP BY TP_PERIODODIOSSERVAZIONE
    OPEN PERIODI_CUR    
        FETCH NEXT FROM PERIODI_CUR
            INTO @OSSERVAZIONE
        WHILE @@FETCH_STATUS = 0
            BEGIN
            
            SET @DATACALCOLATA = @DATAODIERNA
            SET @PERIODOCORRENTE = 1
            SELECT @GIORNIPERIODO = GIORNI 
            FROM TP_PERIODO_OSSERVAZIONE 
            WHERE PROGRESSIVO = @OSSERVAZIONE
            
            IF @OSSERVAZIONE <> 2
                BEGIN
                    /*CALCOLO I PERIODI*/
                    WHILE @PERIODOCORRENTE <= @PERIODOTOTALE
                        BEGIN       
                            SET @INIZIOPERIODO =(SELECT
                                                    CASE @OSSERVAZIONE
                                                        WHEN 1 THEN
                                                            DATEADD(WW, DATEDIFF(WW,0, @DATACALCOLATA),0) 
                                                        /*WHEN 2 THEN
                                                            DATEADD(WW, DATEDIFF(WW,0, @DATACALCOLATA)-1,0) */
                                                        WHEN 3 THEN
                                                            DATEADD(MM, DATEDIFF(MM,0,@DATACALCOLATA), 0) 
                                                        WHEN 4 THEN
                                                            DATEADD(QQ, DATEDIFF(QQ,0,@DATACALCOLATA), 0)
                                                        WHEN 5 THEN
                                                            DATEADD(QQ, DATEDIFF(QQ,0,@DATACALCOLATA)-1, 0)
                                                        WHEN 6 THEN
                                                            DATEADD(YY, DATEDIFF(YY,0,@DATACALCOLATA), 0)
                                                        ELSE
                                                            @DATACALCOLATA
                                                    END)
                            
                            SET @FINEPERIODO =  (SELECT
                                                    CASE @OSSERVAZIONE
                                                        WHEN 1 THEN
                                                            DATEADD(MS,-3,DATEADD(WW, DATEDIFF(WW,0,@DATACALCOLATA)+1, 0))
                                                        /*WHEN 2 THEN
                                                            DATEADD(MS,-3,DATEADD(WW, DATEDIFF(WW,0,@DATACALCOLATA)+1, 0))*/
                                                        WHEN 3 THEN
                                                            DATEADD(MS,-3,DATEADD(MM, DATEDIFF(MM,0,@DATACALCOLATA)+1, 0))
                                                        WHEN 4 THEN
                                                            DATEADD(MS,-3,DATEADD(QQ, DATEDIFF(QQ,0,@DATACALCOLATA)+1, 0))
                                                        WHEN 5 THEN
                                                            DATEADD(MS,-3,DATEADD(QQ, DATEDIFF(QQ,0,@DATACALCOLATA)+1, 0))
                                                        WHEN 6 THEN
                                                            DATEADD(MS,-3,DATEADD(YY, DATEDIFF(YY,0,@DATACALCOLATA)+1, 0))
                                                        ELSE
                                                            @DATACALCOLATA
                                                    END)
                            
                            SET @DATACALCOLATA = (SELECT
                                                    CASE @OSSERVAZIONE
                                                        WHEN 1 THEN
                                                            DATEADD(WW, -1, @DATACALCOLATA) 
                                                        /*WHEN 2 THEN
                                                            DATEADD(WW, -2, @DATACALCOLATA) */
                                                        WHEN 3 THEN
                                                            DATEADD(MM, -1, @DATACALCOLATA)
                                                        WHEN 4 THEN
                                                            DATEADD(QQ, -1, @DATACALCOLATA)
                                                        WHEN 5 THEN
                                                            DATEADD(QQ, -2, @DATACALCOLATA)
                                                        WHEN 6 THEN
                                                            DATEADD(YY, -1, @DATACALCOLATA)
                                                        ELSE
                                                            @DATACALCOLATA
                                                    END)
                            
                            SET @GIORNILAVOROPERIODO = @GIORNIPERIODO
                            IF (@USAPERIODIOSS = 0)
                                BEGIN
                                    SELECT @GIORNILAVOROPERIODO = COUNT(*) FROM TP_CALENDARIOCOMMERCIALE 
                                    WHERE FESTIVO = 0 AND ((DATACAL BETWEEN CONVERT(DATETIME,@INIZIOPERIODO,112) AND CONVERT(DATETIME,@FINEPERIODO,112)))
                                END
                            IF NOT EXISTS(SELECT  Osservazione
                                          FROM @TP_PERIODI_CALCOLATI_TMP 
                                          WHERE Osservazione = @OSSERVAZIONE AND
                                                CONVERT(DATETIME,Inizio,112) = CONVERT(DATETIME,@INIZIOPERIODO,112) AND
                                                CONVERT(DATETIME,Fine,112) = CONVERT(DATETIME,@FINEPERIODO,112))
                                BEGIN
                                    INSERT INTO @TP_PERIODI_CALCOLATI_TMP([Inizio],[Fine],[Osservazione],[GiorniLavoro],[GiorniPeriodo])
                                    VALUES  (
                                            CONVERT(DATETIME,@INIZIOPERIODO,112),
                                            CONVERT(DATETIME,@FINEPERIODO,112),
                                            @OSSERVAZIONE,
                                            @GIORNILAVOROPERIODO,
                                            @GIORNIPERIODO
                                            )
                                    
                                    SET @DAPERIODO = (@PERIODOTOTALE - (@PERIODOCORRENTE - 1))
                                    SET @APERIODO = (@PERIODOTOTALE - @PERIODOCORRENTE)
                                END
                                
                            SET @PERIODOCORRENTE = @PERIODOCORRENTE + 1
                        END
                END
            FETCH NEXT FROM PERIODI_CUR
            INTO @OSSERVAZIONE
        END
    CLOSE PERIODI_CUR
    DEALLOCATE PERIODI_CUR
    
    /*PERIODI STAGIONALI*/
    /*CALCOLO I PERIODI x STAGIONALE*/
    SET @DATACALCOLATA = @DATAODIERNA
    SET @PERIODOTOTALE = 36
    SET @PERIODOCORRENTE = 1
    SET @OSSERVAZIONE = 3
    
    SELECT @GIORNIPERIODO = GIORNI FROM TP_PERIODO_OSSERVAZIONE WHERE PROGRESSIVO = 3
    WHILE @PERIODOCORRENTE <= @PERIODOTOTALE
        BEGIN       
            SET @INIZIOPERIODO = DATEADD(MM, DATEDIFF(MM,0,@DATACALCOLATA), 0) 
            SET @FINEPERIODO = DATEADD(MS,-3,DATEADD(MM, DATEDIFF(MM,0,@DATACALCOLATA)+1, 0))
            SET @DATACALCOLATA = DATEADD(MM, -1, @DATACALCOLATA)
            
            SET @GIORNILAVOROPERIODO = @GIORNIPERIODO
            IF (@USAPERIODIOSS = 0)
                BEGIN
                    SELECT @GIORNILAVOROPERIODO = COUNT(*) FROM TP_CALENDARIOCOMMERCIALE 
                    WHERE FESTIVO = 0 AND ((DATACAL BETWEEN CONVERT(DATETIME,@INIZIOPERIODO,112) AND CONVERT(DATETIME,@FINEPERIODO,112)))
                END
            
            IF NOT EXISTS(SELECT  Osservazione
                          FROM @TP_STAGIONALE_CALCOLATI_TMP 
                          WHERE Osservazione = @OSSERVAZIONE AND
                                CONVERT(DATETIME,Inizio,112) = CONVERT(DATETIME,@INIZIOPERIODO,112) AND
                                CONVERT(DATETIME,Fine,112) = CONVERT(DATETIME,@FINEPERIODO,112))
                BEGIN
                    INSERT INTO @TP_STAGIONALE_CALCOLATI_TMP([Inizio],[Fine],[Osservazione],[GiorniLavoro],[GiorniPeriodo])
                    VALUES  (
                            CONVERT(DATETIME,@INIZIOPERIODO,112),
                            CONVERT(DATETIME,@FINEPERIODO,112),
                            @OSSERVAZIONE,
                            @GIORNILAVOROPERIODO,
                            @GIORNIPERIODO
                            )
                END
                
            SET @PERIODOCORRENTE = @PERIODOCORRENTE + 1
        END
    
    /*MERGE PERIODI*/
    MERGE
        @TP_PERIODI_CALCOLATI_TMP
        AS TARGET
    USING 
        (
         SELECT 
            Inizio,
            Fine,
            Osservazione
         FROM 
            TP_PERIODI_CALCOLATI 
        ) AS SOURCE (Inizio, Fine, Osservazione)
    ON 
        (TARGET.Inizio = SOURCE.Inizio AND
         TARGET.Fine = SOURCE.Fine AND
         TARGET.Osservazione = SOURCE.Osservazione)
    WHEN MATCHED 
    THEN Update Set Stato = 0;
    --OUTPUT $action, Inserted.Inizio, Inserted.Fine, Inserted.Osservazione;
    DELETE FROM TP_PERIODI_CALCOLATI;
    
    INSERT INTO TP_PERIODI_CALCOLATI(Periodo,Inizio,Fine,Osservazione,GiorniLavoro,GiorniPeriodo,Cambiato,UtenteModifica,DataModifica)
    SELECT 
        ROW_NUMBER() OVER(PARTITION BY Osservazione ORDER BY Osservazione,Inizio DESC) As Periodo,
        Inizio,
        Fine,
        Osservazione,
        GiorniLavoro,
        GiorniPeriodo,
        Stato,
        USER_NAME(),
        GETDATE()
    FROM 
        @TP_PERIODI_CALCOLATI_TMP;
    
    /*MERGE STAGIONALI*/
    MERGE
        @TP_STAGIONALE_CALCOLATI_TMP
        AS TARGET
    USING 
        (
         SELECT 
            Inizio,
            Fine,
            Osservazione
         FROM 
            TP_STAGIONALE_CALCOLATI 
        ) AS SOURCE (Inizio, Fine, Osservazione)
    ON 
        (TARGET.Inizio = SOURCE.Inizio AND
         TARGET.Fine = SOURCE.Fine AND
         TARGET.Osservazione = SOURCE.Osservazione)
    WHEN MATCHED 
    THEN Update Set Stato = 0;
    --OUTPUT $action, Inserted.Inizio, Inserted.Fine, Inserted.Osservazione;
    DELETE FROM TP_STAGIONALE_CALCOLATI;
    
    INSERT INTO TP_STAGIONALE_CALCOLATI(Periodo,Inizio,Fine,Osservazione,GiorniLavoro,GiorniPeriodo,Cambiato,UtenteModifica,DataModifica)
    SELECT 
        ROW_NUMBER() OVER(PARTITION BY Osservazione ORDER BY Osservazione,Inizio DESC) As Periodo,
        Inizio,
        Fine,
        Osservazione,
        GiorniLavoro,
        GiorniPeriodo,
        Stato,
        USER_NAME(),
        GETDATE()
    FROM 
        @TP_STAGIONALE_CALCOLATI_TMP;
        
RETURN
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[PROC_CREA_OF_PERIODIOSSERVAZIONE] TO [Metodo98]
    AS [dbo];

