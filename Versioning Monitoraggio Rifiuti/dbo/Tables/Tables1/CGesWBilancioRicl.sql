CREATE TABLE [dbo].[CGesWBilancioRicl] (
    [NrTerminale]      DECIMAL (5)     NOT NULL,
    [Voce]             VARCHAR (10)    NOT NULL,
    [CodDestinazione]  VARCHAR (10)    NOT NULL,
    [CodConto]         VARCHAR (20)    NOT NULL,
    [Anno]             DECIMAL (5)     DEFAULT (0) NOT NULL,
    [Mese]             INT             DEFAULT (0) NOT NULL,
    [Tipologia]        SMALLINT        DEFAULT (0) NULL,
    [DescrizioneConto] VARCHAR (80)    DEFAULT ('') NULL,
    [ImportoVariabile] DECIMAL (19, 6) DEFAULT (0) NULL,
    [ImportoFisso]     DECIMAL (19, 6) DEFAULT (0) NULL,
    PRIMARY KEY CLUSTERED ([NrTerminale] ASC, [Voce] ASC, [CodDestinazione] ASC, [CodConto] ASC, [Anno] ASC, [Mese] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesWBilancioRicl] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesWBilancioRicl] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesWBilancioRicl] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesWBilancioRicl] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesWBilancioRicl] TO [Metodo98]
    AS [dbo];

