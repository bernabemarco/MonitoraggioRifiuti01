CREATE TABLE [dbo].[GEMPLUS_TabGemmaPlusGiroVisita] (
    [IdGiroVisitaGMP] VARCHAR (10)  NOT NULL,
    [Descrizione]     VARCHAR (80)  NULL,
    [NOTE]            VARCHAR (100) NULL,
    [UTENTEMODIFICA]  VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]    DATETIME      NOT NULL,
    CONSTRAINT [GEMPLUS_TabGemmaPlusGiroVisita_PK] PRIMARY KEY CLUSTERED ([IdGiroVisitaGMP] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GEMPLUS_TabGemmaPlusGiroVisita] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEMPLUS_TabGemmaPlusGiroVisita] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEMPLUS_TabGemmaPlusGiroVisita] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEMPLUS_TabGemmaPlusGiroVisita] TO [Metodo98]
    AS [dbo];

