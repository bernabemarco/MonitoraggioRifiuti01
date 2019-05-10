CREATE TABLE [dbo].[TP_TMP_MovimentiCauzioni] (
    [IDSessione]          DECIMAL (5)     NOT NULL,
    [IDTesta]             DECIMAL (10)    NOT NULL,
    [IDRiga]              INT             NOT NULL,
    [Posizione]           INT             NOT NULL,
    [CodiceVuoto]         VARCHAR (50)    NOT NULL,
    [UM]                  VARCHAR (3)     NOT NULL,
    [QtaCons]             DECIMAL (16, 6) NOT NULL,
    [CauMagCons]          DECIMAL (5)     NULL,
    [CodDepCons]          VARCHAR (10)    NULL,
    [CauMagConsColl]      DECIMAL (5)     NULL,
    [CodDepConsColl]      VARCHAR (10)    NULL,
    [ImportoUnitCons]     DECIMAL (19, 6) NOT NULL,
    [ImportoUnitConsEuro] DECIMAL (19, 6) NOT NULL,
    [QtaResi]             DECIMAL (16, 6) NOT NULL,
    [CauMagResi]          DECIMAL (5)     NULL,
    [CodDepResi]          VARCHAR (10)    NULL,
    [CauMagResiColl]      DECIMAL (5)     NULL,
    [CodDepResiColl]      VARCHAR (10)    NULL,
    [ImportoUnitResi]     DECIMAL (19, 6) NOT NULL,
    [ImportoUnitResiEuro] DECIMAL (19, 6) NOT NULL,
    [UTENTEMODIFICA]      VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]        DATETIME        NOT NULL,
    CONSTRAINT [PK_TP_TMP_MovimentiCauzioni] PRIMARY KEY CLUSTERED ([IDSessione] ASC, [IDTesta] ASC, [IDRiga] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_TMP_MovimentiCauzioni] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_TMP_MovimentiCauzioni] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_TMP_MovimentiCauzioni] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_TMP_MovimentiCauzioni] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_TMP_MovimentiCauzioni] TO [Metodo98]
    AS [dbo];

