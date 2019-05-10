CREATE TABLE [dbo].[tmpPackingDesc] (
    [IdSessione]     DECIMAL (5)  NOT NULL,
    [RifProgressivo] DECIMAL (5)  NULL,
    [NrRiga]         INT          NULL,
    [IdRif]          DECIMAL (18) NOT NULL,
    [Descrizione]    VARCHAR (50) NULL,
    [Raggruppamento] VARCHAR (50) NULL,
    [UtenteModifica] VARCHAR (25) NOT NULL,
    [DataModifica]   DATETIME     NOT NULL,
    [POSIZIONE]      INT          NULL
);


GO
CREATE CLUSTERED INDEX [IX_tmpPackingDesc]
    ON [dbo].[tmpPackingDesc]([IdSessione] ASC, [IdRif] ASC) WITH (FILLFACTOR = 90);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tmpPackingDesc] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tmpPackingDesc] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tmpPackingDesc] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tmpPackingDesc] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tmpPackingDesc] TO [Metodo98]
    AS [dbo];

