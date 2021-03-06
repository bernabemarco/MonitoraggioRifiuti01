﻿CREATE TABLE [dbo].[TP_TESTE_EXPORTDOC] (
    [PROGRESSIVO]      DECIMAL (10)  NOT NULL,
    [DSCProfili]       VARCHAR (50)  NULL,
    [CodCli]           VARCHAR (7)   NULL,
    [TipoEsportazione] VARCHAR (16)  NULL,
    [Path]             VARCHAR (250) NULL,
    [PathCli]          VARCHAR (250) NULL,
    [DataEsp]          DATETIME      NULL,
    [UtenteModifica]   VARCHAR (25)  NOT NULL,
    [DataModifica]     DATETIME      NOT NULL,
    [ExpDocumenti]     SMALLINT      DEFAULT ((0)) NULL,
    CONSTRAINT [PK_TP_TESTE_EXPORTDOC] PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC) WITH (FILLFACTOR = 90)
);


GO

CREATE TRIGGER [dbo].[TD_TESTEEXPORTDOC] ON [dbo].[TP_TESTE_EXPORTDOC] FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)
    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN
  
    /*  DELETE ALL CHILDREN IN "TP_RIGHE_EXPORTDOC"  */
    DELETE TP_RIGHE_EXPORTDOC
    FROM   TP_RIGHE_EXPORTDOC T2, DELETED T1
    WHERE  T2.RifProgressivo = T1.Progressivo
    /*  DELETE ALL CHILDREN IN "TP_DATI_EXPORTDOC"  */
    DELETE TP_DATI_EXPORTDOC
    FROM   TP_DATI_EXPORTDOC T2, DELETED T1
    WHERE  T2.RifProgressivo = T1.Progressivo
    /*  DELETE ALL CHILDREN IN "TP_CONDIZIONI_EXPORTDOC"  */
    DELETE TP_CONDIZIONI_EXPORTDOC
    FROM   TP_CONDIZIONI_EXPORTDOC T2, DELETED T1
    WHERE  T2.RifProgressivo = T1.Progressivo
     
    /*  DELETE ALL CHILDREN IN "TP_RELAZIONI_EXPORTDOC"  */
    DELETE TP_RELAZIONI_EXPORTDOC
    FROM   TP_RELAZIONI_EXPORTDOC T2, DELETED T1
    WHERE  T2.RifProgressivo = T1.Progressivo

	/*  DELETE ALL CHILDREN IN "TP_PARAMETRI_EXPORTDOC"  */
    DELETE TP_PARAMETRI_EXPORTDOC
    FROM   TP_PARAMETRI_EXPORTDOC T2, DELETED T1
    WHERE  T2.RifProgressivo = T1.Progressivo

    RETURN
/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_TESTE_EXPORTDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_TESTE_EXPORTDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_TESTE_EXPORTDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_TESTE_EXPORTDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_TESTE_EXPORTDOC] TO [Metodo98]
    AS [dbo];

