CREATE TABLE [dbo].[SL_temp_CtrlCosti] (
    [CodArt]       VARCHAR (50)  NOT NULL,
    [UTENTE]       VARCHAR (25)  NOT NULL,
    [MsgControllo] VARCHAR (100) NULL,
    [stpRigReport] VARCHAR (1)   DEFAULT ('N') NULL,
    CONSTRAINT [PK_SL_temp_CtrlCosti] PRIMARY KEY CLUSTERED ([CodArt] ASC, [UTENTE] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[SL_temp_CtrlCosti] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[SL_temp_CtrlCosti] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[SL_temp_CtrlCosti] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[SL_temp_CtrlCosti] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[SL_temp_CtrlCosti] TO [Metodo98]
    AS [dbo];

