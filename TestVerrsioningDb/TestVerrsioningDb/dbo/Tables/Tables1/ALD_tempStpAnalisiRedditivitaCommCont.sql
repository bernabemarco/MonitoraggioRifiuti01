CREATE TABLE [dbo].[ALD_tempStpAnalisiRedditivitaCommCont] (
    [IdAnalisi]               VARCHAR (30)    NOT NULL,
    [StatoCommessa]           SMALLINT        DEFAULT ((0)) NULL,
    [CodCommessa]             VARCHAR (30)    NOT NULL,
    [Fatturato]               DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [Ordinato]                DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [RimanMagazzino]          DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [TotMaterialiPrevisti]    DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [TotLavInternePreviste]   DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [TotLavEsternePreviste]   DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [TotMaterialiConsuntivi]  DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [TotLavInterneConsuntive] DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [TotLavEsterneConsuntive] DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [UtenteModifica]          VARCHAR (25)    NOT NULL,
    [DataModifica]            SMALLDATETIME   NOT NULL,
    [ValMagazzinoApplicata]   VARCHAR (50)    NULL,
    [TipoAnalisi]             VARCHAR (1)     NULL,
    [TotOrdinatoLavEsterne]   DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [MaterialeProduzione]     DECIMAL (19, 6) DEFAULT ((0)) NULL,
    CONSTRAINT [PK_ALD_tempStpAnalisiRedditivitaCommCont] PRIMARY KEY CLUSTERED ([IdAnalisi] ASC, [CodCommessa] ASC, [UtenteModifica] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_tempStpAnalisiRedditivitaCommCont] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_tempStpAnalisiRedditivitaCommCont] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_tempStpAnalisiRedditivitaCommCont] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_tempStpAnalisiRedditivitaCommCont] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_tempStpAnalisiRedditivitaCommCont] TO [Metodo98]
    AS [dbo];

