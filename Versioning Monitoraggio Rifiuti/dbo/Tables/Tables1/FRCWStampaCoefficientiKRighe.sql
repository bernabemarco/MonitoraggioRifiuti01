CREATE TABLE [dbo].[FRCWStampaCoefficientiKRighe] (
    [NrTerminale]      DECIMAL (5)     NOT NULL,
    [Ambiente]         VARCHAR (3)     NOT NULL,
    [Anno]             INT             NOT NULL,
    [Qualifica]        INT             NOT NULL,
    [Riga]             INT             NOT NULL,
    [VoceCoefficiente] VARCHAR (20)    DEFAULT ('') NULL,
    [Percentuale]      DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [Valore]           DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [Note]             VARCHAR (100)   DEFAULT ('') NULL,
    [UtenteModifica]   VARCHAR (25)    NOT NULL,
    [DataModifica]     DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([NrTerminale] ASC, [Ambiente] ASC, [Anno] ASC, [Qualifica] ASC, [Riga] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRCWStampaCoefficientiKRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRCWStampaCoefficientiKRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCWStampaCoefficientiKRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCWStampaCoefficientiKRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRCWStampaCoefficientiKRighe] TO [Metodo98]
    AS [dbo];

