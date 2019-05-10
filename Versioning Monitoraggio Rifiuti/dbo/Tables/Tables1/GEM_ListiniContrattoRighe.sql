CREATE TABLE [dbo].[GEM_ListiniContrattoRighe] (
    [idGListinoContr]  DECIMAL (10)    NOT NULL,
    [IdRigaListinoC]   DECIMAL (5)     NOT NULL,
    [QtaRifProvv]      DECIMAL (16, 6) DEFAULT ((0)) NOT NULL,
    [Variante1]        VARCHAR (8)     NULL,
    [Variante2]        VARCHAR (8)     NULL,
    [Variante3]        VARCHAR (8)     NULL,
    [Variante4]        VARCHAR (8)     NULL,
    [Variante5]        VARCHAR (8)     NULL,
    [Variante6]        VARCHAR (8)     NULL,
    [DATAINIVALIDITA]  DATETIME        NOT NULL,
    [DATAFINEVALIDITA] DATETIME        NOT NULL,
    [UTENTEMODIFICA]   VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]     DATETIME        NOT NULL,
    CONSTRAINT [GEM_ListiniContrattoRighe_PK] PRIMARY KEY CLUSTERED ([idGListinoContr] ASC, [IdRigaListinoC] ASC)
);


GO


--------------------------------------------------------------------------------------------------------------
-- PC 5 MAggio 2010 
-- Trigger di cancellazione attività contratto
-- su cancellazione Righe Listini 
--------------------------------------------------------------------------------------------------------------
/*  DELETE TRIGGER "TD_TESTECONTABILITA" FOR TABLE "TESTECONTABILITA"  */
CREATE TRIGGER [TD_GEM_ListiniContrattoRighe] ON [dbo].[GEM_ListiniContrattoRighe] FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN

    
    /*  DELETE ALL CHILDREN IN "Righe Contratto Attivita"  */
    DELETE GEM_ListiniContrattoRigheAttivita
    FROM   GEM_ListiniContrattoRigheAttivita  T2, DELETED T1
    WHERE  T2.idGListinoContr  = T1.idGListinoContr AND T2.IdRigaListinoC = T1.IdRigaListinoC 


    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END




GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_ListiniContrattoRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_ListiniContrattoRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_ListiniContrattoRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_ListiniContrattoRighe] TO [Metodo98]
    AS [dbo];

