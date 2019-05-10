CREATE TABLE [dbo].[CGesIndiciStorici] (
    [Ambiente]              VARCHAR (3)     NOT NULL,
    [CodDestinazione]       VARCHAR (10)    NOT NULL,
    [Tipo]                  SMALLINT        NOT NULL,
    [Anno]                  DECIMAL (5)     NOT NULL,
    [Mese]                  INT             NOT NULL,
    [ValoreVariabile]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [ValoreFisso]           DECIMAL (19, 6) DEFAULT (0) NULL,
    [QtaPrimaria]           DECIMAL (16, 6) DEFAULT (0) NULL,
    [QtaPrimaria2]          DECIMAL (16, 6) DEFAULT (0) NULL,
    [QtaSecondaria]         DECIMAL (16, 6) DEFAULT (0) NULL,
    [QtaSecondaria2]        DECIMAL (16, 6) DEFAULT (0) NULL,
    [TipoMisurazione]       SMALLINT        DEFAULT (0) NULL,
    [UMPrimaria]            VARCHAR (5)     DEFAULT ('') NULL,
    [UMPrimaria2]           VARCHAR (5)     DEFAULT ('') NULL,
    [UMSecondaria]          VARCHAR (5)     DEFAULT ('') NULL,
    [UMSecondaria2]         VARCHAR (5)     DEFAULT ('') NULL,
    [TipoRiclassificazione] VARCHAR (5)     DEFAULT ('') NULL,
    [Note]                  VARCHAR (100)   DEFAULT ('') NULL,
    [UtenteModifica]        VARCHAR (25)    NOT NULL,
    [DataModifica]          DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([Ambiente] ASC, [CodDestinazione] ASC, [Tipo] ASC, [Anno] ASC, [Mese] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesIndiciStorici] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesIndiciStorici] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesIndiciStorici] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesIndiciStorici] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesIndiciStorici] TO [Metodo98]
    AS [dbo];

