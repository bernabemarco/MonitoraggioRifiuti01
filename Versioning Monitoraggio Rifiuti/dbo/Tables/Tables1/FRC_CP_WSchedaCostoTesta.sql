CREATE TABLE [dbo].[FRC_CP_WSchedaCostoTesta] (
    [NrTerminale]    DECIMAL (5)  NOT NULL,
    [ID]             INT          NOT NULL,
    [UtenteModifica] VARCHAR (25) NOT NULL,
    [DataModifica]   DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([NrTerminale] ASC, [ID] ASC)
);


GO


/*  DELETE TRIGGER "TD_FRC_CP_WSchedaCostoTesta" FOR TABLE "FRC_CP_WSchedaCostoTesta"  */
CREATE TRIGGER TD_FRC_CP_WSchedaCostoTesta ON FRC_CP_WSchedaCostoTesta FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN

    
    /*  DELETE ALL CHILDREN IN "FRC_CP_WSchedaCostoVoci"  */
    DELETE FRC_CP_WSchedaCostoVoci
    FROM   FRC_CP_WSchedaCostoVoci T2, DELETED T1
    WHERE  T2.NrTerminale = T1.NrTerminale AND T2.ID = T1.ID
    
    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO
GRANT DELETE
    ON OBJECT::[dbo].[FRC_CP_WSchedaCostoTesta] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRC_CP_WSchedaCostoTesta] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRC_CP_WSchedaCostoTesta] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRC_CP_WSchedaCostoTesta] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRC_CP_WSchedaCostoTesta] TO [Metodo98]
    AS [dbo];

