CREATE TABLE [dbo].[PL_PackingRigheAllestimenti] (
    [PROGRIGA]          DECIMAL (18)     IDENTITY (1, 1) NOT NULL,
    [RIFPROGRESSIVO]    DECIMAL (18)     NOT NULL,
    [RIFRAGGR]          UNIQUEIDENTIFIER NOT NULL,
    [IDTESTADOC]        DECIMAL (18)     DEFAULT ((0)) NULL,
    [IDRIGADOC]         INT              DEFAULT ((0)) NULL,
    [IDTESTAORP]        DECIMAL (18)     DEFAULT ((0)) NULL,
    [IDRIGAORP]         INT              DEFAULT ((0)) NULL,
    [CODART]            VARCHAR (50)     NOT NULL,
    [UM]                VARCHAR (3)      NOT NULL,
    [QTA]               DECIMAL (16, 6)  DEFAULT ((0)) NULL,
    [NRRIFPARTITA]      VARCHAR (15)     DEFAULT ('') NULL,
    [RIFCOMMESSA]       VARCHAR (30)     DEFAULT ('') NULL,
    [PESONETTOARTICOLO] DECIMAL (16, 6)  DEFAULT ((0)) NULL,
    [CODARTCOMPOSTO]    VARCHAR (50)     DEFAULT ('') NULL,
    [QTAARTCOMPOSTO]    DECIMAL (16, 6)  DEFAULT ((0)) NULL,
    [UMARTCOMPOSTO]     VARCHAR (3)      DEFAULT ('') NULL,
    [UTENTEMODIFICA]    VARCHAR (25)     NOT NULL,
    [DATAMODIFICA]      DATETIME         NOT NULL,
    CONSTRAINT [PK_PL_PackingRigheAllestimenti] PRIMARY KEY CLUSTERED ([PROGRIGA] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[PL_PackingRigheAllestimenti] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[PL_PackingRigheAllestimenti] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[PL_PackingRigheAllestimenti] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[PL_PackingRigheAllestimenti] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[PL_PackingRigheAllestimenti] TO [Metodo98]
    AS [dbo];

