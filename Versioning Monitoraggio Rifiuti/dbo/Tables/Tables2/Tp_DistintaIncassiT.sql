CREATE TABLE [dbo].[Tp_DistintaIncassiT] (
    [PROGRESSIVO]    NUMERIC (10)    NOT NULL,
    [Esercizio]      DECIMAL (5)     NOT NULL,
    [CodiceAgente]   VARCHAR (7)     NOT NULL,
    [CODCONTO]       VARCHAR (7)     NOT NULL,
    [ImportoInc]     DECIMAL (19, 4) NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL,
    [DataIncasso]    DATETIME        NULL,
    CONSTRAINT [PK_Tp_DistintaIncassiT] PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC) WITH (FILLFACTOR = 90)
);


GO

CREATE TRIGGER TD_DISTINTATESTE ON Tp_DistintaIncassiT FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN
  
    /*  DELETE ALL CHILDREN IN "TP_RIGHE_EXPORT"  */
    DELETE TP_DISTINTAINCASSID
    FROM   TP_DISTINTAINCASSID T2, DELETED T1
    WHERE  T2.CodiceTestata = T1.Progressivo

    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END


GO
GRANT DELETE
    ON OBJECT::[dbo].[Tp_DistintaIncassiT] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Tp_DistintaIncassiT] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[Tp_DistintaIncassiT] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Tp_DistintaIncassiT] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Tp_DistintaIncassiT] TO [Metodo98]
    AS [dbo];

