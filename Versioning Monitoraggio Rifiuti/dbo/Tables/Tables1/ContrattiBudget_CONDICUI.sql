CREATE TABLE [dbo].[ContrattiBudget_CONDICUI] (
    [RIFPROGRESSIVO]            DECIMAL (10)    NOT NULL,
    [RIFRIGA]                   DECIMAL (5)     NOT NULL,
    [RIFRIGACON]                DECIMAL (5)     NOT NULL,
    [NRRIGA]                    INT             NOT NULL,
    [POSIZIONE]                 INT             NULL,
    [FLAGRIGA]                  SMALLINT        NULL,
    [DADATA]                    DATETIME        NULL,
    [ADATA]                     DATETIME        NULL,
    [VALORE]                    DECIMAL (19, 6) NULL,
    [QTA]                       DECIMAL (19, 6) DEFAULT (0) NULL,
    [UM]                        VARCHAR (3)     NULL,
    [UTENTEMODIFICA]            VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]              DATETIME        NOT NULL,
    [CONSUNTIVATOQTA]           DECIMAL (19, 6) DEFAULT (0) NULL,
    [CONSUNTIVATOVALORE]        DECIMAL (19, 6) DEFAULT (0) NULL,
    [CONSUNTIVATOQTASTORICO]    DECIMAL (19, 6) DEFAULT (0) NULL,
    [CONSUNTIVATOVALORESTORICO] DECIMAL (19, 6) DEFAULT (0) NULL,
    [UMVALQTA]                  VARCHAR (3)     NULL,
    [QTAVALORE]                 DECIMAL (19, 6) DEFAULT (0) NULL,
    PRIMARY KEY CLUSTERED ([RIFPROGRESSIVO] ASC, [RIFRIGA] ASC, [RIFRIGACON] ASC, [NRRIGA] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ContrattiBudget_CONDICUI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ContrattiBudget_CONDICUI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ContrattiBudget_CONDICUI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ContrattiBudget_CONDICUI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ContrattiBudget_CONDICUI] TO [Metodo98]
    AS [dbo];

