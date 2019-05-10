CREATE TABLE [dbo].[ContrattiRange_CONDICUI] (
    [RIFPROGRESSIVO]            DECIMAL (10)    NOT NULL,
    [RIFRIGA]                   DECIMAL (5)     NOT NULL,
    [NRRIGA]                    INT             NOT NULL,
    [POSIZIONE]                 INT             NULL,
    [FLAGRIGA]                  SMALLINT        NULL,
    [VALORE]                    DECIMAL (19, 6) DEFAULT (0) NULL,
    [QTA]                       DECIMAL (19, 6) DEFAULT (0) NULL,
    [UM]                        VARCHAR (3)     CONSTRAINT [DF_ContrattiRange_CONDICUI_UM] DEFAULT ('') NULL,
    [QTA2]                      DECIMAL (19, 6) DEFAULT (0) NULL,
    [UM2]                       VARCHAR (2)     NULL,
    [PREMIOVALORE]              DECIMAL (19, 6) DEFAULT (0) NULL,
    [PREMIOPERCENT]             DECIMAL (19, 6) DEFAULT (0) NULL,
    [NOTE]                      VARCHAR (500)   NULL,
    [UTENTEMODIFICA]            VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]              DATETIME        NOT NULL,
    [PREVISIONI]                SMALLINT        DEFAULT (0) NULL,
    [TIPO]                      SMALLINT        DEFAULT (0) NULL,
    [CONSUNTIVATOQTA]           DECIMAL (19, 6) DEFAULT (0) NULL,
    [CONSUNTIVATOVALORE]        DECIMAL (19, 6) DEFAULT (0) NULL,
    [CONSUNTIVATOQTASTORICO]    DECIMAL (19, 6) DEFAULT (0) NULL,
    [CONSUNTIVATOVALORESTORICO] DECIMAL (19, 6) DEFAULT (0) NULL,
    [PREMIOMATURATO]            DECIMAL (19, 6) DEFAULT (0) NULL,
    [UMVALORE]                  VARCHAR (3)     CONSTRAINT [DF_ContrattiRange_CONDICUI_UMVALORE] DEFAULT ('') NULL,
    [ESCLUSOLOGICAMENTE]        SMALLINT        DEFAULT ((0)) NULL,
    [AGGIUNTIVO]                SMALLINT        DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_ContrattiRange_CONDICUI] PRIMARY KEY CLUSTERED ([RIFPROGRESSIVO] ASC, [RIFRIGA] ASC, [NRRIGA] ASC, [AGGIUNTIVO] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ContrattiRange_CONDICUI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ContrattiRange_CONDICUI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ContrattiRange_CONDICUI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ContrattiRange_CONDICUI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ContrattiRange_CONDICUI] TO [Metodo98]
    AS [dbo];

