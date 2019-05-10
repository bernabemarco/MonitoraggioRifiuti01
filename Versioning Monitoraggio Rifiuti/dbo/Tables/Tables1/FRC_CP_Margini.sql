CREATE TABLE [dbo].[FRC_CP_Margini] (
    [NumeroRiga]     INT             NOT NULL,
    [Ambiente]       VARCHAR (3)     DEFAULT ('') NULL,
    [Anno]           INT             DEFAULT ((0)) NULL,
    [Settore]        DECIMAL (5)     DEFAULT ((0)) NULL,
    [Zona]           DECIMAL (5)     DEFAULT ((0)) NULL,
    [Categoria]      DECIMAL (5)     DEFAULT ((0)) NULL,
    [PercMargine]    DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [PercMargine2]   DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [UtenteModifica] VARCHAR (25)    NOT NULL,
    [DataModifica]   DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([NumeroRiga] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRC_CP_Margini] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRC_CP_Margini] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRC_CP_Margini] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRC_CP_Margini] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRC_CP_Margini] TO [Metodo98]
    AS [dbo];

