CREATE TABLE [dbo].[CGesMovimentiMetodoDettaglio] (
    [RifProgressivo]  DECIMAL (10) NOT NULL,
    [ProgressivoCont] DECIMAL (10) NOT NULL,
    [RigaCont]        SMALLINT     NOT NULL,
    [RigaContComp]    INT          NOT NULL,
    [ProgressivoCDC]  DECIMAL (10) NOT NULL,
    [UtenteModifica]  VARCHAR (25) NOT NULL,
    [DataModifica]    DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([RifProgressivo] ASC, [ProgressivoCont] ASC, [RigaCont] ASC, [RigaContComp] ASC, [ProgressivoCDC] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesMovimentiMetodoDettaglio] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesMovimentiMetodoDettaglio] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesMovimentiMetodoDettaglio] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesMovimentiMetodoDettaglio] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesMovimentiMetodoDettaglio] TO [Metodo98]
    AS [dbo];

