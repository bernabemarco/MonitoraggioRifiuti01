CREATE TABLE [dbo].[FRCVociCoefficientiValoreTesta] (
    [Progressivo]    DECIMAL (10)  NOT NULL,
    [Ambiente]       VARCHAR (3)   DEFAULT ('') NULL,
    [Anno]           INT           DEFAULT ((0)) NULL,
    [Note]           VARCHAR (500) DEFAULT ('') NULL,
    [UtenteModifica] VARCHAR (25)  NOT NULL,
    [DataModifica]   DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC)
);


GO


/*  DELETE TRIGGER "TD_FRCVociCoefficientiValoreTesta" FOR TABLE "FRCVociCoefficientiValoreTesta"  */
CREATE TRIGGER TD_FRCVociCoefficientiValoreTesta ON FRCVociCoefficientiValoreTesta FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN
    
    /*  DELETE ALL CHILDREN IN "FRCVociCoefficientiValoreContributi"  */
    DELETE FRCVociCoefficientiValoreContributi
    FROM   FRCVociCoefficientiValoreContributi T2, DELETED T1
    WHERE  T2.RIFPROGRESSIVO = T1.PROGRESSIVO
    
    /*  DELETE ALL CHILDREN IN "FRCVociCoefficientiValoreOreLavoro"  */
    DELETE FRCVociCoefficientiValoreOreLavoro
    FROM   FRCVociCoefficientiValoreOreLavoro T2, DELETED T1
    WHERE  T2.RIFPROGRESSIVO = T1.PROGRESSIVO
    
    /*  DELETE ALL CHILDREN IN "FRCVociCoefficientiValoreOreCosto"  */
    DELETE FRCVociCoefficientiValoreOreCosto
    FROM   FRCVociCoefficientiValoreOreCosto T2, DELETED T1
    WHERE  T2.RIFPROGRESSIVO = T1.PROGRESSIVO    
    RETURN
	
/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO
GRANT DELETE
    ON OBJECT::[dbo].[FRCVociCoefficientiValoreTesta] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRCVociCoefficientiValoreTesta] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCVociCoefficientiValoreTesta] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCVociCoefficientiValoreTesta] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRCVociCoefficientiValoreTesta] TO [Metodo98]
    AS [dbo];

