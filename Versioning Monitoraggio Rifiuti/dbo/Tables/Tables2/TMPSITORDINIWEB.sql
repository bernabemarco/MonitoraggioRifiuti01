﻿CREATE TABLE [dbo].[TMPSITORDINIWEB] (
    [ID_ORDINE]      DECIMAL (10)    NOT NULL,
    [ID_RIGA]        DECIMAL (10)    NOT NULL,
    [DATADOC]        DATETIME        NOT NULL,
    [E_MAIL]         VARCHAR (50)    NOT NULL,
    [CODART]         VARCHAR (50)    NULL,
    [DESCRIZIONE]    VARCHAR (255)   NULL,
    [BARCODE]        VARCHAR (50)    NULL,
    [QTAORDINE]      DECIMAL (16, 6) NULL,
    [QTABOLLATA]     DECIMAL (16, 6) NULL,
    [QTAFATTURATA]   DECIMAL (16, 6) NULL,
    [PREZZOLORDO]    DECIMAL (19, 6) NULL,
    [PREZZONETTO]    DECIMAL (19, 6) NULL,
    [DATACONSEGNA]   DATETIME        NOT NULL,
    [SCONTO]         DECIMAL (8, 5)  NULL,
    [TOTNETTORIGA]   DECIMAL (19, 6) NULL,
    [RIFWEB]         VARCHAR (50)    NULL,
    [SPEDIZIONIERE]  VARCHAR (255)   NULL,
    [PAGAMENTO]      VARCHAR (255)   NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL,
    [SCONTIESTESI]   VARCHAR (20)    NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TMPSITORDINIWEB] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TMPSITORDINIWEB] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TMPSITORDINIWEB] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TMPSITORDINIWEB] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TMPSITORDINIWEB] TO [Metodo98]
    AS [dbo];
