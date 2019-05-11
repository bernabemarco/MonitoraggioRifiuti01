﻿CREATE TABLE [dbo].[TRASPORTO_CAD] (
    [PROGRESSIVO]          DECIMAL (5)     NOT NULL,
    [CODSPEDIZ]            DECIMAL (5)     CONSTRAINT [DF_TRASPORTO_CAD_CODSPEDIZ] DEFAULT ((0)) NOT NULL,
    [CODCONTO]             VARCHAR (7)     NULL,
    [DADATA]               DATETIME        NOT NULL,
    [ADATA]                DATETIME        NOT NULL,
    [TIPO]                 SMALLINT        DEFAULT ((0)) NOT NULL,
    [UTENTEMODIFICA]       VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]         DATETIME        NOT NULL,
    [CONTRIBGASOLIO]       DECIMAL (5, 2)  CONSTRAINT [DF_TRASPORTO_CAD_CONTRIBGASOLIO] DEFAULT ((0)) NULL,
    [RAPPORTOPESOVOLUME]   DECIMAL (19, 6) CONSTRAINT [DF_TRASPORTO_CAD_RAPPORTOPESOVOLUME] DEFAULT ((0)) NULL,
    [UM]                   VARCHAR (3)     NOT NULL,
    [CODDEPOSITO]          VARCHAR (10)    DEFAULT ('') NOT NULL,
    [TIPODEPOSITO]         SMALLINT        DEFAULT ((0)) NOT NULL,
    [CODTIPOSERVIZIO]      SMALLINT        DEFAULT ((0)) NOT NULL,
    [VALOREEFFETTIVO]      DECIMAL (19, 6) DEFAULT ((0)) NOT NULL,
    [VALORIANNOPRECEDENTE] SMALLINT        DEFAULT ((1)) NOT NULL,
    [ELABORATO]            SMALLINT        DEFAULT ((0)) NOT NULL,
    PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC),
    CONSTRAINT [FK_TRASPORTO_CAD_CODTIPOSERVIZIO] FOREIGN KEY ([CODTIPOSERVIZIO]) REFERENCES [dbo].[TRASPORTO_CAD_TIPI_SERVIZI] ([CODICE])
);


GO

CREATE TRIGGER [dbo].[TD_TRASPORTO_CAD] ON [dbo].[TRASPORTO_CAD] FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN

    /*  DELETE ALL CHILDREN IN "TRASPORTO_CAD_FILTRI"  */
    DELETE TRASPORTO_CAD_FILTRI
    FROM   TRASPORTO_CAD_FILTRI T2, DELETED T1
    WHERE  T2.RIFPROGRESSIVOSPED = T1.PROGRESSIVO
	
	/*  DELETE ALL CHILDREN IN "TRASPORTO_CAD_TREEVIEW"  */
    DELETE TRASPORTO_CAD_TREEVIEW
    FROM   TRASPORTO_CAD_TREEVIEW T2, DELETED T1
    WHERE  T2.RIFPROGRESSIVO = T1.PROGRESSIVO
	
    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR ('Errore Cancellazione TRASPORTO_CAD.', 16, 1);
    ROLLBACK  TRANSACTION
END


GO
GRANT DELETE
    ON OBJECT::[dbo].[TRASPORTO_CAD] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TRASPORTO_CAD] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TRASPORTO_CAD] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TRASPORTO_CAD] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TRASPORTO_CAD] TO [Metodo98]
    AS [dbo];
