﻿CREATE TABLE [dbo].[PARAMETRIAUTOMAZIONE] (
    [IDPARAMETRO]    VARCHAR (3)     NOT NULL,
    [DESCRIZIONE]    VARCHAR (80)    NULL,
    [TIPODOC]        VARCHAR (3)     NULL,
    [QTADEFAULT]     DECIMAL (16, 6) DEFAULT (0) NOT NULL,
    [CODTABELLA]     SMALLINT        NOT NULL,
    [CHK0]           SMALLINT        DEFAULT (0) NULL,
    [CHK1]           SMALLINT        DEFAULT (0) NULL,
    [CHK2]           SMALLINT        DEFAULT (0) NULL,
    [CHK3]           SMALLINT        DEFAULT (0) NULL,
    [CHK4]           SMALLINT        DEFAULT (0) NULL,
    [CHK5]           SMALLINT        DEFAULT (0) NULL,
    [CHK6]           SMALLINT        DEFAULT (0) NULL,
    [CHK7]           SMALLINT        DEFAULT (0) NULL,
    [CHK8]           SMALLINT        DEFAULT (0) NULL,
    [CHK9]           SMALLINT        DEFAULT (0) NULL,
    [CHK10]          SMALLINT        DEFAULT (0) NULL,
    [CHK11]          SMALLINT        DEFAULT (0) NULL,
    [CHK12]          SMALLINT        DEFAULT (0) NULL,
    [CHK13]          SMALLINT        DEFAULT (0) NULL,
    [CHK14]          SMALLINT        DEFAULT (0) NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL,
    [FILTROT]        VARCHAR (50)    NULL,
    [FILTROR]        VARCHAR (50)    NULL,
    [NonAcc]         SMALLINT        DEFAULT (0) NOT NULL,
    [Ordinamento]    SMALLINT        DEFAULT (0) NOT NULL,
    CONSTRAINT [PK_PARAMETRIAUTOMAZIONE] PRIMARY KEY CLUSTERED ([IDPARAMETRO] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [CKC_CHK0_PARAMETR] CHECK ([CHK0] = 0 or [CHK0] = 1),
    CONSTRAINT [CKC_CHK1_PARAMETR] CHECK ([CHK1] = 0 or [CHK1] = 1),
    CONSTRAINT [CKC_CHK10_PARAMETR] CHECK ([CHK10] = 0 or [CHK10] = 1),
    CONSTRAINT [CKC_CHK11_PARAMETR] CHECK ([CHK11] = 0 or [CHK11] = 1),
    CONSTRAINT [CKC_CHK12_PARAMETR] CHECK ([CHK12] = 0 or [CHK12] = 1),
    CONSTRAINT [CKC_CHK13_PARAMETR] CHECK ([CHK13] = 0 or [CHK13] = 1),
    CONSTRAINT [CKC_CHK14_PARAMETR] CHECK ([CHK14] = 0 or [CHK14] = 1),
    CONSTRAINT [CKC_CHK2_PARAMETR] CHECK ([CHK2] = 0 or [CHK2] = 1),
    CONSTRAINT [CKC_CHK3_PARAMETR] CHECK ([CHK3] = 0 or [CHK3] = 1),
    CONSTRAINT [CKC_CHK4_PARAMETR] CHECK ([CHK4] = 0 or [CHK4] = 1),
    CONSTRAINT [CKC_CHK5_PARAMETR] CHECK ([CHK5] = 0 or [CHK5] = 1),
    CONSTRAINT [CKC_CHK6_PARAMETR] CHECK ([CHK6] = 0 or [CHK6] = 1),
    CONSTRAINT [CKC_CHK7_PARAMETR] CHECK ([CHK7] = 0 or [CHK7] = 1),
    CONSTRAINT [CKC_CHK8_PARAMETR] CHECK ([CHK8] = 0 or [CHK8] = 1),
    CONSTRAINT [CKC_CHK9_PARAMETR] CHECK ([CHK9] = 0 or [CHK9] = 1)
);


GO
CREATE NONCLUSTERED INDEX [DSCPARAMETRIAUTOM]
    ON [dbo].[PARAMETRIAUTOMAZIONE]([DESCRIZIONE] ASC) WITH (FILLFACTOR = 90);


GO
GRANT DELETE
    ON OBJECT::[dbo].[PARAMETRIAUTOMAZIONE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[PARAMETRIAUTOMAZIONE] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[PARAMETRIAUTOMAZIONE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[PARAMETRIAUTOMAZIONE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[PARAMETRIAUTOMAZIONE] TO [Metodo98]
    AS [dbo];

