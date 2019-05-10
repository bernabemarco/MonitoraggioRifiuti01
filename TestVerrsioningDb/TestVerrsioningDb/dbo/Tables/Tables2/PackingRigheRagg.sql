CREATE TABLE [dbo].[PackingRigheRagg] (
    [RifProgressivo]    DECIMAL (18)    NOT NULL,
    [TipoRiga]          CHAR (1)        NOT NULL,
    [Esercizio]         DECIMAL (5)     NOT NULL,
    [CodRaggruppamento] NUMERIC (18)    NOT NULL,
    [Articolo]          VARCHAR (50)    NULL,
    [Raggruppamento]    NUMERIC (18)    NULL,
    [Um]                VARCHAR (3)     NULL,
    [Imballo]           VARCHAR (10)    NULL,
    [ImballoPeso]       DECIMAL (16, 6) NULL,
    [ImballoAltezza]    DECIMAL (16, 6) NULL,
    [ImballoLunghezza]  DECIMAL (16, 6) NULL,
    [ImballoProfondita] DECIMAL (16, 6) NULL,
    [ImballoQta]        DECIMAL (16, 6) NULL,
    [Qta]               DECIMAL (16, 6) NULL,
    [Colli]             DECIMAL (16)    NULL,
    [Da]                DECIMAL (16)    NULL,
    [A]                 DECIMAL (16)    NULL,
    [PesoNetto]         DECIMAL (16, 6) NULL,
    [PesoLordo]         DECIMAL (16, 6) NULL,
    [Volume]            DECIMAL (16, 6) NULL,
    [Intra]             VARCHAR (8)     NULL,
    [NumEtichette]      NUMERIC (18)    NULL,
    [TipologiaRiga]     CHAR (1)        NULL,
    [UTENTEMODIFICA]    VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]      DATETIME        NOT NULL,
    [NrRiga]            INT             NULL,
    [RifProgConf]       DECIMAL (18)    NULL,
    [RifRigaConf]       INT             NULL,
    [RifxCanc]          INT             NULL,
    [Riferimento]       VARCHAR (50)    NULL,
    [IDCFGIMB]          DECIMAL (18)    CONSTRAINT [DF_PackingRigheRagg_IDCFGIMB] DEFAULT (0) NULL,
    [IdDesc]            DECIMAL (18)    NULL,
    [IDTESTA]           DECIMAL (10)    NULL,
    [IDRIGA]            INT             NULL,
    [SHIPPINGMARK]      VARCHAR (100)   NULL,
    [DESCRIZIONEART]    VARCHAR (80)    DEFAULT ('') NULL
);


GO



CREATE TRIGGER DRIGHERAGGPL ON PackingRigheRagg
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

CREATE TRIGGER IRIGHERAGGPL ON PackingRigheRagg
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
GRANT DELETE
    ON OBJECT::[dbo].[PackingRigheRagg] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[PackingRigheRagg] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[PackingRigheRagg] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[PackingRigheRagg] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[PackingRigheRagg] TO [Metodo98]
    AS [dbo];

