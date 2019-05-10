CREATE TABLE [dbo].[TMP_ANAGRAFICAARTICOLI] (
    [CODICE]                  VARCHAR (50)    NOT NULL,
    [DESCRIZIONE]             VARCHAR (80)    NULL,
    [GRUPPO]                  DECIMAL (5)     NULL,
    [CATEGORIA]               DECIMAL (5)     NULL,
    [CODCATEGORIASTAT]        DECIMAL (5)     NULL,
    [PESONETTO]               DECIMAL (16, 6) NULL,
    [SUPERFICIE]              DECIMAL (16, 6) NULL,
    [CUBATURA]                DECIMAL (16, 6) NULL,
    [NOMENCLCOMBINATA1]       VARCHAR (8)     NULL,
    [NOMENCLCOMBINATA2]       VARCHAR (8)     NULL,
    [ORIGINEINTRA]            VARCHAR (3)     NULL,
    [CODICEARTIMBALLO]        VARCHAR (50)    NULL,
    [NRPEZZIIMBALLO]          DECIMAL (16, 6) NULL,
    [RIFERIMIMBALLO]          VARCHAR (10)    NULL,
    [AGGIORNAMAG]             SMALLINT        NULL,
    [MOVIMENTAPARTITE]        SMALLINT        NULL,
    [MOVIMENTAMATRICOLE]      SMALLINT        NULL,
    [CODDEPOSITO]             VARCHAR (10)    NOT NULL,
    [NRTIPRAGGRUPPATE]        SMALLINT        NULL,
    [VARESPLICITE]            VARCHAR (255)   NULL,
    [CODICEPRIMARIO]          VARCHAR (50)    NULL,
    [ARTTIPOLOGIA]            SMALLINT        NULL,
    [UTENTEMODIFICA]          VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]            DATETIME        NOT NULL,
    [ARTCONFIGURATO]          SMALLINT        NULL,
    [DESCRESTESA]             VARCHAR (3000)  NULL,
    [SERIE]                   VARCHAR (20)    NULL,
    [MODELLO]                 VARCHAR (20)    NULL,
    [ModelloBudget]           VARCHAR (5)     NULL,
    [TipologiaProdotto]       VARCHAR (5)     NULL,
    [APPLICAMAGGIORAZIONI]    SMALLINT        NULL,
    [PRODIGIOUSAPREZZIMETODO] SMALLINT        NULL,
    [PRODIGIORAGGRCODICE]     SMALLINT        NULL,
    [PRODIGIOUSADESCRMETODO]  SMALLINT        NULL,
    [PRODIGIOESCLUDIBOX]      SMALLINT        NULL,
    [TIPOINTRA]               SMALLINT        NULL,
    [CODSERVIZIOINTRA]        VARCHAR (6)     NULL,
    [MODEROGAZINTRA]          VARCHAR (1)     NULL,
    [FLGSISTRI]               SMALLINT        NOT NULL,
    [TIPART62]                SMALLINT        NULL,
    [UMSUPPLNOMCOMB1]         VARCHAR (3)     NULL,
    [UMSUPPLNOMCOMB2]         VARCHAR (3)     NULL,
    [FLGQUALITY]              SMALLINT        NOT NULL,
    [FAMIGLIAQUALITY]         VARCHAR (50)    NULL,
    PRIMARY KEY CLUSTERED ([CODICE] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TMP_ANAGRAFICAARTICOLI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TMP_ANAGRAFICAARTICOLI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TMP_ANAGRAFICAARTICOLI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TMP_ANAGRAFICAARTICOLI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TMP_ANAGRAFICAARTICOLI] TO [Metodo98]
    AS [dbo];

