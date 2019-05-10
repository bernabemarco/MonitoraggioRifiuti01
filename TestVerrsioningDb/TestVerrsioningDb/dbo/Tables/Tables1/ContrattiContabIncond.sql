CREATE TABLE [dbo].[ContrattiContabIncond] (
    [idsessione]            DECIMAL (5)     NOT NULL,
    [progcontratto]         DECIMAL (10)    NOT NULL,
    [progcontributo]        DECIMAL (10)    NOT NULL,
    [rifprogressivo]        DECIMAL (10)    DEFAULT ((0)) NOT NULL,
    [riga]                  INT             DEFAULT ((0)) NOT NULL,
    [valore]                DECIMAL (19, 6) DEFAULT ((0)) NOT NULL,
    [merce]                 DECIMAL (19, 6) DEFAULT ((0)) NOT NULL,
    [ispercentuale]         SMALLINT        DEFAULT ((0)) NOT NULL,
    [dadata]                DATETIME        NULL,
    [adata]                 DATETIME        NULL,
    [percentuale]           DECIMAL (19, 6) DEFAULT ((0)) NOT NULL,
    [budget]                DECIMAL (19, 6) DEFAULT ((0)) NOT NULL,
    [avanzamento]           DECIMAL (19, 6) DEFAULT ((0)) NOT NULL,
    [descrizionecontratto]  NVARCHAR (455)  NULL,
    [descrizionecontributo] VARCHAR (455)   NULL,
    [premio]                DECIMAL (19, 6) DEFAULT ((0)) NOT NULL,
    PRIMARY KEY CLUSTERED ([idsessione] ASC, [progcontratto] ASC, [progcontributo] ASC, [rifprogressivo] ASC, [riga] ASC, [ispercentuale] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ContrattiContabIncond] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ContrattiContabIncond] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ContrattiContabIncond] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ContrattiContabIncond] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ContrattiContabIncond] TO [Metodo98]
    AS [dbo];

