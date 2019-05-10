CREATE TABLE [dbo].[TP_TMP_GOF] (
    [Fornitore]     VARCHAR (7)     NOT NULL,
    [Depositario]   VARCHAR (7)     NOT NULL,
    [Magazzino]     VARCHAR (50)    NOT NULL,
    [Esercizio]     INT             NOT NULL,
    [CODART]        VARCHAR (50)    NOT NULL,
    [DESCRIZIONE]   VARCHAR (80)    NULL,
    [UM]            VARCHAR (3)     NULL,
    [TIPOUMPREZZO]  VARCHAR (3)     NULL,
    [CODIVA]        DECIMAL (19, 4) NULL,
    [GIAC]          NUMERIC (19, 4) NULL,
    [GGAPPROVV]     SMALLINT        NULL,
    [GGAPPRONT]     SMALLINT        NULL,
    [QTAMIN]        DECIMAL (19, 4) NULL,
    [QTAMAX]        DECIMAL (19, 4) NULL,
    [QTADELTA]      DECIMAL (19, 4) NULL,
    [PPARTEURO]     NUMERIC (19, 4) NULL,
    [INORD]         NUMERIC (19, 4) NULL,
    [NUMORD]        NUMERIC (19, 4) NULL,
    [INDROT]        NUMERIC (19, 4) NULL,
    [POSS]          SMALLINT        NULL,
    [SCORTAMINIMA]  NUMERIC (19, 4) NULL,
    [TP_TSicur]     SMALLINT        NULL,
    [QTAC]          DECIMAL (19, 4) NULL,
    [QTAS]          DECIMAL (19, 4) NULL,
    [PORD]          DECIMAL (19, 4) NULL,
    [NPREV]         DECIMAL (19, 4) NULL,
    [CPREV]         DECIMAL (19, 4) NULL,
    [PM_LISTINO]    DECIMAL (19)    NULL,
    [PM_CODFOR]     VARCHAR (7)     NULL,
    [PM_DESCFOR]    VARCHAR (100)   NULL,
    [PM_PREZZOVAL]  NUMERIC (19, 4) NULL,
    [PM_PREZZOEURO] NUMERIC (19, 4) NULL,
    [PM_QTAC]       DECIMAL (19, 4) NULL,
    [PM_QTAS]       DECIMAL (19, 4) NULL,
    [PM_DATA]       DATETIME        NULL,
    [QTA13]         DECIMAL (19, 4) NULL,
    [DATACONSEGNA]  DATETIME        NULL,
    PRIMARY KEY CLUSTERED ([Esercizio] ASC, [Fornitore] ASC, [Depositario] ASC, [Magazzino] ASC, [CODART] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_TMP_GOF] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_TMP_GOF] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_TMP_GOF] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_TMP_GOF] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_TMP_GOF] TO [Metodo98]
    AS [dbo];

