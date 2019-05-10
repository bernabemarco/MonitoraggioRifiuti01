CREATE TABLE [dbo].[TP_AGENDAUTENTEORDINI_A] (
    [RifProgressivo] DECIMAL (10)   NOT NULL,
    [RifRiga]        INT            NOT NULL,
    [Utente]         VARCHAR (25)   NOT NULL,
    [Supervisor]     SMALLINT       NOT NULL,
    [CodCliente]     VARCHAR (7)    NOT NULL,
    [DestDiv]        DECIMAL (5)    NULL,
    [Data]           DATETIME       NOT NULL,
    [Ora]            DATETIME       NOT NULL,
    [Stato]          SMALLINT       NOT NULL,
    [OrdineFatto]    VARCHAR (10)   DEFAULT ('') NULL,
    [Note]           VARCHAR (1000) NULL,
    [Oggetto]        VARCHAR (1000) NULL,
    [id]             DECIMAL (30)   IDENTITY (1, 1) NOT NULL,
    [UtenteModifica] VARCHAR (25)   NOT NULL,
    [DataModifica]   DATETIME       NOT NULL,
    PRIMARY KEY CLUSTERED ([RifProgressivo] ASC, [RifRiga] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_AGENDAUTENTEORDINI_A] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_AGENDAUTENTEORDINI_A] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_AGENDAUTENTEORDINI_A] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_AGENDAUTENTEORDINI_A] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_AGENDAUTENTEORDINI_A] TO [Metodo98]
    AS [dbo];

