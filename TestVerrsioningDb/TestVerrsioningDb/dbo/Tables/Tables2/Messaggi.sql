CREATE TABLE [dbo].[Messaggi] (
    [MesgCSer]    INT           IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [MesgCTipo]   VARCHAR (10)  NULL,
    [MesgCMesg]   VARCHAR (10)  NULL,
    [MesgISysUte] VARCHAR (3)   CONSTRAINT [MesgISysUtedflt] DEFAULT ('') NOT NULL,
    [MesgDMesg]   VARCHAR (255) NULL,
    [MesgNLiv]    INT           NULL,
    [MesgModif]   VARCHAR (3)   CONSTRAINT [MesgModifdflt] DEFAULT ('') NOT NULL,
    CONSTRAINT [MesgCSer] PRIMARY KEY CLUSTERED ([MesgCSer] ASC)
);

