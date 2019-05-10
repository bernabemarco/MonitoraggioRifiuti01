CREATE TABLE [dbo].[CGesBilancioTeste] (
    [Progressivo]           DECIMAL (10) NOT NULL,
    [TipoReport]            SMALLINT     DEFAULT (0) NULL,
    [Nome]                  VARCHAR (50) DEFAULT ('') NULL,
    [Ambiente]              VARCHAR (3)  DEFAULT ('') NULL,
    [AnnoInizio]            DECIMAL (5)  DEFAULT (0) NULL,
    [MeseInizio]            INT          DEFAULT (0) NULL,
    [AnnoFine]              DECIMAL (5)  DEFAULT (0) NULL,
    [MeseFine]              INT          DEFAULT (0) NULL,
    [DesIntestazione]       VARCHAR (80) DEFAULT ('') NULL,
    [Mese01]                VARCHAR (12) DEFAULT ('') NULL,
    [Mese02]                VARCHAR (12) DEFAULT ('') NULL,
    [Mese03]                VARCHAR (12) DEFAULT ('') NULL,
    [Mese04]                VARCHAR (12) DEFAULT ('') NULL,
    [Mese05]                VARCHAR (12) DEFAULT ('') NULL,
    [Mese06]                VARCHAR (12) DEFAULT ('') NULL,
    [Mese07]                VARCHAR (12) DEFAULT ('') NULL,
    [Mese08]                VARCHAR (12) DEFAULT ('') NULL,
    [Mese09]                VARCHAR (12) DEFAULT ('') NULL,
    [Mese10]                VARCHAR (12) DEFAULT ('') NULL,
    [Mese11]                VARCHAR (12) DEFAULT ('') NULL,
    [Mese12]                VARCHAR (12) DEFAULT ('') NULL,
    [DesTotale]             VARCHAR (12) DEFAULT ('') NULL,
    [UtenteModifica]        VARCHAR (25) NOT NULL,
    [DataModifica]          DATETIME     NOT NULL,
    [TipoRiclassificazione] VARCHAR (5)  DEFAULT ('') NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO

/*  UPDATE TRIGGER "TU_CGesBilancioTeste" FOR TABLE "CGesBilancioTeste"  */
CREATE TRIGGER TU_CGesBilancioTeste ON CGesBilancioTeste FOR UPDATE AS
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

      
      /*  MODIFY PARENT CODE OF "CGesBilancioTeste" FOR ALL CHILDREN IN "CGesBilancioRighe"  */
      IF UPDATE(PROGRESSIVO)
      BEGIN
         UPDATE CGesBilancioRighe
          SET   RIFPROGRESSIVO = I1.PROGRESSIVO
         FROM   CGesBilancioRighe T2, INSERTED I1, DELETED D1
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

/*  DELETE TRIGGER "TD_CGesBilancioTeste" FOR TABLE "CGesBilancioTeste"  */
CREATE TRIGGER TD_CGesBilancioTeste ON CGesBilancioTeste FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN

    
    /*  DELETE ALL CHILDREN IN "CGesBilancioRighe"  */
    DELETE CGesBilancioRighe
    FROM   CGesBilancioRighe T2, DELETED T1
    WHERE  T2.RIFPROGRESSIVO = T1.PROGRESSIVO
    
    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesBilancioTeste] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesBilancioTeste] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesBilancioTeste] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesBilancioTeste] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesBilancioTeste] TO [Metodo98]
    AS [dbo];

