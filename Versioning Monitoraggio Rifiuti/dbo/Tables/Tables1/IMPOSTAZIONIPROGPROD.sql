﻿CREATE TABLE [dbo].[IMPOSTAZIONIPROGPROD] (
    [NOMEPIANIF]                   VARCHAR (30) NOT NULL,
    [TIPOGESTIONE]                 SMALLINT     DEFAULT (2) NULL,
    [DATECAL]                      SMALLINT     DEFAULT (0) NULL,
    [MAGPF]                        SMALLINT     DEFAULT (0) NULL,
    [MAGMP]                        SMALLINT     DEFAULT (0) NULL,
    [SCMINIMA]                     SMALLINT     DEFAULT (0) NULL,
    [LIVRIORD]                     SMALLINT     DEFAULT (0) NULL,
    [SCMAX]                        SMALLINT     DEFAULT (0) NULL,
    [QTMINRIORD]                   SMALLINT     DEFAULT (0) NULL,
    [LOTTORIORD]                   SMALLINT     DEFAULT (0) NULL,
    [GGORIZZONTE]                  SMALLINT     NULL,
    [FLGCONSMAGDOC]                SMALLINT     DEFAULT (0) NULL,
    [FLGRAGGDATACONS]              SMALLINT     DEFAULT (0) NULL,
    [FLGRIVALUTALIVP]              SMALLINT     DEFAULT (0) NULL,
    [ORDINIMPSL]                   SMALLINT     DEFAULT (0) NULL,
    [FLGORDINALOTTORAGG]           SMALLINT     DEFAULT (1) NULL,
    [FLGPREIMPOSTALIVP]            SMALLINT     DEFAULT (0) NULL,
    [FLGESPLODISCALARE]            SMALLINT     DEFAULT (0) NULL,
    [UTENTEMODIFICA]               VARCHAR (25) NOT NULL,
    [DATAMODIFICA]                 DATETIME     NOT NULL,
    [FLGGENERAARTICOLI]            SMALLINT     DEFAULT (0) NULL,
    [FLGVERSIONEDBA]               SMALLINT     DEFAULT (0) NULL,
    [FLGCONSIDERATUTTI]            SMALLINT     CONSTRAINT [DF_IMPOSTAZIONIPROGPROD_FLGCONSIDERATUTTI] DEFAULT (0) NULL,
    [FLGCHIUDISCADUTI]             SMALLINT     NULL,
    [FLGRIGENERAMPP]               SMALLINT     NULL,
    [IMPOSTAZIONEFILTROSCORTA]     VARCHAR (50) NULL,
    [SQLFILTROSCORTA]              TEXT         NULL,
    [FLGGENERACOMPONENTI]          SMALLINT     NULL,
    [PIANOTEMPORANEO]              SMALLINT     DEFAULT ((0)) NULL,
    [IMPOSTAZIONEFILTROCOMMCLI]    VARCHAR (50) NULL,
    [SQLFILTROCOMMCLI]             TEXT         NULL,
    [SQLFILTROMAGRIFCOMMCLI]       TEXT         NULL,
    [TIPODISPMAGRIFCOMMCLI]        SMALLINT     DEFAULT ((0)) NULL,
    [BLOCCOUTENTE]                 VARCHAR (25) NULL,
    [DATAULTIMOELEMENTOMODIFICATO] DATETIME     NULL,
    [FLGUSADBAFABBISOGNO]          SMALLINT     CONSTRAINT [DF_IMPOSTAZIONIPROGPROD_FLGUSADBAFABBISOGNO] DEFAULT ((0)) NOT NULL,
    [FlgLottoPeriodoCoper]         SMALLINT     CONSTRAINT [DF_IMPOSTAZIONIPROGPROD_FLGLOTTOPERIODOCOPER] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_IMPOSTAZIONIPROGPROD] PRIMARY KEY CLUSTERED ([NOMEPIANIF] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [CKC_DATECAL_IMPOSTAZ] CHECK ([DATECAL] = 0 or [DATECAL] = 1),
    CONSTRAINT [CKC_FLGCONSMAGDOC_IMPOSTAZ] CHECK ([FLGCONSMAGDOC] = 0 or [FLGCONSMAGDOC] = 1),
    CONSTRAINT [CKC_FLGESPLODISCALARE_IMPOSTAZ] CHECK ([FLGESPLODISCALARE] = 0 or [FLGESPLODISCALARE] = 1),
    CONSTRAINT [CKC_FLGPREIMPOSTALIVP_IMPOSTAZ] CHECK ([FLGPREIMPOSTALIVP] = 0 or [FLGPREIMPOSTALIVP] = 1),
    CONSTRAINT [CKC_FLGRAGGDATACONS_IMPOSTAZ] CHECK ([FLGRAGGDATACONS] = 0 or [FLGRAGGDATACONS] = 1),
    CONSTRAINT [CKC_FLGRIVALUTALIVP_IMPOSTAZ] CHECK ([FLGRIVALUTALIVP] = 0 or [FLGRIVALUTALIVP] = 1),
    CONSTRAINT [CKC_LIVRIORD_IMPOSTAZ] CHECK ([LIVRIORD] = 0 or [LIVRIORD] = 1),
    CONSTRAINT [CKC_LOTTORIORD_IMPOSTAZ] CHECK ([LOTTORIORD] = 0 or [LOTTORIORD] = 1),
    CONSTRAINT [CKC_MAGMP_IMPOSTAZ] CHECK ([MAGMP] = 0 or [MAGMP] = 1),
    CONSTRAINT [CKC_MAGPF_IMPOSTAZ] CHECK ([MAGPF] = 0 or [MAGPF] = 1),
    CONSTRAINT [CKC_ORDINIMPSL_IMPOSTAZ] CHECK ([ORDINIMPSL] = 0 or [ORDINIMPSL] = 1),
    CONSTRAINT [CKC_QTMINRIORD_IMPOSTAZ] CHECK ([QTMINRIORD] = 0 or [QTMINRIORD] = 1),
    CONSTRAINT [CKC_SCMAX_IMPOSTAZ] CHECK ([SCMAX] = 0 or [SCMAX] = 1),
    CONSTRAINT [CKC_SCMINIMA_IMPOSTAZ] CHECK ([SCMINIMA] = 0 or [SCMINIMA] = 1),
    CONSTRAINT [CKC_TIPOGESTIONE_IMPOSTAZ] CHECK ([TIPOGESTIONE]=(3) OR [TIPOGESTIONE]=(2) OR [TIPOGESTIONE]=(1) OR [TIPOGESTIONE]=(0))
);


GO

/*  UPDATE TRIGGER "TU_IMPOSTAZIONIPROGPROD" FOR TABLE "IMPOSTAZIONIPROGPROD"  */
CREATE TRIGGER TU_IMPOSTAZIONIPROGPROD ON IMPOSTAZIONIPROGPROD FOR UPDATE AS
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

      
      /*  MODIFY PARENT CODE OF "IMPOSTAZIONIPROGPROD" FOR ALL CHILDREN IN "IMPOSTAZIONIMAGAZZINIPROD"  */
      IF UPDATE(NOMEPIANIF)
      BEGIN
         UPDATE IMPOSTAZIONIMAGAZZINIPROD
          SET   NOMEPIANIF = I1.NOMEPIANIF
         FROM   IMPOSTAZIONIMAGAZZINIPROD T2, INSERTED I1, DELETED D1
         WHERE  T2.NOMEPIANIF = D1.NOMEPIANIF
          AND  (I1.NOMEPIANIF != D1.NOMEPIANIF)
      END
      
      /*  MODIFY PARENT CODE OF "IMPOSTAZIONIPROGPROD" FOR ALL CHILDREN IN "PROGPRODUZIONE"  */
      IF UPDATE(NOMEPIANIF)
      BEGIN
         UPDATE PROGPRODUZIONE
          SET   NOMEPIANIF = I1.NOMEPIANIF
         FROM   PROGPRODUZIONE T2, INSERTED I1, DELETED D1
         WHERE  T2.NOMEPIANIF = D1.NOMEPIANIF
          AND  (I1.NOMEPIANIF != D1.NOMEPIANIF)
      END
      
      /*  MODIFY PARENT CODE OF "IMPOSTAZIONIPROGPROD" FOR ALL CHILDREN IN "PROGPRODUZIONEDOC"  */
      IF UPDATE(NOMEPIANIF)
      BEGIN
         UPDATE PROGPRODUZIONEDOC
          SET   NOMEPIANIF = I1.NOMEPIANIF
         FROM   PROGPRODUZIONEDOC T2, INSERTED I1, DELETED D1
         WHERE  T2.NOMEPIANIF = D1.NOMEPIANIF
          AND  (I1.NOMEPIANIF != D1.NOMEPIANIF)
      END
      
      /*  MODIFY PARENT CODE OF "IMPOSTAZIONIPROGPROD" FOR ALL CHILDREN IN "IMPOSTAZIONIPRODLISTADOC"  */
      IF UPDATE(NOMEPIANIF)
      BEGIN
         UPDATE IMPOSTAZIONIPRODLISTADOC
          SET   NOMEPIANIF = I1.NOMEPIANIF
         FROM   IMPOSTAZIONIPRODLISTADOC T2, INSERTED I1, DELETED D1
         WHERE  T2.NOMEPIANIF = D1.NOMEPIANIF
          AND  (I1.NOMEPIANIF != D1.NOMEPIANIF)
      END

      RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO


CREATE TRIGGER [dbo].[TD_IMPOSTAZIONIPROGPROD] ON [dbo].[IMPOSTAZIONIPROGPROD] FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN

    
    /*  DELETE ALL CHILDREN IN "IMPOSTAZIONIMAGAZZINIPROD"  */
    DELETE IMPOSTAZIONIMAGAZZINIPROD
    FROM   IMPOSTAZIONIMAGAZZINIPROD T2, DELETED T1
    WHERE  T2.NOMEPIANIF = T1.NOMEPIANIF
    
    /*  DELETE ALL CHILDREN IN "PROGPRODUZIONE"  */
    DELETE PROGPRODUZIONE
    FROM   PROGPRODUZIONE T2, DELETED T1
    WHERE  T2.NOMEPIANIF = T1.NOMEPIANIF
    
    /*  DELETE ALL CHILDREN IN "PROGPRODUZIONEDOC"  */
    DELETE PROGPRODUZIONEDOC
    FROM   PROGPRODUZIONEDOC T2, DELETED T1
    WHERE  T2.NOMEPIANIF = T1.NOMEPIANIF
    
    /*  DELETE ALL CHILDREN IN "ECCEZIONIPROGPROD"  */
    DELETE ECCEZIONIPROGPROD
    FROM   ECCEZIONIPROGPROD T2, DELETED T1
    WHERE  T2.NOMEPIANIF = T1.NOMEPIANIF

    /*  DELETE ALL CHILDREN IN "IMPOSTAZIONIPRODLISTADOC"  */
    DELETE IMPOSTAZIONIPRODLISTADOC
    FROM   IMPOSTAZIONIPRODLISTADOC T2, DELETED T1
    WHERE  T2.NOMEPIANIF = T1.NOMEPIANIF

    /*  DELETE ALL CHILDREN IN "PROGPRODUZIONEGIAC"  */
    DELETE PROGPRODUZIONEGIAC
    FROM   PROGPRODUZIONEGIAC T2, DELETED T1
    WHERE  T2.NOMEPIANIF = T1.NOMEPIANIF

    RETURN

/*  ERRORS HANDLING  */
ERROR:
    raiserror (@errmsg, 1, 1)
    ROLLBACK  TRANSACTION
END

GO
GRANT DELETE
    ON OBJECT::[dbo].[IMPOSTAZIONIPROGPROD] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[IMPOSTAZIONIPROGPROD] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[IMPOSTAZIONIPROGPROD] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[IMPOSTAZIONIPROGPROD] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[IMPOSTAZIONIPROGPROD] TO [Metodo98]
    AS [dbo];
