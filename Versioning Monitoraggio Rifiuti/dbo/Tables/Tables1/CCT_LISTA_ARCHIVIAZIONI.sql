CREATE TABLE [dbo].[CCT_LISTA_ARCHIVIAZIONI] (
    [Progressivo]        INT          NOT NULL,
    [Riferimento]        DECIMAL (12) NOT NULL,
    [CodArchiviazione]   DECIMAL (15) NOT NULL,
    [CodTipologia]       DECIMAL (5)  NOT NULL,
    [StatoInvio]         SMALLINT     DEFAULT ((0)) NOT NULL,
    [StatoArchiviazione] SMALLINT     DEFAULT ((0)) NOT NULL,
    [Datainvio]          DATETIME     NULL,
    [Utentemodifica]     VARCHAR (25) NOT NULL,
    [Datamodifica]       DATETIME     NOT NULL,
    CONSTRAINT [PK_CCT_LISTA_ARCHIVIAZIONI] PRIMARY KEY CLUSTERED ([Progressivo] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CCT_LISTA_ARCHIVIAZIONI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CCT_LISTA_ARCHIVIAZIONI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CCT_LISTA_ARCHIVIAZIONI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CCT_LISTA_ARCHIVIAZIONI] TO [Metodo98]
    AS [dbo];

