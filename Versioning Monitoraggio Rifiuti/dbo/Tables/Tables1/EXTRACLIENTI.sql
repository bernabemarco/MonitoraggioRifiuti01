CREATE TABLE [dbo].[EXTRACLIENTI] (
    [CODCONTO]                    VARCHAR (7)   NOT NULL,
    [UTENTEMODIFICA]              VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]                DATETIME      NOT NULL,
    [CodiceDeroga]                CHAR (2)      COLLATE Latin1_General_CI_AS NULL,
    [CodiceVoce]                  VARCHAR (6)   COLLATE Latin1_General_CI_AS NULL,
    [GiorniRitardo]               NUMERIC (3)   NULL,
    [Condominio]                  SMALLINT      DEFAULT (0) NULL,
    [CodSettoreGiriVisite]        VARCHAR (7)   NULL,
    [CodClienteNew]               VARCHAR (7)   DEFAULT ('') NULL,
    [CtrlPivaCF]                  SMALLINT      DEFAULT (0) NULL,
    [CtrlDDV_Gemma]               SMALLINT      DEFAULT (0) NULL,
    [IdTrust]                     SMALLINT      CONSTRAINT [DF__ExtraClie__IdTru__3496FD03] DEFAULT (1) NULL,
    [codIstatComune]              VARCHAR (6)   NULL,
    [codRelazione]                VARCHAR (11)  NULL,
    [CentroCompentenza]           VARCHAR (10)  NULL,
    [IdAmministratore]            SMALLINT      DEFAULT ((0)) NULL,
    [CodSap]                      VARCHAR (10)  NULL,
    [IdSocietaPartnerMNC]         VARCHAR (6)   NULL,
    [IdSocietaPartnerGR]          VARCHAR (4)   NULL,
    [ClassCID]                    VARCHAR (10)  NULL,
    [ExportSap]                   INT           DEFAULT ((0)) NULL,
    [DtCreazione]                 DATETIME      DEFAULT (getdate()) NULL,
    [CodSapPotenziale]            VARCHAR (10)  NULL,
    [DtAttivazioneIPA]            DATETIME      NULL,
    [CodCRM]                      VARCHAR (100) NULL,
    [RefSegrCons]                 SMALLINT      NULL,
    [RefSegrMedicina]             SMALLINT      NULL,
    [idTipologiaCli]              SMALLINT      DEFAULT ((0)) NULL,
    [AttivazioneInoltroFattEmail] SMALLINT      DEFAULT ((0)) NULL,
    [IdTipoCli]                   SMALLINT      DEFAULT ((0)) NULL,
    [CodClienteOld]               VARCHAR (7)   NULL,
    [CodiceComplesso]             VARCHAR (30)  NULL,
    [RSPPdiRif]                   SMALLINT      DEFAULT ((0)) NULL,
    [MedicodiRif]                 SMALLINT      DEFAULT ((0)) NULL,
    [RefSegrForm]                 SMALLINT      DEFAULT ((0)) NULL,
    [IdLivelloRiscCC]             DECIMAL (5)   DEFAULT ((0)) NULL,
    [MAILPEC]                     VARCHAR (100) DEFAULT ('') NULL,
    CONSTRAINT [PK_EXTRACLIENTI] PRIMARY KEY CLUSTERED ([CODCONTO] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_EXTRACLIENTI_CODCONTO] FOREIGN KEY ([CODCONTO]) REFERENCES [dbo].[ANAGRAFICACF] ([CODCONTO]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO


/*  INSERT TRIGGER "ALD_TU_ANAGRCFMASTRO" FOR TABLE "ANAGRAFICACF"  */
CREATE TRIGGER [dbo].[ALD_TU_EXTRACLIENTI_B2B] ON [dbo].[EXTRACLIENTI] FOR	UPDATE AS

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
      
    IF UPDATE(MAILPEC)
    BEGIN
	DELETE FROM  [dbo].[ALD_B2B_CLIENTI]  FROM [dbo].[ALD_B2B_CLIENTI] inner join INSERTED on ALD_B2B_CLIENTI.CODCONTO = INSERTED.CODCONTO and ALD_B2B_CLIENTI.[DESTINAZIONEDIVERSA]=0

      INSERT INTO [dbo].[ALD_B2B_CLIENTI]
           ([CODCONTO]
           ,[DESTINAZIONEDIVERSA]
           ,[TipoInstradamento]
           ,[PROGRESSIVOUFFICIO]
           ,[MAIL]
           ,[Utentemodifica]
           ,[Datamodifica], 
		   ID)
		   SELECT  INSERTED.CODCONTO, 0, 3, 
		   (CASE WHEN isnull(CODDESTINATARIOPA,'')='' THEN '0000000' ELSE CODDESTINATARIOPA END) as CODDESTINATARIOPA ,Isnull(INSERTED.MAILPEC,'') as Mail, INSERTED.UTENTEMODIFICA, INSERTED.DATAMODIFICA,
		   (select max(id) +1 from ALD_B2B_CLIENTI) as ID
		   FROM INSERTED 
		   INNER join ANAGRAFICACF CC on INSERTED.CODCONTO = CC.CODCONTO
		     WHERE TIPOCONTO ='c'
    END

      RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END



GO


/*  INSERT TRIGGER "ALD_TI_ANAGRCFMASTRO" FOR TABLE "ANAGRAFICACF"  */
CREATE TRIGGER [dbo].[ALD_TI_EXTRACLIENTI_B2B] ON [dbo].[EXTRACLIENTI] FOR INSERT AS
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
    
    /* Inserisco riga su ALD_B2B_CLIENTI */
    IF UPDATE(MAILPEC)
    BEGIN
	DELETE FROM  [dbo].[ALD_B2B_CLIENTI]  FROM [dbo].[ALD_B2B_CLIENTI] inner join INSERTED on ALD_B2B_CLIENTI.CODCONTO = INSERTED.CODCONTO and ALD_B2B_CLIENTI.[DESTINAZIONEDIVERSA]=0
      INSERT INTO [dbo].[ALD_B2B_CLIENTI]
           ([CODCONTO]
           ,[DESTINAZIONEDIVERSA]
           ,[TipoInstradamento]
           ,[PROGRESSIVOUFFICIO]
           ,[MAIL]
           ,[Utentemodifica]
           ,[Datamodifica], 
		   ID)
		   SELECT  INSERTED.CODCONTO, 0, 3, 
		   (CASE WHEN isnull(CODDESTINATARIOPA,'')='' THEN '0000000' ELSE CODDESTINATARIOPA END) as CODDESTINATARIOPA,Isnull(INSERTED.MAILPEC,'') as Mail, INSERTED.UTENTEMODIFICA, INSERTED.DATAMODIFICA,
		   (select max(id) +1 from ALD_B2B_CLIENTI) as ID
		   FROM INSERTED 
		   INNER join ANAGRAFICACF CC on INSERTED.CODCONTO = CC.CODCONTO
		     WHERE TIPOCONTO ='c'
    END
    RETURN
/*  ERRORS HANDLING  */
ERROR:
    RAISERROR(@ERRMSG,1, 1)
    ROLLBACK  TRANSACTION
END


GO
GRANT DELETE
    ON OBJECT::[dbo].[EXTRACLIENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[EXTRACLIENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[EXTRACLIENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[EXTRACLIENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[EXTRACLIENTI] TO [Metodo98]
    AS [dbo];

