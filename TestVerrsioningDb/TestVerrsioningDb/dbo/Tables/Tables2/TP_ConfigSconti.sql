CREATE TABLE [dbo].[TP_ConfigSconti] (
    [Progressivo]    DECIMAL (5)  NOT NULL,
    [CodFor]         VARCHAR (7)  NOT NULL,
    [Esercizio]      DECIMAL (5)  CONSTRAINT [DF_TP_ConfigSconti_Esercizio] DEFAULT (0) NOT NULL,
    [DaData]         DATETIME     NULL,
    [AData]          DATETIME     NULL,
    [CodContratto]   DECIMAL (18) NULL,
    [UtenteModifica] VARCHAR (25) NULL,
    [DataModifica]   DATETIME     NULL,
    [Attiva]         SMALLINT     DEFAULT ((0)) NULL,
    CONSTRAINT [PK_TP_ConfigSconti] PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO

CREATE TRIGGER TD_ConfigSconti ON TP_ConfigSconti FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN
  
    /*  DELETE ALL CHILDREN IN "TP_ConfigScontiTeste"  */
    DELETE TP_ConfigScontiTeste
    FROM   TP_ConfigScontiTeste T2, DELETED T1
    WHERE  T2.IdTesta = T1.Progressivo

    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_ConfigSconti] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_ConfigSconti] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_ConfigSconti] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_ConfigSconti] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_ConfigSconti] TO [Metodo98]
    AS [dbo];

