CREATE TABLE [dbo].[CGCPWImportAttribuzioni] (
    [Progressivo]       DECIMAL (10)    NOT NULL,
    [TipoScheda]        VARCHAR (5)     DEFAULT ('') NULL,
    [VoceScheda]        VARCHAR (10)    DEFAULT ('') NULL,
    [Tipo]              SMALLINT        DEFAULT (0) NULL,
    [VoceRiferimento]   VARCHAR (10)    DEFAULT ('') NULL,
    [Anno]              DECIMAL (5)     DEFAULT (0) NULL,
    [Mese]              INT             DEFAULT (0) NULL,
    [Categoria]         DECIMAL (5)     DEFAULT (0) NULL,
    [Articolo]          VARCHAR (50)    DEFAULT ('') NULL,
    [OggettoCalcolo]    VARCHAR (10)    DEFAULT ('') NULL,
    [ValoreVariabile]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [ValoreFisso]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [Percentuale]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [DataRegistrazione] DATETIME        NULL,
    [FlagVal]           SMALLINT        DEFAULT (0) NULL,
    [DescrizioneErrore] VARCHAR (200)   DEFAULT ('') NULL,
    [UtenteModifica]    VARCHAR (25)    NOT NULL,
    [DataModifica]      DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGCPWImportAttribuzioni] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGCPWImportAttribuzioni] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGCPWImportAttribuzioni] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGCPWImportAttribuzioni] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGCPWImportAttribuzioni] TO [Metodo98]
    AS [dbo];

