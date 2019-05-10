CREATE TABLE [dbo].[TP_ELENCOFORNITORIOF_TEMP] (
    [CodBuyer]       VARCHAR (7)     NOT NULL,
    [CodDeposito]    VARCHAR (10)    NOT NULL,
    [CodFornitore]   VARCHAR (7)     NOT NULL,
    [EOQ]            SMALLINT        DEFAULT ((0)) NOT NULL,
    [PFR]            SMALLINT        DEFAULT ((0)) NOT NULL,
    [SCT]            SMALLINT        DEFAULT ((0)) NOT NULL,
    [PRS]            SMALLINT        DEFAULT ((0)) NOT NULL,
    [Data]           VARCHAR (8)     NULL,
    [Ordinato]       DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [UtenteModifica] VARCHAR (25)    NULL,
    [DataModifica]   DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([CodBuyer] ASC, [CodDeposito] ASC, [CodFornitore] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_ELENCOFORNITORIOF_TEMP] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_ELENCOFORNITORIOF_TEMP] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_ELENCOFORNITORIOF_TEMP] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_ELENCOFORNITORIOF_TEMP] TO [Metodo98]
    AS [dbo];

