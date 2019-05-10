CREATE TABLE [dbo].[CGCPValoriCiclo] (
    [Articolo]               VARCHAR (50)    NOT NULL,
    [Anno]                   DECIMAL (5)     NOT NULL,
    [Mese]                   INT             NOT NULL,
    [GruppoCosti]            VARCHAR (3)     NOT NULL,
    [CostoMedioVariabile]    DECIMAL (19, 6) DEFAULT (0) NULL,
    [CostoMedioFisso]        DECIMAL (19, 6) DEFAULT (0) NULL,
    [CostoUltimoVariabile]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [CostoUltimoFisso]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [CostoStandardVariabile] DECIMAL (19, 6) DEFAULT (0) NULL,
    [CostoStandardFisso]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [CostoBudgetVariabile]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [CostoBudgetFisso]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [CostoSimulatoVariabile] DECIMAL (19, 6) DEFAULT (0) NULL,
    [CostoSimulatoFisso]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [UtenteModifica]         VARCHAR (25)    NOT NULL,
    [DataModifica]           DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([Articolo] ASC, [Anno] ASC, [Mese] ASC, [GruppoCosti] ASC) WITH (FILLFACTOR = 90)
);


GO

/*  DELETE TRIGGER "TD_CGCPValoriCiclo" FOR TABLE "CGCPValoriCiclo"  */
CREATE TRIGGER TD_CGCPValoriCiclo ON CGCPValoriCiclo FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN

    
    /*  DELETE ALL CHILDREN IN "CGCPValoriCicloDettaglio"  */
    DELETE CGCPValoriCicloDettaglio
    FROM   CGCPValoriCicloDettaglio T2, DELETED T1
    WHERE  T2.Articolo = T1.Articolo AND T2.Anno = T1.Anno AND 
           T2.Mese = T1.Mese AND T2.GruppoCosti = T1.GruppoCosti
    
    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO
GRANT DELETE
    ON OBJECT::[dbo].[CGCPValoriCiclo] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGCPValoriCiclo] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGCPValoriCiclo] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGCPValoriCiclo] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGCPValoriCiclo] TO [Metodo98]
    AS [dbo];

