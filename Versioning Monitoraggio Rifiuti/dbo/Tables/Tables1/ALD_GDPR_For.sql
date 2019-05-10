CREATE TABLE [dbo].[ALD_GDPR_For] (
    [CODCONTO]       VARCHAR (7)   NOT NULL,
    [InfPrivInviata] VARCHAR (1)   DEFAULT ('') NULL,
    [DataInvInf]     DATETIME      NULL,
    [CodModInvioInf] VARCHAR (6)   NULL,
    [TipoInf]        VARCHAR (6)   NULL,
    [CorrespTrat]    VARCHAR (1)   NULL,
    [AnnotInvInf]    VARCHAR (200) NULL,
    [InfPrivRic]     VARCHAR (1)   DEFAULT ('') NULL,
    [DataRicInf]     DATETIME      NULL,
    [AllegInfRic1]   VARCHAR (300) DEFAULT ('') NULL,
    [AllegInfRic2]   VARCHAR (300) DEFAULT ('') NULL,
    [SotCoresp]      VARCHAR (1)   DEFAULT ('') NULL,
    [DataAccCoresp]  DATETIME      NULL,
    [AttConsRic1]    VARCHAR (300) DEFAULT ('') NULL,
    [AttConsRic2]    VARCHAR (300) DEFAULT ('') NULL,
    [ConsDati]       VARCHAR (1)   DEFAULT ('') NULL,
    [ConsComun]      VARCHAR (1)   DEFAULT ('') NULL,
    [AnnotCons]      VARCHAR (200) NULL,
    [ConsDatiPart]   VARCHAR (1)   DEFAULT ('') NULL,
    [ConsDatiImm]    VARCHAR (1)   DEFAULT ('') NULL,
    [ConsDatiGiud]   VARCHAR (1)   DEFAULT ('') NULL,
    [ConsMark]       VARCHAR (1)   DEFAULT ('') NULL,
    [DataCons]       DATETIME      NULL,
    [IndMailMark1]   VARCHAR (200) DEFAULT ('') NULL,
    [IndMailMark2]   VARCHAR (200) DEFAULT ('') NULL,
    [UTENTEMODIFICA] VARCHAR (25)  NULL,
    [DATAMODIFICA]   DATETIME      NULL,
    CONSTRAINT [PK_ALD_GDPR_For] PRIMARY KEY CLUSTERED ([CODCONTO] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_GDPR_For] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_GDPR_For] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_GDPR_For] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_GDPR_For] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_GDPR_For] TO [Metodo98]
    AS [dbo];

