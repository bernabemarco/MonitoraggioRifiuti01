CREATE TABLE [dbo].[CGesDateElaborazioni] (
    [Ambiente]        VARCHAR (3)  NOT NULL,
    [Anno]            DECIMAL (5)  NOT NULL,
    [Mese]            INT          NOT NULL,
    [DataTransazioni] DATETIME     NULL,
    [DataQuantita]    DATETIME     NULL,
    [DataMovimenti]   DATETIME     NULL,
    [DataPersonale]   DATETIME     NULL,
    [DataCespiti]     DATETIME     NULL,
    [DataValori]      DATETIME     NULL,
    [DataReversioni]  DATETIME     NULL,
    [UtenteModifica]  VARCHAR (25) NOT NULL,
    [DataModifica]    DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([Ambiente] ASC, [Anno] ASC, [Mese] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesDateElaborazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesDateElaborazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesDateElaborazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesDateElaborazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesDateElaborazioni] TO [Metodo98]
    AS [dbo];

