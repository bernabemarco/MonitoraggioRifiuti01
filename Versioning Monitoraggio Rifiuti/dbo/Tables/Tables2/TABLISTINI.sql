﻿CREATE TABLE [dbo].[TABLISTINI] (
    [NRLISTINO]        DECIMAL (5)  NOT NULL,
    [DESCRIZIONE]      VARCHAR (25) NULL,
    [CODCAMBIO]        DECIMAL (5)  NULL,
    [VINCOLAUM]        SMALLINT     DEFAULT (0) NULL,
    [UTENTEMODIFICA]   VARCHAR (25) NOT NULL,
    [DATAMODIFICA]     DATETIME     NOT NULL,
    [TP_Tipo]          CHAR (1)     NULL,
    [TP_Scorporo]      SMALLINT     NULL,
    [FLGCOSTISTD]      SMALLINT     NULL,
    [DATAINIVALIDITA]  DATETIME     NULL,
    [DATAFINEVALIDITA] DATETIME     NULL,
    [ExportCRM]        SMALLINT     DEFAULT ((0)) NULL,
    CONSTRAINT [PK_TABLISTINI] PRIMARY KEY CLUSTERED ([NRLISTINO] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [CKC_VINCOLAUM_TABLISTI] CHECK ([VINCOLAUM] = 0 or [VINCOLAUM] = 1),
    CONSTRAINT [FK_TABLISTINI_CODCAMBIO] FOREIGN KEY ([CODCAMBIO]) REFERENCES [dbo].[TABCAMBI] ([CODICE])
);


GO
CREATE NONCLUSTERED INDEX [TABLISTINI_CODCAMBIO]
    ON [dbo].[TABLISTINI]([CODCAMBIO] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [TABLISTINI_DSC]
    ON [dbo].[TABLISTINI]([DESCRIZIONE] ASC) WITH (FILLFACTOR = 90);


GO


/*  DELETE TRIGGER "TD_TABLISTINI_TP" FOR TABLE "TABLISTINI"  */
CREATE TRIGGER [dbo].[TD_TABLISTINI_TP] ON [dbo].[TABLISTINI] FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN

    
    /*  CANNOT DELETE PARENT "TABLISTINI" IF CHILDREN STILL EXIST IN "LISTINIARTICOLI"  */
    IF EXISTS (SELECT 1
               FROM   TP_LISTINIART T2, DELETED T1
               WHERE  T2.NRLISTINO = T1.NRLISTINO)
       BEGIN
          SELECT @ERRNO  = 30006,
                 @ERRMSG = 'Children still exist in "TP_LISTINIART". Cannot delete parent "TABLISTINI".'
          GOTO ERROR
       END

    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END


GO

/*  UPDATE TRIGGER "TU_TABLISTINI" FOR TABLE "TABLISTINI"  */
CREATE TRIGGER TU_TABLISTINI ON TABLISTINI FOR UPDATE AS
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

      
      /*  PARENT "TABCAMBI" MUST EXIST WHEN UPDATING A CHILD IN "TABLISTINI"  */
      IF UPDATE(CODCAMBIO)
      BEGIN
         SELECT @NUMNULL = (SELECT COUNT(*)
                            FROM   INSERTED
                            WHERE  CODCAMBIO IS NULL)
         IF @NUMNULL != @NUMROWS
            IF (SELECT COUNT(*)
                FROM   TABCAMBI T1, INSERTED T2
                WHERE  T1.CODICE = T2.CODCAMBIO) != @NUMROWS - @NUMNULL
            BEGIN
               SELECT @ERRNO  = 30003,
                      @ERRMSG = '"TABCAMBI" does not exist. Cannot modify child in "TABLISTINI".'
               GOTO ERROR
            END
      END
      
      /*  CANNOT MODIFY PARENT CODE IN "TABLISTINI" IF CHILDREN STILL EXIST IN "LISTINIARTICOLI"  */
      IF UPDATE(NRLISTINO)
      BEGIN
         IF EXISTS (SELECT 1
                    FROM   LISTINIARTICOLI T2, INSERTED I1, DELETED D1
                    WHERE  T2.NRLISTINO = D1.NRLISTINO
                     AND  (I1.NRLISTINO != D1.NRLISTINO))
            BEGIN
               SELECT @ERRNO  = 30005,
                      @ERRMSG = 'Children still exist in "LISTINIARTICOLI". Cannot modify parent code in "TABLISTINI".'
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

/*  DELETE TRIGGER "TD_TABLISTINI" FOR TABLE "TABLISTINI"  */
CREATE TRIGGER TD_TABLISTINI ON TABLISTINI FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN

    
    /*  CANNOT DELETE PARENT "TABLISTINI" IF CHILDREN STILL EXIST IN "LISTINIARTICOLI"  */
    IF EXISTS (SELECT 1
               FROM   LISTINIARTICOLI T2, DELETED T1
               WHERE  T2.NRLISTINO = T1.NRLISTINO)
       BEGIN
          SELECT @ERRNO  = 30006,
                 @ERRMSG = 'Children still exist in "LISTINIARTICOLI". Cannot delete parent "TABLISTINI".'
          GOTO ERROR
       END

    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO

/*  INSERT TRIGGER "TI_TABLISTINI" FOR TABLE "TABLISTINI"  */
CREATE TRIGGER TI_TABLISTINI ON TABLISTINI FOR INSERT AS
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

    
    /*  PARENT "TABCAMBI" MUST EXIST WHEN INSERTING A CHILD IN "TABLISTINI"  */
    IF UPDATE(CODCAMBIO)
    BEGIN
       SELECT @NUMNULL = (SELECT COUNT(*)
                          FROM   INSERTED
                          WHERE  CODCAMBIO IS NULL)
       IF @NUMNULL != @NUMROWS
          IF (SELECT COUNT(*)
              FROM   TABCAMBI T1, INSERTED T2
              WHERE  T1.CODICE = T2.CODCAMBIO) != @NUMROWS - @NUMNULL
          BEGIN
             SELECT @ERRNO  = 30002,
                    @ERRMSG = 'Parent does not exist in "TABCAMBI". Cannot create child in "TABLISTINI".'
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
    ON OBJECT::[dbo].[TABLISTINI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TABLISTINI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TABLISTINI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TABLISTINI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TABLISTINI] TO [Metodo98]
    AS [dbo];

