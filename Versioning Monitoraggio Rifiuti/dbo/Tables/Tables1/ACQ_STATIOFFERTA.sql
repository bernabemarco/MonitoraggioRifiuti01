﻿CREATE TABLE [dbo].[ACQ_STATIOFFERTA] (
    [RIFPROGRESSIVO] DECIMAL (10) NOT NULL,
    [RIFPROFILO]     VARCHAR (10) NOT NULL,
    [RIFRIGA]        INT          NOT NULL,
    [STATO]          SMALLINT     DEFAULT ((0)) NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    CONSTRAINT [PK__ACQ_STATIOFFERTA__2FD3133D] PRIMARY KEY CLUSTERED ([RIFPROGRESSIVO] ASC, [RIFPROFILO] ASC, [RIFRIGA] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ACQ_STATIOFFERTA] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ACQ_STATIOFFERTA] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ACQ_STATIOFFERTA] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ACQ_STATIOFFERTA] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ACQ_STATIOFFERTA] TO [Metodo98]
    AS [dbo];

