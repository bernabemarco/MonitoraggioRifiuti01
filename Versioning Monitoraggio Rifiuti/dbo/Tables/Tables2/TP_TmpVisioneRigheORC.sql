CREATE TABLE [dbo].[TP_TmpVisioneRigheORC] (
    [IDSESSIONE]       DECIMAL (5)     DEFAULT (0) NOT NULL,
    [NRRIGA]           INT             DEFAULT (0) NOT NULL,
    [CodArticolo]      VARCHAR (50)    DEFAULT ('') NOT NULL,
    [DescrArticolo]    VARCHAR (80)    DEFAULT ('') NOT NULL,
    [GRUPPO]           DECIMAL (5)     DEFAULT (0) NOT NULL,
    [DESCGRP]          VARCHAR (80)    DEFAULT ('') NOT NULL,
    [CATEGORIA]        DECIMAL (5)     DEFAULT (0) NOT NULL,
    [DESCCAT]          VARCHAR (80)    DEFAULT ('') NOT NULL,
    [CODCATEGORIASTAT] DECIMAL (5)     DEFAULT (0) NOT NULL,
    [DESCCATSTAT]      VARCHAR (80)    DEFAULT ('') NOT NULL,
    [UMGEST]           VARCHAR (3)     DEFAULT ('') NOT NULL,
    [QTAGEST]          DECIMAL (19, 6) DEFAULT (0) NOT NULL,
    [TOTNETTORIGA]     DECIMAL (19, 6) DEFAULT (0) NOT NULL,
    [TOTNETTORIGAEURO] DECIMAL (19, 6) DEFAULT (0) NOT NULL,
    [UTENTEMODIFICA]   VARCHAR (25)    DEFAULT ('') NOT NULL,
    [DATAMODIFICA]     DATETIME        NOT NULL,
    [TIPORIGA]         CHAR (1)        NULL,
    [PREZZOUNIT]       DECIMAL (19, 6) NULL,
    [PREZZOUNITEURO]   DECIMAL (19, 6) NULL,
    [SCONTO]           VARCHAR (20)    NULL,
    [PROMOZIONE]       VARCHAR (50)    NULL,
    [ESPOSITORE]       SMALLINT        NULL,
    [SCONTIESTESI]     VARCHAR (50)    NULL,
    [NOTE]             VARCHAR (100)   NULL,
    CONSTRAINT [PK_TP_TmpVisioneRigheORC] PRIMARY KEY CLUSTERED ([IDSESSIONE] ASC, [NRRIGA] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_TmpVisioneRigheORC] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_TmpVisioneRigheORC] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_TmpVisioneRigheORC] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_TmpVisioneRigheORC] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_TmpVisioneRigheORC] TO [Metodo98]
    AS [dbo];

