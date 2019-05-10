CREATE TABLE [dbo].[EXTRAGENERICI] (
    [CODCONTO]                 VARCHAR (7)  NOT NULL,
    [UTENTEMODIFICA]           VARCHAR (25) NOT NULL,
    [DATAMODIFICA]             DATETIME     NOT NULL,
    [RitenAccCondominio]       SMALLINT     DEFAULT (0) NULL,
    [CodContoMFM]              VARCHAR (20) NULL,
    [codNaturaPDC_1]           VARCHAR (20) NULL,
    [codNaturaPDC_2]           VARCHAR (20) NULL,
    [codNaturaPDC_3]           VARCHAR (20) NULL,
    [CodSap]                   VARCHAR (10) NULL,
    [IdASA]                    VARCHAR (2)  DEFAULT ('') NULL,
    [RifCommessaDefault]       VARCHAR (30) DEFAULT ('') NULL,
    [flgObblCommessaCompilata] SMALLINT     DEFAULT ((0)) NULL,
    [flgNoExportSap]           SMALLINT     DEFAULT ((0)) NULL,
    [CodSapStanz]              VARCHAR (10) DEFAULT ('') NULL,
    [CogesSpeciale]            VARCHAR (1)  NULL,
    [TMVDare]                  VARCHAR (3)  NULL,
    [TMVAvere]                 VARCHAR (3)  NULL,
    [IdSocietaPartnerMNC]      VARCHAR (6)  NULL,
    CONSTRAINT [PK_EXTRAGENERICI] PRIMARY KEY CLUSTERED ([CODCONTO] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_EXTRAGENERICI_CODCONTO] FOREIGN KEY ([CODCONTO]) REFERENCES [dbo].[ANAGRAFICAGENERICI] ([CODCONTO]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[EXTRAGENERICI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[EXTRAGENERICI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[EXTRAGENERICI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[EXTRAGENERICI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[EXTRAGENERICI] TO [Metodo98]
    AS [dbo];

