﻿CREATE TABLE [dbo].[CONTRATTIAV_PROGRESSIVOCONDIZIONATIDICUI] (
    [RIFPROGRESSIVO]   DECIMAL (10)    DEFAULT (0) NOT NULL,
    [CONTRATTO]        DECIMAL (10)    DEFAULT (0) NOT NULL,
    [RIFCONDIZIONATO]  DECIMAL (10)    DEFAULT (0) NOT NULL,
    [RIGACONDIZIONATO] DECIMAL (10)    DEFAULT (0) NOT NULL,
    [RIFDICUI]         DECIMAL (10)    DEFAULT (0) NOT NULL,
    [CONSUNTIVOQTA]    DECIMAL (19, 6) DEFAULT (0) NOT NULL,
    [CONSUNTIVOVALORE] DECIMAL (19, 6) DEFAULT (0) NOT NULL,
    [UTENTEMODIFICA]   VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]     DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([RIFPROGRESSIVO] ASC, [CONTRATTO] ASC, [RIFCONDIZIONATO] ASC, [RIGACONDIZIONATO] ASC, [RIFDICUI] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CONTRATTIAV_PROGRESSIVOCONDIZIONATIDICUI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CONTRATTIAV_PROGRESSIVOCONDIZIONATIDICUI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CONTRATTIAV_PROGRESSIVOCONDIZIONATIDICUI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CONTRATTIAV_PROGRESSIVOCONDIZIONATIDICUI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CONTRATTIAV_PROGRESSIVOCONDIZIONATIDICUI] TO [Metodo98]
    AS [dbo];

