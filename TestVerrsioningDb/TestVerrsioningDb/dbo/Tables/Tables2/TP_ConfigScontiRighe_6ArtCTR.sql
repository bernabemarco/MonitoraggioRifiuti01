CREATE TABLE [dbo].[TP_ConfigScontiRighe_6ArtCTR] (
    [RifProgressivo] DECIMAL (5)  NOT NULL,
    [IdTesta]        DECIMAL (5)  NOT NULL,
    [IdRiga]         DECIMAL (5)  NOT NULL,
    [Posizione]      INT          NOT NULL,
    [FlagRiga]       SMALLINT     NULL,
    [Codice]         VARCHAR (50) NULL,
    [FlagSconto]     SMALLINT     NULL,
    [ValoreSconto]   VARCHAR (15) NULL,
    [UtenteModifica] VARCHAR (25) NULL,
    [DataModifica]   DATETIME     NULL,
    PRIMARY KEY CLUSTERED ([RifProgressivo] ASC, [IdTesta] ASC, [IdRiga] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_ConfigScontiRighe_6ArtCTR] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_ConfigScontiRighe_6ArtCTR] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_ConfigScontiRighe_6ArtCTR] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_ConfigScontiRighe_6ArtCTR] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_ConfigScontiRighe_6ArtCTR] TO [Metodo98]
    AS [dbo];

