﻿CREATE TABLE [dbo].[TEMPSTAMPADISPDAPIANIF] (
    [NOMEPIANIF]     VARCHAR (30)    NOT NULL,
    [PROG_ID]        NUMERIC (10)    NOT NULL,
    [SITUAZIONE]     NUMERIC (16, 6) NULL,
    [CODART]         VARCHAR (50)    NULL,
    [FLGCHECK]       SMALLINT        NULL,
    [GGSCOPERTO]     INT             NULL,
    [GIACENZA]       NUMERIC (16, 6) NULL,
    [ORDINELETTURA]  DECIMAL (10)    NULL,
    [FLGCONSIDERA]   SMALLINT        NULL,
    [TERMINALE]      SMALLINT        NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TEMPSTAMPADISPDAPIANIF] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TEMPSTAMPADISPDAPIANIF] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TEMPSTAMPADISPDAPIANIF] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TEMPSTAMPADISPDAPIANIF] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TEMPSTAMPADISPDAPIANIF] TO [Metodo98]
    AS [dbo];
