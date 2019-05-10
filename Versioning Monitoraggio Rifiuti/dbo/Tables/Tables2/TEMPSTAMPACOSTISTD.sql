﻿CREATE TABLE [dbo].[TEMPSTAMPACOSTISTD] (
    [NRTERMINALE]         SMALLINT        NOT NULL,
    [PROGRESSIVO]         DECIMAL (10)    NOT NULL,
    [IDCOSTO]             VARCHAR (10)    NULL,
    [DESCRIZIONE]         VARCHAR (80)    NULL,
    [DATACALCOLO]         DATETIME        NULL,
    [ARTICOLO]            VARCHAR (50)    NULL,
    [UMRIF]               VARCHAR (3)     NOT NULL,
    [VERSIONEDBA]         VARCHAR (10)    NULL,
    [VERSIONECICLO]       VARCHAR (10)    NULL,
    [IDDISTINTA]          DECIMAL (10)    NULL,
    [IDCICLO]             DECIMAL (10)    NULL,
    [CP_MATERIALE]        DECIMAL (19, 6) DEFAULT (0) NULL,
    [CP_LAVINTERNA]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [CP_LAVESTERNA]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [CP_INDVARIABILE]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [CP_INDFISSO]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [CA_MATERIALE]        DECIMAL (19, 6) DEFAULT (0) NULL,
    [CA_LAVINTERNA]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [CA_LAVESTERNA]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [CA_INDVARIABILE]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [CA_INDFISSO]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [CP_MATERIALEEURO]    DECIMAL (19, 6) DEFAULT (0) NULL,
    [CP_LAVINTERNAEURO]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [CP_LAVESTERNAEURO]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [CP_INDVARIABILEEURO] DECIMAL (19, 6) DEFAULT (0) NULL,
    [CP_INDFISSOEURO]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [CA_MATERIALEEURO]    DECIMAL (19, 6) DEFAULT (0) NULL,
    [CA_LAVINTERNAEURO]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [CA_LAVESTERNAEURO]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [CA_INDVARIABILEEURO] DECIMAL (19, 6) DEFAULT (0) NULL,
    [CA_INDFISSOEURO]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [UTENTEMODIFICA]      VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]        DATETIME        NOT NULL,
    CONSTRAINT [PK_TEMPSTAMPACOSTISTD] PRIMARY KEY CLUSTERED ([NRTERMINALE] ASC, [PROGRESSIVO] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TEMPSTAMPACOSTISTD] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TEMPSTAMPACOSTISTD] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TEMPSTAMPACOSTISTD] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TEMPSTAMPACOSTISTD] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TEMPSTAMPACOSTISTD] TO [Metodo98]
    AS [dbo];

