﻿CREATE TABLE [dbo].[ContrattiCatStSCTA_TOP] (
    [RIFPROGRESSIVO] DECIMAL (5)  NOT NULL,
    [RIFRIGA]        DECIMAL (5)  NOT NULL,
    [NRRIGA]         DECIMAL (5)  NOT NULL,
    [Posizione]      INT          NOT NULL,
    [FlagRiga]       SMALLINT     NULL,
    [Codice]         DECIMAL (5)  NULL,
    [UtenteModifica] VARCHAR (25) NULL,
    [DataModifica]   DATETIME     NULL,
    PRIMARY KEY CLUSTERED ([RIFPROGRESSIVO] ASC, [RIFRIGA] ASC, [NRRIGA] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ContrattiCatStSCTA_TOP] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ContrattiCatStSCTA_TOP] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ContrattiCatStSCTA_TOP] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ContrattiCatStSCTA_TOP] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ContrattiCatStSCTA_TOP] TO [Metodo98]
    AS [dbo];

