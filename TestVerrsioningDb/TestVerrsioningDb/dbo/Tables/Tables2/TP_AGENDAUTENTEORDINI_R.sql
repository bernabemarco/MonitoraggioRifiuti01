CREATE TABLE [dbo].[TP_AGENDAUTENTEORDINI_R] (
    [RifProgressivo] DECIMAL (18) NOT NULL,
    [CodCliente]     VARCHAR (7)  NOT NULL,
    [DestDiv]        DECIMAL (5)  NOT NULL,
    [Giorno]         SMALLINT     NOT NULL,
    [Ora]            DATETIME     NOT NULL,
    [UtenteModifica] VARCHAR (25) NOT NULL,
    [DataModifica]   DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([RifProgressivo] ASC, [CodCliente] ASC, [DestDiv] ASC, [Giorno] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_AGENDAUTENTEORDINI_R] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_AGENDAUTENTEORDINI_R] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_AGENDAUTENTEORDINI_R] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_AGENDAUTENTEORDINI_R] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_AGENDAUTENTEORDINI_R] TO [Metodo98]
    AS [dbo];

