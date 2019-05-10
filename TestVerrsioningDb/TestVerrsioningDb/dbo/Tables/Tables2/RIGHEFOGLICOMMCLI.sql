CREATE TABLE [dbo].[RIGHEFOGLICOMMCLI] (
    [RIFPROGRESSIVO]      DECIMAL (10)     NOT NULL,
    [NRRIGA]              DECIMAL (5)      NOT NULL,
    [POSIZIONE]           DECIMAL (5)      NOT NULL,
    [FLAGRIGA]            SMALLINT         NULL,
    [LIV1]                VARCHAR (25)     NULL,
    [LIV2]                VARCHAR (25)     NULL,
    [LIV3]                VARCHAR (25)     NULL,
    [LIV4]                VARCHAR (25)     NULL,
    [LIV5]                VARCHAR (25)     NULL,
    [DESCRIZIONE]         VARCHAR (100)    NULL,
    [VOCECOSTO]           VARCHAR (3)      NULL,
    [TIPORIGA]            SMALLINT         NULL,
    [UMGEST]              VARCHAR (3)      NULL,
    [QTAGESTIONE]         DECIMAL (16, 6)  NULL,
    [COSTOUNITARIO]       DECIMAL (19, 4)  NULL,
    [UMCOSTO]             VARCHAR (3)      NULL,
    [FATTCONV]            DECIMAL (20, 10) NULL,
    [QTACOSTO]            DECIMAL (16, 6)  NULL,
    [COSTOTOTALEPREV]     DECIMAL (19, 4)  NULL,
    [COSTOTOTALECONS]     DECIMAL (19, 4)  NULL,
    [UTENTEMODIFICA]      VARCHAR (25)     NOT NULL,
    [DATAMODIFICA]        DATETIME         NOT NULL,
    [FLGTIPOLIV5]         SMALLINT         CONSTRAINT [DF_RIGHEFOGLICOMMCLI_FLGTIPOLIV5] DEFAULT (0) NOT NULL,
    [COSTOUNITARIOEURO]   DECIMAL (19, 4)  NULL,
    [COSTOTOTALEPREVEURO] DECIMAL (19, 4)  NULL,
    [VERSDBA]             VARCHAR (10)     NULL,
    [QTARILASCIATA]       DECIMAL (16, 6)  NULL,
    [SC]                  VARCHAR (5)      NULL,
    [GRP]                 VARCHAR (5)      NULL,
    [NOTE]                VARCHAR (255)    NULL,
    CONSTRAINT [PK_RIGHEFOGLICOMMCLI] PRIMARY KEY CLUSTERED ([RIFPROGRESSIVO] ASC, [NRRIGA] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[RIGHEFOGLICOMMCLI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[RIGHEFOGLICOMMCLI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[RIGHEFOGLICOMMCLI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[RIGHEFOGLICOMMCLI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[RIGHEFOGLICOMMCLI] TO [Metodo98]
    AS [dbo];

