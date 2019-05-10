CREATE TABLE [dbo].[TP_FASCE_CONTINGENZA_ART] (
    [CodArt]         VARCHAR (50)    NOT NULL,
    [Fascia1]        NUMERIC (19, 6) NULL,
    [Fascia2]        NUMERIC (19, 6) NULL,
    [Fascia3]        NUMERIC (19, 6) NULL,
    [Fascia4]        NUMERIC (19, 6) NULL,
    [Fascia5]        NUMERIC (19, 6) NULL,
    [Fascia6]        NUMERIC (19, 6) NULL,
    [Fascia7]        NUMERIC (19, 6) NULL,
    [Fascia8]        NUMERIC (19, 6) NULL,
    [Datamodifica]   DATETIME        NULL,
    [Utentemodifica] VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([CodArt] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_FASCE_CONTINGENZA_ART] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_FASCE_CONTINGENZA_ART] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_FASCE_CONTINGENZA_ART] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_FASCE_CONTINGENZA_ART] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_FASCE_CONTINGENZA_ART] TO [Metodo98]
    AS [dbo];

