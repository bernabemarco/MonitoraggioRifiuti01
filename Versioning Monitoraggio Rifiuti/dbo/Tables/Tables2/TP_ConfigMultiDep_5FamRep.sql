﻿CREATE TABLE [dbo].[TP_ConfigMultiDep_5FamRep] (
    [idTesta]        DECIMAL (5)     NOT NULL,
    [IdRiga]         DECIMAL (5)     NOT NULL,
    [Posizione]      INT             NOT NULL,
    [FlagRiga]       SMALLINT        NULL,
    [CodFam]         DECIMAL (5)     NULL,
    [CodRep]         DECIMAL (5)     NULL,
    [ScortaMin]      NUMERIC (16, 6) NULL,
    [LottoRrd]       NUMERIC (16, 6) NULL,
    [UtenteModifica] VARCHAR (25)    NULL,
    [DataModifica]   DATETIME        NULL,
    CONSTRAINT [PK_TP_ConfigMultiDep_5FamRep] PRIMARY KEY CLUSTERED ([idTesta] ASC, [IdRiga] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_ConfigMultiDep_5FamRep] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_ConfigMultiDep_5FamRep] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_ConfigMultiDep_5FamRep] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_ConfigMultiDep_5FamRep] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_ConfigMultiDep_5FamRep] TO [Metodo98]
    AS [dbo];

