CREATE TABLE [dbo].[CGesCalcoloBEPRighe] (
    [RifProgressivo] DECIMAL (10)    NOT NULL,
    [Numero]         INT             NOT NULL,
    [ContoVoce]      VARCHAR (20)    DEFAULT ('') NULL,
    [Descrizione]    VARCHAR (80)    DEFAULT ('') NULL,
    [Giorni]         DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [Mese]           DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [Quantita]       DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [Ricavi]         DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [CostiFissi]     DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [CostiVariabili] DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [CostiTotali]    DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [Risultato]      DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [GiorniP]        DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [UtenteModifica] VARCHAR (25)    NOT NULL,
    [DataModifica]   DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([RifProgressivo] ASC, [Numero] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesCalcoloBEPRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesCalcoloBEPRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesCalcoloBEPRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesCalcoloBEPRighe] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesCalcoloBEPRighe] TO [Metodo98]
    AS [dbo];

