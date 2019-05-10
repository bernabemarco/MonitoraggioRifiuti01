CREATE TABLE [dbo].[FRCCentriCostoStrutturaRighe] (
    [Progressivo]    DECIMAL (10)  NOT NULL,
    [RifProgressivo] DECIMAL (10)  NOT NULL,
    [CDC]            VARCHAR (10)  DEFAULT ('') NULL,
    [Note]           VARCHAR (100) DEFAULT ('') NULL,
    [UtenteModifica] VARCHAR (25)  NOT NULL,
    [DataModifica]   DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRCCentriCostoStrutturaRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRCCentriCostoStrutturaRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCCentriCostoStrutturaRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCCentriCostoStrutturaRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRCCentriCostoStrutturaRighe] TO [Metodo98]
    AS [dbo];

