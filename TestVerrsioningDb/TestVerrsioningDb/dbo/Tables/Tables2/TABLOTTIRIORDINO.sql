﻿CREATE TABLE [dbo].[TABLOTTIRIORDINO] (
    [CODART]              VARCHAR (50)    NOT NULL,
    [NUMERO]              SMALLINT        NOT NULL,
    [TIPORIORD]           SMALLINT        DEFAULT (0) NOT NULL,
    [CODFOR]              VARCHAR (7)     NULL,
    [LOTTORIF]            DECIMAL (16, 6) DEFAULT (0) NOT NULL,
    [UM]                  VARCHAR (3)     NOT NULL,
    [QTAMINIMA]           DECIMAL (16, 6) DEFAULT (0) NOT NULL,
    [QTAMASSIMA]          DECIMAL (16, 6) DEFAULT (0) NOT NULL,
    [QTADELTA]            DECIMAL (16, 6) DEFAULT (0) NOT NULL,
    [PRCRIPART]           DECIMAL (8, 5)  DEFAULT (0) NOT NULL,
    [GGAPPROVV]           SMALLINT        NULL,
    [GGAPPRONT]           SMALLINT        NULL,
    [ARROTLOTTO]          SMALLINT        DEFAULT (0) NULL,
    [VERSIONEDBA]         VARCHAR (10)    NULL,
    [COSTOUNTRASF]        DECIMAL (19, 6) DEFAULT (0) NULL,
    [COSTOUNTRASEURO]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [UTENTEMODIFICA]      VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]        DATETIME        NOT NULL,
    [TP_CODDEP]           VARCHAR (10)    NULL,
    [TP_FORNFATTURAZIONE] VARCHAR (7)     NULL,
    CONSTRAINT [PK_TABLOTTIRIORDINO] PRIMARY KEY CLUSTERED ([CODART] ASC, [NUMERO] ASC, [TIPORIORD] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [CKC_ARROTLOTTO_TABLOTTI] CHECK ([ARROTLOTTO] = 0 or [ARROTLOTTO] = 1),
    CONSTRAINT [CKC_TIPORIORD_TABLOTTI] CHECK ([TIPORIORD] = 2 or [TIPORIORD] = 1 or [TIPORIORD] = 0)
);


GO
CREATE NONCLUSTERED INDEX [TABLOTTIRIORD_DSC]
    ON [dbo].[TABLOTTIRIORDINO]([CODFOR] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [TABLOTTIRIORD_ART]
    ON [dbo].[TABLOTTIRIORDINO]([CODART] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IX_ORDINEFORNITORE_TABLOTTIRIORDINO_1]
    ON [dbo].[TABLOTTIRIORDINO]([TP_CODDEP] ASC, [TP_FORNFATTURAZIONE] ASC)
    INCLUDE([CODART]);


GO

CREATE TRIGGER TD_TABLOTTIRIORDINO ON TABLOTTIRIORDINO FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN

	/*  DELETE ALL CHILDREN IN "TP_APPROVV_DEPOSITI"  */
    DELETE TP_APPROVV_DEPOSITI
    FROM   TP_APPROVV_DEPOSITI T2, DELETED T1
    WHERE  T2.CodArticolo = T1.CODART
     AND   T2.CodFornPref = T1.CODFOR
	 AND   T2.CodDeposito = T1.TP_CODDEP
	
	/*  DELETE ALL CHILDREN IN "TP_PUNTOFISSORIORDINO"  */
    DELETE TP_PUNTOFISSORIORDINO
    FROM   TP_PUNTOFISSORIORDINO T2, DELETED T1
    WHERE  T2.CodArticolo = T1.CODART
     AND   T2.CodFornPref = T1.CODFOR
	 AND   T2.CodDeposito = T1.TP_CODDEP

	/*  DELETE ALL CHILDREN IN "TP_SCORTA"  */
    DELETE TP_SCORTA
    FROM   TP_SCORTA T2, DELETED T1
    WHERE  T2.CodArticolo = T1.CODART
     AND   T2.CodFornPref = T1.CODFOR
	 AND   T2.CodDeposito = T1.TP_CODDEP

	/*  DELETE ALL CHILDREN IN "TP_PERSONALIZZATOLIBERO"  */
    DELETE TP_PERSONALIZZATOLIBERO
    FROM   TP_PERSONALIZZATOLIBERO T2, DELETED T1
    WHERE  T2.CodArticolo = T1.CODART
     AND   T2.CodFornPref = T1.CODFOR
	 AND   T2.CodDeposito = T1.TP_CODDEP

    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR(@ERRMSG,1, 1)
    ROLLBACK  TRANSACTION
END

GO

/*  INSERT TRIGGER "TI_TABLOTTIRIORDINO" FOR TABLE "TABLOTTIRIORDINO"  */
CREATE TRIGGER TI_TABLOTTIRIORDINO ON TABLOTTIRIORDINO FOR INSERT AS
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

    
    /*  PARENT "ANAGRAFICAARTICOLI" MUST EXIST WHEN INSERTING A CHILD IN "TABLOTTIRIORDINO"  */
    IF UPDATE(CODART)
    BEGIN
       IF (SELECT COUNT(*)
           FROM   ANAGRAFICAARTICOLI T1, INSERTED T2
           WHERE  T1.CODICE = T2.CODART) != @NUMROWS
          BEGIN
             SELECT @ERRNO  = 30002,
                    @ERRMSG = 'Parent does not exist in "ANAGRAFICAARTICOLI". Cannot create child in "TABLOTTIRIORDINO".'
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

/*  UPDATE TRIGGER "TU_TABLOTTIRIORDINO" FOR TABLE "TABLOTTIRIORDINO"  */
CREATE TRIGGER TU_TABLOTTIRIORDINO ON TABLOTTIRIORDINO FOR UPDATE AS
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

      
      /*  PARENT "ANAGRAFICAARTICOLI" MUST EXIST WHEN UPDATING A CHILD IN "TABLOTTIRIORDINO"  */
      IF UPDATE(CODART)
      BEGIN
         IF (SELECT COUNT(*)
             FROM   ANAGRAFICAARTICOLI T1, INSERTED T2
             WHERE  T1.CODICE = T2.CODART) != @NUMROWS
            BEGIN
               SELECT @ERRNO  = 30003,
                      @ERRMSG = '"ANAGRAFICAARTICOLI" does not exist. Cannot modify child in "TABLOTTIRIORDINO".'
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
    ON OBJECT::[dbo].[TABLOTTIRIORDINO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TABLOTTIRIORDINO] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TABLOTTIRIORDINO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TABLOTTIRIORDINO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TABLOTTIRIORDINO] TO [Metodo98]
    AS [dbo];

