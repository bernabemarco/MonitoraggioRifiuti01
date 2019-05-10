﻿CREATE TABLE [dbo].[POSFILEDATIFATTURA] (
    [PROGRESSIVO]    DECIMAL (10) IDENTITY (1, 1) NOT NULL,
    [IDTESTADF]      DECIMAL (10) NOT NULL,
    [PROGFILEDF]     DECIMAL (10) NULL,
    [POSIZIONEDF]    SMALLINT     NULL,
    [PROGFILEANN]    DECIMAL (10) NULL,
    [PROGFILERETT]   DECIMAL (10) NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    CONSTRAINT [PK_POSFILEDATIFATTURA] PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC),
    CONSTRAINT [FK_POSFILEDATIFATTURA_PROGRESSIVO] FOREIGN KEY ([PROGFILEDF]) REFERENCES [dbo].[FILEDATIFATTURA] ([PROGRESSIVO]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[POSFILEDATIFATTURA] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[POSFILEDATIFATTURA] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[POSFILEDATIFATTURA] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[POSFILEDATIFATTURA] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[POSFILEDATIFATTURA] TO [Metodo98]
    AS [dbo];

