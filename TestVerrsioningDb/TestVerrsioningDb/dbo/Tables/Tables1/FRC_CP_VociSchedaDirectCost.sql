CREATE TABLE [dbo].[FRC_CP_VociSchedaDirectCost] (
    [Codice]          INT           NOT NULL,
    [Nome]            VARCHAR (100) DEFAULT ('') NULL,
    [Descrizione]     VARCHAR (100) DEFAULT ('') NULL,
    [UtenteModifica]  VARCHAR (25)  NOT NULL,
    [DataModifica]    DATETIME      NOT NULL,
    [RiferimentoPerc] SMALLINT      DEFAULT ((0)) NULL,
    [Ordine]          INT           DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([Codice] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRC_CP_VociSchedaDirectCost] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRC_CP_VociSchedaDirectCost] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRC_CP_VociSchedaDirectCost] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRC_CP_VociSchedaDirectCost] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRC_CP_VociSchedaDirectCost] TO [Metodo98]
    AS [dbo];

