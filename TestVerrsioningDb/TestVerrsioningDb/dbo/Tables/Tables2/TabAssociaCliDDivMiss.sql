CREATE TABLE [dbo].[TabAssociaCliDDivMiss] (
    [CLIENTE]             VARCHAR (7)  NOT NULL,
    [DESTINAZIONEDIVERSA] DECIMAL (5)  NOT NULL,
    [UtenteModifica]      VARCHAR (25) NOT NULL,
    [DataModifica]        DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([CLIENTE] ASC, [DESTINAZIONEDIVERSA] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TabAssociaCliDDivMiss] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TabAssociaCliDDivMiss] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TabAssociaCliDDivMiss] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TabAssociaCliDDivMiss] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TabAssociaCliDDivMiss] TO [Metodo98]
    AS [dbo];

