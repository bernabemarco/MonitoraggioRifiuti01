CREATE TABLE [dbo].[CGCPCategorieGruppoCosti] (
    [Categoria]      DECIMAL (5)   NOT NULL,
    [GruppoCosti]    VARCHAR (3)   DEFAULT ('') NULL,
    [Note]           VARCHAR (100) DEFAULT ('') NULL,
    [UtenteModifica] VARCHAR (25)  NOT NULL,
    [DataModifica]   DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([Categoria] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGCPCategorieGruppoCosti] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGCPCategorieGruppoCosti] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGCPCategorieGruppoCosti] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGCPCategorieGruppoCosti] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGCPCategorieGruppoCosti] TO [Metodo98]
    AS [dbo];

