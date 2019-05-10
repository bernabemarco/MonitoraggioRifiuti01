CREATE TABLE [dbo].[GRI_RAPPORTI_ServiziAccessori] (
    [IDRAPPORTO]     VARCHAR (14)    NOT NULL,
    [IDRIGA]         DECIMAL (5)     NOT NULL,
    [IDMATERIALE]    VARCHAR (50)    NOT NULL,
    [PREZZO]         NUMERIC (10, 2) NULL,
    [SCONTO]         NUMERIC (10, 5) NULL,
    [QTA]            NUMERIC (10, 2) NULL,
    [PROVVIGIONE1]   NUMERIC (18, 2) NULL,
    [PROVVIGIONE2]   NUMERIC (18, 2) NULL,
    [PROVVIGIONE3]   NUMERIC (18, 2) NULL,
    [flg_mat_dafatt] VARCHAR (1)     DEFAULT ('S') NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL,
    CONSTRAINT [GRI_RAPPORTI_ServiziAccessori_PK] PRIMARY KEY CLUSTERED ([IDRAPPORTO] ASC, [IDRIGA] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GRI_RAPPORTI_ServiziAccessori] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GRI_RAPPORTI_ServiziAccessori] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GRI_RAPPORTI_ServiziAccessori] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GRI_RAPPORTI_ServiziAccessori] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GRI_RAPPORTI_ServiziAccessori] TO [Metodo98]
    AS [dbo];

