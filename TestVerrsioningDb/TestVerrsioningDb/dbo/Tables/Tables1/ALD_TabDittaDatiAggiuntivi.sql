CREATE TABLE [dbo].[ALD_TabDittaDatiAggiuntivi] (
    [IdSocieta]             VARCHAR (4)     NOT NULL,
    [DescrizioneSocieta]    VARCHAR (80)    NULL,
    [DittaMetodo]           VARCHAR (8)     NULL,
    [UtenteModifica]        VARCHAR (25)    NOT NULL,
    [DataModifica]          SMALLDATETIME   NOT NULL,
    [TimeSheetExportDir]    VARCHAR (200)   NULL,
    [TimeSheetExportFile]   VARCHAR (25)    NULL,
    [ZucchettiImportFile]   VARCHAR (200)   NULL,
    [CodClienteB2B]         VARCHAR (7)     NULL,
    [CodClienteB2C]         VARCHAR (7)     NULL,
    [IdListinoVendita]      DECIMAL (5)     NULL,
    [IdListinoUPA]          DECIMAL (5)     NULL,
    [SupportoMailClienti]   VARCHAR (80)    DEFAULT ('') NULL,
    [SupportoMailFornitori] VARCHAR (80)    DEFAULT ('') NULL,
    [CapitaleSocialeREA]    DECIMAL (16, 6) NULL,
    [FlagAggCampiB2B]       SMALLINT        DEFAULT ((0)) NULL,
    CONSTRAINT [PK_ALD_TabDittaDatiAggiuntivi] PRIMARY KEY CLUSTERED ([IdSocieta] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_TabDittaDatiAggiuntivi] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_TabDittaDatiAggiuntivi] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_TabDittaDatiAggiuntivi] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_TabDittaDatiAggiuntivi] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_TabDittaDatiAggiuntivi] TO [Metodo98]
    AS [dbo];

