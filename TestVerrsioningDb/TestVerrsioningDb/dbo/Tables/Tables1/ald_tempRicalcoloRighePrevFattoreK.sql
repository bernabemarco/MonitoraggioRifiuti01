CREATE TABLE [dbo].[ald_tempRicalcoloRighePrevFattoreK] (
    [RIFPROGRESSIVO]      DECIMAL (10)    NOT NULL,
    [UTENTEMODIFICA]      VARCHAR (25)    NOT NULL,
    [NRRIGA]              DECIMAL (5)     NOT NULL,
    [FLAGRIGA_FattoreK]   SMALLINT        NULL,
    [POSIZIONE]           DECIMAL (5)     NOT NULL,
    [LIVPADRES1]          VARCHAR (14)    NULL,
    [LIV5]                VARCHAR (50)    NULL,
    [DESCRIZIONE]         VARCHAR (100)   NULL,
    [UMGEST]              VARCHAR (3)     NULL,
    [QTAGESTIONE]         DECIMAL (16, 6) NULL,
    [COSTOUNITARIOEURO]   DECIMAL (19, 6) NULL,
    [COSTOTOTALEPREVEURO] DECIMAL (19, 6) NULL,
    [QTAPREZZO]           DECIMAL (16, 6) NULL,
    [UMPREZZO]            VARCHAR (3)     NULL,
    [PREZZOFFERTAUNIEURO] DECIMAL (19, 6) NULL,
    [PREZZOFFERTATOTEURO] DECIMAL (19, 6) NULL,
    [ALDFattoreK]         DECIMAL (19, 4) CONSTRAINT [DF__ald_tempR__ALDFa__6AFD2F55] DEFAULT (0) NOT NULL,
    [DATAMODIFICA]        DATETIME        NOT NULL,
    CONSTRAINT [PK_ald_tempRicalcoloRighePrevFattoreK] PRIMARY KEY CLUSTERED ([RIFPROGRESSIVO] ASC, [NRRIGA] ASC, [UTENTEMODIFICA] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ald_tempRicalcoloRighePrevFattoreK] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ald_tempRicalcoloRighePrevFattoreK] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ald_tempRicalcoloRighePrevFattoreK] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ald_tempRicalcoloRighePrevFattoreK] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ald_tempRicalcoloRighePrevFattoreK] TO [Metodo98]
    AS [dbo];

