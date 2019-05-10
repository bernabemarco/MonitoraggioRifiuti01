CREATE TABLE [dbo].[CGesDestinazioniDestRep] (
    [Progressivo]     DECIMAL (10)  NOT NULL,
    [RifProgressivo]  DECIMAL (10)  NOT NULL,
    [CodDestinatario] VARCHAR (3)   DEFAULT ('') NULL,
    [Note]            VARCHAR (100) DEFAULT ('') NULL,
    [UtenteModifica]  VARCHAR (25)  NOT NULL,
    [DataModifica]    DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CGesDestinazioniDestRep_Dest]
    ON [dbo].[CGesDestinazioniDestRep]([RifProgressivo] ASC, [CodDestinatario] ASC) WITH (FILLFACTOR = 90);


GO

/*  INSERT TRIGGER "TI_CGesDestinazioniDestRep" FOR TABLE "CGesDestinazioniDestRep"  */
CREATE TRIGGER TI_CGesDestinazioniDestRep ON CGesDestinazioniDestRep FOR INSERT AS
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

    
    /*  PARENT "CGesDestinazioni" MUST EXIST WHEN INSERTING A CHILD IN "CGesDestinazioniDestRep"  */
    IF UPDATE(RIFPROGRESSIVO)
    BEGIN
       IF (SELECT COUNT(*)
           FROM   CGesDestinazioni T1, INSERTED T2
           WHERE  T1.PROGRESSIVO = T2.RIFPROGRESSIVO) != @NUMROWS
          BEGIN
             SELECT @ERRNO  = 30002,
                    @ERRMSG = 'Parent does not exist in "CGesDestinazioni". Cannot create child in "CGesDestinazioniDestRep".'
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

/*  UPDATE TRIGGER "TU_CGesDestinazioniDestRep" FOR TABLE "CGesDestinazioniDestRep"  */
CREATE TRIGGER TU_CGesDestinazioniDestRep ON CGesDestinazioniDestRep FOR UPDATE AS
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

      
      /*  PARENT "CGesDestinazioni" MUST EXIST WHEN UPDATING A CHILD IN "CGesDestinazioniDestRep"  */
      IF UPDATE(RIFPROGRESSIVO)
      BEGIN
         IF (SELECT COUNT(*)
             FROM   CGesDestinazioni T1, INSERTED T2
             WHERE  T1.PROGRESSIVO = T2.RIFPROGRESSIVO) != @NUMROWS
            BEGIN
               SELECT @ERRNO  = 30003,
                      @ERRMSG = '"CGesDestinazioni" does not exist. Cannot modify child in "CGesDestinazioniDestRep".'
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
    ON OBJECT::[dbo].[CGesDestinazioniDestRep] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesDestinazioniDestRep] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesDestinazioniDestRep] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesDestinazioniDestRep] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesDestinazioniDestRep] TO [Metodo98]
    AS [dbo];

