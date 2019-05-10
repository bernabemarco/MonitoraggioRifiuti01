﻿CREATE TABLE [dbo].[STORICOMOVIMPPRODMATRICOLE] (
    [RIFPROGRESSIVO] DECIMAL (10) NOT NULL,
    [RIFRIGAMOVORD]  INT          NOT NULL,
    [RIFRIGAMOVIMP]  INT          NOT NULL,
    [CODMATRICOLA]   VARCHAR (30) NOT NULL,
    [RIFTESTA]       DECIMAL (10) NULL,
    [RIFRIGA]        INT          NOT NULL,
    [RIFIMPEGNO]     INT          NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    CONSTRAINT [PK_STORICOMOVIMPPRODMATRICOLE] PRIMARY KEY CLUSTERED ([RIFPROGRESSIVO] ASC, [RIFRIGAMOVORD] ASC, [RIFRIGAMOVIMP] ASC, [CODMATRICOLA] ASC) WITH (FILLFACTOR = 90)
);


GO

/*  INSERT TRIGGER "TI_STORICOMOVIMPPRODMATRICOLE" FOR TABLE "STORICOMOVIMPPRODMATRICOLE"  */
CREATE TRIGGER TI_STORICOMOVIMPPRODMATRICOLE ON STORICOMOVIMPPRODMATRICOLE FOR INSERT AS
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

    
    /*  PARENT "STORICOMOVIMPPROD" MUST EXIST WHEN INSERTING A CHILD IN "STORICOMOVIMPPRODMATRICOLE"  */
    IF UPDATE(RIFPROGRESSIVO) OR
       UPDATE(RIFRIGAMOVORD) OR
       UPDATE(RIFRIGAMOVIMP)
    BEGIN
       IF (SELECT COUNT(*)
           FROM   STORICOMOVIMPPROD T1, INSERTED T2
           WHERE  T1.RIFPROGRESSIVO = T2.RIFPROGRESSIVO
            AND   T1.RIGAMOVORD = T2.RIFRIGAMOVORD
            AND   T1.RIGAMOVIMP = T2.RIFRIGAMOVIMP) != @NUMROWS
          BEGIN
             SELECT @ERRNO  = 30002,
                    @ERRMSG = 'Parent does not exist in "STORICOMOVIMPPROD". Cannot create child in "STORICOMOVIMPPRODMATRICOLE".'
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

/*  UPDATE TRIGGER "TU_STORICOMOVIMPPRODMATRICOLE" FOR TABLE "STORICOMOVIMPPRODMATRICOLE"  */
CREATE TRIGGER TU_STORICOMOVIMPPRODMATRICOLE ON STORICOMOVIMPPRODMATRICOLE FOR UPDATE AS
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

      
      /*  PARENT "STORICOMOVIMPPROD" MUST EXIST WHEN UPDATING A CHILD IN "STORICOMOVIMPPRODMATRICOLE"  */
      IF UPDATE(RIFPROGRESSIVO) OR
         UPDATE(RIFRIGAMOVORD) OR
         UPDATE(RIFRIGAMOVIMP)
      BEGIN
         IF (SELECT COUNT(*)
             FROM   STORICOMOVIMPPROD T1, INSERTED T2
             WHERE  T1.RIFPROGRESSIVO = T2.RIFPROGRESSIVO
              AND   T1.RIGAMOVORD = T2.RIFRIGAMOVORD
              AND   T1.RIGAMOVIMP = T2.RIFRIGAMOVIMP) != @NUMROWS
            BEGIN
               SELECT @ERRNO  = 30003,
                      @ERRMSG = '"STORICOMOVIMPPROD" does not exist. Cannot ALTER COLUMN child in "STORICOMOVIMPPRODMATRICOLE".'
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
    ON OBJECT::[dbo].[STORICOMOVIMPPRODMATRICOLE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[STORICOMOVIMPPRODMATRICOLE] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[STORICOMOVIMPPRODMATRICOLE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[STORICOMOVIMPPRODMATRICOLE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[STORICOMOVIMPPRODMATRICOLE] TO [Metodo98]
    AS [dbo];

