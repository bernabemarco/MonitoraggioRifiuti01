CREATE TABLE [dbo].[TP_STORICO_WINTER] (
    [CodArticolo]    VARCHAR (50)    NOT NULL,
    [CodDeposito]    VARCHAR (10)    NOT NULL,
    [A1B1]           DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [A1B2]           DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [A1B3]           DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [A1B4]           DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [A2B1]           DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [A2B2]           DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [A2B3]           DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [A2B4]           DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [A3B1]           DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [A3B2]           DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [A3B3]           DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [A3B4]           DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [A4B1]           DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [A4B2]           DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [A4B3]           DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [A4B4]           DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [A5B1]           DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [A5B2]           DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [A5B3]           DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [A5B4]           DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [A6B1]           DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [A6B2]           DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [A6B3]           DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [A6B4]           DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [TA1B1]          DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [TA2B1]          DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [TA3B1]          DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [TA4B1]          DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [TA5B1]          DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [TA6B1]          DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [TA1B2]          DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [TA2B2]          DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [TA3B2]          DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [TA4B2]          DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [TA5B2]          DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [TA6B2]          DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [TA1B3]          DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [TA2B3]          DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [TA3B3]          DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [TA4B3]          DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [TA5B3]          DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [TA6B3]          DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [TA1B4]          DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [TA2B4]          DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [TA3B4]          DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [TA4B4]          DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [TA5B4]          DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [TA6B4]          DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [MA1B1]          DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [MA2B1]          DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [MA3B1]          DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [MA4B1]          DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [MA5B1]          DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [MA6B1]          DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [MA1B2]          DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [MA2B2]          DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [MA3B2]          DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [MA4B2]          DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [MA5B2]          DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [MA6B2]          DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [MA1B3]          DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [MA2B3]          DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [MA3B3]          DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [MA4B3]          DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [MA5B3]          DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [MA6B3]          DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [MA1B4]          DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [MA2B4]          DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [MA3B4]          DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [MA4B4]          DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [MA5B4]          DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [MA6B4]          DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [D1]             DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [D2]             DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [D3]             DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [D4]             DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [D5]             DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [D6]             DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [D7]             DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [D8]             DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [D9]             DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [D10]            DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [D11]            DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [D12]            DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [ALFA]           DECIMAL (2, 1)  DEFAULT ((0)) NOT NULL,
    [BETA]           DECIMAL (2, 1)  DEFAULT ((0)) NOT NULL,
    [UtenteModifica] VARCHAR (25)    NOT NULL,
    [DataModifica]   DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([CodArticolo] ASC, [CodDeposito] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_STORICO_WINTER] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_STORICO_WINTER] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_STORICO_WINTER] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_STORICO_WINTER] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_STORICO_WINTER] TO [Metodo98]
    AS [dbo];

