CREATE TABLE [dbo].[FRCWArticoliMPS] (
    [NrTerminale] DECIMAL (5)  NOT NULL,
    [Articolo]    VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([NrTerminale] ASC, [Articolo] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRCWArticoliMPS] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRCWArticoliMPS] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCWArticoliMPS] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCWArticoliMPS] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRCWArticoliMPS] TO [Metodo98]
    AS [dbo];

