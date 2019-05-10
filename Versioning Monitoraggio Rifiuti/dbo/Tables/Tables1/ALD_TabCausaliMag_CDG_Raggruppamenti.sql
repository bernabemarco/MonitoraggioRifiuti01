CREATE TABLE [dbo].[ALD_TabCausaliMag_CDG_Raggruppamenti] (
    [CODCausale]     DECIMAL (5)  NOT NULL,
    [Descrizione]    VARCHAR (80) NULL,
    [Segno]          VARCHAR (1)  NOT NULL,
    [Raggruppamento] VARCHAR (80) NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([CODCausale] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_TabCausaliMag_CDG_Raggruppamenti] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_TabCausaliMag_CDG_Raggruppamenti] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_TabCausaliMag_CDG_Raggruppamenti] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_TabCausaliMag_CDG_Raggruppamenti] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_TabCausaliMag_CDG_Raggruppamenti] TO [Metodo98]
    AS [dbo];

