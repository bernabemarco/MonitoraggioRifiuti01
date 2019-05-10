CREATE TABLE [dbo].[GEM_ListiniContratti] (
    [idGListinoContr]         DECIMAL (10)    NOT NULL,
    [DESCRIZIONE]             VARCHAR (80)    NULL,
    [DATAINIVALIDITA]         DATETIME        NOT NULL,
    [DATAFINEVALIDITA]        DATETIME        NOT NULL,
    [DATARINNOVO]             DATETIME        NULL,
    [CodCliente]              VARCHAR (7)     NOT NULL,
    [idTipologMezzo]          DECIMAL (5)     NOT NULL,
    [idGListinoModello]       DECIMAL (5)     NOT NULL,
    [CodAgente1]              VARCHAR (7)     NOT NULL,
    [CodAgente2]              VARCHAR (7)     NOT NULL,
    [ApplicazioneProvvigione] VARCHAR (1)     DEFAULT ('A') NOT NULL,
    [UTENTEMODIFICA]          VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]            DATETIME        NOT NULL,
    [CODICEMEZZO]             VARCHAR (50)    NULL,
    [IdListinoOriginale]      DECIMAL (10)    NULL,
    [PercAumentoListino]      NUMERIC (10, 2) DEFAULT ((0)) NOT NULL,
    [CriterioGestProvv1]      VARCHAR (1)     NULL,
    [PercProvvFissaAg1]       NUMERIC (10, 2) DEFAULT ((0)) NOT NULL,
    CONSTRAINT [GEM_ListiniContratti_PK] PRIMARY KEY CLUSTERED ([idGListinoContr] ASC)
);


GO
CREATE NONCLUSTERED INDEX [GEM_ListiniContratti_CODCLIENTE]
    ON [dbo].[GEM_ListiniContratti]([CodCliente] ASC);


GO
CREATE NONCLUSTERED INDEX [GEM_ListiniContratti_CODCLIENTE_idTipologMezzo]
    ON [dbo].[GEM_ListiniContratti]([CodCliente] ASC, [idTipologMezzo] ASC);


GO


--------------------------------------------------------------------------------------------------------------
-- PC 5 MAggio 2010 
-- Trigger di cancellazione righe e attività contratto
-- su cancellazione Testa Listini Contratto
--------------------------------------------------------------------------------------------------------------

CREATE TRIGGER [TD_GEM_ListiniContratti] ON [dbo].[GEM_ListiniContratti] FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN

    
    /*  DELETE ALL CHILDREN IN "Righe Contratto"  */
    DELETE GEM_ListiniContrattoRighe
    FROM   GEM_ListiniContrattoRighe  T2, DELETED T1
    WHERE  T2.idGListinoContr  = T1.idGListinoContr 
    
    /*  DELETE ALL CHILDREN IN "Righe Attivita COntratto"  */
    DELETE GEM_ListiniContrattoRigheAttivita
    FROM   GEM_ListiniContrattoRigheAttivita T2, DELETED T1
    WHERE  T2.idGListinoContr = T1.idGListinoContr 


    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END



set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON

GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_ListiniContratti] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_ListiniContratti] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_ListiniContratti] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_ListiniContratti] TO [Metodo98]
    AS [dbo];

