CREATE TABLE [dbo].[TMP_GESTIONEPREZZI_RIGHE_CLASSIFICATE] (
    [PROGRESSIVO]            DECIMAL (10)    NOT NULL,
    [CODGRUPPOPREZZICF]      DECIMAL (5)     NOT NULL,
    [CODCLIFOR]              VARCHAR (7)     NOT NULL,
    [CODDESTINAZIONE]        DECIMAL (5)     NOT NULL,
    [CODART]                 VARCHAR (50)    NOT NULL,
    [CODGRUPPOPREZZIMAG]     DECIMAL (5)     NULL,
    [INIZIOVALIDITA]         DATETIME        NOT NULL,
    [FINEVALIDITA]           DATETIME        NOT NULL,
    [FAMIGLIA]               DECIMAL (5)     NOT NULL,
    [REPARTO]                DECIMAL (5)     NOT NULL,
    [TIPOARROT]              VARCHAR (1)     NULL,
    [ARROTAVALUTA]           DECIMAL (19, 4) NOT NULL,
    [ARROTONDA]              DECIMAL (19, 4) NOT NULL,
    [CODARTTIPOLOGIA]        VARCHAR (50)    NULL,
    [VARIANTI]               SMALLINT        NULL,
    [UM]                     VARCHAR (3)     NOT NULL,
    [TIPORIGA]               SMALLINT        NOT NULL,
    [QTAMINIMA]              DECIMAL (16, 6) NOT NULL,
    [IMPORTOVALUTA]          DECIMAL (19, 6) NULL,
    [IMPORTO]                DECIMAL (19, 6) NULL,
    [TIPOSCONTO]             SMALLINT        NOT NULL,
    [PROGRESSIVOCTR]         DECIMAL (5)     NOT NULL,
    [CODSETTORE]             DECIMAL (5)     NULL,
    [CODZONA]                DECIMAL (5)     NULL,
    [CODCATEGORIA]           DECIMAL (5)     NULL,
    [CLIFOR]                 SMALLINT        NULL,
    [TipoEspositore]         SMALLINT        NULL,
    [PROGRESSIVOREGOLETESTE] DECIMAL (10)    NULL,
    [IDRIGA]                 DECIMAL (10)    NULL,
    [CODSCONTO]              VARCHAR (5)     NULL,
    [SCONTO]                 VARCHAR (20)    NULL,
    [POSIZIONE]              INT             NULL,
    [INIZIOVALIDITASC]       DATETIME        NULL,
    [FINEVALIDITASC]         DATETIME        NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TMP_GESTIONEPREZZI_RIGHE_CLASSIFICATE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TMP_GESTIONEPREZZI_RIGHE_CLASSIFICATE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TMP_GESTIONEPREZZI_RIGHE_CLASSIFICATE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TMP_GESTIONEPREZZI_RIGHE_CLASSIFICATE] TO [Metodo98]
    AS [dbo];

