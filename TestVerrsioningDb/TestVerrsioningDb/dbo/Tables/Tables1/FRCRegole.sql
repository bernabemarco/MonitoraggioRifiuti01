CREATE TABLE [dbo].[FRCRegole] (
    [Progressivo]           DECIMAL (10)   NOT NULL,
    [Ambiente]              VARCHAR (3)    DEFAULT ('') NULL,
    [Anno]                  DECIMAL (5)    DEFAULT ((0)) NULL,
    [CodConto]              VARCHAR (20)   DEFAULT ('') NULL,
    [CodDestinazione]       VARCHAR (10)   NOT NULL,
    [Note]                  VARCHAR (2000) DEFAULT ('') NULL,
    [Formula]               VARCHAR (500)  DEFAULT ('') NULL,
    [UtenteModifica]        VARCHAR (25)   NOT NULL,
    [DataModifica]          DATETIME       NOT NULL,
    [CodDestinazioneRegola] VARCHAR (10)   DEFAULT ('') NULL,
    [AnnoFine]              DECIMAL (5)    DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRCRegole] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRCRegole] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCRegole] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCRegole] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRCRegole] TO [Metodo98]
    AS [dbo];

