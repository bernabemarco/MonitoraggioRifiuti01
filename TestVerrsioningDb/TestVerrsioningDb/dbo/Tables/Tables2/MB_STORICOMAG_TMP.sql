CREATE TABLE [dbo].[MB_STORICOMAG_TMP] (
    [PROGRESSIVO]         DECIMAL (10)    NOT NULL,
    [CODART]              VARCHAR (50)    NOT NULL,
    [CODDEPOSITO]         VARCHAR (10)    NOT NULL,
    [NRIFPARTITA]         VARCHAR (15)    NULL,
    [DATARIFDOC]          DATETIME        NULL,
    [QTA1UM]              DECIMAL (16, 6) NOT NULL,
    [UM]                  VARCHAR (3)     NULL,
    [QUANTITACARICO]      SMALLINT        NULL,
    [VALORECARICO]        SMALLINT        NULL,
    [MOVIMENTAPARTITE]    SMALLINT        NULL,
    [IMPORTOTOTLORDOEURO] DECIMAL (19, 4) NOT NULL,
    [IMPORTOTOTNETTOEURO] DECIMAL (19, 4) NOT NULL,
    [IDTESTA]             DECIMAL (10)    NULL,
    [RIGADOC]             INT             NULL,
    [CODCAUSALE]          DECIMAL (5)     NULL,
    [TIPODOC]             VARCHAR (3)     NULL,
    [TIPO]                BIT             DEFAULT ((0)) NOT NULL,
    [UTENTEMODIFICA]      VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]        DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC, [TIPO] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[MB_STORICOMAG_TMP] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[MB_STORICOMAG_TMP] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[MB_STORICOMAG_TMP] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[MB_STORICOMAG_TMP] TO [Metodo98]
    AS [dbo];

