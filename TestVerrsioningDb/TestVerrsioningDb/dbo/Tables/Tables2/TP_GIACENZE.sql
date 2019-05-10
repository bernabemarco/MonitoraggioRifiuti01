CREATE TABLE [dbo].[TP_GIACENZE] (
    [CodDeposito]      VARCHAR (10)    NOT NULL,
    [CodArticolo]      VARCHAR (50)    NOT NULL,
    [Giacenza]         DECIMAL (18, 6) NULL,
    [Ordinato]         DECIMAL (18, 6) NULL,
    [Impegnato]        DECIMAL (18, 6) NULL,
    [Carico]           DECIMAL (18, 6) NULL,
    [Scarico]          DECIMAL (18, 6) NULL,
    [ResoDaCarico]     DECIMAL (18, 6) NULL,
    [ResoDaScarico]    DECIMAL (18, 6) NULL,
    [InOrdine]         DECIMAL (18)    NULL,
    [UM]               VARCHAR (3)     NULL,
    [IndRot]           NUMERIC (19, 4) NULL,
    [PrezzoMedio]      DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [PrezzoUltimo]     DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [ValoreLifo]       DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [ProgressivoSTMAG] DECIMAL (18)    NULL,
    [UtenteModifica]   VARCHAR (25)    NULL,
    [DataModifica]     DATETIME        NULL,
    [Esercizio]        DECIMAL (5)     DEFAULT ((0)) NOT NULL,
    PRIMARY KEY CLUSTERED ([CodDeposito] ASC, [CodArticolo] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_GIACENZE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_GIACENZE] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_GIACENZE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_GIACENZE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_GIACENZE] TO [Metodo98]
    AS [dbo];

