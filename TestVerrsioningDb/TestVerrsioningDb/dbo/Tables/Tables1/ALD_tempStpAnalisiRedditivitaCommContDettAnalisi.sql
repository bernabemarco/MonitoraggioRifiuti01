CREATE TABLE [dbo].[ALD_tempStpAnalisiRedditivitaCommContDettAnalisi] (
    [IdAnalisi]        VARCHAR (30)    NOT NULL,
    [CodCommessa]      VARCHAR (30)    NOT NULL,
    [IdTestaOrigine]   DECIMAL (10)    NOT NULL,
    [IdRigaOrigine]    DECIMAL (10)    NOT NULL,
    [TipoOrigine]      VARCHAR (1)     NOT NULL,
    [StatoValutazione] VARCHAR (2)     NOT NULL,
    [CodArticolo]      VARCHAR (50)    NULL,
    [Quantita]         DECIMAL (19, 6) CONSTRAINT [DF__ALD_tempS__Quant__11EDAA9B] DEFAULT ((0)) NULL,
    [ValUnitario]      DECIMAL (19, 6) CONSTRAINT [DF__ALD_tempS__ValUn__12E1CED4] DEFAULT ((0)) NULL,
    [TotNettoEuro]     DECIMAL (19, 6) CONSTRAINT [DF__ALD_tempS__TotNe__13D5F30D] DEFAULT ((0)) NULL,
    [TotNettoEuroRes]  DECIMAL (19, 6) CONSTRAINT [DF__ALD_tempS__TotNe__14CA1746] DEFAULT ((0)) NULL,
    [UtenteModifica]   VARCHAR (25)    NOT NULL,
    [DataModifica]     SMALLDATETIME   NOT NULL,
    [IdImpegnoOrigine] DECIMAL (10)    CONSTRAINT [DF__ALD_tempS__IdImp__5A686B87] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_ALD_tempStpAnalisiRedditivitaCommContDettAnalisi] PRIMARY KEY CLUSTERED ([IdAnalisi] ASC, [CodCommessa] ASC, [IdTestaOrigine] ASC, [IdRigaOrigine] ASC, [TipoOrigine] ASC, [UtenteModifica] ASC, [IdImpegnoOrigine] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_tempStpAnalisiRedditivitaCommContDettAnalisi] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_tempStpAnalisiRedditivitaCommContDettAnalisi] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_tempStpAnalisiRedditivitaCommContDettAnalisi] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_tempStpAnalisiRedditivitaCommContDettAnalisi] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_tempStpAnalisiRedditivitaCommContDettAnalisi] TO [Metodo98]
    AS [dbo];

