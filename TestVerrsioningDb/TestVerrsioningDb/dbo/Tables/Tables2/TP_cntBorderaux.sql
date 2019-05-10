CREATE TABLE [dbo].[TP_cntBorderaux] (
    [Spedizioniere]        DECIMAL (5)  NOT NULL,
    [ProgressivoBorderaux] NUMERIC (18) NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_cntBorderaux] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_cntBorderaux] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_cntBorderaux] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_cntBorderaux] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_cntBorderaux] TO [Metodo98]
    AS [dbo];

