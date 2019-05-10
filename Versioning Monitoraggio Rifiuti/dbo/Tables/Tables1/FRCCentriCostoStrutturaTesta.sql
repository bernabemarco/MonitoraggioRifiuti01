CREATE TABLE [dbo].[FRCCentriCostoStrutturaTesta] (
    [Progressivo]     DECIMAL (10)  NOT NULL,
    [Codice]          INT           DEFAULT ((0)) NULL,
    [CDC]             VARCHAR (10)  DEFAULT ('') NULL,
    [TipoCalcolo]     SMALLINT      DEFAULT ((0)) NULL,
    [TipoRiferimento] SMALLINT      DEFAULT ((0)) NULL,
    [Tutti]           SMALLINT      DEFAULT ((0)) NULL,
    [Note]            VARCHAR (500) DEFAULT ('') NULL,
    [UtenteModifica]  VARCHAR (25)  NOT NULL,
    [DataModifica]    DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC)
);


GO


/*  DELETE TRIGGER "TD_FRCCentriCostoStrutturaTesta" FOR TABLE "FRCCentriCostoStrutturaTesta"  */
CREATE TRIGGER TD_FRCCentriCostoStrutturaTesta ON FRCCentriCostoStrutturaTesta FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN
    
    /*  DELETE ALL CHILDREN IN "FRCCentriCostoStrutturaRighe"  */
    DELETE FRCCentriCostoStrutturaRighe
    FROM   FRCCentriCostoStrutturaRighe T2, DELETED T1
    WHERE  T2.RIFPROGRESSIVO = T1.PROGRESSIVO
    
    RETURN
    
/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO
GRANT DELETE
    ON OBJECT::[dbo].[FRCCentriCostoStrutturaTesta] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRCCentriCostoStrutturaTesta] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCCentriCostoStrutturaTesta] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCCentriCostoStrutturaTesta] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRCCentriCostoStrutturaTesta] TO [Metodo98]
    AS [dbo];

