CREATE TABLE [dbo].[TP_STAGIONALE_ACQUISTATO] (
    [CodArticolo]         VARCHAR (50)    NOT NULL,
    [CodDeposito]         VARCHAR (10)    NOT NULL,
    [PeriodoOsservazione] INT             DEFAULT ((0)) NOT NULL,
    [1]                   DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [2]                   DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [3]                   DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [4]                   DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [5]                   DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [6]                   DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [7]                   DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [8]                   DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [9]                   DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [10]                  DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [11]                  DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [12]                  DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [13]                  DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [14]                  DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [15]                  DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [16]                  DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [17]                  DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [18]                  DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [19]                  DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [20]                  DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [21]                  DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [22]                  DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [23]                  DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [24]                  DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [25]                  DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [26]                  DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [27]                  DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [28]                  DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [29]                  DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [30]                  DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [31]                  DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [32]                  DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [33]                  DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [34]                  DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [35]                  DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [36]                  DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [UtenteModifica]      VARCHAR (25)    NOT NULL,
    [DataModifica]        DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([CodArticolo] ASC, [CodDeposito] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_STAGIONALE_ACQUISTATO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_STAGIONALE_ACQUISTATO] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_STAGIONALE_ACQUISTATO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_STAGIONALE_ACQUISTATO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_STAGIONALE_ACQUISTATO] TO [Metodo98]
    AS [dbo];

