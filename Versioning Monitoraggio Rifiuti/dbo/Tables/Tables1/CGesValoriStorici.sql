CREATE TABLE [dbo].[CGesValoriStorici] (
    [Ambiente]           VARCHAR (3)     NOT NULL,
    [CodDestinazione]    VARCHAR (10)    NOT NULL,
    [CodConto]           VARCHAR (20)    NOT NULL,
    [CodDestinazioneRev] VARCHAR (10)    NOT NULL,
    [Tipo]               SMALLINT        NOT NULL,
    [Anno]               DECIMAL (5)     NOT NULL,
    [Mese]               INT             NOT NULL,
    [ValoreVariabile]    DECIMAL (19, 6) DEFAULT (0) NULL,
    [ValoreFisso]        DECIMAL (19, 6) DEFAULT (0) NULL,
    [Segno]              SMALLINT        DEFAULT (0) NULL,
    [Tipologia]          SMALLINT        DEFAULT (0) NULL,
    [UtenteModifica]     VARCHAR (25)    NOT NULL,
    [DataModifica]       DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([Ambiente] ASC, [CodDestinazione] ASC, [CodConto] ASC, [CodDestinazioneRev] ASC, [Tipo] ASC, [Anno] ASC, [Mese] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [CGesValoriStorici_TDC]
    ON [dbo].[CGesValoriStorici]([Tipo] ASC, [CodDestinazione] ASC, [CodConto] ASC) WITH (FILLFACTOR = 90);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesValoriStorici] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesValoriStorici] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesValoriStorici] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesValoriStorici] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesValoriStorici] TO [Metodo98]
    AS [dbo];

