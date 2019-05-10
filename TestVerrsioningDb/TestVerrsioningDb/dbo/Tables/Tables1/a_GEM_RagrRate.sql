CREATE TABLE [dbo].[a_GEM_RagrRate] (
    [IDSESSIONE]  INT          NULL,
    [IDCONTRATTO] VARCHAR (13) NULL,
    [NRRATA]      INT          NULL,
    [Rap_Rif]     VARCHAR (13) NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[a_GEM_RagrRate] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[a_GEM_RagrRate] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[a_GEM_RagrRate] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[a_GEM_RagrRate] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[a_GEM_RagrRate] TO [Metodo98]
    AS [dbo];

