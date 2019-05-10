CREATE TABLE [dbo].[CGesConfigurazioneBEP] (
    [Progressivo]        DECIMAL (10) NOT NULL,
    [Descrizione]        VARCHAR (80) DEFAULT ('') NULL,
    [Tipo]               SMALLINT     DEFAULT (0) NULL,
    [CodDestinazione]    VARCHAR (10) DEFAULT ('') NULL,
    [Riclassificazione]  VARCHAR (5)  DEFAULT ('') NULL,
    [VoceRicavi]         VARCHAR (10) DEFAULT ('') NULL,
    [VoceCostiFissi]     VARCHAR (10) DEFAULT ('') NULL,
    [VoceCostiVariabili] VARCHAR (10) DEFAULT ('') NULL,
    [VoceCostiTotali]    VARCHAR (10) DEFAULT ('') NULL,
    [VoceMargini]        VARCHAR (10) DEFAULT ('') NULL,
    [UtenteModifica]     VARCHAR (25) NOT NULL,
    [DataModifica]       DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesConfigurazioneBEP] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesConfigurazioneBEP] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesConfigurazioneBEP] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesConfigurazioneBEP] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesConfigurazioneBEP] TO [Metodo98]
    AS [dbo];

