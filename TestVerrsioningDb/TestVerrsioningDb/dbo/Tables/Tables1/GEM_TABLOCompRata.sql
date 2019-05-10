CREATE TABLE [dbo].[GEM_TABLOCompRata] (
    [idLOCompRata]   DECIMAL (10)  NOT NULL,
    [DscLOCompRata]  VARCHAR (80)  NULL,
    [Note]           VARCHAR (200) NULL,
    [UTENTEMODIFICA] VARCHAR (25)  NOT NULL,
    [DATAMODIFICA]   DATETIME      NOT NULL,
    CONSTRAINT [PK_GEM_TABLOCompRata] PRIMARY KEY CLUSTERED ([idLOCompRata] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_TABLOCompRata] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_TABLOCompRata] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GEM_TABLOCompRata] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_TABLOCompRata] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_TABLOCompRata] TO [Metodo98]
    AS [dbo];

