CREATE TABLE [dbo].[SEC_Moduli] (
    [CodModulo]            NVARCHAR (16) NULL,
    [NomeCampo]            NVARCHAR (68) NULL,
    [Progressivo]          NVARCHAR (13) NULL,
    [SecGrup]              SMALLINT      NULL,
    [GrpAutor]             NVARCHAR (5)  NULL,
    [FlgPronto]            NVARCHAR (1)  NULL,
    [FlgConoscenza]        NVARCHAR (1)  NULL,
    [CodUtente]            NVARCHAR (25) NULL,
    [DataFirma]            DATETIME      NULL,
    [OraFirma]             DATETIME      NULL,
    [IdDocumentoRevisione] NVARCHAR (50) NULL,
    [GrpCtrlFirma]         NVARCHAR (5)  NULL
);


GO
CREATE NONCLUSTERED INDEX [FlgConoscenza]
    ON [dbo].[SEC_Moduli]([FlgConoscenza] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [FlgPronto]
    ON [dbo].[SEC_Moduli]([FlgPronto] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [GrpAutor]
    ON [dbo].[SEC_Moduli]([GrpAutor] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [IdDocumentoRevisione]
    ON [dbo].[SEC_Moduli]([IdDocumentoRevisione] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [idFirma]
    ON [dbo].[SEC_Moduli]([CodModulo] ASC, [Progressivo] ASC, [SecGrup] ASC) WITH (FILLFACTOR = 90);


GO
GRANT DELETE
    ON OBJECT::[dbo].[SEC_Moduli] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[SEC_Moduli] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[SEC_Moduli] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[SEC_Moduli] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[SEC_Moduli] TO [Metodo98]
    AS [dbo];

