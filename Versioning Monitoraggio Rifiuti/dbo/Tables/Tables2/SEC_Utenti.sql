CREATE TABLE [dbo].[SEC_Utenti] (
    [CodUtente]       NVARCHAR (25)  CONSTRAINT [DF_SEC_Utenti_CodUtente_1__10] DEFAULT ('') NOT NULL,
    [NomeUtente]      NVARCHAR (32)  NULL,
    [Mansione]        NVARCHAR (50)  NULL,
    [FlgAmminis]      NVARCHAR (1)   NULL,
    [FlgRespTaratura] NVARCHAR (1)   NULL,
    [CodEnte]         NVARCHAR (2)   NULL,
    [Nome]            NVARCHAR (20)  NULL,
    [COGNOME]         NVARCHAR (20)  NULL,
    [Titolo]          NVARCHAR (10)  NULL,
    [EMail]           NVARCHAR (100) NULL,
    [Note]            NTEXT          NULL,
    [Campo1]          NVARCHAR (50)  NULL,
    [Campo2]          NVARCHAR (50)  NULL,
    [Campo3]          NVARCHAR (50)  NULL,
    [Campo4]          NVARCHAR (50)  NULL,
    [Campo5]          NVARCHAR (50)  NULL,
    [Campo6]          NVARCHAR (50)  NULL,
    CONSTRAINT [PK_SYSQM_Utenti] PRIMARY KEY NONCLUSTERED ([CodUtente] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[SEC_Utenti] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[SEC_Utenti] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[SEC_Utenti] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[SEC_Utenti] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[SEC_Utenti] TO [Metodo98]
    AS [dbo];

