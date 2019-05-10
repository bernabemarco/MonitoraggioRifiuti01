CREATE TABLE [dbo].[CGCPWElencoArticoliCalcoloSchedeDB] (
    [NrTerminale] DECIMAL (5)  NOT NULL,
    [Articolo]    VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([NrTerminale] ASC, [Articolo] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGCPWElencoArticoliCalcoloSchedeDB] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGCPWElencoArticoliCalcoloSchedeDB] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGCPWElencoArticoliCalcoloSchedeDB] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGCPWElencoArticoliCalcoloSchedeDB] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGCPWElencoArticoliCalcoloSchedeDB] TO [Metodo98]
    AS [dbo];

