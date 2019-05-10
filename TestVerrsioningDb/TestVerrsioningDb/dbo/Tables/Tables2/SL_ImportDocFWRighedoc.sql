CREATE TABLE [dbo].[SL_ImportDocFWRighedoc] (
    [IdTesta]         INT          NOT NULL,
    [IdRiga]          INT          NOT NULL,
    [TipoRiga]        VARCHAR (1)  NULL,
    [CodArticolo]     VARCHAR (50) NULL,
    [DescrizioneRiga] VARCHAR (80) NULL,
    [Quantità]        FLOAT (53)   NULL,
    [PrezzoUnitario]  FLOAT (53)   NULL,
    [Sconto]          FLOAT (53)   NULL,
    [Provv1]          FLOAT (53)   NULL,
    [Provv2]          FLOAT (53)   NULL,
    [Provv3]          FLOAT (53)   NULL,
    [UTENTEMODIFICA]  VARCHAR (25) NOT NULL,
    [DATAMODIFICA]    DATETIME     NULL,
    CONSTRAINT [PK_SL_ImportDocFWRighedoc] PRIMARY KEY CLUSTERED ([IdTesta] ASC, [IdRiga] ASC, [UTENTEMODIFICA] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[SL_ImportDocFWRighedoc] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[SL_ImportDocFWRighedoc] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[SL_ImportDocFWRighedoc] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[SL_ImportDocFWRighedoc] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[SL_ImportDocFWRighedoc] TO [Metodo98]
    AS [dbo];

