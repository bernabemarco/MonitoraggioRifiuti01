CREATE TABLE [dbo].[StoricoConsManComm] (
    [Progressivo]    NUMERIC (5)     NOT NULL,
    [AnnoCom]        INT             NULL,
    [TipoCom]        VARCHAR (3)     NULL,
    [NumCom]         INT             NULL,
    [RigaPBS]        INT             NULL,
    [RigaCBS]        INT             NULL,
    [Causale]        NUMERIC (5)     NULL,
    [DataMov]        DATETIME        NULL,
    [TipoMov]        VARCHAR (3)     NULL,
    [QtaMov]         NUMERIC (15, 6) NULL,
    [ImpTotMov]      DECIMAL (19, 6) NULL,
    [TipoCons]       VARCHAR (1)     NOT NULL,
    [CodCambio]      INT             NULL,
    [ValCambio]      DECIMAL (19, 6) NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NULL,
    [DATAMODIFICA]   DATETIME        NULL,
    [ImpTotMovEURO]  DECIMAL (19, 6) NULL,
    CONSTRAINT [StoricoConsManComm_PK] PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO

/*  INSERT TRIGGER "TI_STORICOCONSMANCOMM" FOR TABLE "STORICOCONSMANCOMM"  */
CREATE TRIGGER TI_STORICOCONSMANCOMM ON STORICOCONSMANCOMM FOR INSERT AS
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

    
    /*  PARENT "CAUSALICONSMAN" MUST EXIST WHEN INSERTING A CHILD IN "STORICOCONSMANCOMM"  */
    IF UPDATE(CAUSALE)
    BEGIN
       SELECT @NUMNULL = (SELECT COUNT(*)
                          FROM   INSERTED
                          WHERE  CAUSALE IS NULL)
       IF @NUMNULL != @NUMROWS
          IF (SELECT COUNT(*)
              FROM   CAUSALICONSMAN T1, INSERTED T2
              WHERE  T1.CODICE = T2.CAUSALE) != @NUMROWS - @NUMNULL
          BEGIN
             SELECT @ERRNO  = 30002,
                    @ERRMSG = 'Parent does not exist in "CAUSALICONSMAN". Cannot create child in "STORICOCONSMANCOMM".'
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

/*  UPDATE TRIGGER "TU_STORICOCONSMANCOMM" FOR TABLE "STORICOCONSMANCOMM"  */
CREATE TRIGGER TU_STORICOCONSMANCOMM ON STORICOCONSMANCOMM FOR UPDATE AS
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

      
      /*  PARENT "CAUSALICONSMAN" MUST EXIST WHEN UPDATING A CHILD IN "STORICOCONSMANCOMM"  */
      IF UPDATE(CAUSALE)
      BEGIN
         SELECT @NUMNULL = (SELECT COUNT(*)
                            FROM   INSERTED
                            WHERE  CAUSALE IS NULL)
         IF @NUMNULL != @NUMROWS
            IF (SELECT COUNT(*)
                FROM   CAUSALICONSMAN T1, INSERTED T2
                WHERE  T1.CODICE = T2.CAUSALE) != @NUMROWS - @NUMNULL
            BEGIN
               SELECT @ERRNO  = 30003,
                      @ERRMSG = '"CAUSALICONSMAN" does not exist. Cannot modify child in "STORICOCONSMANCOMM".'
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
    ON OBJECT::[dbo].[StoricoConsManComm] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[StoricoConsManComm] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[StoricoConsManComm] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[StoricoConsManComm] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[StoricoConsManComm] TO [Metodo98]
    AS [dbo];

