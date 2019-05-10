CREATE TABLE [dbo].[TP_LISTINIART] (
    [CODART]            VARCHAR (50)    NOT NULL,
    [NRLISTINO]         DECIMAL (5)     NOT NULL,
    [UM]                VARCHAR (3)     NOT NULL,
    [DataVal]           DATETIME        NOT NULL,
    [PREZZO]            DECIMAL (19, 6) NULL,
    [PREZZOEURO]        DECIMAL (19, 6) NULL,
    [UTENTEMODIFICA]    VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]      DATETIME        NOT NULL,
    [TP_CodConto]       VARCHAR (7)     NULL,
    [TP_ConsPP]         SMALLINT        NULL,
    [TP_PrezzoPart]     NUMERIC (19, 6) NULL,
    [TP_PrezzoPartEuro] NUMERIC (19, 6) NULL,
    [TP_Scorporo]       SMALLINT        NULL,
    [TP_Sconti]         VARCHAR (20)    NULL,
    [TP_QTASCONTO]      NUMERIC (16, 6) NULL,
    [TP_QTACOEFF]       NUMERIC (16, 6) NULL,
    [TP_QTAMO]          CHAR (1)        NULL,
    [TP_Abbuono]        NUMERIC (19, 6) NULL,
    [TP_DataCambio]     DATETIME        NULL,
    [TP_ValoreCambio]   NUMERIC (19, 6) NULL,
    [Aggiornato]        SMALLINT        NULL,
    [TP_FormulaSct]     VARCHAR (200)   NULL,
    [PREZZOCALC]        DECIMAL (19, 6) NULL,
    [TP_ABBUONOEURO]    DECIMAL (19, 6) NULL,
    CONSTRAINT [PK_TP_LISTINIART] PRIMARY KEY CLUSTERED ([CODART] ASC, [NRLISTINO] ASC, [UM] ASC, [DataVal] ASC) WITH (FILLFACTOR = 90)
);


GO




/*  UPDATE TRIGGER "TU_TP_LISTINIART" FOR TABLE "TP_LISTINIART"  */
CREATE TRIGGER TU_TP_LISTINIART ON TP_LISTINIART FOR UPDATE AS
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

      
      /*  PARENT "TABLISTINI" MUST EXIST WHEN UPDATING A CHILD IN "TP_LISTINIART"  */
      IF UPDATE(NRLISTINO)
      BEGIN
         IF (SELECT COUNT(*)
             FROM   TABLISTINI T1, INSERTED T2
             WHERE  T1.NRLISTINO = T2.NRLISTINO) != @NUMROWS
            BEGIN
               SELECT @ERRNO  = 30003,
                      @ERRMSG = '"TABLISTINI" does not exist. Cannot modify child in "TP_LISTINIART".'
               GOTO ERROR
            END
      END
      
      /*  PARENT "ANAGRAFICAARTICOLI" MUST EXIST WHEN UPDATING A CHILD IN "TP_LISTINIART"  */
      IF UPDATE(CODART)
      BEGIN
         IF (SELECT COUNT(*)
             FROM   ANAGRAFICAARTICOLI T1, INSERTED T2
             WHERE  T1.CODICE = T2.CODART) != @NUMROWS
            BEGIN
               SELECT @ERRNO  = 30003,
                      @ERRMSG = '"ANAGRAFICAARTICOLI" does not exist. Cannot modify child in "TP_LISTINIART".'
               GOTO ERROR
            END
      END
      
      /*  PARENT "TABUNITAMISURA" MUST EXIST WHEN UPDATING A CHILD IN "TP_LISTINIART"  */
      IF UPDATE(UM)
      BEGIN
         IF (SELECT COUNT(*)
             FROM   TABUNITAMISURA T1, INSERTED T2
             WHERE  T1.CODICE = T2.UM) != @NUMROWS
            BEGIN
               SELECT @ERRNO  = 30003,
                      @ERRMSG = '"TABUNITAMISURA" does not exist. Cannot modify child in "TP_LISTINIART".'
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



/*  INSERT TRIGGER "TI_TP_LISTINIART" FOR TABLE "TP_LISTINIART"  */
CREATE TRIGGER TI_TP_LISTINIART ON TP_LISTINIART FOR INSERT AS
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

    
    /*  PARENT "TABLISTINI" MUST EXIST WHEN INSERTING A CHILD IN "TP_LISTINIART"  */
    IF UPDATE(NRLISTINO)
    BEGIN
       IF (SELECT COUNT(*)
           FROM   TABLISTINI T1, INSERTED T2
           WHERE  T1.NRLISTINO = T2.NRLISTINO) != @NUMROWS
          BEGIN
             SELECT @ERRNO  = 30002,
                    @ERRMSG = 'Parent does not exist in "TABLISTINI". Cannot create child in "TP_LISTINIART".'
             GOTO ERROR
          END
    END
    
    /*  PARENT "ANAGRAFICAARTICOLI" MUST EXIST WHEN INSERTING A CHILD IN "TP_LISTINIART"  */
    IF UPDATE(CODART)
    BEGIN
       IF (SELECT COUNT(*)
           FROM   ANAGRAFICAARTICOLI T1, INSERTED T2
           WHERE  T1.CODICE = T2.CODART) != @NUMROWS
          BEGIN
             SELECT @ERRNO  = 30002,
                    @ERRMSG = 'Parent does not exist in "ANAGRAFICAARTICOLI". Cannot create child in "TP_LISTINIART".'
             GOTO ERROR
          END
    END
    
    /*  PARENT "TABUNITAMISURA" MUST EXIST WHEN INSERTING A CHILD IN "TP_LISTINIART"  */
    IF UPDATE(UM)
    BEGIN
       IF (SELECT COUNT(*)
           FROM   TABUNITAMISURA T1, INSERTED T2
           WHERE  T1.CODICE = T2.UM) != @NUMROWS
          BEGIN
             SELECT @ERRNO  = 30002,
                    @ERRMSG = 'Parent does not exist in "TABUNITAMISURA". Cannot create child in "TP_LISTINIART".'
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
    ON OBJECT::[dbo].[TP_LISTINIART] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_LISTINIART] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_LISTINIART] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_LISTINIART] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_LISTINIART] TO [Metodo98]
    AS [dbo];

