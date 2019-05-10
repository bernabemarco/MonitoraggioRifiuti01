CREATE TABLE [dbo].[EC_TabTracciati] (
    [Codice]               VARCHAR (10) NOT NULL,
    [Descrizione]          VARCHAR (50) NULL,
    [CodiceBanca]          VARCHAR (7)  NOT NULL,
    [PosizioneTipoRecord]  DECIMAL (5)  NULL,
    [LunghezzaTipoRecord]  DECIMAL (5)  NULL,
    [TipoRecordTestata]    VARCHAR (10) NULL,
    [TipoRecordCorpo]      VARCHAR (10) NULL,
    [TipoRecordPiede]      VARCHAR (10) NULL,
    [PosizioneABI]         DECIMAL (5)  NULL,
    [LunghezzaABI]         DECIMAL (5)  NULL,
    [PosizioneConto]       DECIMAL (5)  NULL,
    [LunghezzaConto]       DECIMAL (5)  NULL,
    [PosizioneDataOpBanca] DECIMAL (5)  NULL,
    [FormatoDataOpBanca]   VARCHAR (10) NULL,
    [PosizioneDataValuta]  DECIMAL (5)  NULL,
    [FormatoDataValuta]    VARCHAR (10) NULL,
    [PosizioneImporto]     DECIMAL (5)  NULL,
    [LunghezzaImporto]     DECIMAL (5)  NULL,
    [PosizioneSegno]       DECIMAL (5)  NULL,
    [LunghezzaSegno]       DECIMAL (5)  NULL,
    [SegnoDare]            VARCHAR (10) NULL,
    [SegnoAvere]           VARCHAR (10) NULL,
    [PosizioneCausale]     DECIMAL (5)  NULL,
    [LunghezzaCausale]     DECIMAL (5)  NULL,
    [CausaliABI]           SMALLINT     NULL,
    [PosizioneAssegno]     DECIMAL (5)  NULL,
    [LunghezzaAssegno]     DECIMAL (5)  NULL,
    [NumDec]               DECIMAL (5)  NULL,
    [SepDec]               VARCHAR (5)  NULL,
    [UTENTEMODIFICA]       VARCHAR (25) NOT NULL,
    [DATAMODIFICA]         DATETIME     NOT NULL,
    [ContoTesteRighe]      SMALLINT     DEFAULT ((0)) NULL,
    [ABITesteRighe]        SMALLINT     DEFAULT ((0)) NULL,
    [CAUSABITesteRighe]    SMALLINT     DEFAULT ((0)) NULL,
    CONSTRAINT [PK_EC_TabTracciati] PRIMARY KEY CLUSTERED ([Codice] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[EC_TabTracciati] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[EC_TabTracciati] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[EC_TabTracciati] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[EC_TabTracciati] TO [Metodo98]
    AS [dbo];

