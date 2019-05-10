CREATE TABLE [dbo].[TP_ConfigScontiTeste] (
    [IdTesta]          DECIMAL (5)     NOT NULL,
    [IdRiga]           DECIMAL (5)     NOT NULL,
    [Posizione]        INT             NULL,
    [FlagRiga]         SMALLINT        NULL,
    [IdFormula]        CHAR (1)        NULL,
    [IdSconto]         VARCHAR (5)     NULL,
    [FlagScalare]      SMALLINT        NULL,
    [Segno]            CHAR (1)        NULL,
    [TipoSconto1]      VARCHAR (5)     NULL,
    [TipoSconto2]      VARCHAR (5)     NULL,
    [FlagSconto]       SMALLINT        NULL,
    [ValoreSconto]     DECIMAL (18, 6) NULL,
    [NrListino]        DECIMAL (5)     NULL,
    [Formula]          VARCHAR (21)    NULL,
    [UtenteModifica]   VARCHAR (25)    NULL,
    [DataModifica]     DATETIME        NULL,
    [FormulaFF]        VARCHAR (21)    NULL,
    [USAPERIMPONIBILE] SMALLINT        NULL,
    CONSTRAINT [PK_TP_ConfigScontiTeste] PRIMARY KEY CLUSTERED ([IdTesta] ASC, [IdRiga] ASC) WITH (FILLFACTOR = 90)
);


GO

/****** Oggetto: trigger dbo.TD_ConfigScontiTeste    Data dello script: 22/12/2004 14.33.45 ******/
CREATE TRIGGER TD_ConfigScontiTeste ON dbo.TP_ConfigScontiTeste FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN
  
    /*  DELETE ALL CHILDREN IN "TP_ConfigScontiRighe_1Grp"  */
    DELETE TP_ConfigScontiRighe_1Grp
    FROM   TP_ConfigScontiRighe_1Grp T2, DELETED T1
    WHERE  T2.RifProgressivo = T1.IdTesta

    /*  DELETE ALL CHILDREN IN "TP_ConfigScontiRighe_2Cat"  */
    DELETE TP_ConfigScontiRighe_2Cat
    FROM   TP_ConfigScontiRighe_2Cat T2, DELETED T1
    WHERE  T2.RifProgressivo = T1.IdTesta

    /*  DELETE ALL CHILDREN IN "TP_ConfigScontiRighe_3CatSt"  */
    DELETE TP_ConfigScontiRighe_3CatSt
    FROM   TP_ConfigScontiRighe_3CatSt T2, DELETED T1
    WHERE  T2.RifProgressivo = T1.IdTesta
     
    /*  DELETE ALL CHILDREN IN "TP_ConfigScontiRighe_4GrpPrz"  */
    DELETE TP_ConfigScontiRighe_4GrpPrz
    FROM   TP_ConfigScontiRighe_4GrpPrz T2, DELETED T1
    WHERE  T2.RifProgressivo = T1.IdTesta

    /*  DELETE ALL CHILDREN IN "TP_ConfigScontiRighe_5FamRep"  */
    DELETE TP_ConfigScontiRighe_5FamRep
    FROM   TP_ConfigScontiRighe_5FamRep T2, DELETED T1
    WHERE  T2.RifProgressivo = T1.IdTesta

    /*  DELETE ALL CHILDREN IN "TP_ConfigScontiRighe_6Art"  */
    DELETE TP_ConfigScontiRighe_6Art
    FROM   TP_ConfigScontiRighe_6Art T2, DELETED T1
    WHERE  T2.RifProgressivo = T1.IdTesta

    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_ConfigScontiTeste] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_ConfigScontiTeste] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_ConfigScontiTeste] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_ConfigScontiTeste] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_ConfigScontiTeste] TO [Metodo98]
    AS [dbo];

