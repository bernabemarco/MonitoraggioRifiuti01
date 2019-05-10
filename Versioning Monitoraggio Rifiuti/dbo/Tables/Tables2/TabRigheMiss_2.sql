CREATE TABLE [dbo].[TabRigheMiss_2] (
    [RIFPROGRESSIVO]       DECIMAL (10)    NOT NULL,
    [RIFIDRIGARIGHEMISS_1] INT             NOT NULL,
    [IDRIGA]               INT             NOT NULL,
    [CODCLI]               VARCHAR (7)     NULL,
    [CODDESTINAZIONE]      DECIMAL (5)     NULL,
    [RAGSOCDDM]            VARCHAR (80)    NULL,
    [CODICESPED]           DECIMAL (5)     NULL,
    [UM]                   VARCHAR (3)     NULL,
    [QTA]                  DECIMAL (16, 6) DEFAULT (0) NULL,
    [NUMCOLLI]             DECIMAL (16, 6) DEFAULT (0) NULL,
    [PESONETTO]            DECIMAL (16, 6) DEFAULT (0) NULL,
    [PESOLORDO]            DECIMAL (16, 6) DEFAULT (0) NULL,
    [VOLUME]               DECIMAL (16, 6) DEFAULT (0) NULL,
    [SUPERFICIE]           DECIMAL (16, 6) DEFAULT (0) NULL,
    [FlgRed]               SMALLINT        DEFAULT (0) NULL,
    [UTENTEMODIFICA]       VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]         DATETIME        NOT NULL,
    [FlgMancaFC]           SMALLINT        DEFAULT (0) NULL,
    [ANNOTAZIONI]          VARCHAR (250)   NULL,
    [TOTNETTOEURO]         DECIMAL (19, 6) DEFAULT ((0)) NULL,
    CONSTRAINT [PK_TabRigheMiss_2] PRIMARY KEY CLUSTERED ([RIFPROGRESSIVO] ASC, [RIFIDRIGARIGHEMISS_1] ASC, [IDRIGA] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TabRigheMiss_2] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TabRigheMiss_2] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TabRigheMiss_2] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TabRigheMiss_2] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TabRigheMiss_2] TO [Metodo98]
    AS [dbo];

