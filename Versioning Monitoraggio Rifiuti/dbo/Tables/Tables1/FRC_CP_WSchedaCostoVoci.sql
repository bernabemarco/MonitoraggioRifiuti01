CREATE TABLE [dbo].[FRC_CP_WSchedaCostoVoci] (
    [NrTerminale]        DECIMAL (5)     NOT NULL,
    [ID]                 INT             NOT NULL,
    [Riga]               INT             NOT NULL,
    [Descrizione]        VARCHAR (100)   DEFAULT ('') NULL,
    [Grassetto]          SMALLINT        DEFAULT ((0)) NULL,
    [Dettaglio]          SMALLINT        DEFAULT ((0)) NULL,
    [Materiale]          SMALLINT        DEFAULT ((0)) NULL,
    [LavorazioneEsterna] SMALLINT        DEFAULT ((0)) NULL,
    [LavorazioneInterna] SMALLINT        DEFAULT ((0)) NULL,
    [Valore]             DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [Percentuale]        DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [UtenteModifica]     VARCHAR (25)    NOT NULL,
    [DataModifica]       DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([NrTerminale] ASC, [ID] ASC, [Riga] ASC)
);


GO


/*  DELETE TRIGGER "TD_FRC_CP_WSchedaCostoVoci" FOR TABLE "FRC_CP_WSchedaCostoVoci"  */
CREATE TRIGGER TD_FRC_CP_WSchedaCostoVoci ON FRC_CP_WSchedaCostoVoci FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN

    
    /*  DELETE ALL CHILDREN IN "FRC_CP_WSchedaCostoDettaglio"  */
    DELETE FRC_CP_WSchedaCostoDettaglio
    FROM   FRC_CP_WSchedaCostoDettaglio T2, DELETED T1
    WHERE  T2.NrTerminale = T1.NrTerminale AND T2.ID = T1.ID AND T2.Riga = T1.Riga
    
    /*  DELETE ALL CHILDREN IN "FRC_CP_WSchedaCostoMateriali"  */
    DELETE FRC_CP_WSchedaCostoMateriali
    FROM   FRC_CP_WSchedaCostoMateriali T2, DELETED T1
    WHERE  T2.NrTerminale = T1.NrTerminale AND T2.ID = T1.ID AND T2.Riga = T1.Riga
    
    /*  DELETE ALL CHILDREN IN "FRC_CP_WSchedaCostoLavEsterne"  */
    DELETE FRC_CP_WSchedaCostoLavEsterne
    FROM   FRC_CP_WSchedaCostoLavEsterne T2, DELETED T1
    WHERE  T2.NrTerminale = T1.NrTerminale AND T2.ID = T1.ID AND T2.Riga = T1.Riga
    
    /*  DELETE ALL CHILDREN IN "FRC_CP_WSchedaCostoLavInterne"  */
    DELETE FRC_CP_WSchedaCostoLavInterne
    FROM   FRC_CP_WSchedaCostoLavInterne T2, DELETED T1
    WHERE  T2.NrTerminale = T1.NrTerminale AND T2.ID = T1.ID AND T2.Riga = T1.Riga
    
    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO
GRANT DELETE
    ON OBJECT::[dbo].[FRC_CP_WSchedaCostoVoci] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRC_CP_WSchedaCostoVoci] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRC_CP_WSchedaCostoVoci] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRC_CP_WSchedaCostoVoci] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRC_CP_WSchedaCostoVoci] TO [Metodo98]
    AS [dbo];

