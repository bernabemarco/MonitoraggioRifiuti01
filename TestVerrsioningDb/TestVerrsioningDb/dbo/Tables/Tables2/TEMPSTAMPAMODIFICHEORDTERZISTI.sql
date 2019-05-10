﻿CREATE TABLE [dbo].[TEMPSTAMPAMODIFICHEORDTERZISTI] (
    [IDSESSIONE]       INT             NOT NULL,
    [IDTESTADOC]       DECIMAL (10)    NOT NULL,
    [IDRIGADOC]        INT             NOT NULL,
    [CODART]           VARCHAR (50)    NULL,
    [DESCRIZIONEART]   VARCHAR (255)   NULL,
    [QTAGESTIONE]      DECIMAL (16, 6) NULL,
    [UMGESTIONE]       VARCHAR (3)     NULL,
    [NUOVAQTAGESTIONE] DECIMAL (16, 6) NULL,
    [AZIONE]           SMALLINT        NULL,
    PRIMARY KEY CLUSTERED ([IDSESSIONE] ASC, [IDTESTADOC] ASC, [IDRIGADOC] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TEMPSTAMPAMODIFICHEORDTERZISTI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TEMPSTAMPAMODIFICHEORDTERZISTI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TEMPSTAMPAMODIFICHEORDTERZISTI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TEMPSTAMPAMODIFICHEORDTERZISTI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TEMPSTAMPAMODIFICHEORDTERZISTI] TO [Metodo98]
    AS [dbo];

