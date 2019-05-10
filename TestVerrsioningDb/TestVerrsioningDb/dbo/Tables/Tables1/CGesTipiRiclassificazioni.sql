CREATE TABLE [dbo].[CGesTipiRiclassificazioni] (
    [Codice]         VARCHAR (5)   NOT NULL,
    [Descrizione]    VARCHAR (80)  DEFAULT ('') NULL,
    [Attivita]       SMALLINT      DEFAULT (0) NULL,
    [Costo]          SMALLINT      DEFAULT (0) NULL,
    [Reddito]        SMALLINT      DEFAULT (0) NULL,
    [Patrimoniale]   SMALLINT      DEFAULT (0) NULL,
    [Tipologia]      SMALLINT      DEFAULT (0) NULL,
    [Note]           VARCHAR (100) DEFAULT ('') NULL,
    [UtenteModifica] VARCHAR (25)  NOT NULL,
    [DataModifica]   DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([Codice] ASC) WITH (FILLFACTOR = 90)
);


GO

/*  DELETE TRIGGER "TD_CGesTipiRiclassificazioni" FOR TABLE "CGesTipiRiclassificazioni"  */
CREATE TRIGGER TD_CGesTipiRiclassificazioni ON CGesTipiRiclassificazioni FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN

    
    /*  DELETE ALL CHILDREN IN "CGesVociRiclassificazioni"  */
    DELETE CGesVociRiclassificazioni
    FROM   CGesVociRiclassificazioni T2, DELETED T1
    WHERE  T2.Tipo = T1.Codice
    
    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesTipiRiclassificazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesTipiRiclassificazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesTipiRiclassificazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesTipiRiclassificazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesTipiRiclassificazioni] TO [Metodo98]
    AS [dbo];

