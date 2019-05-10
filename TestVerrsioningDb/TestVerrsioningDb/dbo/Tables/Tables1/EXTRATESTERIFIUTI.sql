CREATE TABLE [dbo].[EXTRATESTERIFIUTI] (
    [IDTESTA]              DECIMAL (10)  NOT NULL,
    [UTENTEMODIFICA]       VARCHAR (25)  NULL,
    [DATAMODIFICA]         DATETIME      NULL,
    [NOTERIFIUTI]          VARCHAR (500) NULL,
    [CommessaService]      VARCHAR (50)  NULL,
    [RefRespCommessa]      SMALLINT      NULL,
    [DataCreazione]        DATETIME      DEFAULT (getdate()) NULL,
    [TIPORIFIUTO]          VARCHAR (100) NULL,
    [UTENTECREAZIONE]      VARCHAR (25)  NULL,
    [ID_Extratesterifiuti] INT           IDENTITY (1, 1) NOT NULL
);

