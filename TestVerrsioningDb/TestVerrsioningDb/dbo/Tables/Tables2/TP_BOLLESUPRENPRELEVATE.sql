﻿CREATE TABLE [dbo].[TP_BOLLESUPRENPRELEVATE] (
    [IDTestaDocCar]  DECIMAL (10) NOT NULL,
    [IDRigaDocCar]   INT          NOT NULL,
    [IDTestaE]       DECIMAL (10) NOT NULL,
    [IDRigaE]        INT          NOT NULL,
    [IDTestaO]       DECIMAL (10) NOT NULL,
    [IDRigaO]        INT          NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    CONSTRAINT [PK_TP_BOLLESUPRENPRELEVATE] PRIMARY KEY CLUSTERED ([IDTestaDocCar] ASC, [IDRigaDocCar] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_BOLLESUPRENPRELEVATE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_BOLLESUPRENPRELEVATE] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_BOLLESUPRENPRELEVATE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_BOLLESUPRENPRELEVATE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_BOLLESUPRENPRELEVATE] TO [Metodo98]
    AS [dbo];

