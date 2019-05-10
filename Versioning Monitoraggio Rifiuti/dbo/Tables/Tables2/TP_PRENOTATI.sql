CREATE TABLE [dbo].[TP_PRENOTATI] (
    [IDTestaP]       DECIMAL (10) NOT NULL,
    [IDRigaP]        INT          NOT NULL,
    [IDTestaO]       DECIMAL (10) NULL,
    [IDRigaO]        INT          NULL,
    [IDTestaE]       DECIMAL (10) NULL,
    [IDRigaE]        INT          NULL,
    [Stato]          CHAR (1)     NOT NULL,
    [Utente]         VARCHAR (25) NOT NULL,
    [UtenteModifica] VARCHAR (25) DEFAULT (user_name()) NOT NULL,
    [DataModifica]   VARCHAR (25) DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [FK_TP_PRENOTATI_IDTESTAP_IDRIGAP] FOREIGN KEY ([IDTestaP], [IDRigaP]) REFERENCES [dbo].[RIGHEDOCUMENTI] ([IDTESTA], [IDRIGA]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [Index_Prenotati]
    ON [dbo].[TP_PRENOTATI]([IDTestaP] ASC, [IDRigaP] ASC, [IDTestaO] ASC, [IDRigaO] ASC, [Stato] ASC) WITH (FILLFACTOR = 90);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_PRENOTATI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_PRENOTATI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_PRENOTATI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_PRENOTATI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_PRENOTATI] TO [Metodo98]
    AS [dbo];

