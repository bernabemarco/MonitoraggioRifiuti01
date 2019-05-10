CREATE TABLE [dbo].[TP_ART_TRASF_ORDF] (
    [CodArt]     VARCHAR (50)    NOT NULL,
    [CodMag]     VARCHAR (50)    NULL,
    [DescMag]    VARCHAR (50)    NOT NULL,
    [QtaTrasf]   NUMERIC (19, 6) NOT NULL,
    [Giac]       NUMERIC (19, 6) NOT NULL,
    [NomeUtente] VARCHAR (50)    NOT NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_ART_TRASF_ORDF] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_ART_TRASF_ORDF] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_ART_TRASF_ORDF] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_ART_TRASF_ORDF] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_ART_TRASF_ORDF] TO [Metodo98]
    AS [dbo];

