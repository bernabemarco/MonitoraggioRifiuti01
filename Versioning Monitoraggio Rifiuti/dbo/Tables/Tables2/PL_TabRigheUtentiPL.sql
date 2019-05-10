CREATE TABLE [dbo].[PL_TabRigheUtentiPL] (
    [RIFPROGRESSIVO] DECIMAL (10) NOT NULL,
    [IDTESTA]        DECIMAL (10) NOT NULL,
    [IDRIGA]         INT          NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    CONSTRAINT [PK_PL_TabRigheUtentiPL] PRIMARY KEY CLUSTERED ([RIFPROGRESSIVO] ASC, [IDTESTA] ASC, [IDRIGA] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[PL_TabRigheUtentiPL] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[PL_TabRigheUtentiPL] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[PL_TabRigheUtentiPL] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[PL_TabRigheUtentiPL] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[PL_TabRigheUtentiPL] TO [Metodo98]
    AS [dbo];

