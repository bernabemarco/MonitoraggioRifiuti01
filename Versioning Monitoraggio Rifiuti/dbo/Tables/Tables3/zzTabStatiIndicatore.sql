CREATE TABLE [dbo].[zzTabStatiIndicatore] (
    [StatoIndicatore]   VARCHAR (1)   NOT NULL,
    [Descrizione]       VARCHAR (100) NOT NULL,
    [UtenteModifica]    VARCHAR (25)  NOT NULL,
    [DataModifica]      DATETIME      NOT NULL,
    [DescrizioneColore] VARCHAR (100) CONSTRAINT [DF_zzTabStatiIndicatore_DescrizioneColore] DEFAULT ('') NOT NULL,
    [CodiceColore]      INT           CONSTRAINT [DF_zzTabStatiIndicatore_CodiceColore] DEFAULT ((0)) NOT NULL,
    [RGB]               VARCHAR (20)  CONSTRAINT [DF_zzTabStatiIndicatore_RGB] DEFAULT ('0,0,0') NOT NULL,
    CONSTRAINT [PK_zzTabStatiIndicatore] PRIMARY KEY CLUSTERED ([StatoIndicatore] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[zzTabStatiIndicatore] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[zzTabStatiIndicatore] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[zzTabStatiIndicatore] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[zzTabStatiIndicatore] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[zzTabStatiIndicatore] TO [Metodo98]
    AS [dbo];

