﻿CREATE TABLE [dbo].[TABLEGAMIPROGPROD] (
    [NOMEPIANIF]      VARCHAR (30) NOT NULL,
    [IDPROPOSTA]      SMALLINT     NOT NULL,
    [TIPOLEGAME]      SMALLINT     NULL,
    [NRECSERVENTE]    NUMERIC (10) NULL,
    [TIPOSERVENTE]    SMALLINT     NULL,
    [IDTESTASERVENTE] NUMERIC (10) NULL,
    [IDRIGASERVENTE]  INT          NULL,
    [NRECSERVITO]     NUMERIC (10) NULL,
    [TIPOSERVITO]     SMALLINT     NULL,
    [IDTESTASERVITO]  NUMERIC (10) NULL,
    [IDRIGASERVITO]   INT          NULL,
    [IDPROGRSERVITO]  INT          NULL,
    [EMESSOLEGAME]    SMALLINT     DEFAULT (0) NULL,
    [UTENTEMODIFICA]  VARCHAR (25) NOT NULL,
    [DATAMODIFICA]    DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([NOMEPIANIF] ASC, [IDPROPOSTA] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TABLEGAMIPROGPROD] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TABLEGAMIPROGPROD] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TABLEGAMIPROGPROD] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TABLEGAMIPROGPROD] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TABLEGAMIPROGPROD] TO [Metodo98]
    AS [dbo];
