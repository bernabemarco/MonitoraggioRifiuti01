CREATE TABLE [dbo].[ANAGRAFICAAGENTI] (
    [CODAGENTE]         VARCHAR (7)     NOT NULL,
    [DSCAGENTE]         VARCHAR (80)    NULL,
    [INDIRIZZO]         VARCHAR (80)    NULL,
    [CAP]               VARCHAR (8)     NULL,
    [LOCALITA]          VARCHAR (80)    NULL,
    [PROVINCIA]         VARCHAR (4)     NULL,
    [CODFISCALE]        VARCHAR (16)    NULL,
    [PROVVIGIONI]       DECIMAL (8, 5)  DEFAULT (0) NOT NULL,
    [TELEFONO]          VARCHAR (25)    NULL,
    [FAX]               VARCHAR (25)    NULL,
    [TELEX]             VARCHAR (50)    NULL,
    [PARTITAIVA]        VARCHAR (25)    NULL,
    [NOTE]              VARCHAR (255)   NULL,
    [APPLPROVVRIGA]     CHAR (8)        NULL,
    [APPLPROVVFINALE]   CHAR (6)        NULL,
    [USAPRVPART]        SMALLINT        DEFAULT (0) NOT NULL,
    [NOTE1]             VARCHAR (255)   NULL,
    [UTENTEMODIFICA]    VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]      DATETIME        NOT NULL,
    [CODFOR]            VARCHAR (7)     NOT NULL,
    [TIPOAGENZIA]       SMALLINT        DEFAULT (0) NULL,
    [TIPOSOCIETA]       SMALLINT        DEFAULT (0) NULL,
    [NRSOCI]            DECIMAL (5)     DEFAULT (0) NOT NULL,
    [NRMATRICOLAAGT]    VARCHAR (12)    NOT NULL,
    [DATAISCRIZIONE]    DATETIME        NULL,
    [IMPORTOPREMIO]     DECIMAL (19, 4) DEFAULT (0) NULL,
    [IMPORTOPREMIOEURO] DECIMAL (19, 4) DEFAULT (0) NULL,
    [NRFATTURA]         DECIMAL (10)    DEFAULT (0) NOT NULL,
    [DSCRIGAENAS]       VARCHAR (80)    NULL,
    [CDCOSTO]           VARCHAR (10)    NOT NULL,
    CONSTRAINT [PK_ANAGRAFICAAGENTI] PRIMARY KEY CLUSTERED ([CODAGENTE] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [CHK_ANAGRAFICAAGENTI_TIPOAGENZIA] CHECK ([TIPOAGENZIA] is null or ([TIPOAGENZIA] = 1 or [TIPOAGENZIA] = 0)),
    CONSTRAINT [CHK_ANAGRAFICAAGENTI_TIPOSOCIETA] CHECK ([TIPOSOCIETA] is null or ([TIPOSOCIETA] = 2 or ([TIPOSOCIETA] = 1 or [TIPOSOCIETA] = 0))),
    CONSTRAINT [CKC_USAPRVPART_ANAGRAFI] CHECK ([USAPRVPART] = 0 or [USAPRVPART] = 1)
);


GO
CREATE NONCLUSTERED INDEX [DSCAGENTE]
    ON [dbo].[ANAGRAFICAAGENTI]([DSCAGENTE] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [PROVINCIAAA]
    ON [dbo].[ANAGRAFICAAGENTI]([PROVINCIA] ASC) WITH (FILLFACTOR = 90);


GO

CREATE TRIGGER [dbo].[ALD_TD_ANAGRAFICAAGENTI] ON [dbo].ANAGRAFICAAGENTI FOR DELETE AS

BEGIN

    DECLARE

       @NUMROWS  INT,

       @ERRNO    INT,

       @ERRMSG   VARCHAR(255)



    SELECT  @NUMROWS = @@ROWCOUNT

    IF @NUMROWS = 0

       RETURN



  

    /*  CANNOT DELETE PARENT "ANAGRAFICAAGENTI" IF CHILDREN STILL EXIST IN "[ANAGRAFICARISERVATICF]" campo CodAgente1  */

    IF EXISTS (SELECT 1

               FROM   [ANAGRAFICARISERVATICF] T2, DELETED T1

               WHERE  T2.CODAGENTE1 = T1.CODAGENTE)

       BEGIN

          SELECT @ERRNO  = 30006,

                 @ERRMSG = ' Esistono record nella tabella "ANAGRAFICARISERVATICF codice agente 1". Non è possibile cancellare il codice dalla tabella "ANAGRAFICAAGENTI".'

          GOTO ERROR

       END

    /*  CANNOT DELETE PARENT "ANAGRAFICAAGENTI" IF CHILDREN STILL EXIST IN "[ANAGRAFICARISERVATICF]" campo CodAgente2  */

    IF EXISTS (SELECT 1

               FROM   [ANAGRAFICARISERVATICF] T2, DELETED T1

               WHERE  T2.CODAGENTE2 = T1.CODAGENTE)

       BEGIN

          SELECT @ERRNO  = 30006,

                 @ERRMSG = ' Esistono record nella tabella "ANAGRAFICARISERVATICF codice agente 2". Non è possibile cancellare il codice dalla tabella "ANAGRAFICAAGENTI".'

          GOTO ERROR

       END

	/*  CANNOT DELETE PARENT "ANAGRAFICAAGENTI" IF CHILDREN STILL EXIST IN "[ANAGRAFICARISERVATICF]" campo CodAgente3  */

    IF EXISTS (SELECT 1

               FROM   [ANAGRAFICARISERVATICF] T2, DELETED T1

               WHERE  T2.CODAGENTE3 = T1.CODAGENTE)

       BEGIN

          SELECT @ERRNO  = 30006,

                 @ERRMSG = ' Esistono record nella tabella "ANAGRAFICARISERVATICF codice agente 3". Non è possibile cancellare il codice dalla tabella "ANAGRAFICAAGENTI".'

          GOTO ERROR

       END

    /*  CANNOT DELETE PARENT "ANAGRAFICAAGENTI" IF CHILDREN STILL EXIST IN "[TesteDocumenti]" campo CodAgente1  */

    IF EXISTS (SELECT 1

               FROM   [TESTEDOCUMENTI] T2, DELETED T1

               WHERE  T2.CODAGENTE1 = T1.CODAGENTE)

       BEGIN

          SELECT @ERRNO  = 30006,

                 @ERRMSG = ' Esistono record nella tabella "TesteDocumenti codice agente 1". Non è possibile cancellare il codice dalla tabella "ANAGRAFICAAGENTI".'

          GOTO ERROR

       END


    RETURN


    /*  CANNOT DELETE PARENT "ANAGRAFICAAGENTI" IF CHILDREN STILL EXIST IN "[TesteDocumenti]" campo CodAgente2  */

    IF EXISTS (SELECT 1

               FROM   [TESTEDOCUMENTI] T2, DELETED T1

               WHERE  T2.CODAGENTE2 = T1.CODAGENTE)

       BEGIN

          SELECT @ERRNO  = 30006,

                 @ERRMSG = ' Esistono record nella tabella "TesteDocumenti codice agente 2". Non è possibile cancellare il codice dalla tabella "ANAGRAFICAAGENTI".'

          GOTO ERROR

       END


    RETURN

	/*  CANNOT DELETE PARENT "ANAGRAFICAAGENTI" IF CHILDREN STILL EXIST IN "[TesteDocumenti]" campo CodAgente3  */

    IF EXISTS (SELECT 1

               FROM   [TESTEDOCUMENTI] T2, DELETED T1

               WHERE  T2.CODAGENTE3 = T1.CODAGENTE)

       BEGIN

          SELECT @ERRNO  = 30006,

                 @ERRMSG = ' Esistono record nella tabella "TesteDocumenti codice agente 3". Non è possibile cancellare il codice dalla tabella "ANAGRAFICAAGENTI".'

          GOTO ERROR

       END


    RETURN

/*  ERRORS HANDLING  */

ERROR:

    RAISERROR (@ERRMSG, 1, 1)

    ROLLBACK  TRANSACTION

END



GO


/*  INSERT TRIGGER "ALD_TU_AnagraficaAgenti" FOR TABLE "AnagraficaAgenti"  */
CREATE TRIGGER [dbo].[ALD_TU_AnagraficaAgenti] ON [dbo].AnagraficaAgenti FOR	UPDATE AS

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
      
      /* Controllo del codice agente 1, non permessa modifica del codice agente se movimentato in anagr. riservati CF */
      IF UPDATE(CodAgente)
      BEGIN
         IF EXISTS (SELECT 1
                    FROM   ANAGRAFICARISERVATICF T2, INSERTED I1, DELETED D1
                    WHERE  T2.CODAGENTE1 = D1.CODAGENTE
                     AND  (I1.CODAGENTE != D1.CODAGENTE))
            BEGIN
               SELECT @ERRNO  = 30005,
                      @ERRMSG = 'Children still exist in "ANAGRAFICA RISERVATI CLI/FOR". Cannot modify parent code in "Anagrafica AGENTI".'
               GOTO ERROR
            END
      END

	  /* Controllo del codice agente 2, non permessa modifica del codice agente se movimentato in anagr. riservati CF */
      IF UPDATE(CodAgente)
      BEGIN
         IF EXISTS (SELECT 1
                    FROM   ANAGRAFICARISERVATICF T2, INSERTED I1, DELETED D1
                    WHERE  T2.CODAGENTE2 = D1.CODAGENTE
                     AND  (I1.CODAGENTE != D1.CODAGENTE))
            BEGIN
               SELECT @ERRNO  = 30005,
                      @ERRMSG = 'Children still exist in "ANAGRAFICA RISERVATI CLI/FOR". Cannot modify parent code in "Anagrafica AGENTI".'
               GOTO ERROR
            END
      END

	  /* Controllo del codice agente 3, non permessa modifica del codice agente se movimentato in anagr. riservati CF */
      IF UPDATE(CodAgente)
      BEGIN
         IF EXISTS (SELECT 1
                    FROM   ANAGRAFICARISERVATICF T2, INSERTED I1, DELETED D1
                    WHERE  T2.CODAGENTE3 = D1.CODAGENTE
                     AND  (I1.CODAGENTE != D1.CODAGENTE))
            BEGIN
               SELECT @ERRNO  = 30005,
                      @ERRMSG = 'Children still exist in "ANAGRAFICA RISERVATI CLI/FOR". Cannot modify parent code in "Anagrafica AGENTI".'
               GOTO ERROR
            END
      END

	  /* Controllo del codice agente 1, non permessa modifica del codice agente se movimentato in TesteDocumenti */
      IF UPDATE(CodAgente)
      BEGIN
         IF EXISTS (SELECT 1
                    FROM   TesteDocumenti T2, INSERTED I1, DELETED D1
                    WHERE  T2.CODAGENTE1 = D1.CODAGENTE
                     AND  (I1.CODAGENTE != D1.CODAGENTE))
            BEGIN
               SELECT @ERRNO  = 30005,
                      @ERRMSG = 'Children still exist in "Teste Documenti". Cannot modify parent code in "Anagrafica AGENTI".'
               GOTO ERROR
            END
      END

	  /* Controllo del codice agente 2, non permessa modifica del codice agente se movimentato in TesteDocumenti */
      IF UPDATE(CodAgente)
      BEGIN
         IF EXISTS (SELECT 1
                    FROM   TesteDocumenti T2, INSERTED I1, DELETED D1
                    WHERE  T2.CODAGENTE2 = D1.CODAGENTE
                     AND  (I1.CODAGENTE != D1.CODAGENTE))
            BEGIN
               SELECT @ERRNO  = 30005,
                      @ERRMSG = 'Children still exist in "Teste Documenti". Cannot modify parent code in "Anagrafica AGENTI".'
               GOTO ERROR
            END
      END     
	  
	  /* Controllo del codice agente 3, non permessa modifica del codice agente se movimentato in TesteDocumenti */
      IF UPDATE(CodAgente)
      BEGIN
         IF EXISTS (SELECT 1
                    FROM   TesteDocumenti T2, INSERTED I1, DELETED D1
                    WHERE  T2.CODAGENTE3 = D1.CODAGENTE
                     AND  (I1.CODAGENTE != D1.CODAGENTE))
            BEGIN
               SELECT @ERRNO  = 30005,
                      @ERRMSG = 'Children still exist in "Teste Documenti". Cannot modify parent code in "Anagrafica AGENTI".'
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
    ON OBJECT::[dbo].[ANAGRAFICAAGENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ANAGRAFICAAGENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ANAGRAFICAAGENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ANAGRAFICAAGENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ANAGRAFICAAGENTI] TO [Metodo98]
    AS [dbo];

