﻿CREATE TABLE [dbo].[ANAGRCARLOTTI] (
    [CODARTICOLO]    VARCHAR (50) NOT NULL,
    [CODLOTTO]       VARCHAR (15) NOT NULL,
    [NRRIGA]         SMALLINT     NOT NULL,
    [VALORE]         VARCHAR (50) NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    CONSTRAINT [PK_ANAGRCARLOTTI] PRIMARY KEY CLUSTERED ([CODARTICOLO] ASC, [CODLOTTO] ASC, [NRRIGA] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [ANAGRAFICALOTTI_FK]
    ON [dbo].[ANAGRCARLOTTI]([CODARTICOLO] ASC, [CODLOTTO] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [CODLOTTO]
    ON [dbo].[ANAGRCARLOTTI]([CODLOTTO] ASC) WITH (FILLFACTOR = 90);


GO

/*  INSERT TRIGGER "TI_ANAGRCARLOTTI" FOR TABLE "ANAGRCARLOTTI"  */
CREATE TRIGGER TI_ANAGRCARLOTTI ON ANAGRCARLOTTI FOR INSERT AS
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

    
    /*  PARENT "ANAGRAFICALOTTI" MUST EXIST WHEN INSERTING A CHILD IN "ANAGRCARLOTTI"  */
    IF UPDATE(CODARTICOLO) OR
       UPDATE(CODLOTTO)
    BEGIN
       IF (SELECT COUNT(*)
           FROM   ANAGRAFICALOTTI T1, INSERTED T2
           WHERE  T1.CODARTICOLO = T2.CODARTICOLO
            AND   T1.CODLOTTO = T2.CODLOTTO) != @NUMROWS
          BEGIN
             SELECT @ERRNO  = 30002,
                    @ERRMSG = 'Parent does not exist in "ANAGRAFICALOTTI". Cannot create child in "ANAGRCARLOTTI".'
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

/*  UPDATE TRIGGER "TU_ANAGRCARLOTTI" FOR TABLE "ANAGRCARLOTTI"  */
CREATE TRIGGER TU_ANAGRCARLOTTI ON ANAGRCARLOTTI FOR UPDATE AS
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

      
      /*  PARENT "ANAGRAFICALOTTI" MUST EXIST WHEN UPDATING A CHILD IN "ANAGRCARLOTTI"  */
      IF UPDATE(CODARTICOLO) OR
         UPDATE(CODLOTTO)
      BEGIN
         IF (SELECT COUNT(*)
             FROM   ANAGRAFICALOTTI T1, INSERTED T2
             WHERE  T1.CODARTICOLO = T2.CODARTICOLO
              AND   T1.CODLOTTO = T2.CODLOTTO) != @NUMROWS
            BEGIN
               SELECT @ERRNO  = 30003,
                      @ERRMSG = '"ANAGRAFICALOTTI" does not exist. Cannot modify child in "ANAGRCARLOTTI".'
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
    ON OBJECT::[dbo].[ANAGRCARLOTTI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ANAGRCARLOTTI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ANAGRCARLOTTI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ANAGRCARLOTTI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ANAGRCARLOTTI] TO [Metodo98]
    AS [dbo];

