CREATE TABLE [dbo].[PackingContenutoRigaImballo] (
    [RIFPROGRESSIVO]   DECIMAL (10)    NOT NULL,
    [NRRIGARIF]        INT             NOT NULL,
    [RIFPROGCONFIMB]   DECIMAL (10)    NOT NULL,
    [RIFRIGACONFIMB]   INT             NOT NULL,
    [RIFNRRIGACONFIMB] INT             NOT NULL,
    [CODARTICOLO]      VARCHAR (50)    NOT NULL,
    [PESONETTO]        DECIMAL (16, 6) CONSTRAINT [DF_PackingContenutoRigaImballo_PESONETTO] DEFAULT (0) NOT NULL,
    [QTA]              DECIMAL (16, 6) CONSTRAINT [DF_PackingContenutoRigaImballo_QTA] DEFAULT (0) NOT NULL,
    [UM]               VARCHAR (3)     NOT NULL,
    [CUBATURA]         DECIMAL (16, 6) CONSTRAINT [DF_PackingContenutoRigaImballo_CUBATURA] DEFAULT (0) NOT NULL,
    [NRPEZZIIMBALLO]   DECIMAL (19, 6) CONSTRAINT [DF_PackingContenutoRigaImballo_NRPEZZIIMBALLO] DEFAULT (0) NOT NULL,
    [RIFERIMIMBALLO]   VARCHAR (10)    CONSTRAINT [DF_PackingContenutoRigaImballo_RIFERIMIMBALLO] DEFAULT ('') NOT NULL,
    [UTENTEMODIFICA]   VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]     DATETIME        NOT NULL,
    [ESERCIZIO]        DECIMAL (5)     NOT NULL,
    [IDCFGIMB]         DECIMAL (18)    CONSTRAINT [DF_PackingContenutoRigaImballo_IDCFGIMB] DEFAULT (0) NOT NULL,
    CONSTRAINT [PK_PackingContenutoRigaImballo] PRIMARY KEY CLUSTERED ([RIFPROGRESSIVO] ASC, [NRRIGARIF] ASC, [RIFPROGCONFIMB] ASC, [RIFRIGACONFIMB] ASC, [RIFNRRIGACONFIMB] ASC, [ESERCIZIO] ASC, [IDCFGIMB] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[PackingContenutoRigaImballo] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[PackingContenutoRigaImballo] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[PackingContenutoRigaImballo] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[PackingContenutoRigaImballo] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[PackingContenutoRigaImballo] TO [Metodo98]
    AS [dbo];

