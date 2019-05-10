CREATE TABLE [dbo].[Tp_DocumentiPrelevatiRighe] (
    [IdTestaP]       DECIMAL (10) NOT NULL,
    [IdRigaP]        INT          NOT NULL,
    [IdTestaO]       DECIMAL (10) NOT NULL,
    [IdRigaO]        INT          NOT NULL,
    [UtenteModifica] VARCHAR (25) NOT NULL,
    [DataModifica]   DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([IdTestaP] ASC, [IdRigaP] ASC, [IdTestaO] ASC, [IdRigaO] ASC),
    CONSTRAINT [FK_Tp_DocumentiPrelevatiRighe_IdTestaPIdRigaP] FOREIGN KEY ([IdTestaP], [IdRigaP]) REFERENCES [dbo].[Tp_DocumentiPrelevati] ([Progressivo], [IdRiga]) ON DELETE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[Tp_DocumentiPrelevatiRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Tp_DocumentiPrelevatiRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[Tp_DocumentiPrelevatiRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Tp_DocumentiPrelevatiRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Tp_DocumentiPrelevatiRighe] TO [Metodo98]
    AS [dbo];

