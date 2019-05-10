CREATE TABLE [dbo].[TP_TMP_GIACENZE_AIOT] (
    [IdSessione]          DECIMAL (5)     NOT NULL,
    [Deposito]            VARCHAR (10)    NOT NULL,
    [DescrizioneDeposito] VARCHAR (80)    NOT NULL,
    [Articolo]            VARCHAR (80)    NOT NULL,
    [Giacenza]            DECIMAL (16, 6) DEFAULT ((0)) NOT NULL,
    [Tipo]                SMALLINT        DEFAULT ((0)) NOT NULL,
    [utentemodifica]      VARCHAR (25)    NOT NULL,
    [datamodifica]        DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([IdSessione] ASC, [Deposito] ASC, [Articolo] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_TMP_GIACENZE_AIOT] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_TMP_GIACENZE_AIOT] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_TMP_GIACENZE_AIOT] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_TMP_GIACENZE_AIOT] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_TMP_GIACENZE_AIOT] TO [Metodo98]
    AS [dbo];

