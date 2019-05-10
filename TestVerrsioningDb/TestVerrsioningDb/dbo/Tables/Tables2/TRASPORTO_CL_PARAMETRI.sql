﻿CREATE TABLE [dbo].[TRASPORTO_CL_PARAMETRI] (
    [PROGRESSIVO]    DECIMAL (18) NOT NULL,
    [UMTOTALEQTA]    VARCHAR (3)  NOT NULL,
    [CODCONTATORE]   DECIMAL (5)  NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TRASPORTO_CL_PARAMETRI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TRASPORTO_CL_PARAMETRI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TRASPORTO_CL_PARAMETRI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TRASPORTO_CL_PARAMETRI] TO [Metodo98]
    AS [dbo];

