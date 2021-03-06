﻿CREATE TABLE [dbo].[TEMPSTPTESTEDBA] (
    [NRTERMINALE]     DECIMAL (5)     NOT NULL,
    [PROGRESSIVO]     DECIMAL (10)    NOT NULL,
    [RIFDISTINTA]     DECIMAL (10)    NULL,
    [COMPOSTO]        VARCHAR (50)    NULL,
    [DSCCOMPOSTO]     VARCHAR (255)   NULL,
    [QUANTITA]        DECIMAL (16, 6) DEFAULT (0) NOT NULL,
    [DATAVALUTAZIONE] DATETIME        NOT NULL,
    [UM]              VARCHAR (3)     NOT NULL,
    [LIVPRODUZIONE]   CHAR (1)        NOT NULL,
    [UTENTEMODIFICA]  VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]    DATETIME        NOT NULL,
    CONSTRAINT [PK_TEMPSTPTESTEDBA] PRIMARY KEY CLUSTERED ([NRTERMINALE] ASC, [PROGRESSIVO] ASC) WITH (FILLFACTOR = 90)
);


GO

/*  UPDATE TRIGGER "TU_TEMPSTPTESTEDBA" FOR TABLE "TEMPSTPTESTEDBA"  */
CREATE TRIGGER TU_TEMPSTPTESTEDBA ON TEMPSTPTESTEDBA FOR UPDATE AS
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

      
      /*  MODIFY PARENT CODE OF "TEMPSTPTESTEDBA" FOR ALL CHILDREN IN "TEMPSTPRIGHEDBA"  */
      IF UPDATE(NRTERMINALE) OR
         UPDATE(PROGRESSIVO)
      BEGIN
         UPDATE TEMPSTPRIGHEDBA
          SET   NRTERMINALE = I1.NRTERMINALE,
                RIFPROGRESSIVO = I1.PROGRESSIVO
         FROM   TEMPSTPRIGHEDBA T2, INSERTED I1, DELETED D1
         WHERE  T2.NRTERMINALE = D1.NRTERMINALE
          AND   T2.RIFPROGRESSIVO = D1.PROGRESSIVO
          AND  (I1.NRTERMINALE != D1.NRTERMINALE OR
                I1.PROGRESSIVO != D1.PROGRESSIVO)
      END

      RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO

/*  DELETE TRIGGER "TD_TEMPSTPTESTEDBA" FOR TABLE "TEMPSTPTESTEDBA"  */
CREATE TRIGGER TD_TEMPSTPTESTEDBA ON TEMPSTPTESTEDBA FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN

    
    /*  DELETE ALL CHILDREN IN "TEMPSTPRIGHEDBA"  */
    DELETE TEMPSTPRIGHEDBA
    FROM   TEMPSTPRIGHEDBA T2, DELETED T1
    WHERE  T2.NRTERMINALE = T1.NRTERMINALE
     AND   T2.RIFPROGRESSIVO = T1.PROGRESSIVO

    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO
GRANT DELETE
    ON OBJECT::[dbo].[TEMPSTPTESTEDBA] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TEMPSTPTESTEDBA] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TEMPSTPTESTEDBA] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TEMPSTPTESTEDBA] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TEMPSTPTESTEDBA] TO [Metodo98]
    AS [dbo];

