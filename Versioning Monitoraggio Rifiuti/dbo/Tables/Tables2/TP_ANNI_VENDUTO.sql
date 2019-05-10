CREATE TABLE [dbo].[TP_ANNI_VENDUTO] (
    [CodArticolo]    VARCHAR (50)    NOT NULL,
    [CodDeposito]    VARCHAR (10)    NOT NULL,
    [Esercizio]      DECIMAL (5)     DEFAULT ((0)) NOT NULL,
    [1]              DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [2]              DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [3]              DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [4]              DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [5]              DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [6]              DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [7]              DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [8]              DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [9]              DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [10]             DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [11]             DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [12]             DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [TOTALE]         DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [V_1]            DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [V_2]            DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [V_3]            DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [V_4]            DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [V_5]            DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [V_6]            DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [V_7]            DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [V_8]            DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [V_9]            DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [V_10]           DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [V_11]           DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [V_12]           DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [V_TOTALE]       DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [UtenteModifica] VARCHAR (25)    NOT NULL,
    [DataModifica]   DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([CodArticolo] ASC, [CodDeposito] ASC, [Esercizio] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_ANNI_VENDUTO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_ANNI_VENDUTO] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_ANNI_VENDUTO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_ANNI_VENDUTO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_ANNI_VENDUTO] TO [Metodo98]
    AS [dbo];

