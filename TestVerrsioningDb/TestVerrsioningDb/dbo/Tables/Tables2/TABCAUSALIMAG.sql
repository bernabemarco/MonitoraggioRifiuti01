﻿CREATE TABLE [dbo].[TABCAUSALIMAG] (
    [CODICE]            DECIMAL (5)  NOT NULL,
    [DESCRIZIONE]       VARCHAR (80) NULL,
    [CLIFOR]            VARCHAR (1)  NULL,
    [QUANTITACARICO]    SMALLINT     DEFAULT (0) NOT NULL,
    [VALORECARICO]      SMALLINT     DEFAULT (0) NOT NULL,
    [QUANTITASCARICO]   SMALLINT     DEFAULT (0) NOT NULL,
    [VALORESCARICO]     SMALLINT     DEFAULT (0) NOT NULL,
    [GIACENZA]          SMALLINT     DEFAULT (0) NOT NULL,
    [ORDINATO]          SMALLINT     DEFAULT (0) NOT NULL,
    [IMPEGNATO]         SMALLINT     DEFAULT (0) NOT NULL,
    [GIACENZA2UM]       SMALLINT     DEFAULT (0) NOT NULL,
    [ORDINATO2UM]       SMALLINT     DEFAULT (0) NOT NULL,
    [IMPEGNATO2UM]      SMALLINT     DEFAULT (0) NOT NULL,
    [NRGIORNALE]        DECIMAL (5)  NULL,
    [FLGCONSCOMMCLI]    SMALLINT     DEFAULT (0) NULL,
    [CODCAUSCOMMCLI]    DECIMAL (5)  NULL,
    [VALUTAULTPREZZO]   SMALLINT     DEFAULT (0) NULL,
    [DATAINIVALIDITA]   DATETIME     NOT NULL,
    [DATAFINEVALIDITA]  DATETIME     NOT NULL,
    [UTENTEMODIFICA]    VARCHAR (25) NOT NULL,
    [DATAMODIFICA]      DATETIME     NOT NULL,
    [Reso]              SMALLINT     DEFAULT (0) NOT NULL,
    [RipresaValore]     SMALLINT     CONSTRAINT [DF_TABCAUSALIMAG_RipresaValore] DEFAULT (0) NULL,
    [FlgArchiviazione]  SMALLINT     CONSTRAINT [DF_TABCAUSALIMAG_FLGARCHIVIAZIONE] DEFAULT (0) NOT NULL,
    [FLGELIMINARIFCOMM] SMALLINT     CONSTRAINT [DF_TABCAUSALIMAG_FLGELIMINARIFCOMM] DEFAULT (0) NULL,
    CONSTRAINT [PK_TABCAUSALIMAG] PRIMARY KEY CLUSTERED ([CODICE] ASC) WITH (FILLFACTOR = 90),
    CHECK ([Reso] = 1 or [Reso] = 0),
    CONSTRAINT [CKC_CLIFOR_TABCAUSA] CHECK ([CLIFOR] = 'F' or [CLIFOR] = 'C'),
    CONSTRAINT [CKC_FLGCONSCOMMCLI_TABCAUSA] CHECK ([FLGCONSCOMMCLI] = 0 or [FLGCONSCOMMCLI] = 1),
    CONSTRAINT [CKC_GIACENZA_TABCAUSA] CHECK ([GIACENZA] = 1 or [GIACENZA] = 0 or [GIACENZA] = (-1)),
    CONSTRAINT [CKC_GIACENZA2UM_TABCAUSA] CHECK ([GIACENZA2UM] = 1 or [GIACENZA2UM] = 0 or [GIACENZA2UM] = (-1)),
    CONSTRAINT [CKC_IMPEGNATO_TABCAUSA] CHECK ([IMPEGNATO] = 1 or [IMPEGNATO] = 0 or [IMPEGNATO] = (-1)),
    CONSTRAINT [CKC_IMPEGNATO2UM_TABCAUSA] CHECK ([IMPEGNATO2UM] = 1 or [IMPEGNATO2UM] = 0 or [IMPEGNATO2UM] = (-1)),
    CONSTRAINT [CKC_ORDINATO_TABCAUSA] CHECK ([ORDINATO] = 1 or [ORDINATO] = 0 or [ORDINATO] = (-1)),
    CONSTRAINT [CKC_ORDINATO2UM_TABCAUSA] CHECK ([ORDINATO2UM] = 1 or [ORDINATO2UM] = 0 or [ORDINATO2UM] = (-1)),
    CONSTRAINT [CKC_QUANTITACARICO_TABCAUSA] CHECK ([QUANTITACARICO] = 1 or [QUANTITACARICO] = 0 or [QUANTITACARICO] = (-1)),
    CONSTRAINT [CKC_QUANTITASCARICO_TABCAUSA] CHECK ([QUANTITASCARICO] = 1 or [QUANTITASCARICO] = 0 or [QUANTITASCARICO] = (-1)),
    CONSTRAINT [CKC_VALORECARICO_TABCAUSA] CHECK ([VALORECARICO] = 1 or [VALORECARICO] = 0 or [VALORECARICO] = (-1)),
    CONSTRAINT [CKC_VALORESCARICO_TABCAUSA] CHECK ([VALORESCARICO] = 1 or [VALORESCARICO] = 0 or [VALORESCARICO] = (-1)),
    CONSTRAINT [CKC_VALUTAULTPREZZO_TABCAUSA] CHECK ([VALUTAULTPREZZO] = 0 or [VALUTAULTPREZZO] = 1)
);


GO
CREATE NONCLUSTERED INDEX [TABCAUMAG_DSC]
    ON [dbo].[TABCAUSALIMAG]([DESCRIZIONE] ASC) WITH (FILLFACTOR = 90);


GO
/*  DELETE TRIGGER "TD_TABCAUSALIMAG" FOR TABLE "TABCAUSALIMAG"  */
CREATE TRIGGER TD_TABCAUSALIMAG ON TABCAUSALIMAG FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN

    
    /*  CANNOT DELETE PARENT "TABCAUSALIMAG" IF CHILDREN STILL EXIST IN "STORICOMAG"  */
    IF EXISTS (SELECT 1
               FROM   STORICOMAG T2, DELETED T1
               WHERE  T2.CODCAUSALE = T1.CODICE)
       BEGIN
          SELECT @ERRNO  = 30006,
                 @ERRMSG = 'Children still exist in "STORICOMAG". Cannot delete parent "TABCAUSALIMAG".'
          GOTO ERROR
       END
    
    /*  DELETE ALL CHILDREN IN "TABEXTRACAUS"  */
    DELETE TABEXTRACAUS
    FROM   TABEXTRACAUS T2, DELETED T1
    WHERE  T2.CODCAUSALE = T1.CODICE
    
    /*  DELETE ALL CHILDREN IN "TABEXTRADEPCAUS"  */
    DELETE TABEXTRADEPCAUS
    FROM   TABEXTRADEPCAUS T2, DELETED T1
    WHERE  T2.CODCAUSALE = T1.CODICE


    /*  DELETE ALL CHILDREN IN "ACCESSICAUSMAG"  */
    DELETE ACCESSICAUSMAG
    FROM   ACCESSICAUSMAG T2, DELETED T1
    WHERE  T2.CODCAUMAG = T1.CODICE

    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO
/*  UPDATE TRIGGER "TU_TABCAUSALIMAG" FOR TABLE "TABCAUSALIMAG"  */
CREATE TRIGGER TU_TABCAUSALIMAG ON TABCAUSALIMAG FOR UPDATE AS
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

      
      /*  CANNOT MODIFY PARENT CODE IN "TABCAUSALIMAG" IF CHILDREN STILL EXIST IN "STORICOMAG"  */
      IF UPDATE(CODICE)
      BEGIN
         IF EXISTS (SELECT 1
                    FROM   STORICOMAG T2, INSERTED I1, DELETED D1
                    WHERE  T2.CODCAUSALE = D1.CODICE
                     AND  (I1.CODICE != D1.CODICE))
            BEGIN
               SELECT @ERRNO  = 30005,
                      @ERRMSG = 'Children still exist in "STORICOMAG". Cannot modify parent code in "TABCAUSALIMAG".'
               GOTO ERROR
            END
      END
      
      /*  MODIFY PARENT CODE OF "TABCAUSALIMAG" FOR ALL CHILDREN IN "TABEXTRACAUS"  */
      IF UPDATE(CODICE)
      BEGIN
         UPDATE TABEXTRACAUS
          SET   CODCAUSALE = I1.CODICE
         FROM   TABEXTRACAUS T2, INSERTED I1, DELETED D1
         WHERE  T2.CODCAUSALE = D1.CODICE
          AND  (I1.CODICE != D1.CODICE)
      END
      
      /*  MODIFY PARENT CODE OF "TABCAUSALIMAG" FOR ALL CHILDREN IN "TABEXTRADEPCAUS"  */
      IF UPDATE(CODICE)
      BEGIN
         UPDATE TABEXTRADEPCAUS
          SET   CODCAUSALE = I1.CODICE
         FROM   TABEXTRADEPCAUS T2, INSERTED I1, DELETED D1
         WHERE  T2.CODCAUSALE = D1.CODICE
          AND  (I1.CODICE != D1.CODICE)
      END

      /*  MODIFY PARENT CODE OF "TABCAUSALIMAG" FOR ALL CHILDREN IN "ACCESSICAUSMAG"  */
      IF UPDATE(CODICE)
      BEGIN
         UPDATE ACCESSICAUSMAG
          SET   CODCAUMAG = I1.CODICE
         FROM   ACCESSICAUSMAG T2, INSERTED I1, DELETED D1
         WHERE  T2.CODCAUMAG = D1.CODICE
          AND  (I1.CODICE != D1.CODICE)
      END

      RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO
GRANT DELETE
    ON OBJECT::[dbo].[TABCAUSALIMAG] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TABCAUSALIMAG] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TABCAUSALIMAG] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TABCAUSALIMAG] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TABCAUSALIMAG] TO [Metodo98]
    AS [dbo];

