CREATE TABLE [dbo].[ContrattiContabCond] (
    [idsessione]            DECIMAL (5)     NOT NULL,
    [progcontratto]         DECIMAL (10)    NOT NULL,
    [progcontributo]        DECIMAL (10)    NOT NULL,
    [dadata]                DATETIME        NULL,
    [adata]                 DATETIME        NULL,
    [budgetqta]             DECIMAL (19, 6) DEFAULT ((0)) NOT NULL,
    [budget]                DECIMAL (19, 6) DEFAULT ((0)) NOT NULL,
    [avanzamentoqta]        DECIMAL (19, 6) DEFAULT ((0)) NOT NULL,
    [avanzamentovalore]     DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [descrizionecontratto]  NVARCHAR (455)  NULL,
    [descrizionecontributo] VARCHAR (455)   NULL,
    [premio]                DECIMAL (19, 6) DEFAULT ((0)) NOT NULL,
    PRIMARY KEY CLUSTERED ([idsessione] ASC, [progcontratto] ASC, [progcontributo] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ContrattiContabCond] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ContrattiContabCond] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ContrattiContabCond] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ContrattiContabCond] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ContrattiContabCond] TO [Metodo98]
    AS [dbo];

