CREATE TABLE [dbo].[TP_OF_DOCKS] (
    [IdSessione]     DECIMAL (5)  NOT NULL,
    [CodBuyer]       VARCHAR (7)  NOT NULL,
    [CodDeposito]    VARCHAR (10) NOT NULL,
    [Selezionato]    SMALLINT     DEFAULT ((0)) NOT NULL,
    [UtenteModifica] VARCHAR (25) NULL,
    [DataModifica]   DATETIME     NULL,
    PRIMARY KEY CLUSTERED ([IdSessione] ASC, [CodBuyer] ASC, [CodDeposito] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_OF_DOCKS] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_OF_DOCKS] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_OF_DOCKS] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_OF_DOCKS] TO [Metodo98]
    AS [dbo];

