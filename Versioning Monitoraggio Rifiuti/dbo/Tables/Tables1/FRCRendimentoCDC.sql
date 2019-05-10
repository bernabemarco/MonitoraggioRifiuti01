CREATE TABLE [dbo].[FRCRendimentoCDC] (
    [Ambiente]        VARCHAR (3)     NOT NULL,
    [Anno]            INT             NOT NULL,
    [CDCProd]         VARCHAR (10)    NOT NULL,
    [RendimentoProd]  DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [CDCMop]          VARCHAR (10)    DEFAULT ('') NULL,
    [RendimentoMop]   DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [CDCSetup]        VARCHAR (10)    DEFAULT ('') NULL,
    [RendimentoSetup] DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [UtenteModifica]  VARCHAR (25)    NOT NULL,
    [DataModifica]    DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([Ambiente] ASC, [Anno] ASC, [CDCProd] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRCRendimentoCDC] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRCRendimentoCDC] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCRendimentoCDC] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCRendimentoCDC] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRCRendimentoCDC] TO [Metodo98]
    AS [dbo];

