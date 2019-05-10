CREATE TABLE [dbo].[GEMPLUS_TabStabilimentoDettaglioUbicaz] (
    [Cod_Fabbrica]          VARCHAR (3)    NOT NULL,
    [CodUbicazioneQlik]     VARCHAR (50)   NOT NULL,
    [DescrizioneUbicazione] VARCHAR (80)   NULL,
    [CoordinataX_U]         DECIMAL (5, 2) NOT NULL,
    [CoordinataX_Y]         DECIMAL (5, 2) NOT NULL,
    [UTENTEMODIFICA]        VARCHAR (25)   NOT NULL,
    [DATAMODIFICA]          DATETIME       NOT NULL,
    CONSTRAINT [GEMPLUS_TabStabilimentoDettaglioUbicaz_PK] PRIMARY KEY CLUSTERED ([Cod_Fabbrica] ASC, [CodUbicazioneQlik] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GEMPLUS_TabStabilimentoDettaglioUbicaz] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEMPLUS_TabStabilimentoDettaglioUbicaz] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEMPLUS_TabStabilimentoDettaglioUbicaz] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEMPLUS_TabStabilimentoDettaglioUbicaz] TO [Metodo98]
    AS [dbo];

