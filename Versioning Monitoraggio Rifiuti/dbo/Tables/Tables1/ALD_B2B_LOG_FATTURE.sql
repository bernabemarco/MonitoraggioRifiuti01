CREATE TABLE [dbo].[ALD_B2B_LOG_FATTURE] (
    [IDElaborazione]     INT            NOT NULL,
    [Progressivo]        DECIMAL (10)   NOT NULL,
    [Utente]             VARCHAR (25)   NOT NULL,
    [DataElaborazione]   DATETIME       NOT NULL,
    [DataGenerazioneXML] DATETIME       CONSTRAINT [DF_ALD_B2B_LOG_FATTURE_DataGenerazioneXML] DEFAULT ('01/01/1900') NULL,
    [Errore]             SMALLINT       NULL,
    [DescErrore]         VARCHAR (500)  NULL,
    [OutFileName]        VARCHAR (5000) NULL,
    [OutFileNameInvio]   VARCHAR (5000) NULL,
    [OutFileHtml]        VARCHAR (5000) NULL,
    [OutFileLog]         VARCHAR (5000) NULL,
    [ProgressivoInvio]   INT            NULL,
    [IdTrasmittente]     VARCHAR (100)  NULL,
    [OutPathPDF]         VARCHAR (5000) NULL,
    CONSTRAINT [PK_ALD_B2B_LOG_FATTURE] PRIMARY KEY CLUSTERED ([IDElaborazione] ASC, [Progressivo] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_B2B_LOG_FATTURE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_B2B_LOG_FATTURE] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_B2B_LOG_FATTURE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_B2B_LOG_FATTURE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_B2B_LOG_FATTURE] TO [Metodo98]
    AS [dbo];

