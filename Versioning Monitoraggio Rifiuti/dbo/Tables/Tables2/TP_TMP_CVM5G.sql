CREATE TABLE [dbo].[TP_TMP_CVM5G] (
    [Giorno]              SMALLINT        NOT NULL,
    [Fornitore]           VARCHAR (7)     NOT NULL,
    [Magazzino]           VARCHAR (50)    NOT NULL,
    [CodiceArticolo]      VARCHAR (50)    NOT NULL,
    [DescrizioneArticolo] VARCHAR (100)   NULL,
    [Data]                DATETIME        NULL,
    [UMBase]              CHAR (2)        NULL,
    [Venduti]             DECIMAL (19, 4) NULL,
    [Mancanti]            DECIMAL (19, 4) NULL,
    PRIMARY KEY CLUSTERED ([Giorno] ASC, [Fornitore] ASC, [Magazzino] ASC, [CodiceArticolo] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_TMP_CVM5G] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_TMP_CVM5G] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_TMP_CVM5G] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_TMP_CVM5G] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_TMP_CVM5G] TO [Metodo98]
    AS [dbo];

