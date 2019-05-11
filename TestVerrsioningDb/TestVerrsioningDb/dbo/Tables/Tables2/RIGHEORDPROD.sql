﻿CREATE TABLE [dbo].[RIGHEORDPROD] (
    [IDTESTA]                  DECIMAL (10)    NOT NULL,
    [IDRIGA]                   INT             NOT NULL,
    [POSIZIONE]                INT             NULL,
    [CODICEORD]                VARCHAR (3)     NOT NULL,
    [CODART]                   VARCHAR (50)    NULL,
    [DESCRIZIONEART]           VARCHAR (255)   NULL,
    [VERSIONEDBA]              VARCHAR (10)    NULL,
    [VERSIONECICLO]            VARCHAR (10)    NULL,
    [UMGEST]                   VARCHAR (3)     NOT NULL,
    [QTAGESTIONE]              DECIMAL (16, 6) DEFAULT (0) NOT NULL,
    [QTAGESTIONEVERS]          DECIMAL (16, 6) DEFAULT (0) NOT NULL,
    [QTAGESTIONERES]           DECIMAL (16, 6) DEFAULT (0) NOT NULL,
    [UMPREZZO]                 VARCHAR (3)     NOT NULL,
    [QTAPREZZOMAN]             SMALLINT        DEFAULT (0) NULL,
    [QTAPREZZO]                DECIMAL (16, 6) DEFAULT (0) NOT NULL,
    [QTAPREZZORES]             DECIMAL (16, 6) DEFAULT (0) NOT NULL,
    [QTA1MAGMAN]               SMALLINT        DEFAULT (0) NULL,
    [QTA1MAG]                  DECIMAL (16, 6) DEFAULT (0) NOT NULL,
    [QTA1MAGRES]               DECIMAL (16, 6) DEFAULT (0) NOT NULL,
    [QTA2MAGMAN]               SMALLINT        DEFAULT (0) NULL,
    [QTA2MAG]                  DECIMAL (16, 6) DEFAULT (0) NOT NULL,
    [QTA2MAGRES]               DECIMAL (16, 6) DEFAULT (0) NOT NULL,
    [UMSCARTO]                 VARCHAR (3)     NOT NULL,
    [QTASCARTO]                DECIMAL (16, 6) DEFAULT (0) NOT NULL,
    [CODCLIDEST]               VARCHAR (7)     NULL,
    [CAUSALEMAG]               DECIMAL (5)     NULL,
    [DEPOSITO]                 VARCHAR (10)    NULL,
    [UBICAZIONE]               VARCHAR (10)    NULL,
    [CONTOCDC]                 VARCHAR (10)    NULL,
    [CAUSALEMAGCOLL]           DECIMAL (5)     NULL,
    [DEPOSITOCOLL]             VARCHAR (10)    NULL,
    [UBICAZIONECOLL]           VARCHAR (10)    NULL,
    [CONTOCDCCOLL]             VARCHAR (10)    NULL,
    [PARTITAASSEGNATA]         VARCHAR (15)    NULL,
    [PARTITAVINCOLATA]         SMALLINT        DEFAULT (0) NULL,
    [CODFORDEST]               VARCHAR (7)     NULL,
    [DATAEMISSIONE]            DATETIME        NULL,
    [DATAINIZIORICH]           DATETIME        NULL,
    [DATAFINERICH]             DATETIME        NULL,
    [DATAINIZIOSCHED]          DATETIME        NULL,
    [DATAFINESCHED]            DATETIME        NULL,
    [DATAINIZIOEFF]            DATETIME        NULL,
    [DATAFINEEFF]              DATETIME        NULL,
    [DATAULTATTIVITA]          DATETIME        NULL,
    [TIPOSCHEDULAZIONE]        SMALLINT        DEFAULT (0) NULL,
    [STATOORDINE]              SMALLINT        DEFAULT (0) NULL,
    [FASERILASCIO]             SMALLINT        DEFAULT (0) NULL,
    [DATARILASCIO]             DATETIME        NULL,
    [IDCOSTOSTD]               VARCHAR (10)    NULL,
    [IDCOSTOCORR]              VARCHAR (10)    NULL,
    [COSTOMATPREV]             DECIMAL (19, 6) DEFAULT (0) NULL,
    [COSTOLAVINTPREV]          DECIMAL (19, 6) DEFAULT (0) NULL,
    [COSTOLAVESTPREV]          DECIMAL (19, 6) DEFAULT (0) NULL,
    [COSTOINDPREV]             DECIMAL (19, 6) DEFAULT (0) NULL,
    [COSTOUNITORDPREV]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [COSTOTOTORDPREV]          DECIMAL (19, 6) DEFAULT (0) NULL,
    [COSTOMATPREVEURO]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [COSTOLAVINTPREVEURO]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [COSTOLAVESTPREVEURO]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [COSTOINDPREVEURO]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [COSTOUNITORDPREVEURO]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [COSTOTOTORDPREVEURO]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [DATACALCCSTPREV]          DATETIME        NULL,
    [COSTOMATEFF]              DECIMAL (19, 6) DEFAULT (0) NULL,
    [COSTOLAVINTEFF]           DECIMAL (19, 6) DEFAULT (0) NULL,
    [COSTOLAVESTEFF]           DECIMAL (19, 6) DEFAULT (0) NULL,
    [COSTOINDEFF]              DECIMAL (19, 6) DEFAULT (0) NULL,
    [COSTOUNITORDEFF]          DECIMAL (19, 6) DEFAULT (0) NULL,
    [COSTOTOTORDEFF]           DECIMAL (19, 6) DEFAULT (0) NULL,
    [COSTOMATEFFEURO]          DECIMAL (19, 6) DEFAULT (0) NULL,
    [COSTOLAVINTEFFEURO]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [COSTOLAVESTEFFEURO]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [COSTOINDEFFEURO]          DECIMAL (19, 6) DEFAULT (0) NULL,
    [COSTOUNITORDEFFEURO]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [COSTOTOTORDEFFEURO]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [DATACALCCSTEFF]           DATETIME        NULL,
    [VALOREPRIORITA]           VARCHAR (15)    NULL,
    [RAPPORTOCRITICO]          DECIMAL (16, 6) DEFAULT (0) NOT NULL,
    [SLACKTIME]                DECIMAL (16, 6) DEFAULT (0) NULL,
    [NOTE]                     VARCHAR (255)   NULL,
    [DATAMODIFICA]             DATETIME        NOT NULL,
    [UTENTEMODIFICA]           VARCHAR (25)    NOT NULL,
    [FLAGRIGA]                 SMALLINT        DEFAULT (0) NULL,
    [RifCommCli]               VARCHAR (30)    NULL,
    [UM1MAG]                   VARCHAR (3)     NULL,
    [UM2MAG]                   VARCHAR (3)     NULL,
    [STATOLANCIO]              SMALLINT        DEFAULT (0) NULL,
    [DATALANCIO]               DATETIME        NULL,
    [STATOSTAMPA]              SMALLINT        DEFAULT (0) NULL,
    [FLGEMETTICICLO]           SMALLINT        DEFAULT (0) NULL,
    [FLGEMESSOCICLO]           SMALLINT        DEFAULT (0) NULL,
    [IDARTBASE]                INT             DEFAULT (0) NULL,
    [CODARTBASE]               VARCHAR (50)    DEFAULT ('') NULL,
    [VARIANTI]                 VARCHAR (100)   DEFAULT ('') NULL,
    [COSTOCOMPTOTPREV]         DECIMAL (19, 6) NULL,
    [COSTOCOMPTOTPREVEURO]     DECIMAL (19, 6) NULL,
    [COSTOCOMPTOTEFF]          DECIMAL (19, 6) NULL,
    [COSTOCOMPTOTEFFEURO]      DECIMAL (19, 6) NULL,
    [FLGVALORIZZA]             SMALLINT        NULL,
    [QTAEMESSADOC]             DECIMAL (16, 6) CONSTRAINT [DF_RIGHEORDPROD_QTAEMESSADOC] DEFAULT (0) NULL,
    [FLGORDTRAVASATO]          SMALLINT        CONSTRAINT [DF_RIGHEORDPROD_FLGORDTRAVASATO] DEFAULT (0) NULL,
    [FLGORDTRAVMOV]            SMALLINT        CONSTRAINT [DF_RIGHEORDPROD_FLGORDTRAVMOV] DEFAULT (0) NULL,
    [STATOSTAMPACICLO]         SMALLINT        NULL,
    [RIFDOCUMENTO]             VARCHAR (30)    NULL,
    [NODOASS]                  VARCHAR (50)    NULL,
    [STATOASS]                 VARCHAR (10)    NULL,
    [RAGSOCCLIDEST]            VARCHAR (80)    NULL,
    [RAGSOCFORDEST]            VARCHAR (80)    NULL,
    [COSTOUNITLAVORAZIONE]     DECIMAL (19, 4) NULL,
    [COSTOUNITLAVORAZIONEEURO] DECIMAL (19, 4) NULL,
    [FLAGUSACICLOCTRASF]       SMALLINT        NULL,
    CONSTRAINT [PK_RIGHEORDPROD] PRIMARY KEY CLUSTERED ([IDTESTA] ASC, [IDRIGA] ASC) WITH (FILLFACTOR = 90),
    CHECK ([FLGEMETTICICLO] = 3 or [FLGEMETTICICLO] = 2 or [FLGEMETTICICLO] = 1 or [FLGEMETTICICLO] = 0),
    CONSTRAINT [CKC_FASERILASCIO_RIGHEORD] CHECK ([FASERILASCIO] >= 0 and [FASERILASCIO] <= 5 and ([FASERILASCIO] = 5 or [FASERILASCIO] = 4 or [FASERILASCIO] = 3 or [FASERILASCIO] = 2 or [FASERILASCIO] = 1 or [FASERILASCIO] = 0)),
    CONSTRAINT [CKC_PARTITAVINCOLATA_RIGHEORD] CHECK ([PARTITAVINCOLATA] = 0 or [PARTITAVINCOLATA] = 1),
    CONSTRAINT [CKC_QTA1MAGMAN_RIGHEORD] CHECK ([QTA1MAGMAN] = 0 or [QTA1MAGMAN] = 1),
    CONSTRAINT [CKC_QTA2MAGMAN_RIGHEORD] CHECK ([QTA2MAGMAN] = 0 or [QTA2MAGMAN] = 1),
    CONSTRAINT [CKC_QTAPREZZOMAN_RIGHEORD] CHECK ([QTAPREZZOMAN] = 0 or [QTAPREZZOMAN] = 1),
    CONSTRAINT [CKC_STATOORDINE_RIGHEORD] CHECK ([STATOORDINE] >= 0 and [STATOORDINE] <= 3 and ([STATOORDINE] = 3 or [STATOORDINE] = 2 or [STATOORDINE] = 1 or [STATOORDINE] = 0)),
    CONSTRAINT [CKC_TIPOSCHEDULAZIONE_RIGHEORD] CHECK ([TIPOSCHEDULAZIONE] >= 0 and [TIPOSCHEDULAZIONE] <= 1 and ([TIPOSCHEDULAZIONE] = 1 or [TIPOSCHEDULAZIONE] = 0))
);


GO

/*  DELETE TRIGGER "TD_RIGHEORDPROD" FOR TABLE "RIGHEORDPROD"  */
CREATE TRIGGER TD_RIGHEORDPROD ON RIGHEORDPROD FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN
    
    /*  DELETE ALL CHILDREN IN "RIGHEORDPRODMATRICOLE"  */
    DELETE RIGHEORDPRODMATRICOLE
    FROM   RIGHEORDPRODMATRICOLE T2, DELETED T1
    WHERE  T2.IDTESTA = T1.IDTESTA
     AND   T2.IDRIGA = T1.IDRIGA
    
    /*  DELETE ALL CHILDREN IN "IMPEGNIORDPROD"  */
    DELETE IMPEGNIORDPROD
    FROM   IMPEGNIORDPROD T2, DELETED T1
    WHERE  T2.IDTESTA = T1.IDTESTA
     AND   T2.IDRIGA = T1.IDRIGA

    /*  DELETE ALL CHILDREN IN "STORICOMAG"  */
    DELETE STORICOMAG
    FROM   STORICOMAG T2, DELETED T1
    WHERE  T2.IDTESTA = T1.IDTESTA
     AND   T2.RIGADOC = T1.IDRIGA
	 AND   T2.TIPOMOV BETWEEN 5 AND 6

    /*  DELETE ALL CHILDREN IN "TESTACICLOORDINE"  */
    DELETE TESTACICLOORDINE
    FROM   TESTACICLOORDINE T2, DELETED T1
    WHERE  T2.IDTESTACOMM = T1.IDTESTA
     AND   T2.IDRIGACOMM = T1.IDRIGA

    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO

/*  INSERT TRIGGER "TI_RIGHEORDPROD" FOR TABLE "RIGHEORDPROD"  */
CREATE TRIGGER TI_RIGHEORDPROD ON RIGHEORDPROD FOR INSERT AS
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

    
    /*  PARENT "TESTEORDINIPROD" MUST EXIST WHEN INSERTING A CHILD IN "RIGHEORDPROD"  */
    IF UPDATE(IDTESTA)
    BEGIN
       IF (SELECT COUNT(*)
           FROM   TESTEORDINIPROD T1, INSERTED T2
           WHERE  T1.PROGRESSIVO = T2.IDTESTA) != @NUMROWS
          BEGIN
             SELECT @ERRNO  = 30002,
                    @ERRMSG = 'Parent does not exist in "TESTEORDINIPROD". Cannot create child in "RIGHEORDPROD".'
             GOTO ERROR
          END
    END
    
    /*  PARENT "PARAMETRIORDPROD" MUST EXIST WHEN INSERTING A CHILD IN "RIGHEORDPROD"  */
    IF UPDATE(CODICEORD)
    BEGIN
       IF (SELECT COUNT(*)
           FROM   PARAMETRIORDPROD T1, INSERTED T2
           WHERE  T1.CODICE = T2.CODICEORD) != @NUMROWS
          BEGIN
             SELECT @ERRNO  = 30002,
                    @ERRMSG = 'Parent does not exist in "PARAMETRIORDPROD". Cannot create child in "RIGHEORDPROD".'
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

/*  UPDATE TRIGGER "TU_RIGHEORDPROD" FOR TABLE "RIGHEORDPROD"  */
CREATE TRIGGER TU_RIGHEORDPROD ON RIGHEORDPROD FOR UPDATE AS
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

      
      /*  PARENT "TESTEORDINIPROD" MUST EXIST WHEN UPDATING A CHILD IN "RIGHEORDPROD"  */
      IF UPDATE(IDTESTA)
      BEGIN
         IF (SELECT COUNT(*)
             FROM   TESTEORDINIPROD T1, INSERTED T2
             WHERE  T1.PROGRESSIVO = T2.IDTESTA) != @NUMROWS
            BEGIN
               SELECT @ERRNO  = 30003,
                      @ERRMSG = '"TESTEORDINIPROD" does not exist. Cannot ALTER COLUMN child in "RIGHEORDPROD".'
               GOTO ERROR
            END
      END
      
      /*  PARENT "PARAMETRIORDPROD" MUST EXIST WHEN UPDATING A CHILD IN "RIGHEORDPROD"  */
      IF UPDATE(CODICEORD)
      BEGIN
         IF (SELECT COUNT(*)
             FROM   PARAMETRIORDPROD T1, INSERTED T2
             WHERE  T1.CODICE = T2.CODICEORD) != @NUMROWS
            BEGIN
               SELECT @ERRNO  = 30003,
                      @ERRMSG = '"PARAMETRIORDPROD" does not exist. Cannot ALTER COLUMN child in "RIGHEORDPROD".'
               GOTO ERROR
            END
      END
      
      /*  ALTER COLUMN PARENT CODE OF "RIGHEORDPROD" FOR ALL CHILDREN IN "RIGHEORDPRODMATRICOLE"  */
      IF UPDATE(IDTESTA) OR
         UPDATE(IDRIGA)
      BEGIN
         UPDATE RIGHEORDPRODMATRICOLE
          SET   IDTESTA = I1.IDTESTA,
                IDRIGA = I1.IDRIGA
         FROM   RIGHEORDPRODMATRICOLE T2, INSERTED I1, DELETED D1
         WHERE  T2.IDTESTA = D1.IDTESTA
          AND   T2.IDRIGA = D1.IDRIGA
          AND  (I1.IDTESTA != D1.IDTESTA OR
                I1.IDRIGA != D1.IDRIGA)
      END
      
      /*  ALTER COLUMN PARENT CODE OF "RIGHEORDPROD" FOR ALL CHILDREN IN "IMPEGNIORDPROD"  */
      IF UPDATE(IDTESTA) OR
         UPDATE(IDRIGA)
      BEGIN
         UPDATE IMPEGNIORDPROD
          SET   IDTESTA = I1.IDTESTA,
                IDRIGA = I1.IDRIGA
         FROM   IMPEGNIORDPROD T2, INSERTED I1, DELETED D1
         WHERE  T2.IDTESTA = D1.IDTESTA
          AND   T2.IDRIGA = D1.IDRIGA
          AND  (I1.IDTESTA != D1.IDTESTA OR
                I1.IDRIGA != D1.IDRIGA)
      END

      RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO
GRANT DELETE
    ON OBJECT::[dbo].[RIGHEORDPROD] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[RIGHEORDPROD] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[RIGHEORDPROD] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[RIGHEORDPROD] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[RIGHEORDPROD] TO [Metodo98]
    AS [dbo];
