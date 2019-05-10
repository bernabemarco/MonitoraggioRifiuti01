CREATE TABLE [dbo].[PL_TabTesteUtentiPL] (
    [PROGRESSIVO]         DECIMAL (10) NOT NULL,
    [PROGRPL]             DECIMAL (19) NOT NULL,
    [NUMPL]               DECIMAL (19) NOT NULL,
    [ESERCIZIO]           DECIMAL (5)  NOT NULL,
    [CLIFOR]              VARCHAR (7)  NOT NULL,
    [DESTINAZIONEDIVERSA] DECIMAL (5)  NOT NULL,
    [MODALITA]            SMALLINT     NOT NULL,
    [BLOCCAINTEROPL]      SMALLINT     DEFAULT ((0)) NULL,
    [USERID]              VARCHAR (25) NOT NULL,
    [NRTERMINALE]         DECIMAL (5)  NOT NULL,
    [UTENTEMODIFICA]      VARCHAR (25) NOT NULL,
    [DATAMODIFICA]        DATETIME     NOT NULL,
    CONSTRAINT [PK_PL_TabTesteUtentiPL] PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC)
);


GO


CREATE TRIGGER TD_PL_TabTesteUtentiPL ON PL_TabTesteUtentiPL
FOR DELETE 
AS
    /*  DELETE ALL CHILDREN IN "PL_TabRigheUtentiPL"  */
    DELETE PL_TabRigheUtentiPL
    FROM     PL_TabRigheUtentiPL T2, DELETED T1
    WHERE  T2.RIFPROGRESSIVO = T1.PROGRESSIVO


GO
GRANT DELETE
    ON OBJECT::[dbo].[PL_TabTesteUtentiPL] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[PL_TabTesteUtentiPL] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[PL_TabTesteUtentiPL] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[PL_TabTesteUtentiPL] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[PL_TabTesteUtentiPL] TO [Metodo98]
    AS [dbo];

