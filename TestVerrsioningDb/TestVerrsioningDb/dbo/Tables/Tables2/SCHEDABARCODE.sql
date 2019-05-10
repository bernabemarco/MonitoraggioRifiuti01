CREATE TABLE [dbo].[SCHEDABARCODE] (
    [PROGRESSIVO]       NUMERIC (18) NOT NULL,
    [PREFISSO]          CHAR (1)     NULL,
    [CA_DA]             INT          NULL,
    [CA_A]              INT          NULL,
    [VAL_DA]            INT          NULL,
    [VAL_A]             INT          NULL,
    [NUMDEC_VAL]        INT          NULL,
    [QTA_DA]            INT          NULL,
    [QTA_A]             INT          NULL,
    [NUMDEC_QTA]        INT          NULL,
    [PREZZOUNIT_DA]     INT          NULL,
    [PREZZOUNIT_A]      INT          NULL,
    [NUMDEC_PREZZOUNIT] INT          NULL,
    [CHKD_DA]           INT          NULL,
    [CHKD_A]            INT          NULL,
    [UTENTEMODIFICA]    VARCHAR (25) NOT NULL,
    [DATAMODIFICA]      DATETIME     NOT NULL,
    CONSTRAINT [PK_SCHEDABARCODE] PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[SCHEDABARCODE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[SCHEDABARCODE] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[SCHEDABARCODE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[SCHEDABARCODE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[SCHEDABARCODE] TO [Metodo98]
    AS [dbo];

