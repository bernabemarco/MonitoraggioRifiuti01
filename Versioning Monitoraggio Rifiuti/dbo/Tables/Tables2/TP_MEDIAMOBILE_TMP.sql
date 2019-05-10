CREATE TABLE [dbo].[TP_MEDIAMOBILE_TMP] (
    [CodArticolo]    VARCHAR (50)    NOT NULL,
    [CodDeposito]    VARCHAR (10)    NOT NULL,
    [Periodi]        SMALLINT        NOT NULL,
    [1]              DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [2]              DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [3]              DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [4]              DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [5]              DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [6]              DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [7]              DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [8]              DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [9]              DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [10]             DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [11]             DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [12]             DECIMAL (18, 6) DEFAULT ((0)) NOT NULL,
    [UtenteModifica] VARCHAR (25)    NOT NULL,
    [DataModifica]   DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([CodArticolo] ASC, [CodDeposito] ASC, [Periodi] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_ORDINEFORNITORE_MEDIAMOBILE_TMP_1]
    ON [dbo].[TP_MEDIAMOBILE_TMP]([Periodi] ASC)
    INCLUDE([CodArticolo], [CodDeposito]);


GO
CREATE NONCLUSTERED INDEX [IX_ORDINEFORNITORE_MEDIAMOBILE_TMP_2]
    ON [dbo].[TP_MEDIAMOBILE_TMP]([Periodi] ASC)
    INCLUDE([CodArticolo], [CodDeposito], [1], [2], [3], [4], [5], [6], [7], [8], [9]);


GO
CREATE NONCLUSTERED INDEX [IX_ORDINEFORNITORE_MEDIAMOBILE_TMP_3]
    ON [dbo].[TP_MEDIAMOBILE_TMP]([Periodi] ASC)
    INCLUDE([CodArticolo], [CodDeposito], [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12]);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_MEDIAMOBILE_TMP] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_MEDIAMOBILE_TMP] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_MEDIAMOBILE_TMP] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_MEDIAMOBILE_TMP] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_MEDIAMOBILE_TMP] TO [Metodo98]
    AS [dbo];

