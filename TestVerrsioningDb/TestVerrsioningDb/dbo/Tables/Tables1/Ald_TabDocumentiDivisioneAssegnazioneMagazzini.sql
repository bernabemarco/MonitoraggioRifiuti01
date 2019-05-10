CREATE TABLE [dbo].[Ald_TabDocumentiDivisioneAssegnazioneMagazzini] (
    [IdRiga]          SMALLINT     NOT NULL,
    [TIPODOC]         VARCHAR (3)  NOT NULL,
    [IdDivisione]     SMALLINT     NOT NULL,
    [CODDEPOSITO]     VARCHAR (10) NULL,
    [CODDEPOSITOCOLL] VARCHAR (10) NULL,
    [CODDEPCOMP]      VARCHAR (10) NULL,
    [CODDEPCOMPCOLL]  VARCHAR (10) NULL,
    [UTENTEMODIFICA]  VARCHAR (25) NOT NULL,
    [DATAMODIFICA]    DATETIME     NOT NULL,
    CONSTRAINT [PK_Ald_TabDocumentiDivisioneAssegnazioneMagazzini] PRIMARY KEY CLUSTERED ([IdRiga] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[Ald_TabDocumentiDivisioneAssegnazioneMagazzini] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Ald_TabDocumentiDivisioneAssegnazioneMagazzini] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Ald_TabDocumentiDivisioneAssegnazioneMagazzini] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Ald_TabDocumentiDivisioneAssegnazioneMagazzini] TO [Metodo98]
    AS [dbo];

