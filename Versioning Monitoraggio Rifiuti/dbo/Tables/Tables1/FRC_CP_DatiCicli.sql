CREATE TABLE [dbo].[FRC_CP_DatiCicli] (
    [ID]                    INT             IDENTITY (1, 1) NOT NULL,
    [IDOrigine]             INT             NOT NULL,
    [COMPONENTE]            VARCHAR (50)    NULL,
    [RIFFASE]               INT             NULL,
    [POSIZIONE]             INT             NULL,
    [OPERAZIONE]            VARCHAR (5)     NULL,
    [CDLAVORO]              VARCHAR (5)     NULL,
    [MACCHINA]              VARCHAR (5)     NULL,
    [CDCProd]               VARCHAR (10)    NULL,
    [CDCMop]                VARCHAR (10)    NULL,
    [CDCSetup]              VARCHAR (10)    NULL,
    [TEMPOSETUPTOT]         DECIMAL (19, 6) NULL,
    [TEMPORISORSATOT]       DECIMAL (19, 6) NULL,
    [TEMPOUOMOTOT]          DECIMAL (19, 6) NULL,
    [CostoTrasfVarSetup]    DECIMAL (19, 6) NULL,
    [CostoTrasfFisSetup]    DECIMAL (19, 6) NULL,
    [CostoTrasfVarUomo]     DECIMAL (19, 6) NULL,
    [CostoTrasfFisUomo]     DECIMAL (19, 6) NULL,
    [CostoTrasfVarMacchina] DECIMAL (19, 6) NULL,
    [CostoTrasfFisMacchina] DECIMAL (19, 6) NULL,
    [UTENTEMODIFICA]        VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]          DATETIME        NOT NULL,
    CONSTRAINT [KEY_FRC_CP_DatiCicli] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRC_CP_DatiCicli] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRC_CP_DatiCicli] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRC_CP_DatiCicli] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRC_CP_DatiCicli] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRC_CP_DatiCicli] TO [Metodo98]
    AS [dbo];

