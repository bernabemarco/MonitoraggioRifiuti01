CREATE TABLE [dbo].[FETS_ELENCODOCSCAR] (
    [GuidRow]       VARCHAR (50)   NOT NULL,
    [Sessione]      DECIMAL (10)   NOT NULL,
    [CliFor]        VARCHAR (7)    NOT NULL,
    [Stato]         VARCHAR (20)   DEFAULT ('') NOT NULL,
    [PathFile]      VARCHAR (255)  NOT NULL,
    [TransmitterId] VARCHAR (20)   NOT NULL,
    [HubFile]       VARCHAR (50)   NOT NULL,
    [Checked]       SMALLINT       DEFAULT ((0)) NOT NULL,
    [DATADOC]       DATETIME       NULL,
    [NUMERODOC]     VARCHAR (200)  NULL,
    [DATARICEZIONE] DATETIME       NULL,
    [DATIRICEVUTI]  VARCHAR (2500) NULL,
    PRIMARY KEY CLUSTERED ([GuidRow] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FETS_ELENCODOCSCAR] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FETS_ELENCODOCSCAR] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FETS_ELENCODOCSCAR] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FETS_ELENCODOCSCAR] TO [Metodo98]
    AS [dbo];

