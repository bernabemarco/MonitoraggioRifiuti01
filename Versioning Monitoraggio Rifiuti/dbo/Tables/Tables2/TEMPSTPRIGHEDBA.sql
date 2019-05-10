﻿CREATE TABLE [dbo].[TEMPSTPRIGHEDBA] (
    [NRTERMINALE]        DECIMAL (5)     NOT NULL,
    [RIFPROGRESSIVO]     DECIMAL (10)    NOT NULL,
    [NUMERORIGA]         INT             NOT NULL,
    [RIFDISTINTA]        DECIMAL (10)    NULL,
    [RIFNRRIGA]          DECIMAL (10)    NULL,
    [COMPONENTE]         VARCHAR (50)    NULL,
    [DSCCOMPONENTE]      VARCHAR (255)   NULL,
    [TIPO]               SMALLINT        NOT NULL,
    [LIVELLO]            INT             NOT NULL,
    [LIVPRODUZIONE]      VARCHAR (1)     NOT NULL,
    [UM]                 VARCHAR (3)     NOT NULL,
    [GHOST]              SMALLINT        NOT NULL,
    [CALCOLOQTA1]        VARCHAR (255)   NOT NULL,
    [CALCOLOQTA2]        VARCHAR (255)   NOT NULL,
    [CALCOLOFINALE]      VARCHAR (255)   NOT NULL,
    [QUANTITA1]          DECIMAL (16, 6) DEFAULT (0) NOT NULL,
    [QUANTITA2]          DECIMAL (16, 6) DEFAULT (0) NOT NULL,
    [QUANTITA]           DECIMAL (16, 6) DEFAULT (0) NOT NULL,
    [GIACENZA]           DECIMAL (16, 6) DEFAULT (0) NOT NULL,
    [IMPEGNATO]          DECIMAL (16, 6) DEFAULT (0) NOT NULL,
    [ORDINATO]           DECIMAL (16, 6) DEFAULT (0) NOT NULL,
    [DISPONIBILE]        DECIMAL (16, 6) DEFAULT (0) NOT NULL,
    [QTACOSTO]           DECIMAL (16, 6) DEFAULT (0) NOT NULL,
    [COSTOUNILIRE]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [COSTOTOTLIRE]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [COSTOUNIEURO]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [COSTOTOTEURO]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [POSIZIONE]          NUMERIC (10)    NOT NULL,
    [LEADTIMECOMPONENTE] INT             NULL,
    [DATADISPONIBILITA]  DATETIME        NOT NULL,
    [DATARICHIESTA]      DATETIME        NULL,
    [UMRIC]              VARCHAR (3)     NOT NULL,
    [QUANTITARIC]        DECIMAL (16, 6) DEFAULT (0) NOT NULL,
    [UTENTEMODIFICA]     VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]       DATETIME        NOT NULL,
    [PREZZOUNITARIO]     DECIMAL (19, 6) CONSTRAINT [DF_PREZZOUNITARIO] DEFAULT (0) NULL,
    [PREZZOUNITARIOEURO] DECIMAL (19, 6) CONSTRAINT [DF_PREZZOUNITARIOEURO] DEFAULT (0) NULL,
    CONSTRAINT [PK_TEMPSTPRIGHEDBA] PRIMARY KEY CLUSTERED ([NRTERMINALE] ASC, [RIFPROGRESSIVO] ASC, [NUMERORIGA] ASC) WITH (FILLFACTOR = 90)
);


GO

/*  UPDATE TRIGGER "TU_TEMPSTPRIGHEDBA" FOR TABLE "TEMPSTPRIGHEDBA"  */
CREATE TRIGGER TU_TEMPSTPRIGHEDBA ON TEMPSTPRIGHEDBA FOR UPDATE AS
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

      
      /*  PARENT "TEMPSTPTESTEDBA" MUST EXIST WHEN UPDATING A CHILD IN "TEMPSTPRIGHEDBA"  */
      IF UPDATE(NRTERMINALE) OR
         UPDATE(RIFPROGRESSIVO)
      BEGIN
         IF (SELECT COUNT(*)
             FROM   TEMPSTPTESTEDBA T1, INSERTED T2
             WHERE  T1.NRTERMINALE = T2.NRTERMINALE
              AND   T1.PROGRESSIVO = T2.RIFPROGRESSIVO) != @NUMROWS
            BEGIN
               SELECT @ERRNO  = 30003,
                      @ERRMSG = '"TEMPSTPTESTEDBA" does not exist. Cannot modify child in "TEMPSTPRIGHEDBA".'
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

/*  INSERT TRIGGER "TI_TEMPSTPRIGHEDBA" FOR TABLE "TEMPSTPRIGHEDBA"  */
CREATE TRIGGER TI_TEMPSTPRIGHEDBA ON TEMPSTPRIGHEDBA FOR INSERT AS
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

    
    /*  PARENT "TEMPSTPTESTEDBA" MUST EXIST WHEN INSERTING A CHILD IN "TEMPSTPRIGHEDBA"  */
    IF UPDATE(NRTERMINALE) OR
       UPDATE(RIFPROGRESSIVO)
    BEGIN
       IF (SELECT COUNT(*)
           FROM   TEMPSTPTESTEDBA T1, INSERTED T2
           WHERE  T1.NRTERMINALE = T2.NRTERMINALE
            AND   T1.PROGRESSIVO = T2.RIFPROGRESSIVO) != @NUMROWS
          BEGIN
             SELECT @ERRNO  = 30002,
                    @ERRMSG = 'Parent does not exist in "TEMPSTPTESTEDBA". Cannot create child in "TEMPSTPRIGHEDBA".'
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
    ON OBJECT::[dbo].[TEMPSTPRIGHEDBA] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TEMPSTPRIGHEDBA] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TEMPSTPRIGHEDBA] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TEMPSTPRIGHEDBA] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TEMPSTPRIGHEDBA] TO [Metodo98]
    AS [dbo];

