CREATE TABLE [dbo].[GEM_TEMP_AnalisiContratiMinori2017] (
    [RIFCOMMCLI]            VARCHAR (30)    NULL,
    [idcontratto]           VARCHAR (13)    NOT NULL,
    [CodCliente]            VARCHAR (7)     NULL,
    [IdStato]               SMALLINT        NULL,
    [codcategoriaContratto] SMALLINT        NULL,
    [Durata]                SMALLINT        NULL,
    [SumSezione]            DECIMAL (16, 6) NULL,
    [TContratto]            DECIMAL (16, 6) NULL,
    [ValRateoMensile]       DECIMAL (16, 6) NULL,
    [ValAnnuale]            DECIMAL (16, 6) NULL,
    [OldRifCommCli]         VARCHAR (30)    NULL,
    CONSTRAINT [PK_GEM_TEMP_AnalisiContratiMinori2017] PRIMARY KEY CLUSTERED ([idcontratto] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_TEMP_AnalisiContratiMinori2017] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_TEMP_AnalisiContratiMinori2017] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GEM_TEMP_AnalisiContratiMinori2017] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_TEMP_AnalisiContratiMinori2017] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_TEMP_AnalisiContratiMinori2017] TO [Metodo98]
    AS [dbo];

