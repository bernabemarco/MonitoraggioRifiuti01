﻿CREATE TABLE [dbo].[ANAGRAFICALOTTI] (
    [CODARTICOLO]    VARCHAR (50) NOT NULL,
    [CODLOTTO]       VARCHAR (15) NOT NULL,
    [BLOCCATO]       SMALLINT     DEFAULT (0) NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    CONSTRAINT [PK_ANAGRAFICALOTTI] PRIMARY KEY CLUSTERED ([CODARTICOLO] ASC, [CODLOTTO] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [CKC_BLOCCATO_ANAGRAFI] CHECK ([BLOCCATO] = 0 or [BLOCCATO] = 1)
);


GO
CREATE NONCLUSTERED INDEX [CODLOTTOA]
    ON [dbo].[ANAGRAFICALOTTI]([CODLOTTO] ASC) WITH (FILLFACTOR = 90);


GO

/*  INSERT TRIGGER "TI_ANAGRAFICALOTTI" FOR TABLE "ANAGRAFICALOTTI"  */
CREATE TRIGGER TI_ANAGRAFICALOTTI ON ANAGRAFICALOTTI FOR INSERT AS
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

    
    /*  PARENT "ANAGRAFICAARTICOLI" MUST EXIST WHEN INSERTING A CHILD IN "ANAGRAFICALOTTI"  */
    IF UPDATE(CODARTICOLO)
    BEGIN
       IF (SELECT COUNT(*)
           FROM   ANAGRAFICAARTICOLI T1, INSERTED T2
           WHERE  T1.CODICE = T2.CODARTICOLO) != @NUMROWS
          BEGIN
             SELECT @ERRNO  = 30002,
                    @ERRMSG = 'Parent does not exist in "ANAGRAFICAARTICOLI". Cannot create child in "ANAGRAFICALOTTI".'
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

/*  UPDATE TRIGGER "TU_ANAGRAFICALOTTI" FOR TABLE "ANAGRAFICALOTTI"  */
CREATE TRIGGER TU_ANAGRAFICALOTTI ON ANAGRAFICALOTTI FOR UPDATE AS
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

      
      /*  PARENT "ANAGRAFICAARTICOLI" MUST EXIST WHEN UPDATING A CHILD IN "ANAGRAFICALOTTI"  */
      IF UPDATE(CODARTICOLO)
      BEGIN
         IF (SELECT COUNT(*)
             FROM   ANAGRAFICAARTICOLI T1, INSERTED T2
             WHERE  T1.CODICE = T2.CODARTICOLO) != @NUMROWS
            BEGIN
               SELECT @ERRNO  = 30003,
                      @ERRMSG = '"ANAGRAFICAARTICOLI" does not exist. Cannot modify child in "ANAGRAFICALOTTI".'
               GOTO ERROR
            END
      END
      
      /*  MODIFY PARENT CODE OF "ANAGRAFICALOTTI" FOR ALL CHILDREN IN "ANAGRCARLOTTI"  */
      IF UPDATE(CODARTICOLO) OR
         UPDATE(CODLOTTO)
      BEGIN
         UPDATE ANAGRCARLOTTI
          SET   CODARTICOLO = I1.CODARTICOLO,
                CODLOTTO = I1.CODLOTTO
         FROM   ANAGRCARLOTTI T2, INSERTED I1, DELETED D1
         WHERE  T2.CODARTICOLO = D1.CODARTICOLO
          AND   T2.CODLOTTO = D1.CODLOTTO
          AND  (I1.CODARTICOLO != D1.CODARTICOLO OR
                I1.CODLOTTO != D1.CODLOTTO)
      END

      RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO

/*  DELETE TRIGGER "TD_ANAGRAFICALOTTI" FOR TABLE "ANAGRAFICALOTTI"  */
CREATE TRIGGER TD_ANAGRAFICALOTTI ON ANAGRAFICALOTTI FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN

    
    /*  DELETE ALL CHILDREN IN "ANAGRCARLOTTI"  */
    DELETE ANAGRCARLOTTI
    FROM   ANAGRCARLOTTI T2, DELETED T1
    WHERE  T2.CODARTICOLO = T1.CODARTICOLO
     AND   T2.CODLOTTO = T1.CODLOTTO

    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO
GRANT DELETE
    ON OBJECT::[dbo].[ANAGRAFICALOTTI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ANAGRAFICALOTTI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ANAGRAFICALOTTI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ANAGRAFICALOTTI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ANAGRAFICALOTTI] TO [Metodo98]
    AS [dbo];
