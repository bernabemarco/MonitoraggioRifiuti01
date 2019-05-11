﻿CREATE TABLE [dbo].[temp_GDETT_RAP_IDRANTI] (
    [IDIDRANTI]      NUMERIC (18)    NOT NULL,
    [IDCONTRATTO]    CHAR (13)       NOT NULL,
    [IDRAPPORTO]     CHAR (14)       NOT NULL,
    [FLAGVISIVA]     CHAR (1)        NULL,
    [FLAGCOL]        CHAR (1)        NULL,
    [FLAGPRESSIONE]  CHAR (1)        NULL,
    [DATA_COLL]      DATETIME        NULL,
    [PRESSIONE_DIN]  NUMERIC (10, 2) NULL,
    [PRESSIONE_STA]  NUMERIC (10, 2) NULL,
    [DATA_PROS_COLL] DATETIME        NULL,
    [DATA_ULT_MOD]   DATETIME        NULL,
    [UTENTE_ULT_MOD] NVARCHAR (50)   NULL,
    [IP_ULT_MOD]     NVARCHAR (50)   NULL,
    [NUOVARIGA]      CHAR (1)        NULL,
    [ELIMINATO]      CHAR (1)        NULL,
    CONSTRAINT [PK_temp_DETT_RAP_IDRANTI] PRIMARY KEY CLUSTERED ([IDIDRANTI] ASC, [IDCONTRATTO] ASC, [IDRAPPORTO] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[temp_GDETT_RAP_IDRANTI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[temp_GDETT_RAP_IDRANTI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[temp_GDETT_RAP_IDRANTI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[temp_GDETT_RAP_IDRANTI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[temp_GDETT_RAP_IDRANTI] TO [Metodo98]
    AS [dbo];
