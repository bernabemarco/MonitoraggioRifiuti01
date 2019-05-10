CREATE TABLE [dbo].[CGesDestinazioniDestRif] (
    [Progressivo]     DECIMAL (10)  NOT NULL,
    [RifProgressivo]  DECIMAL (10)  NOT NULL,
    [CodDestinazione] VARCHAR (10)  DEFAULT ('') NULL,
    [Note]            VARCHAR (100) DEFAULT ('') NULL,
    [UtenteModifica]  VARCHAR (25)  NOT NULL,
    [DataModifica]    DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CGesDestinazioniDestRif_Dest]
    ON [dbo].[CGesDestinazioniDestRif]([RifProgressivo] ASC, [CodDestinazione] ASC) WITH (FILLFACTOR = 90);


GO

/*  INSERT TRIGGER "TI_CGesDestinazioniDestRif" FOR TABLE "CGesDestinazioniDestRif"  */
CREATE TRIGGER TI_CGesDestinazioniDestRif ON CGesDestinazioniDestRif FOR INSERT AS
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

    
    /*  PARENT "CGesDestinazioni" MUST EXIST WHEN INSERTING A CHILD IN "CGesDestinazioniDestRif"  */
    IF UPDATE(RIFPROGRESSIVO)
    BEGIN
       IF (SELECT COUNT(*)
           FROM   CGesDestinazioni T1, INSERTED T2
           WHERE  T1.PROGRESSIVO = T2.RIFPROGRESSIVO) != @NUMROWS
          BEGIN
             SELECT @ERRNO  = 30002,
                    @ERRMSG = 'Parent does not exist in "CGesDestinazioni". Cannot create child in "CGesDestinazioniDestRif".'
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

/*  UPDATE TRIGGER "TU_CGesDestinazioniDestRif" FOR TABLE "CGesDestinazioniDestRif"  */
CREATE TRIGGER TU_CGesDestinazioniDestRif ON CGesDestinazioniDestRif FOR UPDATE AS
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

      
      /*  PARENT "CGesDestinazioni" MUST EXIST WHEN UPDATING A CHILD IN "CGesDestinazioniDestRif"  */
      IF UPDATE(RIFPROGRESSIVO)
      BEGIN
         IF (SELECT COUNT(*)
             FROM   CGesDestinazioni T1, INSERTED T2
             WHERE  T1.PROGRESSIVO = T2.RIFPROGRESSIVO) != @NUMROWS
            BEGIN
               SELECT @ERRNO  = 30003,
                      @ERRMSG = '"CGesDestinazioni" does not exist. Cannot modify child in "CGesDestinazioniDestRif".'
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
    ON OBJECT::[dbo].[CGesDestinazioniDestRif] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesDestinazioniDestRif] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesDestinazioniDestRif] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesDestinazioniDestRif] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesDestinazioniDestRif] TO [Metodo98]
    AS [dbo];

