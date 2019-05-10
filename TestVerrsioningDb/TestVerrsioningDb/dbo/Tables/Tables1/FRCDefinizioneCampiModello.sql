CREATE TABLE [dbo].[FRCDefinizioneCampiModello] (
    [Riga]           INT           NOT NULL,
    [NomeCampo]      VARCHAR (80)  DEFAULT ('') NULL,
    [Usa]            SMALLINT      DEFAULT ((0)) NULL,
    [Note]           VARCHAR (100) DEFAULT ('') NULL,
    [UtenteModifica] VARCHAR (25)  NOT NULL,
    [DataModifica]   DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([Riga] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRCDefinizioneCampiModello] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRCDefinizioneCampiModello] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCDefinizioneCampiModello] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCDefinizioneCampiModello] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRCDefinizioneCampiModello] TO [Metodo98]
    AS [dbo];

