﻿CREATE TABLE [dbo].[TesteVBanco] (
    [Progressivo]       DECIMAL (10)    NOT NULL,
    [Data]              DATETIME        NOT NULL,
    [CodCausale]        VARCHAR (3)     NOT NULL,
    [CodCliente]        VARCHAR (7)     NULL,
    [Listino]           DECIMAL (5)     DEFAULT (0) NULL,
    [ScontoFinale]      VARCHAR (10)    NULL,
    [TotImponibile]     DECIMAL (19, 4) DEFAULT (0) NULL,
    [TotImposta]        DECIMAL (19, 4) DEFAULT (0) NULL,
    [TotaleNetto]       DECIMAL (19, 4) DEFAULT (0) NULL,
    [TotImponibileEuro] DECIMAL (19, 4) DEFAULT (0) NULL,
    [TotImpostaEuro]    DECIMAL (19, 4) DEFAULT (0) NULL,
    [TotaleNettoEuro]   DECIMAL (19, 4) DEFAULT (0) NULL,
    [Incassato]         SMALLINT        DEFAULT (0) NULL,
    [AggMagazzino]      SMALLINT        DEFAULT (0) NULL,
    [Contabilizzato]    SMALLINT        DEFAULT (0) NULL,
    [TipoRigaCont]      VARCHAR (3)     NULL,
    [RigaContabile]     VARCHAR (7)     NULL,
    [UTENTEMODIFICA]    VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]      DATETIME        NOT NULL,
    [MODPAGAMENTO]      DECIMAL (5)     DEFAULT (0) NOT NULL,
    [ESERCIZIO]         DECIMAL (5)     NULL,
    [CodicePos]         NUMERIC (18)    NULL,
    [ScontoFinAValore]  DECIMAL (19, 6) DEFAULT (0) NULL,
    [RipScontoFinale]   SMALLINT        DEFAULT (0) NULL,
    [Tipo_AggMagazzino] SMALLINT        DEFAULT ((0)) NULL,
    CONSTRAINT [TesteVBanco_PK] PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [CKC_AggMagazzino] CHECK ([AggMagazzino] = 0 or [AggMagazzino] = 1),
    CONSTRAINT [CKC_Contabilizzato] CHECK ([Contabilizzato] = (-1) or [Contabilizzato] = 0 or [Contabilizzato] = 1),
    CONSTRAINT [CKC_Incassato] CHECK ([Incassato] = 0 or [Incassato] = 1)
);


GO

/*  DELETE TRIGGER "TD_TESTEVBANCO" FOR TABLE "TESTEVBANCO"  */
CREATE TRIGGER TD_TESTEVBANCO ON TESTEVBANCO FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
        RETURN

    /*  DELETE ALL CHILDREN IN "RIGHEVBANCO"  */
    DELETE RIGHEVBANCO
    FROM   RIGHEVBANCO T2, DELETED T1
    WHERE  T2.PROGRESSIVO = T1.PROGRESSIVO

   /*  DELETE ALL CHILDREN IN "VBSITUAZIONECASSAD"  */
    DELETE VBSITUAZIONECASSAD
    FROM   VBSITUAZIONECASSAD T2, DELETED T1
    WHERE  T2.IDTESTA = T1.PROGRESSIVO    

   /*  DELETE ALL CHILDREN IN "TP_MATRICOLE_VBANCO"  */
    DELETE TP_MATRICOLE_VBANCO
    FROM   TP_MATRICOLE_VBANCO T2, DELETED T1
    WHERE  T2.IDMOV = T1.PROGRESSIVO    

    /*  DELETE ALL CHILDREN IN "TP_PARTITE_VBANCO"  */
    DELETE TP_PARTITE_VBANCO
    FROM   TP_PARTITE_VBANCO T2, DELETED T1
    WHERE  T2.IDMOV = T1.PROGRESSIVO
     
    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END


GO

/*  UPDATE TRIGGER "TU_TESTEVBANCO" FOR TABLE "TESTEVBANCO"  */
CREATE TRIGGER TU_TESTEVBANCO ON TESTEVBANCO FOR UPDATE AS
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

      
      /*  MODIFY PARENT CODE OF "TESTEVBANCO" FOR ALL CHILDREN IN "RIGHEVBANCO"  */
      IF UPDATE(PROGRESSIVO)
      BEGIN
         UPDATE RIGHEVBANCO
          SET   PROGRESSIVO = I1.PROGRESSIVO
         FROM   RIGHEVBANCO T2, INSERTED I1, DELETED D1
         WHERE  T2.PROGRESSIVO = D1.PROGRESSIVO
          AND  (I1.PROGRESSIVO != D1.PROGRESSIVO)
      END

      RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO
GRANT DELETE
    ON OBJECT::[dbo].[TesteVBanco] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TesteVBanco] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TesteVBanco] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TesteVBanco] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TesteVBanco] TO [Metodo98]
    AS [dbo];

