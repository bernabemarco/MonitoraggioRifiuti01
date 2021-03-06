﻿CREATE TABLE [dbo].[FIDOCLIENTI] (
    [CODCLIENTE]     VARCHAR (7)     NOT NULL,
    [ESITO0]         DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [ESITO0EURO]     DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [ESITO1]         DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [ESITO1EURO]     DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [ESITO2]         DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [ESITO2EURO]     DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [ESITO3]         DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [ESITO3EURO]     DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [ESITO4]         DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [ESITO4EURO]     DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [BOLLE]          DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [BOLLEEURO]      DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [FATTURE]        DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [FATTUREEURO]    DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [ORDINI]         DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [ORDINIEURO]     DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [NOTAACCR]       DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [NOTAACCREURO]   DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [ALTRO]          DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [ALTROEURO]      DECIMAL (19, 4) DEFAULT (0) NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL,
    CONSTRAINT [PK_FIDOCLIENTI] PRIMARY KEY CLUSTERED ([CODCLIENTE] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FIDOCLIENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FIDOCLIENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FIDOCLIENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FIDOCLIENTI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FIDOCLIENTI] TO [Metodo98]
    AS [dbo];

