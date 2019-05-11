﻿CREATE TABLE [dbo].[TP_PIANIFICAZIONE_RUB_ORC] (
    [IDRubrica] NUMERIC (18) NOT NULL,
    [IDGiorno]  SMALLINT     NOT NULL,
    [Ora]       DATETIME     NOT NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_PIANIFICAZIONE_RUB_ORC] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_PIANIFICAZIONE_RUB_ORC] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_PIANIFICAZIONE_RUB_ORC] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_PIANIFICAZIONE_RUB_ORC] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_PIANIFICAZIONE_RUB_ORC] TO [Metodo98]
    AS [dbo];
