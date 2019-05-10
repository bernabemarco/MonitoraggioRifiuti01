CREATE TABLE [dbo].[FRCUnitaMisuraCDC] (
    [Ambiente]       VARCHAR (3)  NOT NULL,
    [Anno]           INT          NOT NULL,
    [CDCProd]        VARCHAR (10) NOT NULL,
    [UnitaMisura]    VARCHAR (5)  DEFAULT ('') NULL,
    [UtenteModifica] VARCHAR (25) NOT NULL,
    [DataModifica]   DATETIME     NOT NULL,
    [UnitaMisura2]   VARCHAR (5)  DEFAULT ('') NULL,
    PRIMARY KEY CLUSTERED ([Ambiente] ASC, [Anno] ASC, [CDCProd] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRCUnitaMisuraCDC] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRCUnitaMisuraCDC] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCUnitaMisuraCDC] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCUnitaMisuraCDC] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRCUnitaMisuraCDC] TO [Metodo98]
    AS [dbo];

