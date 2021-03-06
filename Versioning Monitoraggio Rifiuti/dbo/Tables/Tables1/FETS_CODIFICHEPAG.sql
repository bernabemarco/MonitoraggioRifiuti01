﻿CREATE TABLE [dbo].[FETS_CODIFICHEPAG] (
    [TIPOCICLO]      SMALLINT     NOT NULL,
    [EFFETTO]        NUMERIC (5)  NOT NULL,
    [TIPOPAGB2B]     VARCHAR (10) NOT NULL,
    [MODPAGPA]       VARCHAR (10) NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    CONSTRAINT [PK_FETS_CODIFICHEPAG] PRIMARY KEY CLUSTERED ([TIPOCICLO] ASC, [EFFETTO] ASC, [TIPOPAGB2B] ASC, [MODPAGPA] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FETS_CODIFICHEPAG] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FETS_CODIFICHEPAG] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FETS_CODIFICHEPAG] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FETS_CODIFICHEPAG] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FETS_CODIFICHEPAG] TO [Metodo98]
    AS [dbo];

