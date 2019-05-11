﻿CREATE TABLE [dbo].[TP_OFDOCUMENTI_TMP] (
    [PROGRESSIVO]    DECIMAL (10)  NOT NULL,
    [TIPODOC]        VARCHAR (5)   NOT NULL,
    [DESCRIZIONE]    VARCHAR (80)  NOT NULL,
    [FILTROSQL]      VARCHAR (MAX) CONSTRAINT [DF_TP_OFDOCUMENTI_TMP_FILTROSQL] DEFAULT ('') NULL,
    [UTENTEMODIFICA] VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]   DATETIME      NOT NULL,
    [CODICEBUYER]    VARCHAR (7)   NULL,
    [DATASOSP]       DATETIME      NULL,
    [FILTROSQL_AGG]  VARCHAR (MAX) CONSTRAINT [DF_TP_OFDOCUMENTI_TMP_FILTROSQL_AGG] DEFAULT ('') NULL,
    PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC)
);


GO

CREATE TRIGGER [dbo].[TD_TP_OFDOCUMENTI_TMP] ON [dbo].[TP_OFDOCUMENTI_TMP] FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)
 
    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN
    
	/*  DELETE ALL CHILDREN IN "TP_OFTESTEDOCUMENTI_TMP"  */
    DELETE TP_OFTESTEDOCUMENTI_TMP
    FROM   TP_OFTESTEDOCUMENTI_TMP T2, DELETED T1
    WHERE  T2.RIFPROGRESSIVO = T1.PROGRESSIVO

    /*  DELETE ALL CHILDREN IN "TP_OFRIGHEDOCUMENTI_TMP"  */
    DELETE TP_OFRIGHEDOCUMENTI_TMP
    FROM   TP_OFRIGHEDOCUMENTI_TMP T2, DELETED T1
    WHERE  T2.RIFPROGRESSIVO = T1.PROGRESSIVO
 
    RETURN
 
/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_OFDOCUMENTI_TMP] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_OFDOCUMENTI_TMP] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_OFDOCUMENTI_TMP] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_OFDOCUMENTI_TMP] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_OFDOCUMENTI_TMP] TO [Metodo98]
    AS [dbo];
