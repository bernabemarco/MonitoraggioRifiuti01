﻿CREATE TABLE [dbo].[ANAGRAFICARISERVATICF] (
    [ESERCIZIO]             DECIMAL (5)     NOT NULL,
    [CODCONTO]              VARCHAR (7)     NOT NULL,
    [CODSETTORE]            DECIMAL (5)     NULL,
    [CODZONA]               DECIMAL (5)     NULL,
    [CODCATEGORIA]          DECIMAL (5)     NULL,
    [CODGRUPPOPREZZIPART]   DECIMAL (5)     NULL,
    [CODGRUPPOPROVPART]     DECIMAL (5)     NULL,
    [CODSPED]               DECIMAL (5)     NULL,
    [PRCTRASPORTO]          VARCHAR (10)    NULL,
    [INOLTROTRASP]          SMALLINT        DEFAULT (0) NULL,
    [CODPAG]                VARCHAR (4)     NULL,
    [MESEESCL1]             SMALLINT        NULL,
    [GGESCL1]               SMALLINT        NULL,
    [MESEESCL2]             SMALLINT        NULL,
    [GGESCL2]               SMALLINT        NULL,
    [CODBANCA]              VARCHAR (7)     NULL,
    [BANCAANAGR]            DECIMAL (5)     NULL,
    [RAGGSCADENZE]          SMALLINT        DEFAULT (0) NULL,
    [CODAGENTE1]            VARCHAR (7)     NULL,
    [CODAGENTE2]            VARCHAR (7)     NULL,
    [CODAGENTE3]            VARCHAR (7)     NULL,
    [PROVV1]                VARCHAR (10)    NULL,
    [PROVV2]                VARCHAR (10)    NULL,
    [PROVV3]                VARCHAR (10)    NULL,
    [SCONTO1]               VARCHAR (10)    NULL,
    [CODIVA]                DECIMAL (5)     NULL,
    [DICHESIVA]             VARCHAR (80)    NULL,
    [LISTINO]               DECIMAL (5)     NULL,
    [CODCAMBIO]             DECIMAL (5)     NULL,
    [DESTDIVMERCI]          DECIMAL (5)     NULL,
    [DESTDIVDOCUMENTI]      DECIMAL (5)     NULL,
    [SPESEDOCUM]            SMALLINT        DEFAULT (0) NULL,
    [SPESEEFFETTO]          SMALLINT        DEFAULT (0) NULL,
    [SPESETRASPORTO]        SMALLINT        DEFAULT (0) NULL,
    [SPESEIMBALLO]          SMALLINT        DEFAULT (0) NULL,
    [FIDO]                  DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [FIDOEURO]              DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [PORTO]                 DECIMAL (5)     NULL,
    [TRASPACURA]            DECIMAL (5)     NULL,
    [APPLSCONTORIGA]        VARCHAR (10)    NULL,
    [APPLSCONTOFINALE]      VARCHAR (6)     NULL,
    [CODCONTOFATT]          VARCHAR (7)     NULL,
    [FATTFINEMESE]          SMALLINT        DEFAULT (0) NULL,
    [NONRAGGRUPPDOC]        SMALLINT        DEFAULT (0) NULL,
    [STATOCONTABILITA]      SMALLINT        DEFAULT (0) NULL,
    [STATOMAGAZZINO]        SMALLINT        DEFAULT (0) NULL,
    [STATOORDINI]           SMALLINT        DEFAULT (0) NULL,
    [STATOBOLLE]            SMALLINT        DEFAULT (0) NULL,
    [STATOFATTURE]          SMALLINT        DEFAULT (0) NULL,
    [STATONOTEACCREDITO]    SMALLINT        DEFAULT (0) NULL,
    [STATOALTRO]            SMALLINT        DEFAULT (0) NULL,
    [CODDEPOSITO]           VARCHAR (10)    NULL,
    [CODDEPOSITOCOLL]       VARCHAR (10)    NULL,
    [CODDEPCOMP]            VARCHAR (10)    NULL,
    [CODDEPCOMPCOLL]        VARCHAR (10)    NULL,
    [RIVIVAOMAGGI]          SMALLINT        DEFAULT (0) NULL,
    [NRCONTROPCONT]         SMALLINT        DEFAULT (0) NULL,
    [USAPRZPRVPART]         SMALLINT        DEFAULT (0) NULL,
    [CCDEBITORE]            VARCHAR (12)    NULL,
    [CODDEBITORE]           VARCHAR (16)    NULL,
    [NOTE1]                 VARCHAR (255)   NULL,
    [UTENTEMODIFICA]        VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]          DATETIME        NOT NULL,
    [DATAINIZIOCALCOLOFIDO] DATETIME        NULL,
    [NUMEROCONTRATTO]       DECIMAL (10)    CONSTRAINT [DF_ANAGRAFICARISERVATICF_NUMEROCONTRATTO] DEFAULT (0) NULL,
    [EXPORTECOMMERCE]       SMALLINT        CONSTRAINT [DF_ANAGRAFICARISERVATICF_EXPORTECOMMERCE] DEFAULT ((0)) NULL,
    [USAPRZCOMMERCIALI]     SMALLINT        CONSTRAINT [DF_ANAGRAFICARISERVATICF_USAPRZCOMMERCIALI] DEFAULT ((0)) NULL,
    [PROGDICHINTENTO]       DECIMAL (10)    CONSTRAINT [DF_ANAGRAFICARISERVATICF_PROGDICHINTENTO] DEFAULT ((0)) NULL,
    [SPLITPAYMENT]          SMALLINT        CONSTRAINT [DF_ANAGRAFICARISERVATICF_SPLITPAYMENT] DEFAULT ((0)) NULL,
    CONSTRAINT [PK_ANAGRAFICARISERVATICF] PRIMARY KEY CLUSTERED ([ESERCIZIO] ASC, [CODCONTO] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [CHK_ANAGRAFICARISERVATICF_SPLITPAYMENT] CHECK ([SPLITPAYMENT]=(1) OR [SPLITPAYMENT]=(0)),
    CONSTRAINT [CKC_FATTFINEMESE_ANAGRAFI] CHECK ([FATTFINEMESE] = 0 or [FATTFINEMESE] = 1),
    CONSTRAINT [CKC_INOLTROTRASP_ANAGRAFI] CHECK ([INOLTROTRASP] = 0 or [INOLTROTRASP] = 1),
    CONSTRAINT [CKC_RAGGSCADENZE_ANAGRAFI] CHECK ([RAGGSCADENZE] = 0 or [RAGGSCADENZE] = 1),
    CONSTRAINT [CKC_RIVIVAOMAGGI_ANAGRAFI] CHECK ([RIVIVAOMAGGI] = 0 or [RIVIVAOMAGGI] = 1),
    CONSTRAINT [CKC_SPESEDOCUM_ANAGRAFI] CHECK ([SPESEDOCUM] = 0 or [SPESEDOCUM] = 1),
    CONSTRAINT [CKC_SPESEEFFETTO_ANAGRAFI] CHECK ([SPESEEFFETTO] = 0 or [SPESEEFFETTO] = 1),
    CONSTRAINT [CKC_SPESEIMBALLO_ANAGRAFI] CHECK ([SPESEIMBALLO] = 0 or [SPESEIMBALLO] = 1),
    CONSTRAINT [CKC_SPESETRASPORTO_ANAGRAFI] CHECK ([SPESETRASPORTO] = 0 or [SPESETRASPORTO] = 1),
    CONSTRAINT [CKC_STATOALTRO_ANAGRAFI] CHECK ([STATOALTRO] = 2 or [STATOALTRO] = 1 or [STATOALTRO] = 0),
    CONSTRAINT [CKC_STATOBOLLE_ANAGRAFI] CHECK ([STATOBOLLE] = 2 or [STATOBOLLE] = 1 or [STATOBOLLE] = 0),
    CONSTRAINT [CKC_STATOCONTABILITA_ANAGRAFI] CHECK ([STATOCONTABILITA] = 2 or [STATOCONTABILITA] = 1 or [STATOCONTABILITA] = 0),
    CONSTRAINT [CKC_STATOFATTURE_ANAGRAFI] CHECK ([STATOFATTURE] = 2 or [STATOFATTURE] = 1 or [STATOFATTURE] = 0),
    CONSTRAINT [CKC_STATOMAGAZZINO_ANAGRAFI] CHECK ([STATOMAGAZZINO] = 2 or [STATOMAGAZZINO] = 1 or [STATOMAGAZZINO] = 0),
    CONSTRAINT [CKC_STATONOTEACCREDIT_ANAGRAFI] CHECK ([STATONOTEACCREDITO] = 2 or [STATONOTEACCREDITO] = 1 or [STATONOTEACCREDITO] = 0),
    CONSTRAINT [CKC_STATOORDINI_ANAGRAFI] CHECK ([STATOORDINI] = 2 or [STATOORDINI] = 1 or [STATOORDINI] = 0),
    CONSTRAINT [CKC_USAPRZPRVPART_ANAGRAFI] CHECK ([USAPRZPRVPART] = 0 or [USAPRZPRVPART] = 1),
    CONSTRAINT [FK_ANAGRAFICARISERVATICF_CODCONTO] FOREIGN KEY ([CODCONTO]) REFERENCES [dbo].[ANAGRAFICACF] ([CODCONTO]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [CODCONTOFOR]
    ON [dbo].[ANAGRAFICARISERVATICF]([CODCONTO] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [CODSETTORE]
    ON [dbo].[ANAGRAFICARISERVATICF]([CODSETTORE] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [CODAGENTE1]
    ON [dbo].[ANAGRAFICARISERVATICF]([CODAGENTE1] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [CODAGENTE2]
    ON [dbo].[ANAGRAFICARISERVATICF]([CODAGENTE2] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [CODAGENTE3]
    ON [dbo].[ANAGRAFICARISERVATICF]([CODAGENTE3] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [CODBANCA]
    ON [dbo].[ANAGRAFICARISERVATICF]([CODBANCA] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [CODCAMBIO]
    ON [dbo].[ANAGRAFICARISERVATICF]([CODCAMBIO] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [CODCATEGORIA]
    ON [dbo].[ANAGRAFICARISERVATICF]([CODCATEGORIA] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [CODCONTOFATT]
    ON [dbo].[ANAGRAFICARISERVATICF]([CODCONTOFATT] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [BANCAINC]
    ON [dbo].[ANAGRAFICARISERVATICF]([BANCAANAGR] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [CODDEPOSITOCF]
    ON [dbo].[ANAGRAFICARISERVATICF]([CODDEPOSITO] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [CODPAGAMENTO]
    ON [dbo].[ANAGRAFICARISERVATICF]([CODPAG] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [CODZONA]
    ON [dbo].[ANAGRAFICARISERVATICF]([CODZONA] ASC) WITH (FILLFACTOR = 90);


GO

/*  UPDATE TRIGGER "ALD_TU_ANAGRAFICARISERVATICF_CodPagamento" FOR TABLE "ANAGRAFICARISERVATICF"  */
CREATE TRIGGER [dbo].[ALD_TU_ANAGRAFICARISERVATICF_CodPagamento] ON [dbo].[ANAGRAFICARISERVATICF] FOR UPDATE AS
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

      
      /*  Accoda record per variazioni su codice pagamento */
      IF UPDATE(CODPAG)
      BEGIN
		insert into ALD_MFAnagraficaCFRiservatiPagamento (CODCONTO, ESERCIZIO, DescrAzioneVariazione, CODPAG, UTENTEMODIFICA, DATAMODIFICA)
		select CODCONTO, ESERCIZIO, 'Variazione pagamento anagrafico', CODPAG, user, GETDATE()
		FROM   INSERTED T1 
      END
      

      RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

/****** Object:  Trigger [dbo].[ALD_TI_ANAGRAFICARISERVATICF]    Script Date: 06/21/2012 16:08:23 ******/
SET ANSI_NULLS ON

GO

/*  INSERT TRIGGER "ALD_TI_ANAGRAFICARISERVATICF" FOR TABLE "ANAGRAFICARISERVATICF"  */
CREATE TRIGGER [dbo].[ALD_TI_ANAGRAFICARISERVATICF] ON [dbo].[ANAGRAFICARISERVATICF] FOR INSERT AS
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

    
    IF UPDATE(CODCONTO)
    /*  Accoda record per inserimento su anagraficariservaticf */
      BEGIN
             insert into ALD_MFAnagraficaCFRiservatiPagamento (CODCONTO, ESERCIZIO, DescrAzioneVariazione, CODPAG, UTENTEMODIFICA, DATAMODIFICA, FlagInserimento)
             select CODCONTO, ESERCIZIO, 'Inserimento pagamento anagrafico', CODPAG, user, GETDATE(), 1
             FROM   INSERTED T1 
      END
    
         -- SARA 19/06/18
         -- se il mastro ha è di tipo flgSplitPay =1 allora attivo lo SPLITPAYMENT
         -- altrimenti lo tolgo
         -- SARA 28/08/18 : aggiunto anche il cambio CodIVA 
      BEGIN
             IF (SELECT flgSplitPay
             FROM   TABMASTRI T1, INSERTED T2, ANAGRAFICACF T3
             WHERE  t2.CodConto = T3.CodConto and T1.CODICE = T3.CODMASTRO ) = 1
                           BEGIN
                              UPDATE ANAGRAFICARISERVATICF SET SPLITPAYMENT = 1, CODIVA=500  from INSERTED inner join ANAGRAFICARISERVATICF on  INSERTED.CODCONTO = ANAGRAFICARISERVATICF.[CODCONTO] where INSERTED.SPLITPAYMENT = 0
                           END 
                    ELSE 
                           BEGIN
                              UPDATE ANAGRAFICARISERVATICF SET SPLITPAYMENT = 0, CODIVA=0  from INSERTED inner join ANAGRAFICARISERVATICF on  INSERTED.CODCONTO = ANAGRAFICARISERVATICF.[CODCONTO] where INSERTED.SPLITPAYMENT = 1 
                           END
          END
      -- FINE SARA 19/06/18

    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO



CREATE TRIGGER [dbo].[ALD_TU_ANAGRAFICARISERVATICF_SplitPayment] ON [dbo].[ANAGRAFICARISERVATICF] WITH EXECUTE AS OWNER FOR UPDATE AS
BEGIN
   DECLARE
      @NUMROWS  INT,
	  @mailA  VARCHAR(255),
	  @body  VARCHAR(255)
	 -- @PrintMessage nvarchar(50)

      SELECT  @NUMROWS = @@ROWCOUNT
      IF @NUMROWS = 0
         RETURN

      SET @mailA = ( SELECT top 1 SupportoMailClienti from ALD_TABDITTADATIAGGIUNTIVI)
      -- inizio 05/07/18 Sara: faccio un controllo se al cambio di mastro esistono dei documenti di tipo O,A,B aperti e mando messaggio
      IF UPDATE(SPLITPAYMENT)
      BEGIN
			IF (SELECT COUNT(*)       
							 FROM   
										 ( select t.CODCLIFOR from PARAMETRIDOC P
										 inner join testedocumenti T on  P.codice =T.TIPODOC 
										 WHERE tipo in ('A','O','B') and CliFor='c'	 and T.DOCCHIUSO = 0
										 group by t.CODCLIFOR) AS T1, INSERTED T2
										 WHERE  T1.CODCLIFOR = T2.CODCONTO) = @NUMROWS
								BEGIN
								 SELECT @body = concat ('Per il soggetto ' ,  TI.CODCONTO ,', l',char(39),' utente ', UPPER(TA.UTENTEMODIFICA), ' ha cambiato il mastro, va modificato anche il flag Split Payment nei documenti aperti. ')  from INSERTED TI
											INNER JOIN anagraficacf TA on TA.CODCONTO = TI.CODCONTO
									EXEC msdb.dbo.sp_send_dbmail
									@recipients = @mailA,
									@blind_copy_recipients = 'sara.dare@aldebra.com',
									@profile_name = 'DatabaseMail',
									@subject = 'Split Payment : modifica flag sui documenti ', 
									@body = @body;
	
								END
      END
      RETURN


END


SET ANSI_NULLS ON


GO
GRANT DELETE
    ON OBJECT::[dbo].[ANAGRAFICARISERVATICF] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ANAGRAFICARISERVATICF] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ANAGRAFICARISERVATICF] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ANAGRAFICARISERVATICF] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ANAGRAFICARISERVATICF] TO [Metodo98]
    AS [dbo];

