CREATE TABLE [dbo].[MB_DettaglioRighe_Tmp] (
    [IdSessione]            DECIMAL (5)     NOT NULL,
    [Raggruppamento]        DECIMAL (10)    NOT NULL,
    [Tipo]                  SMALLINT        NOT NULL,
    [IDTestaDoc]            DECIMAL (10)    NOT NULL,
    [IDRigaDoc]             INT             NOT NULL,
    [ValoreLordoRiga]       DECIMAL (19, 6) DEFAULT ((0)) NOT NULL,
    [ValoreNettoRiga]       DECIMAL (19, 6) DEFAULT ((0)) NOT NULL,
    [ValoreMedioAcquistato] DECIMAL (19, 6) DEFAULT ((0)) NOT NULL,
    [ValoreTraspAcq]        DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [QtaOrigine]            DECIMAL (16, 6) DEFAULT ((0)) NOT NULL,
    [QtaConv1]              DECIMAL (16, 6) DEFAULT ((0)) NOT NULL,
    [QtaConv2]              DECIMAL (16, 6) DEFAULT ((0)) NOT NULL,
    [UmOrigine]             VARCHAR (3)     DEFAULT ('') NOT NULL,
    [UMConv1]               VARCHAR (3)     DEFAULT ('') NOT NULL,
    [UMConv2]               VARCHAR (3)     DEFAULT ('') NOT NULL,
    [CodAgente1]            VARCHAR (7)     DEFAULT ('') NOT NULL,
    [VALOREPROVV1]          DECIMAL (19, 4) DEFAULT ((0)) NOT NULL,
    [CodAgente2]            VARCHAR (7)     DEFAULT ('') NOT NULL,
    [VALOREPROVV2]          DECIMAL (19, 4) DEFAULT ((0)) NOT NULL,
    [CodAgente3]            VARCHAR (7)     DEFAULT ('') NOT NULL,
    [VALOREPROVV3]          DECIMAL (19, 4) DEFAULT ((0)) NOT NULL,
    [Sel_1]                 VARCHAR (80)    NULL,
    [Sel_2]                 VARCHAR (80)    NULL,
    [Sel_3]                 VARCHAR (80)    NULL,
    [Sel_4]                 VARCHAR (80)    NULL,
    [Sel_5]                 VARCHAR (80)    NULL,
    [Sel_6]                 VARCHAR (80)    NULL,
    [ScontoRiga]            DECIMAL (8, 5)  DEFAULT ((0)) NOT NULL,
    [QtaExtra]              DECIMAL (16, 6) DEFAULT ((0)) NOT NULL,
    [ValoreExtra]           DECIMAL (16, 6) DEFAULT ((0)) NOT NULL,
    [QtaExtra01]            DECIMAL (16, 6) NOT NULL,
    [QtaExtra02]            DECIMAL (16, 6) NOT NULL,
    [QtaExtra03]            DECIMAL (16, 6) NOT NULL,
    [QtaExtra04]            DECIMAL (16, 6) NOT NULL,
    [QtaExtra05]            DECIMAL (16, 6) NOT NULL,
    [QtaExtra06]            DECIMAL (16, 6) NOT NULL,
    [QtaExtra07]            DECIMAL (16, 6) NOT NULL,
    [QtaExtra08]            DECIMAL (16, 6) NOT NULL,
    [QtaExtra09]            DECIMAL (16, 6) NOT NULL,
    [QtaExtra10]            DECIMAL (16, 6) NOT NULL,
    [ValoreExtra01]         DECIMAL (16, 6) NOT NULL,
    [ValoreExtra02]         DECIMAL (16, 6) NOT NULL,
    [ValoreExtra03]         DECIMAL (16, 6) NOT NULL,
    [ValoreExtra04]         DECIMAL (16, 6) NOT NULL,
    [ValoreExtra05]         DECIMAL (16, 6) NOT NULL,
    [ValoreExtra06]         DECIMAL (16, 6) NOT NULL,
    [ValoreExtra07]         DECIMAL (16, 6) NOT NULL,
    [ValoreExtra08]         DECIMAL (16, 6) NOT NULL,
    [ValoreExtra09]         DECIMAL (16, 6) NOT NULL,
    [ValoreExtra10]         DECIMAL (16, 6) NOT NULL,
    [FlgProvv]              SMALLINT        DEFAULT ((0)) NULL,
    [UtenteModifica]        VARCHAR (25)    DEFAULT (user_name()) NOT NULL,
    [DataModifica]          DATETIME        DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_MB_DettaglioRIghe_tmp] PRIMARY KEY CLUSTERED ([IdSessione] ASC, [Raggruppamento] ASC, [Tipo] ASC, [IDTestaDoc] ASC, [IDRigaDoc] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[MB_DettaglioRighe_Tmp] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[MB_DettaglioRighe_Tmp] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[MB_DettaglioRighe_Tmp] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[MB_DettaglioRighe_Tmp] TO [Metodo98]
    AS [dbo];

