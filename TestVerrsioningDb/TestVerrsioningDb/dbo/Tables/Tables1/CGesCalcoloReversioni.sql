CREATE TABLE [dbo].[CGesCalcoloReversioni] (
    [NrTerminale]        DECIMAL (5)     NOT NULL,
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
    [FlagReversione]     INT             DEFAULT (0) NULL,
    [NumReversione]      DECIMAL (10)    DEFAULT (0) NULL,
    PRIMARY KEY CLUSTERED ([NrTerminale] ASC, [CodDestinazione] ASC, [CodConto] ASC, [CodDestinazioneRev] ASC, [Tipo] ASC, [Anno] ASC, [Mese] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesCalcoloReversioni] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesCalcoloReversioni] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesCalcoloReversioni] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesCalcoloReversioni] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesCalcoloReversioni] TO [Metodo98]
    AS [dbo];

