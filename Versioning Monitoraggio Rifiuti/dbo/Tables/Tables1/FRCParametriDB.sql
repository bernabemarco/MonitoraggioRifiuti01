CREATE TABLE [dbo].[FRCParametriDB] (
    [NumeroRiga]     INT             NOT NULL,
    [Anno]           INT             DEFAULT ((0)) NULL,
    [Gruppo]         DECIMAL (5)     DEFAULT ((0)) NULL,
    [Categoria]      DECIMAL (5)     DEFAULT ((0)) NULL,
    [CategoriaStat]  DECIMAL (5)     DEFAULT ((0)) NULL,
    [Resa]           DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [AcqITA]         DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [AcqEST]         DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [UtenteModifica] VARCHAR (25)    NOT NULL,
    [DataModifica]   DATETIME        NOT NULL,
    [Ambiente]       VARCHAR (3)     DEFAULT ('') NULL,
    PRIMARY KEY CLUSTERED ([NumeroRiga] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRCParametriDB] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRCParametriDB] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCParametriDB] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCParametriDB] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRCParametriDB] TO [Metodo98]
    AS [dbo];

