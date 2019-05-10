CREATE TABLE [dbo].[TABDITTEEURITMO] (
    [Progressivo]         INT          NOT NULL,
    [RagioneSociale]      VARCHAR (70) NULL,
    [Indirizzo]           VARCHAR (70) NULL,
    [Citta]               VARCHAR (35) NULL,
    [Provincia]           VARCHAR (9)  NULL,
    [CAP]                 VARCHAR (9)  NULL,
    [Nazione]             VARCHAR (3)  NULL,
    [Naz_PIVA]            VARCHAR (35) NULL,
    [Int_PIVA]            VARCHAR (35) NULL,
    [Reg_Tribunale]       VARCHAR (35) NULL,
    [Num_Licenza]         VARCHAR (35) NULL,
    [Reg_CameraCommercio] VARCHAR (35) NULL,
    [CapitaleSociale]     VARCHAR (35) NULL,
    [CodiceFiscale]       VARCHAR (35) NULL,
    [UTENTEMODIFICA]      VARCHAR (25) NOT NULL,
    [DATAMODIFICA]        DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TABDITTEEURITMO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TABDITTEEURITMO] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TABDITTEEURITMO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TABDITTEEURITMO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TABDITTEEURITMO] TO [Metodo98]
    AS [dbo];

