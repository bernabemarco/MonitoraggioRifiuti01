CREATE TABLE [dbo].[Ffld] (
    [FfldCNome]       VARCHAR (80) NOT NULL,
    [FfldCTipoCampo]  VARCHAR (1)  NULL,
    [FfldCTipo]       VARCHAR (3)  NULL,
    [FfldNFLunghezza] INT          NULL,
    [FfldNDecimali]   INT          NULL,
    [FfldIProprieta]  VARCHAR (3)  DEFAULT ('S') NOT NULL,
    [ffldCltab]       VARCHAR (80) DEFAULT ('') NOT NULL,
    [ffldCFtab]       VARCHAR (80) DEFAULT ('') NOT NULL,
    [ffldClfld]       VARCHAR (80) DEFAULT ('') NOT NULL,
    [ffldCetab]       VARCHAR (80) DEFAULT ('') NULL,
    [ffldCefld]       VARCHAR (80) DEFAULT ('') NULL,
    [ffldCltabt]      VARCHAR (80) DEFAULT ('') NULL,
    CONSTRAINT [ffldprimary] PRIMARY KEY CLUSTERED ([ffldCltab] ASC, [ffldClfld] ASC, [ffldCFtab] ASC, [FfldCNome] ASC)
);

