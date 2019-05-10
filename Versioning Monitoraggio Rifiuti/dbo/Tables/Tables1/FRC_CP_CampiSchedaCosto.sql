CREATE TABLE [dbo].[FRC_CP_CampiSchedaCosto] (
    [Codice]              INT           NOT NULL,
    [Nome]                VARCHAR (100) DEFAULT ('') NULL,
    [Descrizione]         VARCHAR (100) DEFAULT ('') NULL,
    [VoceFullCost]        INT           DEFAULT ((0)) NULL,
    [PosizioneFullCost]   INT           DEFAULT ((0)) NULL,
    [VoceDirectCost]      INT           DEFAULT ((0)) NULL,
    [PosizioneDirectCost] INT           DEFAULT ((0)) NULL,
    [Ricavo]              SMALLINT      DEFAULT ((0)) NULL,
    [UtenteModifica]      VARCHAR (25)  NOT NULL,
    [DataModifica]        DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([Codice] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRC_CP_CampiSchedaCosto] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRC_CP_CampiSchedaCosto] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRC_CP_CampiSchedaCosto] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRC_CP_CampiSchedaCosto] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRC_CP_CampiSchedaCosto] TO [Metodo98]
    AS [dbo];

