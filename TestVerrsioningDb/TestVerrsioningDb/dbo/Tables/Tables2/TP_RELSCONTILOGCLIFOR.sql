﻿CREATE TABLE [dbo].[TP_RELSCONTILOGCLIFOR] (
    [CODCLIFOR]      VARCHAR (7)  NOT NULL,
    [PROGSCONTO]     DECIMAL (18) NOT NULL,
    [CONTRATTO]      DECIMAL (9)  NOT NULL,
    [DESTDIVMERCI]   DECIMAL (5)  NOT NULL,
    [UtenteModifica] VARCHAR (25) NOT NULL,
    [DataModifica]   DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([CODCLIFOR] ASC, [PROGSCONTO] ASC, [CONTRATTO] ASC, [DESTDIVMERCI] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_RELSCONTILOGCLIFOR] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_RELSCONTILOGCLIFOR] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_RELSCONTILOGCLIFOR] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_RELSCONTILOGCLIFOR] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_RELSCONTILOGCLIFOR] TO [Metodo98]
    AS [dbo];
