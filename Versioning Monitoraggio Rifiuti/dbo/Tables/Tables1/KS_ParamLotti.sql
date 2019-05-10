CREATE TABLE [dbo].[KS_ParamLotti] (
    [Progressivo]        DECIMAL (5)  NOT NULL,
    [Prefisso]           VARCHAR (10) NULL,
    [Suffisso]           VARCHAR (10) NULL,
    [Contatore]          DECIMAL (5)  NULL,
    [LungCont]           INT          NULL,
    [TipoAttrLotto]      INT          NULL,
    [CarRiempimento]     CHAR (1)     NULL,
    [DscCarattScadLotto] VARCHAR (80) NULL,
    [CarattLottoProv]    VARCHAR (80) NULL,
    [FunzLottoProv]      INT          NULL,
    [FlagBlocca]         INT          NULL,
    [FlagPrelLottoBloc]  INT          NULL,
    [FlagDateNONValide]  INT          NULL,
    [UtenteModifica]     VARCHAR (25) NULL,
    [DataModifica]       DATETIME     NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[KS_ParamLotti] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[KS_ParamLotti] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[KS_ParamLotti] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[KS_ParamLotti] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[KS_ParamLotti] TO [Metodo98]
    AS [dbo];

