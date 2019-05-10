CREATE TABLE [dbo].[FRCStampaDBMancanti] (
    [AMBIENTE]            VARCHAR (3)     NOT NULL,
    [ANNODOC]             INT             NOT NULL,
    [CODART]              VARCHAR (50)    NOT NULL,
    [GRUPPO]              DECIMAL (5)     NOT NULL,
    [CATEGORIA]           DECIMAL (5)     NOT NULL,
    [CODCATEGORIASTAT]    DECIMAL (5)     NOT NULL,
    [SERIE]               VARCHAR (20)    NOT NULL,
    [MODELLO]             VARCHAR (20)    NOT NULL,
    [QTAGEST]             DECIMAL (19, 6) NULL,
    [QTAPREZZO]           DECIMAL (19, 6) NULL,
    [DescrizioneArticolo] VARCHAR (500)   NULL,
    [PROVENIENZA]         INT             NULL,
    CONSTRAINT [KEY_FRCStampaDBMancanti] PRIMARY KEY CLUSTERED ([AMBIENTE] ASC, [ANNODOC] ASC, [CODART] ASC, [GRUPPO] ASC, [CATEGORIA] ASC, [CODCATEGORIASTAT] ASC, [SERIE] ASC, [MODELLO] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRCStampaDBMancanti] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRCStampaDBMancanti] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCStampaDBMancanti] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCStampaDBMancanti] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRCStampaDBMancanti] TO [Metodo98]
    AS [dbo];

