CREATE TABLE [dbo].[CGCPFattoriConvOre] (
    [Codice]         VARCHAR (5)     NOT NULL,
    [TipoUM]         SMALLINT        DEFAULT (0) NULL,
    [Operazione]     SMALLINT        DEFAULT (0) NULL,
    [FattoreConv]    DECIMAL (19, 6) DEFAULT (0) NULL,
    [Note]           VARCHAR (100)   DEFAULT ('') NULL,
    [UtenteModifica] VARCHAR (25)    NOT NULL,
    [DataModifica]   DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([Codice] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGCPFattoriConvOre] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGCPFattoriConvOre] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGCPFattoriConvOre] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGCPFattoriConvOre] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGCPFattoriConvOre] TO [Metodo98]
    AS [dbo];

