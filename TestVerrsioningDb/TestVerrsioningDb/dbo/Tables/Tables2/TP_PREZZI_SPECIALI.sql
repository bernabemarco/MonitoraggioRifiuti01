CREATE TABLE [dbo].[TP_PREZZI_SPECIALI] (
    [AcquistoVendita]    CHAR (1)        NOT NULL,
    [AliquotaEccedente]  NUMERIC (19, 6) NULL,
    [AliquotaPrecedente] NUMERIC (19, 6) NULL,
    [Valoreda]           NUMERIC (19, 6) NOT NULL,
    [Valorea]            NUMERIC (19, 6) NOT NULL,
    [Datamodifica]       DATETIME        NULL,
    [Utentemodifica]     VARCHAR (25)    NULL,
    PRIMARY KEY CLUSTERED ([AcquistoVendita] ASC, [Valoreda] ASC, [Valorea] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_PREZZI_SPECIALI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_PREZZI_SPECIALI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_PREZZI_SPECIALI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_PREZZI_SPECIALI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_PREZZI_SPECIALI] TO [Metodo98]
    AS [dbo];

