CREATE TABLE [dbo].[PackingRighe] (
    [RifProgressivo]        DECIMAL (18)    NOT NULL,
    [NrRiga]                INT             NOT NULL,
    [Esercizio]             DECIMAL (5)     NOT NULL,
    [FlagRiga]              SMALLINT        NULL,
    [Posizione]             INT             NULL,
    [CodiceArticolo]        VARCHAR (50)    NULL,
    [CodiceRaggruppamento]  DECIMAL (18)    NULL,
    [DescrizioneAggiuntiva] VARCHAR (50)    NULL,
    [Um]                    VARCHAR (3)     NULL,
    [Imballo]               VARCHAR (10)    NULL,
    [Qta]                   DECIMAL (16, 6) NULL,
    [Colli]                 DECIMAL (16)    NULL,
    [Da]                    DECIMAL (16)    NULL,
    [A]                     DECIMAL (16)    NULL,
    [PesoNetto]             DECIMAL (16, 6) NULL,
    [PesoLordo]             DECIMAL (16, 6) NULL,
    [Volume]                DECIMAL (16, 6) NULL,
    [Intra]                 VARCHAR (8)     NULL,
    [NumEtichette]          NUMERIC (18)    NULL,
    [TipoRiga]              CHAR (1)        NOT NULL,
    [UTENTEMODIFICA]        VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]          DATETIME        NOT NULL,
    [RifProgConf]           DECIMAL (18)    NULL,
    [RifRigaConf]           INT             NULL,
    [ImbH]                  DECIMAL (16, 6) NULL,
    [ImbL]                  DECIMAL (16, 6) NULL,
    [ImbP]                  DECIMAL (16, 6) NULL,
    [ImbPeso]               DECIMAL (16, 6) NULL,
    [Riferimento]           VARCHAR (50)    NULL,
    [Note]                  VARCHAR (200)   NULL,
    [IDCFGIMB]              DECIMAL (18)    CONSTRAINT [DF_PackingRighe_IDCFGIMB] DEFAULT (0) NULL,
    [IdDesc]                DECIMAL (18)    NULL,
    [IDTESTA]               DECIMAL (10)    NULL,
    [IDRIGA]                INT             NULL,
    [SHIPPINGMARK]          VARCHAR (100)   NULL,
    [DESCRIZIONEART]        VARCHAR (80)    DEFAULT ('') NULL,
    CONSTRAINT [PK_PackingRighe] PRIMARY KEY CLUSTERED ([RifProgressivo] ASC, [NrRiga] ASC) WITH (FILLFACTOR = 90)
);


GO

CREATE TRIGGER IRIGHEPL ON PackingRighe
FOR INSERT
AS

	Declare @idtesta decimal(10,0)
	Declare @idriga int
	Declare @qta decimal(16,6)

	Begin
		Declare CurI Cursor For

			Select case when IDTESTA is null Then 0 else IDTESTA End As IDTESTA,
			           case when IDRIGA is null then 0 else IDRIGA End As IDRIGA,
			           case when QTA is null then 0 else QTA End As QTA From inserted

			Open CurI
			Fetch Next From CurI Into @idtesta,@idriga,@qta

				While @@fetch_status = 0

					Begin

						Update RigheDocumenti Set QtaPLRes = QtaPLRes+@qta Where idtesta=@idtesta and idriga=@idriga
						Fetch Next From CurI Into @idtesta,@idriga,@qta

					End

			Close CurI
			Deallocate CurI
	End







GO

CREATE TRIGGER DRIGHEPL ON PackingRighe
FOR DELETE 
AS

	Declare @idtesta decimal(10,0)
	Declare @idriga int
	Declare @qta decimal(16,6)

	Begin
		Declare CurI Cursor For

			Select case when IDTESTA is null Then 0 else IDTESTA End As IDTESTA,
			           case when IDRIGA is null then 0 else IDRIGA End As IDRIGA,
			           case when QTA is null then 0 else QTA End As QTA From deleted

			Open CurI
			Fetch Next From CurI Into @idtesta,@idriga,@qta

				While @@fetch_status = 0

					Begin

						Update RigheDocumenti Set QtaPLRes = QtaPLRes-@qta Where idtesta=@idtesta and idriga=@idriga
						Fetch Next From CurI Into @idtesta,@idriga,@qta

					End

			Close CurI
			Deallocate CurI
	End


GO
GRANT DELETE
    ON OBJECT::[dbo].[PackingRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[PackingRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[PackingRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[PackingRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[PackingRighe] TO [Metodo98]
    AS [dbo];

