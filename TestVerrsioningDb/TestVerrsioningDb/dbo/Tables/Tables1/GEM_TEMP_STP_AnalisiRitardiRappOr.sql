CREATE TABLE [dbo].[GEM_TEMP_STP_AnalisiRitardiRappOr] (
    [IDRapporto]     VARCHAR (14)    NOT NULL,
    [TipoAnalisi]    VARCHAR (1)     NOT NULL,
    [nrMezzi]        DECIMAL (12, 4) DEFAULT ('0') NULL,
    [IMPORTONetto]   DECIMAL (12, 4) DEFAULT ('0') NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL,
    CONSTRAINT [GEM_TEMP_STP_AnalisiRitardiRappOr_PK] PRIMARY KEY CLUSTERED ([IDRapporto] ASC, [TipoAnalisi] ASC, [UTENTEMODIFICA] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_TEMP_STP_AnalisiRitardiRappOr] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_TEMP_STP_AnalisiRitardiRappOr] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GEM_TEMP_STP_AnalisiRitardiRappOr] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_TEMP_STP_AnalisiRitardiRappOr] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_TEMP_STP_AnalisiRitardiRappOr] TO [Metodo98]
    AS [dbo];

