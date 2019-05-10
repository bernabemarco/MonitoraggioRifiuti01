CREATE TABLE [dbo].[FRCCalcoloCoefficienti] (
    [Ambiente]       VARCHAR (3)     NOT NULL,
    [Anno]           INT             NOT NULL,
    [Mese]           INT             NOT NULL,
    [Qualifica]      INT             NOT NULL,
    [A000]           DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [B000CA]         DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [ASS]            DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [B000]           DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [OreSoggContr]   DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [OreOneriContr]  DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [OreTFR]         DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [C000]           DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [K010]           DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [K020]           DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [K030]           DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [K000]           DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [UtenteModifica] VARCHAR (25)    NOT NULL,
    [DataModifica]   DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([Ambiente] ASC, [Anno] ASC, [Mese] ASC, [Qualifica] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRCCalcoloCoefficienti] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRCCalcoloCoefficienti] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCCalcoloCoefficienti] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCCalcoloCoefficienti] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRCCalcoloCoefficienti] TO [Metodo98]
    AS [dbo];

