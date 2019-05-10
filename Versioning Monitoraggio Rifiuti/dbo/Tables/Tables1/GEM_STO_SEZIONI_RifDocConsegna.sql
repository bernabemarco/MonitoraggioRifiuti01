CREATE TABLE [dbo].[GEM_STO_SEZIONI_RifDocConsegna] (
    [IDCONTRATTO]      VARCHAR (13) NOT NULL,
    [SEZIONECONTRATTO] DECIMAL (5)  NOT NULL,
    [IdRiga]           DECIMAL (5)  NOT NULL,
    [AnnoDoc]          DECIMAL (5)  NULL,
    [IdTestaDoc]       DECIMAL (10) NOT NULL,
    [UTENTEMODIFICA]   VARCHAR (25) NOT NULL,
    [DATAMODIFICA]     DATETIME     NOT NULL,
    CONSTRAINT [GEM_STO_SEZIONI_RifDocConsegna_PK] PRIMARY KEY CLUSTERED ([IDCONTRATTO] ASC, [SEZIONECONTRATTO] ASC, [IdRiga] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_STO_SEZIONI_RifDocConsegna] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_STO_SEZIONI_RifDocConsegna] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GEM_STO_SEZIONI_RifDocConsegna] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_STO_SEZIONI_RifDocConsegna] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_STO_SEZIONI_RifDocConsegna] TO [Metodo98]
    AS [dbo];

