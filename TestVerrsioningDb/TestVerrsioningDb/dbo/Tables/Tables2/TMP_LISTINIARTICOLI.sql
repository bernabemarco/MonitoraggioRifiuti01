CREATE TABLE [dbo].[TMP_LISTINIARTICOLI] (
    [CODART]            VARCHAR (50)    NOT NULL,
    [NRLISTINO]         DECIMAL (5)     NOT NULL,
    [UM]                VARCHAR (3)     NOT NULL,
    [PREZZO]            DECIMAL (19, 6) NULL,
    [PREZZOEURO]        DECIMAL (19, 6) NULL,
    [UTENTEMODIFICA]    VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]      DATETIME        NOT NULL,
    [DeltaIncremento]   SMALLINT        NOT NULL,
    [TP_CodConto]       VARCHAR (7)     NULL,
    [TP_ConsPP]         SMALLINT        NULL,
    [TP_PrezzoPart]     NUMERIC (19, 6) NULL,
    [TP_PrezzoPartEuro] NUMERIC (19, 6) NULL,
    [TP_Scorporo]       SMALLINT        NULL,
    [TP_Sconti]         VARCHAR (200)   NULL,
    [TP_QTASCONTO]      NUMERIC (16, 6) NULL,
    [TP_QTACOEFF]       NUMERIC (16, 6) NULL,
    [TP_QTAMO]          CHAR (1)        NULL,
    [TP_Abbuono]        NUMERIC (19, 6) NULL,
    [TP_DataCambio]     DATETIME        NULL,
    [TP_ValoreCambio]   NUMERIC (19, 6) NULL,
    [DATAVALIDITA]      DATETIME        NULL,
    [TP_FormulaSct]     VARCHAR (100)   NULL,
    [PREZZOCALC]        DECIMAL (19, 6) NULL,
    [TP_ABBUONOEURO]    DECIMAL (19, 6) NULL,
    PRIMARY KEY CLUSTERED ([CODART] ASC, [NRLISTINO] ASC, [UM] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TMP_LISTINIARTICOLI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TMP_LISTINIARTICOLI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TMP_LISTINIARTICOLI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TMP_LISTINIARTICOLI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TMP_LISTINIARTICOLI] TO [Metodo98]
    AS [dbo];

