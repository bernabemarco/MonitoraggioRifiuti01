CREATE TABLE [dbo].[TP_OF_SUPPLIERS] (
    [IdSessione]      DECIMAL (5)  NOT NULL,
    [CodBuyer]        VARCHAR (7)  NOT NULL,
    [CodFornitore]    VARCHAR (7)  NOT NULL,
    [GiorniCopertura] INT          DEFAULT ((0)) NOT NULL,
    [Selezionato]     SMALLINT     DEFAULT ((0)) NOT NULL,
    [Tipo]            SMALLINT     DEFAULT ((0)) NOT NULL,
    [EOQ]             SMALLINT     DEFAULT ((0)) NOT NULL,
    [PFR]             SMALLINT     DEFAULT ((0)) NOT NULL,
    [SCT]             SMALLINT     DEFAULT ((0)) NOT NULL,
    [PRS]             SMALLINT     DEFAULT ((0)) NOT NULL,
    [ALL]             SMALLINT     DEFAULT ((0)) NOT NULL,
    [ALF]             SMALLINT     DEFAULT ((0)) NOT NULL,
    [UtenteModifica]  VARCHAR (25) NULL,
    [DataModifica]    DATETIME     NULL,
    PRIMARY KEY CLUSTERED ([IdSessione] ASC, [CodBuyer] ASC, [CodFornitore] ASC, [Tipo] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_OF_SUPPLIERS] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_OF_SUPPLIERS] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_OF_SUPPLIERS] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_OF_SUPPLIERS] TO [Metodo98]
    AS [dbo];

