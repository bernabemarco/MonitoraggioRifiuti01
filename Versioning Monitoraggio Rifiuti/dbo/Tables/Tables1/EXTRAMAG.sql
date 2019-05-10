CREATE TABLE [dbo].[EXTRAMAG] (
    [CODART]               VARCHAR (50)   NOT NULL,
    [UTENTEMODIFICA]       VARCHAR (25)   NOT NULL,
    [DATAMODIFICA]         DATETIME       NOT NULL,
    [Disegno]              VARCHAR (15)   NULL,
    [Kit]                  VARCHAR (1)    NULL,
    [VerQLT]               VARCHAR (1)    NULL,
    [Ricalcola]            SMALLINT       NULL,
    [ExportGemma]          INT            DEFAULT (0) NULL,
    [EsclCalcoloCondomini] SMALLINT       NULL,
    [rifMezzoTipoRicambio] VARCHAR (1)    NULL,
    [IdRespCid]            VARCHAR (8)    DEFAULT ('') NULL,
    [IdASA]                VARCHAR (2)    NULL,
    [IdSottoAsa]           VARCHAR (5)    NULL,
    [idALDScontoEcom]      VARCHAR (8)    NULL,
    [IdTipoIntervento]     SMALLINT       NULL,
    [ScontoMaxTEcnico]     DECIMAL (8, 5) DEFAULT ((0)) NOT NULL,
    [ListinoCommerciale]   INT            DEFAULT ((0)) NULL,
    [var_colore]           VARCHAR (8)    DEFAULT ('') NULL,
    [ClassDotazTec]        VARCHAR (7)    DEFAULT ('') NULL,
    CONSTRAINT [PK_EXTRAMAG] PRIMARY KEY CLUSTERED ([CODART] ASC) WITH (FILLFACTOR = 90)
);


GO

/*  UPDATE TRIGGER "TU_EXTRAMAG" FOR TABLE "EXTRAMAG"  */
CREATE TRIGGER TU_EXTRAMAG ON EXTRAMAG FOR UPDATE AS
BEGIN
   DECLARE
      @MAXCARD  INT,
      @NUMROWS  INT,
      @NUMNULL  INT,
      @ERRNO    INT,
      @ERRMSG   VARCHAR(255)

      SELECT  @NUMROWS = @@ROWCOUNT
      IF @NUMROWS = 0
         RETURN

      
      /*  PARENT "ANAGRAFICAARTICOLI" MUST EXIST WHEN UPDATING A CHILD IN "EXTRAMAG"  */
      IF UPDATE(CODART)
      BEGIN
         IF (SELECT COUNT(*)
             FROM   ANAGRAFICAARTICOLI T1, INSERTED T2
             WHERE  T1.CODICE = T2.CODART) != @NUMROWS
            BEGIN
               SELECT @ERRNO  = 30003,
                      @ERRMSG = '"ANAGRAFICAARTICOLI" does not exist. Cannot modify child in "EXTRAMAG".'
               GOTO ERROR
            END
      END

      RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO

/*  INSERT TRIGGER "TI_EXTRAMAG" FOR TABLE "EXTRAMAG"  */
CREATE TRIGGER TI_EXTRAMAG ON EXTRAMAG FOR INSERT AS
BEGIN
    DECLARE
       @MAXCARD  INT,
       @NUMROWS  INT,
       @NUMNULL  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN

    
    /*  PARENT "ANAGRAFICAARTICOLI" MUST EXIST WHEN INSERTING A CHILD IN "EXTRAMAG"  */
    IF UPDATE(CODART)
    BEGIN
       IF (SELECT COUNT(*)
           FROM   ANAGRAFICAARTICOLI T1, INSERTED T2
           WHERE  T1.CODICE = T2.CODART) != @NUMROWS
          BEGIN
             SELECT @ERRNO  = 30002,
                    @ERRMSG = 'Parent does not exist in "ANAGRAFICAARTICOLI". Cannot create child in "EXTRAMAG".'
             GOTO ERROR
          END
    END

    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO
GRANT DELETE
    ON OBJECT::[dbo].[EXTRAMAG] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[EXTRAMAG] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[EXTRAMAG] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[EXTRAMAG] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[EXTRAMAG] TO [Metodo98]
    AS [dbo];

