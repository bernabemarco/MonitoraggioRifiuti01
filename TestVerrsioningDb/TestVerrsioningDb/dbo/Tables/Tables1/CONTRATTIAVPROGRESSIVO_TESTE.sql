﻿CREATE TABLE [dbo].[CONTRATTIAVPROGRESSIVO_TESTE] (
    [PROGRESSIVO]    DECIMAL (10) NOT NULL,
    [CONTRATTO]      DECIMAL (10) DEFAULT (0) NOT NULL,
    [DADATA]         DATETIME     NOT NULL,
    [ADATA]          DATETIME     NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC, [CONTRATTO] ASC) WITH (FILLFACTOR = 90)
);


GO

CREATE TRIGGER CANCELLARIGHE ON CONTRATTIAVPROGRESSIVO_TESTE
FOR DELETE 
AS


DECLARE @RIFPROGRESSIVO DECIMAL(10,0)
DECLARE @RIFCONTRATTO DECIMAL(10,0)
SELECT @RIFPROGRESSIVO = PROGRESSIVO FROM DELETED
SELECT @RIFCONTRATTO = CONTRATTO FROM DELETED


	DELETE CONTRATTIAVPROGRESSIVO_RIGHEFATTURATO WHERE RIFPROGRESSIVO=@RIFPROGRESSIVO AND CONTRATTO = @RIFCONTRATTO
	DELETE CONTRATTIAV_PROGRESSIVOINCONDPERC WHERE RIFPROGRESSIVO=@RIFPROGRESSIVO AND CONTRATTO = @RIFCONTRATTO
	DELETE CONTRATTIAV_PROGRESSIVOCONDIZIONATI WHERE RIFPROGRESSIVO=@RIFPROGRESSIVO AND CONTRATTO = @RIFCONTRATTO
	DELETE CONTRATTIAV_PROGRESSIVOCONDIZIONATIDICUI WHERE RIFPROGRESSIVO=@RIFPROGRESSIVO AND CONTRATTO = @RIFCONTRATTO
	DELETE CONTRATTIAV_PROGRESSIVOBUDGETCON WHERE RIFPROGRESSIVO=@RIFPROGRESSIVO AND CONTRATTO = @RIFCONTRATTO
	DELETE CONTRATTIAV_PROGRESSIVOBUDGETCONDICUI WHERE RIFPROGRESSIVO=@RIFPROGRESSIVO AND CONTRATTO = @RIFCONTRATTO



GO
GRANT DELETE
    ON OBJECT::[dbo].[CONTRATTIAVPROGRESSIVO_TESTE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CONTRATTIAVPROGRESSIVO_TESTE] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CONTRATTIAVPROGRESSIVO_TESTE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CONTRATTIAVPROGRESSIVO_TESTE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CONTRATTIAVPROGRESSIVO_TESTE] TO [Metodo98]
    AS [dbo];
