CREATE TABLE [dbo].[CGCPWVisualizzaSchedeODP] (
    [NrTerminale]     DECIMAL (5)     NOT NULL,
    [NumeroRiga]      INT             NOT NULL,
    [CodiceStampa]    VARCHAR (80)    DEFAULT ('') NULL,
    [Descrizione]     VARCHAR (80)    DEFAULT ('') NULL,
    [OrdineStampa]    INT             DEFAULT (0) NULL,
    [ValoreVariabile] DECIMAL (19, 6) DEFAULT (0) NULL,
    [ValoreFisso]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [ValoreTotale]    DECIMAL (19, 6) DEFAULT (0) NULL,
    [Percentuale]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [UtenteModifica]  VARCHAR (25)    NOT NULL,
    [DataModifica]    DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([NrTerminale] ASC, [NumeroRiga] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGCPWVisualizzaSchedeODP] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGCPWVisualizzaSchedeODP] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGCPWVisualizzaSchedeODP] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGCPWVisualizzaSchedeODP] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGCPWVisualizzaSchedeODP] TO [Metodo98]
    AS [dbo];

