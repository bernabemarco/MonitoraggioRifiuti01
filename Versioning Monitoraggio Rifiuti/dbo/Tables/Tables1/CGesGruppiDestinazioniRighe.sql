CREATE TABLE [dbo].[CGesGruppiDestinazioniRighe] (
    [Progressivo]     DECIMAL (10)  NOT NULL,
    [RifProgressivo]  DECIMAL (10)  NOT NULL,
    [CodDestinazione] VARCHAR (10)  DEFAULT ('') NULL,
    [Note]            VARCHAR (100) DEFAULT ('') NULL,
    [UtenteModifica]  VARCHAR (25)  NOT NULL,
    [DataModifica]    DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CGesGruppiDestinazioniRighe_Dest]
    ON [dbo].[CGesGruppiDestinazioniRighe]([RifProgressivo] ASC, [CodDestinazione] ASC) WITH (FILLFACTOR = 90);


GO

/*  INSERT TRIGGER "TI_CGesGruppiDestinazioniRighe" FOR TABLE "CGesGruppiDestinazioniRighe"  */
CREATE TRIGGER TI_CGesGruppiDestinazioniRighe ON CGesGruppiDestinazioniRighe FOR INSERT AS
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

    
    /*  PARENT "CGesGruppiDestinazioni" MUST EXIST WHEN INSERTING A CHILD IN "CGesGruppiDestinazioniRighe"  */
    IF UPDATE(RIFPROGRESSIVO)
    BEGIN
       IF (SELECT COUNT(*)
           FROM   CGesGruppiDestinazioni T1, INSERTED T2
           WHERE  T1.PROGRESSIVO = T2.RIFPROGRESSIVO) != @NUMROWS
          BEGIN
             SELECT @ERRNO  = 30002,
                    @ERRMSG = 'Parent does not exist in "CGesGruppiDestinazioni". Cannot create child in "CGesGruppiDestinazioniRighe".'
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

/*  UPDATE TRIGGER "TU_CGesGruppiDestinazioniRighe" FOR TABLE "CGesGruppiDestinazioniRighe"  */
CREATE TRIGGER TU_CGesGruppiDestinazioniRighe ON CGesGruppiDestinazioniRighe FOR UPDATE AS
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

      
      /*  PARENT "CGesGruppiDestinazioni" MUST EXIST WHEN UPDATING A CHILD IN "CGesGruppiDestinazioniRighe"  */
      IF UPDATE(RIFPROGRESSIVO)
      BEGIN
         IF (SELECT COUNT(*)
             FROM   CGesGruppiDestinazioni T1, INSERTED T2
             WHERE  T1.PROGRESSIVO = T2.RIFPROGRESSIVO) != @NUMROWS
            BEGIN
               SELECT @ERRNO  = 30003,
                      @ERRMSG = '"CGesGruppiDestinazioni" does not exist. Cannot modify child in "CGesGruppiDestinazioniRighe".'
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
    ON OBJECT::[dbo].[CGesGruppiDestinazioniRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesGruppiDestinazioniRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesGruppiDestinazioniRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesGruppiDestinazioniRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesGruppiDestinazioniRighe] TO [Metodo98]
    AS [dbo];

