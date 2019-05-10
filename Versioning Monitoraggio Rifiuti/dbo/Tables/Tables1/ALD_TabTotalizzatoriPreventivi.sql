CREATE TABLE [dbo].[ALD_TabTotalizzatoriPreventivi] (
    [TotalizzPreventivo] VARCHAR (3)  NOT NULL,
    [Descrizione]        VARCHAR (80) DEFAULT ('') NULL,
    [UTENTEMODIFICA]     VARCHAR (25) NOT NULL,
    [DATAMODIFICA]       DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([TotalizzPreventivo] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_TabTotalizzatoriPreventivi] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_TabTotalizzatoriPreventivi] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_TabTotalizzatoriPreventivi] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_TabTotalizzatoriPreventivi] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_TabTotalizzatoriPreventivi] TO [Metodo98]
    AS [dbo];

