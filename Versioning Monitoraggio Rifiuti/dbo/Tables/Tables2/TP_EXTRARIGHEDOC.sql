CREATE TABLE [dbo].[TP_EXTRARIGHEDOC] (
    [IDTESTA]                    DECIMAL (10)    NOT NULL,
    [IDRIGA]                     INT             NOT NULL,
    [POSIZIONE]                  INT             NULL,
    [UTENTEMODIFICA]             VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]               DATETIME        NOT NULL,
    [ComposizioneEstemporaneo]   VARCHAR (500)   NULL,
    [Mancanti]                   NUMERIC (16, 6) NULL,
    [NCampagna]                  VARCHAR (3)     NULL,
    [NPromozione]                VARCHAR (4)     NULL,
    [DescCampagna]               VARCHAR (50)    NULL,
    [DescPromozione]             VARCHAR (50)    NULL,
    [PPart]                      NUMERIC (19, 6) NULL,
    [PPartEURO]                  NUMERIC (19, 6) NULL,
    [Stato]                      CHAR (1)        NULL,
    [TP_Cassetta]                VARCHAR (13)    NULL,
    [Scorporo]                   SMALLINT        NULL,
    [ScontoEsteso]               VARCHAR (20)    NULL,
    [Sconto]                     NUMERIC (19, 6) NULL,
    [Prezzo]                     NUMERIC (19, 6) NULL,
    [PrezzoEuro]                 NUMERIC (19, 6) NULL,
    [QtaSconto]                  NUMERIC (19, 6) NULL,
    [QtaCoeff]                   NUMERIC (19, 6) NULL,
    [Riga]                       NUMERIC (10)    NULL,
    [RigaPadre]                  INT             NULL,
    [Prenota]                    SMALLINT        NULL,
    [Stralcio]                   SMALLINT        NULL,
    [tredicesime]                NUMERIC (19, 6) NULL,
    [PrezzoForz]                 DECIMAL (19, 6) CONSTRAINT [DF_TP_EXTRARIGHEDOC_PREZZOFORZ] DEFAULT ((-1)) NULL,
    [ScontoForz]                 DECIMAL (8, 5)  CONSTRAINT [DF_TP_EXTRARIGHEDOC_SCONTOFORZ] DEFAULT ((-1)) NULL,
    [ValCompEsp]                 DECIMAL (19, 6) NULL,
    [VALOREUNITARIONETTOCOMPESP] DECIMAL (19, 6) NULL,
    [VALORETOTALENETTOCOMPESP]   DECIMAL (19, 6) NULL,
    [VALSCONTOCOMPESP]           DECIMAL (19, 6) NULL,
    [TIPOESPOSITORE]             SMALLINT        NULL,
    [SCONTOBASE]                 VARCHAR (20)    NULL,
    [SCONTOAGG]                  VARCHAR (20)    NULL,
    [SCONTICONTRATTI]            VARCHAR (20)    NULL,
    [SCONTILOGISTICI]            VARCHAR (20)    NULL,
    [SOCIOTO]                    VARCHAR (7)     NULL,
    [TP_FORMULASCT]              VARCHAR (20)    DEFAULT ('') NULL,
    [TP_IMPORTOFF]               DECIMAL (19, 6) NULL,
    [CompMovMag]                 SMALLINT        DEFAULT (0) NULL,
    [ProgrMiss]                  DECIMAL (10)    DEFAULT (0) NULL,
    [TipoPromo]                  SMALLINT        DEFAULT (0) NULL,
    [TipoGstSctLogistici]        VARCHAR (1)     NULL,
    [RAEVALORE]                  DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [RifIDRigaRaee]              DECIMAL (10)    DEFAULT ((0)) NULL,
    [COSTOTRASPPRIM]             DECIMAL (19, 6) NULL,
    [LISTINOACQ]                 DECIMAL (5)     NULL,
    [TRASPORTI]                  VARCHAR (250)   NULL,
    [SCONTICLASSIFICATI]         VARCHAR (500)   NULL,
    [CONTRATTIXML]               XML             NULL,
    [SCONTICLASSIFICATIXML]      XML             NULL,
    [TRASPORTIXML]               XML             NULL,
    CONSTRAINT [PK_TP_EXTRARIGHEDOC] PRIMARY KEY CLUSTERED ([IDTESTA] ASC, [IDRIGA] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_TP_EXTRARIGHEDOC_IDTESTA_IDRIGA] FOREIGN KEY ([IDTESTA], [IDRIGA]) REFERENCES [dbo].[RIGHEDOCUMENTI] ([IDTESTA], [IDRIGA]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO


CREATE TRIGGER TI_RIGHEDOC_PRZVEN ON TP_EXTRARIGHEDOC
FOR INSERT
AS
BEGIN

DECLARE @ERRNO INT

--Il Trigger deve funzionare Solo in Modalit sede
DECLARE @TIPOCONFIGURAZIONE CHAR(1)

--In TP_PREZZIVENDITA non ci devono essere
--pi di 5 prezzi per Articolo/Cliente/Um/Listino
DECLARE @COUNT INT

--Campi da inserire in tp_prezzivendita
--presi da Testedocumenti
DECLARE @CODCLIFOR VARCHAR(7)
DECLARE @DATADOC DATETIME
DECLARE @CODAGENTE1 VARCHAR(7)
DECLARE @CODAGENTE2 VARCHAR(7)
DECLARE @CODAGENTE3 VARCHAR(7)
DECLARE @NUMERODOC DECIMAL(10,0)
DECLARE @NUMRIFDOC VARCHAR(15)
DECLARE @ESERCIZIO DECIMAL(5,0)
DECLARE @TIPODOC VARCHAR(3)

--Campi da inserire in tp_prezzivendita
--presi da righedocumenti
DECLARE @IDTESTA DECIMAL(10,0)
DECLARE @IDRIGA INT
DECLARE @CODART VARCHAR(50)
DECLARE @DESCRIZIONEART VARCHAR(80)
DECLARE @UMGEST VARCHAR(3)
DECLARE @NUMLISTINO DECIMAL(5,0)
DECLARE @PREZZOUNITLORDO DECIMAL(19,6)
DECLARE @PREZZOUNITLORDOEURO DECIMAL(19,6)
DECLARE @PREZZOUNITNETTO DECIMAL(19,6)
DECLARE @PREZZOUNITNETTOEURO DECIMAL(19,6)
DECLARE @QTAGEST DECIMAL(16,6)
DECLARE @SCONTOESTESO VARCHAR(50)
DECLARE @DESCRIZIONEPROMOZIONE VARCHAR(50)
DECLARE @PROVVAG1 VARCHAR(20)
DECLARE @PROVVAG2 VARCHAR(20)
DECLARE @PROVVAG3 VARCHAR(20)
DECLARE @UTENTEMODIFICA VARCHAR(25)
DECLARE @DATAMODIFICA DATETIME

--Tipo di Documento
DECLARE @TIPOPARDOC CHAR(1)
DECLARE @TIPODOCP CHAR(1)
DECLARE @TIPODO SMALLINT

--Tipo Di COnfigurazione
SELECT @TIPOCONFIGURAZIONE=VALORE
FROM TP_PARAMETRI
WHERE NOME='trsf'

    --Solo Tipo Sede
    IF (@TIPOCONFIGURAZIONE = 'C')
        BEGIN

            DECLARE Articoli_Cursor CURSOR FOR
                    SELECT IDTESTA, IDRIGA, DESCPROMOZIONE, UTENTEMODIFICA, DATAMODIFICA
                    FROM INSERTED
            OPEN Articoli_Cursor

            FETCH NEXT FROM Articoli_Cursor
                INTO @IDTESTA, @IDRIGA, @DESCRIZIONEPROMOZIONE, @UTENTEMODIFICA, @DATAMODIFICA

            WHILE @@FETCH_STATUS = 0
               BEGIN

                    --TESTEDOCUMENTI
                    SELECT @CODCLIFOR=T1.CODCLIFOR,
                           @TIPODOC=T1.TIPODOC,
                           @DATADOC=CONVERT(DATETIME,T1.DATADOC,112),
                           @NUMRIFDOC=T1.NUMRIFDOC,
                           @NUMERODOC=T1.NUMERODOC,
                           @ESERCIZIO=T1.ESERCIZIO,
                           @CODAGENTE1=T1.CODAGENTE1,
                           @CODAGENTE2=T1.CODAGENTE2,
                           @CODAGENTE3=T1.CODAGENTE3
                    FROM   TESTEDOCUMENTI T1
                    WHERE  T1.PROGRESSIVO = @IDTESTA

                    --RIGHEDOCUMENTI
                    SELECT @CODART=T1.CODART,
                           @DESCRIZIONEART=T1.DESCRIZIONEART,
                           @UMGEST=T1.UMGEST,
                           @NUMLISTINO=T1.NUMLISTINO,
                           @IDRIGA=T1.IDRIGA,
                           @IDTESTA=T1.IDTESTA,
                           @PREZZOUNITLORDO=T1.PREZZOUNITLORDO,
                           @PREZZOUNITLORDOEURO=T1.PREZZOUNITLORDOEURO,
                           @PREZZOUNITNETTO=T1.PREZZOUNITNETTO,
                           @PREZZOUNITNETTOEURO=T1.PREZZOUNITNETTOEURO,
                           @QTAGEST=T1.QTAGEST,
                           @SCONTOESTESO=T1.SCONTIESTESI,
                           @PROVVAG1=ISNULL(PROVVAG1,''),
                           @PROVVAG2=ISNULL(PROVVAG2,''),
                           @PROVVAG3=ISNULL(PROVVAG3,'')
                    FROM RIGHEDOCUMENTI T1
                    WHERE T1.IDTESTA = @IDTESTA AND
                    T1.IDRIGA = @IDRIGA

                    --PARAMETRIDOC
                    SELECT @TIPOPARDOC=CLIFOR, @TIPODOCP=TIPO, @TIPODO=FLAGDOCDO
                    FROM PARAMETRIDOC
                    WHERE CODICE=@TIPODOC

                    IF ((@IDTESTA <> 0) AND (@IDTESTA IS NOT NULL)) AND
                        ((@IDRIGA <> 0) AND (@IDRIGA IS NOT NULL))  AND
                         ((@TIPOPARDOC = 'C')) AND ((@TIPODOCP='O')) AND
                          ((@PREZZOUNITLORDO <> 0) AND (@PREZZOUNITLORDO IS NOT NULL))
                        
                        BEGIN

--PREZZI VENDITA
                            SELECT @COUNT=COUNT(*)
                            FROM TP_PREZZIVENDITA
                            WHERE CODCONTO = @CODCLIFOR AND
                                      CODARTICOLO = @CODART AND
                                      UMGEST = @UMGEST

                            IF @COUNT = 5
                                BEGIN
                                    DELETE FROM TP_PREZZIVENDITA
                                    WHERE CODCONTO = @CODCLIFOR AND
                                          CODARTICOLO = @CODART AND
                                          UMGEST = @UMGEST AND
                                          DATADOC = (SELECT TOP 1 DATADOC
                                                     FROM TP_PREZZIVENDITA
                                                     WHERE   CODCONTO = @CODCLIFOR AND
                                                             CODARTICOLO = @CODART AND
                                                             UMGEST = @UMGEST
                                                     ORDER BY DATADOC)
                                END
                                
                                IF EXISTS(SELECT IDTESTA FROM TP_PREZZIVENDITA WHERE IDTESTA = @IDTESTA AND IDRIGA = @IDRIGA)
                                    DELETE FROM TP_PREZZIVENDITA WHERE IDTESTA = @IDTESTA AND IDRIGA = @IDRIGA
                                
                                INSERT INTO TP_PREZZIVENDITA(
                                            IDRIGA,
                                            ESERCIZIO,
                                            NUMERODOC,
                                            IDTESTA,
                                            CODCONTO,
                                            CODARTICOLO,
                                            UMGEST,
                                            CODLISTINO,
                                            PREZZOLST,
                                            PREZZOUNITLORDO,
                                            PREZZOUNITLORDOEURO,
                                            PREZZOUNITNETTO,
                                            PREZZOUNITNETTOEURO,
                                            QTAGEST,
                                            DATADOC,
                                            SCONTOESTESO,
                                            CODAGENTE1,
                                            CODAGENTE2,
                                            CODAGENTE3,
                                            NUMRIFDOC,
                                            TIPODOC,
                                            TIPO,
                                            DESCRIZIONEPROMOZIONE,
                                            PROVVAG1,
                                            PROVVAG2,
                                            PROVVAG3,
                                            UTENTEMODIFICA,
                                            DATAMODIFICA)
                                VALUES (
                                            @IDRIGA,
                                            @ESERCIZIO,
                                            @NUMERODOC,
                                            @IDTESTA,
                                            @CODCLIFOR,
                                            @CODART,
                                            @UMGEST,
                                            @NUMLISTINO,
                                            @PREZZOUNITLORDO,
                                            @PREZZOUNITLORDO,
                                            @PREZZOUNITLORDOEURO,
                                            @PREZZOUNITNETTO,
                                            @PREZZOUNITNETTOEURO,
                                            @QTAGEST,
                                            @DATADOC,
                                            @SCONTOESTESO,
                                            @CODAGENTE1,
                                            @CODAGENTE2,
                                            @CODAGENTE3,
                                            @NUMRIFDOC,
                                            @TIPODOC,
                                            @TIPOPARDOC,
                                            @DESCRIZIONEPROMOZIONE,
                                            @PROVVAG1,
                                            @PROVVAG2,
                                            @PROVVAG3,
                                            @UTENTEMODIFICA,
                                            @DATAMODIFICA)

--**********************************

--ASSORTIMENTO**********************

/*AGGIUNGERE CODICE CHE VERIFICA SE ESISTE IL FLAG x AGENTE*/
DECLARE @CODICEARTICOLO VARCHAR(50)
DECLARE @CODICEPRIMARIO VARCHAR(50)
DECLARE @VARIANTI       VARCHAR(50)
DECLARE @VARESPLICITE   VARCHAR(255)
DECLARE @TIPCONT        VARCHAR(3)
DECLARE @RIFPROGR       DECIMAL(10,0)
DECLARE @POUNDPOSITION  INT
DECLARE @CODICELENGHT   INT
DECLARE @RELCFVCOUNT    INT
DECLARE @GESTASSORT     SMALLINT
DECLARE @GESTASSORTDOC  SMALLINT
DECLARE @CODICERIF      VARCHAR(5)
DECLARE @TIPODOCAG      VARCHAR(3) --15.07.2009 Da TP_DOCTRASFAG il documento in trasferimento


--05.02.2009
DECLARE @GESTASSORTDOCCLIEXTRA  SMALLINT

    SET @CODICEARTICOLO = ''
    SET @VARIANTI = ''
    SET @VARESPLICITE = ''
    SET @TIPCONT = ''
    SET @CODICEPRIMARIO = ''
    SET @POUNDPOSITION = 0
    SET @CODICELENGHT = 0
    SET @RELCFVCOUNT = 0
    SET @CODICEARTICOLO = @CODART
    SET @CODICERIF = ''
    SET @TIPODOCAG = ''  --15.07.2009 Da TP_DOCTRASFAG il documento in trasferimento
    
    SELECT @GESTASSORT = GESTASSORT FROM TP_TRASFAGENTI WHERE CODAGENTE= @CODAGENTE1
    SELECT @GESTASSORTDOC = RELCFVAUTOMATICA FROM TP_EXTRAPARDOC WHERE CODICE= @TIPODOC
    SELECT @TIPODOCAG = CODICEDOC FROM TP_DOCTRASFAG WHERE CODAGENTE = @CODAGENTE1   --15.07.2009 Da TP_DOCTRASFAG il documento in trasferimento

--05.02.2009
    SELECT @GESTASSORTDOCCLIEXTRA = RELARTCLI_CRAUTOMATICA FROM TP_EXTRACLIENTI WHERE CODCONTO= @CODCLIFOR
    IF(@GESTASSORTDOCCLIEXTRA = 1) SET @GESTASSORTDOC = 1   

    IF (@GESTASSORT = 1) OR (@GESTASSORTDOC = 1)
        BEGIN
            SELECT @RELCFVCOUNT=COUNT(*) FROM VISTARELAZIONICFV WHERE CODARTICOLO = @CODICEARTICOLO AND CODCLIFOR = @CODCLIFOR

            IF (@RELCFVCOUNT = 0)
                BEGIN
                   SELECT @POUNDPOSITION = CHARINDEX('#', @CODICEARTICOLO)
                   SELECT @CODICELENGHT = LEN(@CODICEARTICOLO)
                   SELECT @RIFPROGR = (PROGR + 1) FROM TABPROGRESSIVI WHERE NOMETABELLA = 'CONTRATTI_RCFV'

                   IF @@ROWCOUNT = 0 
                        begin
                            insert into TABPROGRESSIVI (NOMETABELLA ,PROGR) values('CONTRATTI_RCFV',0)
                            set @RIFPROGR = 1
                        end
                        
                   IF (@GESTASSORT = 1)
                        BEGIN
                            IF (@TIPODOCAG = @TIPODOC)
                                BEGIN
                                    SET @CODICERIF = 'AGEN-'
                                END
                            ELSE
                                BEGIN
                                    IF (@GESTASSORTDOC = 1)
                                        BEGIN
                                            SET @CODICERIF = 'SEDE-'                    
                                        END
                                END
                        END
                   ELSE
                        BEGIN
                            IF (@GESTASSORTDOC = 1)
                                BEGIN
                                    SET @CODICERIF = 'SEDE-'                    
                                END
                        END

                   IF (@POUNDPOSITION > 0) AND
                        (@CODICELENGHT > 0)

                        BEGIN
                            SELECT @CODICEPRIMARIO = SUBSTRING(@CODICEARTICOLO,1,(@POUNDPOSITION-1))
                            SELECT @TIPCONT=TIP_CONTATORE FROM ANAGRAFICAARTICOLI WHERE CODICE = @CODICEARTICOLO
                            
                            IF Len(@TIPCONT)= 0
                               BEGIN
                                 SELECT @VARIANTI = SUBSTRING(@CODICEARTICOLO,(@POUNDPOSITION+1),(@CODICELENGHT-@POUNDPOSITION))
                                 SELECT @VARESPLICITE =''
                               END
                            ELSE
                               -- Modifica [30.01.2013] ----
                               -- Nel caso di articoli con varianti nascoste scrivere in RELCFV anche il Valore VARESPLICITE
                               -- In questo caso @VARIANTI deve essere calcolato a partire da @VARESPLICITE 
                               BEGIN
                                 SELECT @VARESPLICITE = VARESPLICITE FROM ANAGRAFICAARTICOLI WHERE CODICE = @CODICEARTICOLO
                                 SELECT @VARIANTI = dbo.FUSVariantiFromVarEsplicite(@VARESPLICITE)
                               END 
                               
                            INSERT INTO RELAZIONICFV (
                                                        CODCLIFOR,
                                                        RIFERIMENTO,
                                                        ARTICOLO,
                                                        VARIANTI,
                                                        DESCRIZIONE,
                                                        TIPOREL,
                                                        MOSTRAVARIANTI,
                                                        UTENTEMODIFICA,
                                                        DATAMODIFICA,
                                                        VARESPLICITE 
                                                        )
                            VALUES (
                                    @CODCLIFOR,
                                    @CODICERIF + CAST(@RIFPROGR AS VARCHAR(10)),
                                    @CODICEPRIMARIO,
                                    @VARIANTI,
                                    @DESCRIZIONEART,
                                    0,
                                    0,
                                    @UTENTEMODIFICA,
                                    @DATAMODIFICA,
                                    @VARESPLICITE
                                    )

                            --PRINT @CODICEPRIMARIO + ' ' + @VARIANTI
                        END
                   ELSE
                        BEGIN
                            SELECT @CODICEPRIMARIO = @CODICEARTICOLO
                            SELECT @VARIANTI = ''
                            
                            INSERT INTO RELAZIONICFV (
                                                        CODCLIFOR,
                                                        RIFERIMENTO,
                                                        ARTICOLO,
                                                        VARIANTI,
                                                        DESCRIZIONE,
                                                        TIPOREL,
                                                        MOSTRAVARIANTI,
                                                        UTENTEMODIFICA,
                                                        DATAMODIFICA,
                                                        VARESPLICITE
                                                        )
                            VALUES (
                                    @CODCLIFOR,
                                    @CODICERIF + CAST(@RIFPROGR AS VARCHAR(10)),
                                    @CODICEPRIMARIO,
                                    @VARIANTI,
                                    @DESCRIZIONEART,
                                    0,
                                    0,
                                    @UTENTEMODIFICA,
                                    @DATAMODIFICA,
                                    ''
                                    )

                            
                        END
                                
                   UPDATE TABPROGRESSIVI SET PROGR = @RIFPROGR WHERE NOMETABELLA = 'CONTRATTI_RCFV'
                END
        END
--**********************************
                        END

                    FETCH NEXT FROM Articoli_Cursor
                        INTO @IDTESTA, @IDRIGA, @DESCRIZIONEPROMOZIONE, @UTENTEMODIFICA, @DATAMODIFICA
               END

            CLOSE Articoli_Cursor
            DEALLOCATE Articoli_Cursor
        END

    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR ('Errore Inserimento RIGHEDOC_PRZVEN.', 16, 1);
    ROLLBACK  TRANSACTION
END



GO
CREATE TRIGGER [dbo].[TU_RIGHEDOC_PRZVEN] ON [dbo].[TP_EXTRARIGHEDOC] FOR UPDATE AS
BEGIN

DECLARE @ERRNO INT
DECLARE @ERRMSG VARCHAR(255)

--Il Trigger deve funzionare Solo in Modalit sede
DECLARE @TIPOCONFIGURAZIONE CHAR(1)

--Campi da inserire in tp_prezzivendita
--presi da Testedocumenti
DECLARE @CODCLIFOR VARCHAR(7) 
DECLARE @DATADOC DATETIME
DECLARE @CODAGENTE1 VARCHAR(7)
DECLARE @CODAGENTE2 VARCHAR(7)
DECLARE @CODAGENTE3 VARCHAR(7)
DECLARE @NUMERODOC DECIMAL(10,0)
DECLARE @NUMRIFDOC VARCHAR(15)
DECLARE @ESERCIZIO DECIMAL(5,0)
DECLARE @TIPODOC VARCHAR(3)

--Campi da inserire in tp_prezzivendita
--presi da righedocumenti
DECLARE @IDTESTA DECIMAL(10,0)
DECLARE @IDRIGA INT
DECLARE @CODART VARCHAR(50)
DECLARE @UMGEST VARCHAR(3) 
DECLARE @NUMLISTINO DECIMAL(5,0)
DECLARE @PREZZOUNITLORDO DECIMAL(19,6) 
DECLARE @PREZZOUNITLORDOEURO DECIMAL(19,6) 
DECLARE @PREZZOUNITNETTO DECIMAL(19,6) 
DECLARE @PREZZOUNITNETTOEURO DECIMAL(19,6) 
DECLARE @QTAGEST DECIMAL(16,6)
DECLARE @SCONTOESTESO VARCHAR(50)
DECLARE @DESCRIZIONEPROMOZIONE VARCHAR(50)
DECLARE @UTENTEMODIFICA VARCHAR(25)
DECLARE @DATAMODIFICA DATETIME

SET NOCOUNT ON

--Tipo di Documento
DECLARE @TIPOPARDOC CHAR(1)

--Tipo Di COnfigurazione
SELECT @TIPOCONFIGURAZIONE=VALORE
FROM TP_PARAMETRI 
WHERE NOME='trsf'
	
	--Solo Tipo Sede
	IF (@TIPOCONFIGURAZIONE = 'C')
		BEGIN			
			--TESTEDOCUMENTI
			SELECT @CODCLIFOR=T1.CODCLIFOR,
				@TIPODOC=T1.TIPODOC,
				@DATADOC=CONVERT(DATETIME,T1.DATADOC,112),
				@NUMRIFDOC=T1.NUMRIFDOC,
				@NUMERODOC=T1.NUMERODOC,
				@ESERCIZIO=T1.ESERCIZIO,
				@CODAGENTE1=T1.CODAGENTE1,
				@CODAGENTE2=T1.CODAGENTE2,
				@CODAGENTE3=T1.CODAGENTE3
			FROM   TESTEDOCUMENTI T1, INSERTED T2
			WHERE  T1.PROGRESSIVO = T2.IDTESTA

			--RIGHEDOCUMENTI		    
			SELECT @CODART=T1.CODART,
				@UMGEST=T1.UMGEST,
				@NUMLISTINO=T1.NUMLISTINO,
				@IDRIGA=T1.IDRIGA,
				@IDTESTA=T1.IDTESTA,
				@PREZZOUNITLORDO=T1.PREZZOUNITLORDO,
				@PREZZOUNITLORDOEURO=T1.PREZZOUNITLORDOEURO,
				@PREZZOUNITNETTO=T1.PREZZOUNITNETTO,
				@PREZZOUNITNETTOEURO=T1.PREZZOUNITNETTOEURO,
				@QTAGEST=T1.QTAGEST,
				@SCONTOESTESO=T1.SCONTIESTESI,
				@DESCRIZIONEPROMOZIONE=T2.DESCPROMOZIONE,
				@UTENTEMODIFICA=T2.UTENTEMODIFICA,
				@DATAMODIFICA=T2.DATAMODIFICA
			FROM RIGHEDOCUMENTI T1, INSERTED T2
			WHERE T1.IDTESTA = T2.IDTESTA AND
				T1.IDRIGA = T2.IDRIGA			
		    	
			--PARAMETRIDOC
			SELECT @TIPOPARDOC=CLIFOR
			FROM PARAMETRIDOC
			WHERE CODICE=@TIPODOC

		   IF ((@IDRIGA <> 0) AND (@IDRIGA IS NOT NULL)) AND
			((@IDTESTA <> 0) AND (@IDTESTA IS NOT NULL)) AND
			((@TIPOPARDOC = 'F' OR @TIPOPARDOC = 'C')) AND
			((@PREZZOUNITLORDO <> 0) AND (@PREZZOUNITLORDO IS NOT NULL))
		    	BEGIN 
				IF EXISTS(SELECT TOP 1 IDTESTA FROM TP_PREZZIVENDITA WHERE IDRIGA=@IDRIGA AND	IDTESTA=@IDTESTA)
                BEGIN
				    UPDATE TP_PREZZIVENDITA
					 SET
						 CODCONTO=@CODCLIFOR
						 ,CODARTICOLO=@CODART,
						 UMGEST=@UMGEST,
						 CODLISTINO=@NUMLISTINO,
						 PREZZOLST=@PREZZOUNITLORDO,
						 PREZZOUNITLORDO=@PREZZOUNITLORDO,
						 PREZZOUNITLORDOEURO=@PREZZOUNITLORDOEURO,
						 PREZZOUNITNETTO=@PREZZOUNITNETTO,
						 PREZZOUNITNETTOEURO=@PREZZOUNITNETTOEURO,
						 QTAGEST=@QTAGEST,
						 DATADOC=@DATADOC,
						 SCONTOESTESO=@SCONTOESTESO,
						 CODAGENTE1=@CODAGENTE1,
						 CODAGENTE2=@CODAGENTE2,
						 CODAGENTE3=@CODAGENTE3,
						 NUMRIFDOC=@NUMRIFDOC,
						 TIPODOC=@TIPODOC,
						 TIPO=@TIPOPARDOC,
						 DESCRIZIONEPROMOZIONE=@DESCRIZIONEPROMOZIONE,
						 UTENTEMODIFICA=@UTENTEMODIFICA,
						 DATAMODIFICA=@DATAMODIFICA
				    WHERE
						 IDRIGA=@IDRIGA AND
						 IDTESTA=@IDTESTA
                END
		    	END				
    	   END
    	
	 SET NOCOUNT OFF
    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO
CREATE TRIGGER TD_RIGHEDOC_PRZVEN ON TP_EXTRARIGHEDOC FOR DELETE AS
BEGIN

DECLARE @ERRNO INT
DECLARE @ERRMSG VARCHAR(255)

--Il Trigger deve funzionare Solo in Modalit sede
DECLARE @TIPOCONFIGURAZIONE CHAR(1)

--Campi da inserire in tp_prezzivendita
--presi da righedocumenti
DECLARE @IDTESTA DECIMAL(10,0)
DECLARE @IDRIGA INT

SET NOCOUNT ON

--Tipo Di COnfigurazione
SELECT @TIPOCONFIGURAZIONE=VALORE
FROM TP_PARAMETRI 
WHERE NOME='trsf'
	
	--Solo Tipo Sede
	IF (@TIPOCONFIGURAZIONE = 'C')
		BEGIN			
			--TP_EXTRARIGHEDOC
			SELECT TOP 1 @IDRIGA=T1.IDRIGA,
					@IDTESTA=T1.IDTESTA
			FROM  DELETED T1
		    
		    IF ((@IDRIGA <> 0) AND (@IDRIGA IS NOT NULL)) AND
		    	((@IDTESTA <> 0) AND (@IDTESTA IS NOT NULL)) 
		    	BEGIN 
				IF (@@ROWCOUNT=1)
					BEGIN
						DELETE 
						FROM TP_PREZZIVENDITA 
						WHERE IDRIGA=@IDRIGA AND
							IDTESTA=@IDTESTA
					END
				ELSE
					BEGIN
						DELETE
						FROM TP_PREZZIVENDITA 
						WHERE IDTESTA=@IDTESTA
					END
		    	END
    	END
    	
	 SET NOCOUNT OFF
    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_EXTRARIGHEDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_EXTRARIGHEDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_EXTRARIGHEDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_EXTRARIGHEDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_EXTRARIGHEDOC] TO [Metodo98]
    AS [dbo];

