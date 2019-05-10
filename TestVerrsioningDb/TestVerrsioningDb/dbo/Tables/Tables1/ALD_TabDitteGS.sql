CREATE TABLE [dbo].[ALD_TabDitteGS] (
    [IdSocietaGR]          VARCHAR (4)   NOT NULL,
    [DescrizioneSocietaGR] VARCHAR (80)  NULL,
    [UtenteModifica]       VARCHAR (25)  NOT NULL,
    [DataModifica]         SMALLDATETIME NOT NULL,
    CONSTRAINT [PK_ALD_TabDitteGS] PRIMARY KEY CLUSTERED ([IdSocietaGR] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_TabDitteGS] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_TabDitteGS] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_TabDitteGS] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_TabDitteGS] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_TabDitteGS] TO [Metodo98]
    AS [dbo];

