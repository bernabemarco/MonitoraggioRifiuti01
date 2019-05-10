CREATE TABLE [dbo].[TP_PERIODI_VENDUTO] (
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
    [P_1]                 DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [P_2]                 DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [P_3]                 DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [P_4]                 DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [P_5]                 DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [P_6]                 DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [P_7]                 DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [P_8]                 DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [P_9]                 DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [P_10]                DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [P_11]                DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [P_12]                DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [P_13]                DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [P_14]                DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [P_15]                DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [P_16]                DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [P_17]                DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [P_18]                DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [P_19]                DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [P_20]                DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [P_21]                DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [P_22]                DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [P_23]                DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [P_24]                DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [P_25]                DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [P_26]                DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [P_27]                DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [P_28]                DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [P_29]                DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [P_30]                DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [P_31]                DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [P_32]                DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [P_33]                DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [P_34]                DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [P_35]                DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [P_36]                DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [M_1]                 DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [M_2]                 DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [M_3]                 DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [M_4]                 DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [M_5]                 DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [M_6]                 DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [M_7]                 DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [M_8]                 DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [M_9]                 DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [M_10]                DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [M_11]                DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [M_12]                DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [M_13]                DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [M_14]                DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [M_15]                DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [M_16]                DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [M_17]                DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [M_18]                DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [M_19]                DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [M_20]                DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [M_21]                DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [M_22]                DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [M_23]                DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [M_24]                DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [M_25]                DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [M_26]                DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [M_27]                DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [M_28]                DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [M_29]                DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [M_30]                DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [M_31]                DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [M_32]                DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [M_33]                DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [M_34]                DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [M_35]                DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [M_36]                DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [UtenteModifica]      VARCHAR (25)    NOT NULL,
    [DataModifica]        DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([CodArticolo] ASC, [CodDeposito] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_ORDINEFORNITORE_EXPONENTIALSMOOTHING_1]
    ON [dbo].[TP_PERIODI_VENDUTO]([CodDeposito] ASC)
    INCLUDE([CodArticolo], [1]);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_PERIODI_VENDUTO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_PERIODI_VENDUTO] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_PERIODI_VENDUTO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_PERIODI_VENDUTO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_PERIODI_VENDUTO] TO [Metodo98]
    AS [dbo];

