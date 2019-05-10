CREATE TABLE [dbo].[Biri_ALD_tempStpAnalisiRedditivitaCommContDettAnalisi] (
    [IdAnalisi]        VARCHAR (30)    NOT NULL,
    [CodCommessa]      VARCHAR (30)    NOT NULL,
    [IdTestaOrigine]   DECIMAL (10)    NOT NULL,
    [IdRigaOrigine]    DECIMAL (10)    NOT NULL,
    [TipoOrigine]      VARCHAR (1)     NOT NULL,
    [StatoValutazione] VARCHAR (2)     NOT NULL,
    [CodArticolo]      VARCHAR (50)    NULL,
    [Quantita]         DECIMAL (19, 6) NULL,
    [ValUnitario]      DECIMAL (19, 6) NULL,
    [TotNettoEuro]     DECIMAL (19, 6) NULL,
    [TotNettoEuroRes]  DECIMAL (19, 6) NULL,
    [UtenteModifica]   VARCHAR (25)    NOT NULL,
    [DataModifica]     SMALLDATETIME   NOT NULL,
    [IdImpegnoOrigine] DECIMAL (10)    NOT NULL
);

