CREATE TABLE [dbo].[TP_ConfigScontiTesteCTR] (
    [IdTesta]          DECIMAL (5)  NOT NULL,
    [IdRiga]           DECIMAL (5)  NOT NULL,
    [Posizione]        INT          NULL,
    [FlagRiga]         SMALLINT     NULL,
    [IdFormula]        CHAR (1)     NULL,
    [IdSconto]         VARCHAR (5)  NULL,
    [FlagScalare]      SMALLINT     NULL,
    [Segno]            CHAR (1)     NULL,
    [TipoSconto1]      VARCHAR (5)  NULL,
    [TipoSconto2]      VARCHAR (5)  NULL,
    [FlagSconto]       SMALLINT     NULL,
    [ValoreSconto]     VARCHAR (15) NULL,
    [NrListino]        DECIMAL (5)  NULL,
    [Formula]          VARCHAR (21) NULL,
    [UtenteModifica]   VARCHAR (25) NULL,
    [DataModifica]     DATETIME     NULL,
    [FormulaFF]        VARCHAR (21) NULL,
    [USAPERIMPONIBILE] SMALLINT     NULL,
    PRIMARY KEY CLUSTERED ([IdTesta] ASC, [IdRiga] ASC) WITH (FILLFACTOR = 90)
);


GO

CREATE TRIGGER TD_ConfigScontiTesteCTR ON TP_ConfigScontiTesteCTR FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN
  
    /*  DELETE ALL CHILDREN IN "TP_ConfigScontiRighe_1GrpCTR"  */
    DELETE TP_ConfigScontiRighe_1GrpCTR
    FROM   TP_ConfigScontiRighe_1GrpCTR T2, DELETED T1
    WHERE  T2.IdTesta = T1.IdRiga

    /*  DELETE ALL CHILDREN IN "TP_ConfigScontiRighe_2Cat"  */
    DELETE TP_ConfigScontiRighe_2CatCTR
    FROM   TP_ConfigScontiRighe_2CatCTR T2, DELETED T1
    WHERE  T2.IdTesta = T1.IdRiga

    /*  DELETE ALL CHILDREN IN "TP_ConfigScontiRighe_3CatSt"  */
    DELETE TP_ConfigScontiRighe_3CatStCTR
    FROM   TP_ConfigScontiRighe_3CatStCTR T2, DELETED T1
    WHERE  T2.IdTesta = T1.IdRiga
     
    /*  DELETE ALL CHILDREN IN "TP_ConfigScontiRighe_4GrpPrz"  */
    DELETE TP_ConfigScontiRighe_4GrpPrzCTR
    FROM   TP_ConfigScontiRighe_4GrpPrzCTR T2, DELETED T1
    WHERE  T2.IdTesta = T1.IdRiga

    /*  DELETE ALL CHILDREN IN "TP_ConfigScontiRighe_5FamRep"  */
    DELETE TP_ConfigScontiRighe_5FamRepCTR
    FROM   TP_ConfigScontiRighe_5FamRepCTR T2, DELETED T1
    WHERE  T2.IdTesta = T1.IdRiga

    /*  DELETE ALL CHILDREN IN "TP_ConfigScontiRighe_6Art"  */
    DELETE TP_ConfigScontiRighe_6ArtCTR
    FROM   TP_ConfigScontiRighe_6ArtCTR T2, DELETED T1
    WHERE  T2.IdTesta = T1.IdRiga

    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_ConfigScontiTesteCTR] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_ConfigScontiTesteCTR] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_ConfigScontiTesteCTR] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_ConfigScontiTesteCTR] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_ConfigScontiTesteCTR] TO [Metodo98]
    AS [dbo];

