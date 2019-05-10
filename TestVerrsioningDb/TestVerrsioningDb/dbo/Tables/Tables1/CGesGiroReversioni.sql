CREATE TABLE [dbo].[CGesGiroReversioni] (
    [NrTerminale]       DECIMAL (5)     NOT NULL,
    [Anno]              DECIMAL (5)     NOT NULL,
    [Mese]              INT             NOT NULL,
    [Occorrenze]        DECIMAL (7)     NOT NULL,
    [CodDestinazione]   VARCHAR (10)    NOT NULL,
    [CodConto]          VARCHAR (20)    NOT NULL,
    [SorgenteVariabile] DECIMAL (19, 6) DEFAULT (0) NULL,
    [SorgenteFisso]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [CedutaVariabile]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [CedutaFisso]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [RicevutaVariabile] DECIMAL (19, 6) DEFAULT (0) NULL,
    [RicevutaFisso]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [Validita]          SMALLINT        DEFAULT (0) NULL,
    [Segno]             SMALLINT        DEFAULT (0) NULL,
    [FlagGiro]          SMALLINT        DEFAULT (0) NULL,
    PRIMARY KEY CLUSTERED ([NrTerminale] ASC, [Anno] ASC, [Mese] ASC, [Occorrenze] ASC, [CodDestinazione] ASC, [CodConto] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [CGesGiroReversioni_CodDes]
    ON [dbo].[CGesGiroReversioni]([NrTerminale] ASC, [Anno] ASC, [Mese] ASC, [CodDestinazione] ASC, [CodConto] ASC) WITH (FILLFACTOR = 90);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesGiroReversioni] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesGiroReversioni] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesGiroReversioni] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesGiroReversioni] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesGiroReversioni] TO [Metodo98]
    AS [dbo];

