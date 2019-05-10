﻿CREATE TABLE [dbo].[TP_ORF_EXTRAFOR] (
    [TOEF_CODARTICOLO]  VARCHAR (50) NOT NULL,
    [TOEF_CODFORNITORE] VARCHAR (7)  NOT NULL,
    PRIMARY KEY CLUSTERED ([TOEF_CODARTICOLO] ASC, [TOEF_CODFORNITORE] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_ORF_EXTRAFOR] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_ORF_EXTRAFOR] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_ORF_EXTRAFOR] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_ORF_EXTRAFOR] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_ORF_EXTRAFOR] TO [Metodo98]
    AS [dbo];

