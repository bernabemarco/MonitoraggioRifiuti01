﻿CREATE TABLE [dbo].[TEMPSTAMPAINDROT] (
    [NRTERMINALE]    SMALLINT        NOT NULL,
    [CODART]         VARCHAR (50)    NOT NULL,
    [CODUM]          VARCHAR (3)     NOT NULL,
    [CODDEPOSITO]    VARCHAR (10)    NOT NULL,
    [GIACINIZIALE]   DECIMAL (16, 6) NULL,
    [CONSUMO]        DECIMAL (16, 6) NULL,
    [SCORTAMEDIA]    DECIMAL (16, 6) NULL,
    [INDROTQTA]      DECIMAL (16, 6) NULL,
    [PREZZOMEDIO]    DECIMAL (16, 6) NULL,
    [INDROTPREZZO]   DECIMAL (16, 6) NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL,
    CONSTRAINT [PK_TEMPSTAMPAINDROT] PRIMARY KEY CLUSTERED ([NRTERMINALE] ASC, [CODART] ASC, [CODDEPOSITO] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TEMPSTAMPAINDROT] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TEMPSTAMPAINDROT] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TEMPSTAMPAINDROT] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TEMPSTAMPAINDROT] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TEMPSTAMPAINDROT] TO [Metodo98]
    AS [dbo];

