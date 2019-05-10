CREATE TABLE [dbo].[SL_tmpManutenzioniFW] (
    [Ditta]           VARCHAR (50)    NOT NULL,
    [CodAgente]       VARCHAR (7)     NOT NULL,
    [FamigliaId]      SMALLINT        NOT NULL,
    [DscAgente]       VARCHAR (80)    NULL,
    [DSCFamiglia]     VARCHAR (80)    NULL,
    [TotaleOrdini]    DECIMAL (19, 4) CONSTRAINT [DF_Table1_TotaleOrdini] DEFAULT (0) NULL,
    [PeriodoOrdini]   DECIMAL (19, 4) CONSTRAINT [DF_Table1_TotaleOrdini1] DEFAULT (0) NULL,
    [PeriodoOrdiniAP] DECIMAL (19, 4) CONSTRAINT [DF_Table1_TotaleOrdini1_1] DEFAULT (0) NULL,
    [idcontratto]     VARCHAR (50)    NULL,
    [FamigliaMetodo]  SMALLINT        DEFAULT (0) NOT NULL,
    CONSTRAINT [PK_SL_tmpManutenzioniFW] PRIMARY KEY CLUSTERED ([Ditta] ASC, [CodAgente] ASC, [FamigliaId] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[SL_tmpManutenzioniFW] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[SL_tmpManutenzioniFW] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[SL_tmpManutenzioniFW] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[SL_tmpManutenzioniFW] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[SL_tmpManutenzioniFW] TO [Metodo98]
    AS [dbo];

