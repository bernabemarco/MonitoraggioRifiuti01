CREATE TABLE [dbo].[ALD_TabCausaliCommessaConsMateriali] (
    [IdRiga]         DECIMAL (5)   NOT NULL,
    [CODCausale]     DECIMAL (5)   NOT NULL,
    [UtenteModifica] VARCHAR (25)  NOT NULL,
    [DataModifica]   SMALLDATETIME NOT NULL,
    CONSTRAINT [PK_ALD_TabCausaliCommessaConsMateriali] PRIMARY KEY CLUSTERED ([IdRiga] ASC, [CODCausale] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_TabCausaliCommessaConsMateriali] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_TabCausaliCommessaConsMateriali] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_TabCausaliCommessaConsMateriali] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_TabCausaliCommessaConsMateriali] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_TabCausaliCommessaConsMateriali] TO [Metodo98]
    AS [dbo];

