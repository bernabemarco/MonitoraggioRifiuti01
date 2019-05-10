CREATE TABLE [dbo].[CGCPValoriCicloODP] (
    [IDTesta]                DECIMAL (10)    NOT NULL,
    [IDRiga]                 INT             NOT NULL,
    [Tipo]                   SMALLINT        NOT NULL,
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
    PRIMARY KEY CLUSTERED ([IDTesta] ASC, [IDRiga] ASC, [Tipo] ASC, [Anno] ASC, [Mese] ASC, [GruppoCosti] ASC) WITH (FILLFACTOR = 90)
);


GO

/*  DELETE TRIGGER "TD_CGCPValoriCicloODP" FOR TABLE "CGCPValoriCicloODP"  */
CREATE TRIGGER TD_CGCPValoriCicloODP ON CGCPValoriCicloODP FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN

    
    /*  DELETE ALL CHILDREN IN "CGCPValoriCicloODPDettaglio"  */
    DELETE CGCPValoriCicloODPDettaglio
    FROM   CGCPValoriCicloODPDettaglio T2, DELETED T1
    WHERE  T2.IDTesta = T1.IDTesta AND T2.IDRiga = T1.IDRiga AND 
           T2.Tipo = T1.Tipo AND T2.Anno = T1.Anno AND 
           T2.Mese = T1.Mese AND T2.GruppoCosti = T1.GruppoCosti
    
    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO
GRANT DELETE
    ON OBJECT::[dbo].[CGCPValoriCicloODP] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGCPValoriCicloODP] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGCPValoriCicloODP] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGCPValoriCicloODP] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGCPValoriCicloODP] TO [Metodo98]
    AS [dbo];

