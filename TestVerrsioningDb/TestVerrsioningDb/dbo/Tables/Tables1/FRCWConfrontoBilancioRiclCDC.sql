CREATE TABLE [dbo].[FRCWConfrontoBilancioRiclCDC] (
    [NrTerminale]      DECIMAL (5)     NOT NULL,
    [Voce]             VARCHAR (10)    NOT NULL,
    [NumColonna]       SMALLINT        NOT NULL,
    [CodDestinazione]  VARCHAR (10)    NOT NULL,
    [CodConto]         VARCHAR (20)    NOT NULL,
    [Anno]             DECIMAL (5)     DEFAULT ((0)) NOT NULL,
    [Mese]             INT             DEFAULT ((0)) NOT NULL,
    [Tipologia]        SMALLINT        DEFAULT ((0)) NULL,
    [DescrizioneConto] VARCHAR (80)    DEFAULT ('') NULL,
    [ImportoVariabile] DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [ImportoFisso]     DECIMAL (19, 6) DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([NrTerminale] ASC, [Voce] ASC, [NumColonna] ASC, [CodDestinazione] ASC, [CodConto] ASC, [Anno] ASC, [Mese] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRCWConfrontoBilancioRiclCDC] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRCWConfrontoBilancioRiclCDC] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCWConfrontoBilancioRiclCDC] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCWConfrontoBilancioRiclCDC] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRCWConfrontoBilancioRiclCDC] TO [Metodo98]
    AS [dbo];

