CREATE TABLE [dbo].[TabGGConsegna] (
    [PROGRESSIVO]    DECIMAL (10) NOT NULL,
    [CODCONTO]       VARCHAR (7)  NOT NULL,
    [NUMDDM]         DECIMAL (5)  NOT NULL,
    [GGRitCons]      SMALLINT     DEFAULT (0) NULL,
    [Lun_NonCons]    SMALLINT     DEFAULT (0) NULL,
    [LunDA_AM]       DATETIME     NULL,
    [LunA_AM]        DATETIME     NULL,
    [LunDA_PM]       DATETIME     NULL,
    [LunA_PM]        DATETIME     NULL,
    [Mar_NonCons]    SMALLINT     DEFAULT (0) NULL,
    [MarDA_AM]       DATETIME     NULL,
    [MarA_AM]        DATETIME     NULL,
    [MarDA_PM]       DATETIME     NULL,
    [MarA_PM]        DATETIME     NULL,
    [Mer_NonCons]    SMALLINT     DEFAULT (0) NULL,
    [MerDA_AM]       DATETIME     NULL,
    [MerA_AM]        DATETIME     NULL,
    [MerDA_PM]       DATETIME     NULL,
    [MerA_PM]        DATETIME     NULL,
    [Gio_NonCons]    SMALLINT     DEFAULT (0) NULL,
    [GioDA_AM]       DATETIME     NULL,
    [GioA_AM]        DATETIME     NULL,
    [GioDA_PM]       DATETIME     NULL,
    [GioA_PM]        DATETIME     NULL,
    [Ven_NonCons]    SMALLINT     DEFAULT (0) NULL,
    [VenDA_AM]       DATETIME     NULL,
    [VenA_AM]        DATETIME     NULL,
    [VenDA_PM]       DATETIME     NULL,
    [VenA_PM]        DATETIME     NULL,
    [Sab_NonCons]    SMALLINT     DEFAULT (0) NULL,
    [SabDA_AM]       DATETIME     NULL,
    [SabA_AM]        DATETIME     NULL,
    [SabDA_PM]       DATETIME     NULL,
    [SabA_PM]        DATETIME     NULL,
    [Dom_NonCons]    SMALLINT     DEFAULT (0) NULL,
    [DomDA_AM]       DATETIME     NULL,
    [DomA_AM]        DATETIME     NULL,
    [DomDA_PM]       DATETIME     NULL,
    [DomA_PM]        DATETIME     NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    [Lun_EffChius]   SMALLINT     DEFAULT (0) NULL,
    [Mar_EffChius]   SMALLINT     DEFAULT (0) NULL,
    [Mer_EffChius]   SMALLINT     DEFAULT (0) NULL,
    [Gio_EffChius]   SMALLINT     DEFAULT (0) NULL,
    [Ven_EffChius]   SMALLINT     DEFAULT (0) NULL,
    [Sab_EffChius]   SMALLINT     DEFAULT (0) NULL,
    [Dom_EffChius]   SMALLINT     DEFAULT (0) NULL,
    CONSTRAINT [PK_TabGGConsegna] PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [INDEX_TABGGCONSEGNA_CODCONTONUMDDDM]
    ON [dbo].[TabGGConsegna]([CODCONTO] ASC, [NUMDDM] ASC) WITH (FILLFACTOR = 90);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TabGGConsegna] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TabGGConsegna] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TabGGConsegna] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TabGGConsegna] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TabGGConsegna] TO [Metodo98]
    AS [dbo];

