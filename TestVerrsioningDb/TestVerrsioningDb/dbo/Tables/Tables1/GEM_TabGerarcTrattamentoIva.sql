CREATE TABLE [dbo].[GEM_TabGerarcTrattamentoIva] (
    [idRiga]         DECIMAL (5)  NOT NULL,
    [CODIVA]         DECIMAL (5)  CONSTRAINT [DF_GEM_TabGerarcTrattamentoIva_CODIVA] DEFAULT ((0)) NOT NULL,
    [SeqAppl]        DECIMAL (5)  NOT NULL,
    [ADDSPESEDOCUM]  SMALLINT     CONSTRAINT [DF_GEM_TabGerarcTrattamentoIva_ADDSPESEDOCUM] DEFAULT ((0)) NULL,
    [APPLRotturaFat] SMALLINT     CONSTRAINT [DF_GEM_TabGerarcTrattamentoIva_APPLRotturaFat] DEFAULT ((0)) NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    CONSTRAINT [PK_GEM_TabGerarcTrattamentoIva] PRIMARY KEY CLUSTERED ([idRiga] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_TabGerarcTrattamentoIva] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_TabGerarcTrattamentoIva] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_TabGerarcTrattamentoIva] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_TabGerarcTrattamentoIva] TO [Metodo98]
    AS [dbo];

