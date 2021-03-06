﻿CREATE TABLE [dbo].[TDA_DETTFEEDBACK_QUANTITA] (
    [RIFPROGRESSIVO] DECIMAL (10)    NOT NULL,
    [IDRIGA]         INT             NOT NULL,
    [QTACONSUNTIVO]  DECIMAL (16, 6) NULL,
    [UM]             VARCHAR (3)     NULL,
    [STATO]          SMALLINT        CONSTRAINT [DF_TDADETTFEEDBACKQUANTITA_STATO] DEFAULT ((0)) NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL,
    [NUOVOSTATOFASE] SMALLINT        DEFAULT ((0)) NULL,
    PRIMARY KEY CLUSTERED ([RIFPROGRESSIVO] ASC, [IDRIGA] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_QUANTITA_FEEDBACK] FOREIGN KEY ([RIFPROGRESSIVO]) REFERENCES [dbo].[TDA_FEEDBACK] ([PROGRESSIVO]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TDA_DETTFEEDBACK_QUANTITA] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TDA_DETTFEEDBACK_QUANTITA] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TDA_DETTFEEDBACK_QUANTITA] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TDA_DETTFEEDBACK_QUANTITA] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TDA_DETTFEEDBACK_QUANTITA] TO [Metodo98]
    AS [dbo];

