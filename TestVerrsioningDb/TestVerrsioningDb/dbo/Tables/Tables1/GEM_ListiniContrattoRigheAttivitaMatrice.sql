CREATE TABLE [dbo].[GEM_ListiniContrattoRigheAttivitaMatrice] (
    [idGListinoContr] DECIMAL (10)    NOT NULL,
    [IdRigaListinoC]  DECIMAL (5)     NOT NULL,
    [idAttivita]      DECIMAL (5)     NOT NULL,
    [IdRigaListino]   DECIMAL (10)    NULL,
    [Listino]         DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [Netto]           DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [SCONTO]          DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [PROVVAG1]        DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [PROVVAG2]        DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [PROVVAG3]        DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [UTENTEMODIFICA]  VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]    DATETIME        NOT NULL,
    CONSTRAINT [GEM_ListiniContrattoRigheAttivitaMatrice_PK] PRIMARY KEY CLUSTERED ([idGListinoContr] ASC, [IdRigaListinoC] ASC, [idAttivita] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_ListiniContrattoRigheAttivitaMatrice] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_ListiniContrattoRigheAttivitaMatrice] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GEM_ListiniContrattoRigheAttivitaMatrice] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_ListiniContrattoRigheAttivitaMatrice] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_ListiniContrattoRigheAttivitaMatrice] TO [Metodo98]
    AS [dbo];

