CREATE TABLE [dbo].[CGesWConfrontoIndiciTesta] (
    [NrTerminale]   DECIMAL (5) NOT NULL,
    [AmbienteRif]   VARCHAR (3) DEFAULT ('') NULL,
    [AnnoInizioRif] DECIMAL (5) DEFAULT (0) NULL,
    [MeseInizioRif] INT         DEFAULT (0) NULL,
    [AnnoFineRif]   DECIMAL (5) DEFAULT (0) NULL,
    [MeseFineRif]   INT         DEFAULT (0) NULL,
    [AmbienteC1]    VARCHAR (3) DEFAULT ('') NULL,
    [AnnoInizioC1]  DECIMAL (5) DEFAULT (0) NULL,
    [MeseInizioC1]  INT         DEFAULT (0) NULL,
    [AnnoFineC1]    DECIMAL (5) DEFAULT (0) NULL,
    [MeseFineC1]    INT         DEFAULT (0) NULL,
    [AmbienteC2]    VARCHAR (3) DEFAULT ('') NULL,
    [AnnoInizioC2]  DECIMAL (5) DEFAULT (0) NULL,
    [MeseInizioC2]  INT         DEFAULT (0) NULL,
    [AnnoFineC2]    DECIMAL (5) DEFAULT (0) NULL,
    [MeseFineC2]    INT         DEFAULT (0) NULL,
    [AmbienteC3]    VARCHAR (3) DEFAULT ('') NULL,
    [AnnoInizioC3]  DECIMAL (5) DEFAULT (0) NULL,
    [MeseInizioC3]  INT         DEFAULT (0) NULL,
    [AnnoFineC3]    DECIMAL (5) DEFAULT (0) NULL,
    [MeseFineC3]    INT         DEFAULT (0) NULL,
    PRIMARY KEY CLUSTERED ([NrTerminale] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesWConfrontoIndiciTesta] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesWConfrontoIndiciTesta] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesWConfrontoIndiciTesta] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesWConfrontoIndiciTesta] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesWConfrontoIndiciTesta] TO [Metodo98]
    AS [dbo];

