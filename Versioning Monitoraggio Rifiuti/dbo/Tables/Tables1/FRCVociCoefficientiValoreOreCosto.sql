CREATE TABLE [dbo].[FRCVociCoefficientiValoreOreCosto] (
    [Progressivo]      DECIMAL (10)    NOT NULL,
    [RifProgressivo]   DECIMAL (10)    NOT NULL,
    [DataValidita]     DATETIME        NULL,
    [Qualifica]        INT             DEFAULT ((0)) NULL,
    [VoceCoefficiente] VARCHAR (20)    DEFAULT ('') NULL,
    [Percentuale]      DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [Ore]              DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [Note]             VARCHAR (100)   DEFAULT ('') NULL,
    [UtenteModifica]   VARCHAR (25)    NOT NULL,
    [DataModifica]     DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRCVociCoefficientiValoreOreCosto] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRCVociCoefficientiValoreOreCosto] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCVociCoefficientiValoreOreCosto] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCVociCoefficientiValoreOreCosto] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRCVociCoefficientiValoreOreCosto] TO [Metodo98]
    AS [dbo];

