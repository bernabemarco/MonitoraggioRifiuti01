CREATE TABLE [dbo].[temp_GDETT_RAP_IMPIANTI] (
    [IDCONTRATTO]    CHAR (13)     NOT NULL,
    [IDRAPPORTO]     CHAR (14)     NOT NULL,
    [IDDETTAGLIO]    DECIMAL (5)   NOT NULL,
    [CAMPO01]        SMALLINT      NULL,
    [CAMPO02]        SMALLINT      NULL,
    [CAMPO03]        SMALLINT      NULL,
    [CAMPO04]        SMALLINT      NULL,
    [CAMPO05]        SMALLINT      NULL,
    [CAMPO06]        SMALLINT      NULL,
    [CAMPO07]        SMALLINT      NULL,
    [CAMPO08]        SMALLINT      NULL,
    [CAMPO09]        SMALLINT      NULL,
    [CAMPO10]        SMALLINT      NULL,
    [CAMPO11]        SMALLINT      NULL,
    [CAMPO12]        SMALLINT      NULL,
    [CAMPO13]        SMALLINT      NULL,
    [CAMPO14]        SMALLINT      NULL,
    [CAMPO15]        SMALLINT      NULL,
    [CAMPO16]        SMALLINT      NULL,
    [CAMPO17]        SMALLINT      NULL,
    [CAMPO18]        SMALLINT      NULL,
    [CAMPO19]        SMALLINT      NULL,
    [CAMPO20]        SMALLINT      NULL,
    [CAMPO21]        SMALLINT      NULL,
    [CAMPO22]        SMALLINT      NULL,
    [CAMPO23]        SMALLINT      NULL,
    [CAMPO24]        SMALLINT      NULL,
    [CAMPO25]        SMALLINT      NULL,
    [CAMPO26]        SMALLINT      NULL,
    [CAMPO27]        SMALLINT      NULL,
    [CAMPO28]        SMALLINT      NULL,
    [CAMPO29]        SMALLINT      NULL,
    [CAMPO30]        SMALLINT      NULL,
    [CAMPO31]        SMALLINT      NULL,
    [CAMPO32]        SMALLINT      NULL,
    [CAMPO33]        SMALLINT      NULL,
    [CAMPO34]        SMALLINT      NULL,
    [CAMPO35]        SMALLINT      NULL,
    [CAMPO36]        SMALLINT      NULL,
    [CAMPO37]        SMALLINT      NULL,
    [CAMPO38]        SMALLINT      NULL,
    [CAMPO39]        SMALLINT      NULL,
    [CAMPO40]        SMALLINT      NULL,
    [CAMPO41]        SMALLINT      NULL,
    [CAMPO42]        SMALLINT      NULL,
    [CAMPO43]        SMALLINT      NULL,
    [CAMPO44]        SMALLINT      NULL,
    [CAMPO45]        SMALLINT      NULL,
    [CAMPO46]        SMALLINT      NULL,
    [CAMPO47]        SMALLINT      NULL,
    [CAMPO48]        SMALLINT      NULL,
    [CAMPO49]        SMALLINT      NULL,
    [CAMPO50]        SMALLINT      NULL,
    [DATA_ULT_MOD]   DATETIME      NULL,
    [UTENTE_ULT_MOD] NVARCHAR (50) NULL,
    [IP_ULT_MOD]     NVARCHAR (50) NULL,
    [SEGNALATO]      BIT           NULL,
    [NUOVARIGA]      CHAR (1)      NULL,
    CONSTRAINT [PK_temp_GDETT_RAP_IMPIANTI] PRIMARY KEY CLUSTERED ([IDCONTRATTO] ASC, [IDRAPPORTO] ASC, [IDDETTAGLIO] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[temp_GDETT_RAP_IMPIANTI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[temp_GDETT_RAP_IMPIANTI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[temp_GDETT_RAP_IMPIANTI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[temp_GDETT_RAP_IMPIANTI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[temp_GDETT_RAP_IMPIANTI] TO [Metodo98]
    AS [dbo];

