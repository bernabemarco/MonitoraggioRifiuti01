CREATE TABLE [dbo].[CGCPOperazioniGruppoCosti] (
    [Operazione]     VARCHAR (5)   NOT NULL,
    [CDLavoro]       VARCHAR (5)   NOT NULL,
    [GruppoCosti]    VARCHAR (3)   DEFAULT ('') NULL,
    [Note]           VARCHAR (100) DEFAULT ('') NULL,
    [UtenteModifica] VARCHAR (25)  NOT NULL,
    [DataModifica]   DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([Operazione] ASC, [CDLavoro] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGCPOperazioniGruppoCosti] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGCPOperazioniGruppoCosti] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGCPOperazioniGruppoCosti] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGCPOperazioniGruppoCosti] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGCPOperazioniGruppoCosti] TO [Metodo98]
    AS [dbo];

