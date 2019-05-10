CREATE TABLE [dbo].[TP_Borderaux] (
    [Progressivo]         NUMERIC (18) NULL,
    [Spedizioniere]       DECIMAL (5)  NULL,
    [Esercizio]           DECIMAL (5)  NULL,
    [AnnoDoc]             DECIMAL (5)  NULL,
    [NumeroDoc]           DECIMAL (18) NULL,
    [Bis]                 CHAR (10)    NULL,
    [TipoDoc]             VARCHAR (3)  NULL,
    [DataUscitaBorderaux] DATETIME     NULL,
    [OraUscitaBorderaux]  CHAR (5)     NULL,
    [Cliente]             VARCHAR (50) NULL,
    [UTENTEMODIFICA]      VARCHAR (25) NOT NULL,
    [DATAMODIFICA]        DATETIME     NOT NULL,
    [Stampato]            INT          NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_Borderaux] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_Borderaux] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_Borderaux] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_Borderaux] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_Borderaux] TO [Metodo98]
    AS [dbo];

