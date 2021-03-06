﻿CREATE TABLE [dbo].[MACROCATEGORIEE98] (
    [CODICE]         DECIMAL (5)  NOT NULL,
    [DESCRIZIONE]    VARCHAR (50) NULL,
    [PUBBLICA]       SMALLINT     DEFAULT (0) NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    [Descrizione1]   VARCHAR (50) NULL,
    [Descrizione2]   VARCHAR (50) NULL,
    [Descrizione3]   VARCHAR (50) NULL,
    [Descrizione4]   VARCHAR (50) NULL,
    [Descrizione5]   VARCHAR (50) NULL,
    [Descrizione6]   VARCHAR (50) NULL,
    [Descrizione7]   VARCHAR (50) NULL,
    [Descrizione8]   VARCHAR (50) NULL,
    [Descrizione9]   VARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([CODICE] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [CKC_PUBBLICA1] CHECK ([PUBBLICA] = 0 or [PUBBLICA] = 1)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[MACROCATEGORIEE98] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[MACROCATEGORIEE98] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[MACROCATEGORIEE98] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[MACROCATEGORIEE98] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[MACROCATEGORIEE98] TO [Metodo98]
    AS [dbo];

