CREATE TABLE [dbo].[TMPTabRigheMiss_1] (
    [IDSESSIONE]     DECIMAL (5)     NOT NULL,
    [RIFPROGRESSIVO] DECIMAL (10)    NOT NULL,
    [IDRIGA]         INT             NOT NULL,
    [CODICE]         VARCHAR (10)    NULL,
    [CODICESPED]     DECIMAL (5)     NULL,
    [UM]             VARCHAR (3)     NULL,
    [QTA]            DECIMAL (16, 6) DEFAULT (0) NULL,
    [NUMCOLLI]       DECIMAL (16, 6) DEFAULT (0) NULL,
    [PESONETTO]      DECIMAL (16, 6) DEFAULT (0) NULL,
    [PESOLORDO]      DECIMAL (16, 6) DEFAULT (0) NULL,
    [VOLUME]         DECIMAL (16, 6) DEFAULT (0) NULL,
    [SUPERFICIE]     DECIMAL (16, 6) DEFAULT (0) NULL,
    [FlgRed]         SMALLINT        DEFAULT (0) NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL,
    [FlgMancaFC]     SMALLINT        DEFAULT (0) NULL,
    [CLISTATOBLOCC]  SMALLINT        DEFAULT ((0)) NULL,
    [TOTNETTOEURO]   DECIMAL (19, 6) DEFAULT ((0)) NULL,
    CONSTRAINT [PK_TMPTabRigheMiss_1] PRIMARY KEY CLUSTERED ([IDSESSIONE] ASC, [RIFPROGRESSIVO] ASC, [IDRIGA] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TMPTabRigheMiss_1] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TMPTabRigheMiss_1] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TMPTabRigheMiss_1] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TMPTabRigheMiss_1] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TMPTabRigheMiss_1] TO [Metodo98]
    AS [dbo];

