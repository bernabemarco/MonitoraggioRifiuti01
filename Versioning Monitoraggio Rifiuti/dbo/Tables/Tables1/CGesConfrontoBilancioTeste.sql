﻿CREATE TABLE [dbo].[CGesConfrontoBilancioTeste] (
    [Progressivo]           DECIMAL (10) NOT NULL,
    [Nome]                  VARCHAR (50) DEFAULT ('') NULL,
    [AmbienteRif]           VARCHAR (3)  DEFAULT ('') NULL,
    [AnnoInizioRif]         DECIMAL (5)  DEFAULT (0) NULL,
    [MeseInizioRif]         INT          DEFAULT (0) NULL,
    [AnnoFineRif]           DECIMAL (5)  DEFAULT (0) NULL,
    [MeseFineRif]           INT          DEFAULT (0) NULL,
    [AmbienteC1]            VARCHAR (3)  DEFAULT ('') NULL,
    [AnnoInizioC1]          DECIMAL (5)  DEFAULT (0) NULL,
    [MeseInizioC1]          INT          DEFAULT (0) NULL,
    [AnnoFineC1]            DECIMAL (5)  DEFAULT (0) NULL,
    [MeseFineC1]            INT          DEFAULT (0) NULL,
    [AmbienteC2]            VARCHAR (3)  DEFAULT ('') NULL,
    [AnnoInizioC2]          DECIMAL (5)  DEFAULT (0) NULL,
    [MeseInizioC2]          INT          DEFAULT (0) NULL,
    [AnnoFineC2]            DECIMAL (5)  DEFAULT (0) NULL,
    [MeseFineC2]            INT          DEFAULT (0) NULL,
    [AmbienteC3]            VARCHAR (3)  DEFAULT ('') NULL,
    [AnnoInizioC3]          DECIMAL (5)  DEFAULT (0) NULL,
    [MeseInizioC3]          INT          DEFAULT (0) NULL,
    [AnnoFineC3]            DECIMAL (5)  DEFAULT (0) NULL,
    [MeseFineC3]            INT          DEFAULT (0) NULL,
    [DesIntestazione]       VARCHAR (80) DEFAULT ('') NULL,
    [UtenteModifica]        VARCHAR (25) NOT NULL,
    [DataModifica]          DATETIME     NOT NULL,
    [TipoRiclassificazione] VARCHAR (5)  DEFAULT ('') NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO

/*  UPDATE TRIGGER "TU_CGesConfrontoBilancioTeste" FOR TABLE "CGesConfrontoBilancioTeste"  */
CREATE TRIGGER TU_CGesConfrontoBilancioTeste ON CGesConfrontoBilancioTeste FOR UPDATE AS
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

      
      /*  MODIFY PARENT CODE OF "CGesConfrontoBilancioTeste" FOR ALL CHILDREN IN "CGesConfrontoBilancioRighe"  */
      IF UPDATE(PROGRESSIVO)
      BEGIN
         UPDATE CGesConfrontoBilancioRighe
          SET   RIFPROGRESSIVO = I1.PROGRESSIVO
         FROM   CGesConfrontoBilancioRighe T2, INSERTED I1, DELETED D1
         WHERE  T2.RIFPROGRESSIVO = D1.PROGRESSIVO
          AND  (I1.PROGRESSIVO != D1.PROGRESSIVO)
      END
      
      RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO

/*  DELETE TRIGGER "TD_CGesConfrontoBilancioTeste" FOR TABLE "CGesConfrontoBilancioTeste"  */
CREATE TRIGGER TD_CGesConfrontoBilancioTeste ON CGesConfrontoBilancioTeste FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN

    
    /*  DELETE ALL CHILDREN IN "CGesConfrontoBilancioRighe"  */
    DELETE CGesConfrontoBilancioRighe
    FROM   CGesConfrontoBilancioRighe T2, DELETED T1
    WHERE  T2.RIFPROGRESSIVO = T1.PROGRESSIVO
    
    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesConfrontoBilancioTeste] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesConfrontoBilancioTeste] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesConfrontoBilancioTeste] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesConfrontoBilancioTeste] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesConfrontoBilancioTeste] TO [Metodo98]
    AS [dbo];

