CREATE TABLE [dbo].[EXTRAAGENTI] (
    [CODAGENTE]                  VARCHAR (7)     NOT NULL,
    [UTENTEMODIFICA]             VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]               DATETIME        NOT NULL,
    [TipoAgente]                 SMALLINT        NULL,
    [Email]                      VARCHAR (50)    NULL,
    [IdSocieta]                  VARCHAR (3)     NULL,
    [ProvFissaGemmaSegnalatore]  NUMERIC (10, 2) DEFAULT ((0)) NULL,
    [PercProvvDecConSegnalatore] NUMERIC (10, 2) DEFAULT ((0)) NULL,
    [CODDEPOSITO]                VARCHAR (10)    NULL,
    [IdDivisione]                SMALLINT        DEFAULT ((0)) NULL,
    [UbicazioneTecnico]          VARCHAR (10)    NULL,
    [CODFORNITORE]               VARCHAR (7)     NULL,
    [SoggettoCommessa]           VARCHAR (50)    NULL,
    [CDCTECNICISERVICE]          SMALLINT        DEFAULT ((0)) NULL,
    [IdRespCid]                  VARCHAR (8)     DEFAULT ('') NULL,
    [ExportCRM]                  SMALLINT        DEFAULT ((0)) NULL,
    [IdResponsabile]             SMALLINT        DEFAULT ((0)) NULL,
    [IdAgentePadre]              SMALLINT        NULL,
    [IdAreaCommAgente]           SMALLINT        NULL,
    [IdTipologiaCommAgente]      SMALLINT        NULL,
    [dismesso]                   INT             DEFAULT ((0)) NULL,
    CONSTRAINT [PK_EXTRAAGENTI] PRIMARY KEY CLUSTERED ([CODAGENTE] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_EXTRAAGENTI_CODAGENTE] FOREIGN KEY ([CODAGENTE]) REFERENCES [dbo].[ANAGRAFICAAGENTI] ([CODAGENTE]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO

CREATE TRIGGER [dbo].ALD_TD_EXTRAAGENTI ON [dbo].EXTRAAGENTI FOR DELETE AS

BEGIN

    DECLARE

       @NUMROWS  INT,

       @ERRNO    INT,

       @ERRMSG   VARCHAR(255)



    SELECT  @NUMROWS = @@ROWCOUNT

    IF @NUMROWS = 0

       RETURN



  

    /*  CANNOT DELETE PARENT "EXTRAAGENTI" IF CHILDREN STILL EXIST IN "[ANAGRAFICARISERVATICF]" campo CodAgente1  */

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


/*  INSERT TRIGGER "ALD_TU_EXTRAAGENTI" FOR TABLE "EXTRAAGENTI"  */
CREATE TRIGGER [dbo].[ALD_TU_EXTRAAGENTI] ON [dbo].EXTRAAGENTI FOR	UPDATE AS

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
                      @ERRMSG = 'Children still exist in "ANAGRAFICA RISERVATI CLI/FOR". Cannot modify parent code in "EXTRA AGENTI".'
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
                      @ERRMSG = 'Children still exist in "ANAGRAFICA RISERVATI CLI/FOR". Cannot modify parent code in "EXTRA AGENTI".'
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
                      @ERRMSG = 'Children still exist in "ANAGRAFICA RISERVATI CLI/FOR". Cannot modify parent code in "EXTRA AGENTI".'
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
                      @ERRMSG = 'Children still exist in "Teste Documenti". Cannot modify parent code in "EXTRA AGENTI".'
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
                      @ERRMSG = 'Children still exist in "Teste Documenti". Cannot modify parent code in "EXTRA AGENTI".'
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
                      @ERRMSG = 'Children still exist in "Teste Documenti". Cannot modify parent code in "EXTRA AGENTI".'
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
    ON OBJECT::[dbo].[EXTRAAGENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[EXTRAAGENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[EXTRAAGENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[EXTRAAGENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[EXTRAAGENTI] TO [Metodo98]
    AS [dbo];

