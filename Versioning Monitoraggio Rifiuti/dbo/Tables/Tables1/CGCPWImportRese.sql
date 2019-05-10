CREATE TABLE [dbo].[CGCPWImportRese] (
    [Progressivo]       DECIMAL (10)    NOT NULL,
    [Destinazione]      VARCHAR (10)    DEFAULT ('') NULL,
    [Anno]              DECIMAL (5)     DEFAULT (0) NULL,
    [Mese]              INT             DEFAULT (0) NULL,
    [Resa]              DECIMAL (19, 6) DEFAULT (0) NULL,
    [Resa2]             DECIMAL (19, 6) DEFAULT (0) NULL,
    [Resa3]             DECIMAL (19, 6) DEFAULT (0) NULL,
    [Resa4]             DECIMAL (19, 6) DEFAULT (0) NULL,
    [Resa5]             DECIMAL (19, 6) DEFAULT (0) NULL,
    [DataRegistrazione] DATETIME        NULL,
    [FlagVal]           SMALLINT        DEFAULT (0) NULL,
    [DescrizioneErrore] VARCHAR (200)   DEFAULT ('') NULL,
    [UtenteModifica]    VARCHAR (25)    NOT NULL,
    [DataModifica]      DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGCPWImportRese] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGCPWImportRese] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGCPWImportRese] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGCPWImportRese] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGCPWImportRese] TO [Metodo98]
    AS [dbo];

