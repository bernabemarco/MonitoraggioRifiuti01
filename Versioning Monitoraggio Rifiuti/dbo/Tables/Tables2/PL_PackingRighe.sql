CREATE TABLE [dbo].[PL_PackingRighe] (
    [RifProgressivo]      DECIMAL (18)    NOT NULL,
    [NrRiga]              INT             NOT NULL,
    [Esercizio]           DECIMAL (5)     NOT NULL,
    [FlagRiga]            SMALLINT        NULL,
    [Posizione]           INT             NULL,
    [CodiceArticolo]      VARCHAR (50)    NOT NULL,
    [Um]                  VARCHAR (3)     NOT NULL,
    [Imballo]             VARCHAR (10)    NULL,
    [Qta]                 DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [ColliCfgImb]         DECIMAL (16)    DEFAULT ((0)) NULL,
    [Colli]               DECIMAL (16)    DEFAULT ((0)) NULL,
    [Da]                  DECIMAL (16)    DEFAULT ((0)) NULL,
    [A]                   DECIMAL (16)    DEFAULT ((0)) NULL,
    [PesoNetto]           DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [PesoLordo]           DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [Volume]              DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [Intra]               VARCHAR (8)     NULL,
    [NumEtichette]        NUMERIC (18)    DEFAULT ((0)) NULL,
    [RifProgConf]         DECIMAL (18)    DEFAULT ((0)) NULL,
    [RifRigaConf]         INT             DEFAULT ((0)) NULL,
    [ImbH]                DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [ImbL]                DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [ImbP]                DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [ImbPeso]             DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [Riferimento]         VARCHAR (50)    DEFAULT ('') NULL,
    [Note]                VARCHAR (200)   DEFAULT ('') NULL,
    [IdDesc]              DECIMAL (18)    NULL,
    [IDCFGIMB]            DECIMAL (18)    NULL,
    [IDTESTA]             DECIMAL (10)    DEFAULT ((0)) NULL,
    [IDRIGA]              INT             DEFAULT ((0)) NULL,
    [TIPORIGA]            CHAR (1)        DEFAULT ('') NULL,
    [SHIPPINGMARK]        VARCHAR (100)   DEFAULT ('') NULL,
    [DESCRIZIONEART]      VARCHAR (254)   DEFAULT ('') NULL,
    [NRRifPartita]        VARCHAR (15)    DEFAULT ('') NULL,
    [RifCommessa]         VARCHAR (30)    DEFAULT ('') NULL,
    [PesoLetto]           DECIMAL (16, 6) CONSTRAINT [DF_PL_PACKINGRIGHE_PESOLETTO] DEFAULT ((0)) NULL,
    [QtaOrigine]          DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [PesoUnitarioOrigine] DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [IsComposto]          SMALLINT        DEFAULT ((0)) NULL,
    [GstCompostoMan]      SMALLINT        DEFAULT ((0)) NULL,
    [IsComponente]        SMALLINT        DEFAULT ((0)) NULL,
    [BkColorComponente]   INT             DEFAULT ((0)) NULL,
    [CodArtPadre]         VARCHAR (50)    DEFAULT ('') NULL,
    [PrelevatoDBA]        SMALLINT        DEFAULT ((0)) NULL,
    [VersioneDBA]         VARCHAR (10)    DEFAULT ('') NULL,
    [IDRigaPadre]         INT             DEFAULT ((0)) NULL,
    [RigaPrelevata]       SMALLINT        DEFAULT ((0)) NULL,
    [UTENTEMODIFICA]      VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]        DATETIME        NOT NULL,
    CONSTRAINT [PK_PL_PackingRighe] PRIMARY KEY CLUSTERED ([RifProgressivo] ASC, [NrRiga] ASC)
);


GO


CREATE TRIGGER TI_PL_PackingRighe ON PL_PackingRighe
FOR INSERT
AS

    Declare @progrPL        decimal(18,0)
    Declare @tipo_prelievo  smallint 
    Declare @idtesta        decimal(10,0)
    Declare @idriga         int
    Declare @qtaorigine     decimal(16,6)

    Begin
        Declare CurI Cursor For

            Select  PLT.progressivo,PLT.tipo_prelievo,I.idtesta,I.idriga,I.qtaorigine 
            From inserted I
            inner join pl_packingtesta PLT on I.rifprogressivo= PLT.progressivo 
            where I.IsComponente=0 and I.idtesta > 0 and I.idriga > 0   

            Open CurI
            Fetch Next From CurI Into @progrPL,@tipo_prelievo,@idtesta,@idriga,@qtaorigine

                While @@fetch_status = 0
                       Begin 
                           If @tipo_prelievo = 0 
                                -- Caso Prelievo Da Doc.
                                Begin
                                    Update RigheDocumenti 
                                    Set QtaPLRes = QtaPLRes+@qtaorigine Where idtesta=@idtesta and idriga=@idriga
                                End
                           Else
                                -- Caso Prelievo Da Miss.
                                Begin
                                    Update TabRigheDocumentiMiss 
                                    Set PROGRPACKING = @progrPL 
                                    Where idtesta=@idtesta and idriga=@idriga
                                End
                           Fetch Next From CurI Into @progrPL,@tipo_prelievo,@idtesta,@idriga,@qtaorigine
                       End

            Close CurI
            Deallocate CurI
    End


GO
GRANT DELETE
    ON OBJECT::[dbo].[PL_PackingRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[PL_PackingRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[PL_PackingRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[PL_PackingRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[PL_PackingRighe] TO [Metodo98]
    AS [dbo];

