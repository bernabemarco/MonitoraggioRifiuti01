CREATE TABLE [dbo].[Biri_StatoRapportiService] (
    [ID]             INT           IDENTITY (1, 1) NOT NULL,
    [datainserted]   DATETIME      DEFAULT (getdate()) NULL,
    [CurrentUser]    VARCHAR (900) NULL,
    [IDRAPPORTO]     VARCHAR (14)  NOT NULL,
    [STATO]          CHAR (1)      NULL,
    [UTENTEMODIFICA] VARCHAR (25)  NULL,
    [DATAMODIFICA]   DATETIME      NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC) WITH (PAD_INDEX = ON, IGNORE_DUP_KEY = ON)
);

