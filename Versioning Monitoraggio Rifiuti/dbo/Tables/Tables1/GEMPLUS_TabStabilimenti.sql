CREATE TABLE [dbo].[GEMPLUS_TabStabilimenti] (
    [Cod_Fabbrica]   VARCHAR (3)  NOT NULL,
    [Descr_Fabbrica] VARCHAR (80) NULL,
    [Ordinamento]    DECIMAL (5)  NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    CONSTRAINT [GEMPLUS_TabStabilimenti_PK] PRIMARY KEY CLUSTERED ([Cod_Fabbrica] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GEMPLUS_TabStabilimenti] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEMPLUS_TabStabilimenti] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEMPLUS_TabStabilimenti] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEMPLUS_TabStabilimenti] TO [Metodo98]
    AS [dbo];

