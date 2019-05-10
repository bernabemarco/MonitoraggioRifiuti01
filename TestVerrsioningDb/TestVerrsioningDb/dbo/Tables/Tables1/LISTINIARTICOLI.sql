CREATE TABLE [dbo].[LISTINIARTICOLI] (
    [CODART]            VARCHAR (50)    NOT NULL,
    [NRLISTINO]         DECIMAL (5)     NOT NULL,
    [UM]                VARCHAR (3)     NOT NULL,
    [PREZZO]            DECIMAL (19, 6) DEFAULT (0) NULL,
    [PREZZOEURO]        DECIMAL (19, 6) DEFAULT (0) NULL,
    [UTENTEMODIFICA]    VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]      DATETIME        NOT NULL,
    [DeltaIncremento]   SMALLINT        DEFAULT (0) NOT NULL,
    [TP_CodConto]       VARCHAR (7)     NULL,
    [TP_ConsPP]         SMALLINT        NULL,
    [TP_PrezzoPart]     NUMERIC (19, 6) NULL,
    [TP_PrezzoPartEuro] NUMERIC (19, 6) NULL,
    [TP_Scorporo]       SMALLINT        NULL,
    [TP_Sconti]         VARCHAR (200)   NULL,
    [TP_QTASCONTO]      NUMERIC (16, 6) NULL,
    [TP_QTACOEFF]       NUMERIC (16, 6) NULL,
    [TP_QTAMO]          CHAR (1)        NULL,
    [TP_Abbuono]        NUMERIC (19, 6) NULL,
    [TP_DataCambio]     DATETIME        NULL,
    [TP_ValoreCambio]   NUMERIC (19, 6) NULL,
    [DATAVALIDITA]      DATETIME        NULL,
    [TP_FormulaSct]     VARCHAR (100)   NULL,
    [PREZZOCALC]        DECIMAL (19, 6) NULL,
    [TP_ABBUONOEURO]    DECIMAL (19, 6) NULL,
    CONSTRAINT [PK_LISTINIARTICOLI] PRIMARY KEY CLUSTERED ([CODART] ASC, [NRLISTINO] ASC, [UM] ASC) WITH (FILLFACTOR = 90)
);


GO

/*  INSERT TRIGGER "TI_LISTINIARTICOLI" FOR TABLE "LISTINIARTICOLI"  */
CREATE TRIGGER TI_LISTINIARTICOLI ON LISTINIARTICOLI FOR INSERT AS
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

    
    /*  PARENT "TABLISTINI" MUST EXIST WHEN INSERTING A CHILD IN "LISTINIARTICOLI"  */
    IF UPDATE(NRLISTINO)
    BEGIN
       IF (SELECT COUNT(*)
           FROM   TABLISTINI T1, INSERTED T2
           WHERE  T1.NRLISTINO = T2.NRLISTINO) != @NUMROWS
          BEGIN
             SELECT @ERRNO  = 30002,
                    @ERRMSG = 'Parent does not exist in "TABLISTINI". Cannot create child in "LISTINIARTICOLI".'
             GOTO ERROR
          END
    END
    
    /*  PARENT "ANAGRAFICAARTICOLI" MUST EXIST WHEN INSERTING A CHILD IN "LISTINIARTICOLI"  */
    IF UPDATE(CODART)
    BEGIN
       IF (SELECT COUNT(*)
           FROM   ANAGRAFICAARTICOLI T1, INSERTED T2
           WHERE  T1.CODICE = T2.CODART) != @NUMROWS
          BEGIN
             SELECT @ERRNO  = 30002,
                    @ERRMSG = 'Parent does not exist in "ANAGRAFICAARTICOLI". Cannot create child in "LISTINIARTICOLI".'
             GOTO ERROR
          END
    END
    
    /*  PARENT "TABUNITAMISURA" MUST EXIST WHEN INSERTING A CHILD IN "LISTINIARTICOLI"  */
    IF UPDATE(UM)
    BEGIN
       IF (SELECT COUNT(*)
           FROM   TABUNITAMISURA T1, INSERTED T2
           WHERE  T1.CODICE = T2.UM) != @NUMROWS
          BEGIN
             SELECT @ERRNO  = 30002,
                    @ERRMSG = 'Parent does not exist in "TABUNITAMISURA". Cannot create child in "LISTINIARTICOLI".'
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

/*  UPDATE TRIGGER "TU_LISTINIARTICOLI" FOR TABLE "LISTINIARTICOLI"  */
CREATE TRIGGER TU_LISTINIARTICOLI ON LISTINIARTICOLI FOR UPDATE AS
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

      
      /*  PARENT "TABLISTINI" MUST EXIST WHEN UPDATING A CHILD IN "LISTINIARTICOLI"  */
      IF UPDATE(NRLISTINO)
      BEGIN
         IF (SELECT COUNT(*)
             FROM   TABLISTINI T1, INSERTED T2
             WHERE  T1.NRLISTINO = T2.NRLISTINO) != @NUMROWS
            BEGIN
               SELECT @ERRNO  = 30003,
                      @ERRMSG = '"TABLISTINI" does not exist. Cannot modify child in "LISTINIARTICOLI".'
               GOTO ERROR
            END
      END
      
      /*  PARENT "ANAGRAFICAARTICOLI" MUST EXIST WHEN UPDATING A CHILD IN "LISTINIARTICOLI"  */
      IF UPDATE(CODART)
      BEGIN
         IF (SELECT COUNT(*)
             FROM   ANAGRAFICAARTICOLI T1, INSERTED T2
             WHERE  T1.CODICE = T2.CODART) != @NUMROWS
            BEGIN
               SELECT @ERRNO  = 30003,
                      @ERRMSG = '"ANAGRAFICAARTICOLI" does not exist. Cannot modify child in "LISTINIARTICOLI".'
               GOTO ERROR
            END
      END
      
      /*  PARENT "TABUNITAMISURA" MUST EXIST WHEN UPDATING A CHILD IN "LISTINIARTICOLI"  */
      IF UPDATE(UM)
      BEGIN
         IF (SELECT COUNT(*)
             FROM   TABUNITAMISURA T1, INSERTED T2
             WHERE  T1.CODICE = T2.UM) != @NUMROWS
            BEGIN
               SELECT @ERRNO  = 30003,
                      @ERRMSG = '"TABUNITAMISURA" does not exist. Cannot modify child in "LISTINIARTICOLI".'
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
    ON OBJECT::[dbo].[LISTINIARTICOLI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[LISTINIARTICOLI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[LISTINIARTICOLI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[LISTINIARTICOLI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[LISTINIARTICOLI] TO [Metodo98]
    AS [dbo];

