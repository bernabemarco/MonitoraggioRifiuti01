CREATE TABLE [dbo].[Query_Parametro] (
    [CodQuery]       NVARCHAR (5)  CONSTRAINT [DF_Query_Para_CodQuery_1__10] DEFAULT ('') NOT NULL,
    [NomeParam]      NVARCHAR (32) CONSTRAINT [DF_Query_Para_NomeParam_2__10] DEFAULT ('') NOT NULL,
    [TestoParam]     NVARCHAR (32) NULL,
    [FlgData]        NVARCHAR (1)  NULL,
    [FlgIntero]      NVARCHAR (1)  NULL,
    [FlgDecimal]     NVARCHAR (1)  NULL,
    [FlgSiNo]        NVARCHAR (1)  NULL,
    [FlgFillzero]    NVARCHAR (1)  NULL,
    [FlgPercent]     NVARCHAR (1)  NULL,
    [IntDec]         NVARCHAR (10) NULL,
    [LunghMax]       SMALLINT      NULL,
    [LookupTable]    NTEXT         NULL,
    [LookupKeyField] NVARCHAR (32) NULL,
    [LookupDesField] NTEXT         NULL,
    [LookupCondiz]   NTEXT         NULL,
    CONSTRAINT [PK_Query_Parametro] PRIMARY KEY NONCLUSTERED ([CodQuery] ASC, [NomeParam] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[Query_Parametro] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Query_Parametro] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[Query_Parametro] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Query_Parametro] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Query_Parametro] TO [Metodo98]
    AS [dbo];

