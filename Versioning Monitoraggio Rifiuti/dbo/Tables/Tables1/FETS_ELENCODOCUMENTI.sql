CREATE TABLE [dbo].[FETS_ELENCODOCUMENTI] (
    [Progressivo]     VARCHAR (50)   NOT NULL,
    [HubFile]         VARCHAR (50)   NOT NULL,
    [NomeFile]        VARCHAR (250)  NOT NULL,
    [CliFor]          VARCHAR (7)    NOT NULL,
    [CodiceB2b]       VARCHAR (10)   NOT NULL,
    [CodiceCarattB2b] VARCHAR (10)   NOT NULL,
    [CodiceFepa]      VARCHAR (10)   NOT NULL,
    [Data]            DATETIME       NOT NULL,
    [Stato]           INT            DEFAULT ((0)) NOT NULL,
    [ProgressivoDoc]  DECIMAL (10)   DEFAULT ((0)) NOT NULL,
    [Tipo]            SMALLINT       DEFAULT ((0)) NOT NULL,
    [TransmitterId]   VARCHAR (20)   NOT NULL,
    [STATOELAB]       SMALLINT       DEFAULT ((0)) NULL,
    [SDI]             SMALLINT       DEFAULT ((0)) NULL,
    [CONSSOSTSENDED]  SMALLINT       DEFAULT ((0)) NULL,
    [HASHCODE]        VARCHAR (1000) DEFAULT ('') NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FETS_ELENCODOCUMENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FETS_ELENCODOCUMENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FETS_ELENCODOCUMENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FETS_ELENCODOCUMENTI] TO [Metodo98]
    AS [dbo];

