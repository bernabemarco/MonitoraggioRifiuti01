﻿CREATE TABLE [dbo].[CONS_ALD_ZPS_SERVIZI] (
    [IdServizio]     VARCHAR (2)  NOT NULL,
    [Descrizione]    VARCHAR (80) NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    [IdSeco]         VARCHAR (4)  NULL,
    CONSTRAINT [PK_CONS_ALD_ZPS_SERVIZI] PRIMARY KEY CLUSTERED ([IdServizio] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CONS_ALD_ZPS_SERVIZI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CONS_ALD_ZPS_SERVIZI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CONS_ALD_ZPS_SERVIZI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CONS_ALD_ZPS_SERVIZI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CONS_ALD_ZPS_SERVIZI] TO [Metodo98]
    AS [dbo];

