CREATE TABLE [dbo].[CGesStoricoQuantita] (
    [Ambiente]            VARCHAR (3)     NOT NULL,
    [CodDestinazione]     VARCHAR (10)    NOT NULL,
    [UnitaMisura]         VARCHAR (5)     NOT NULL,
    [CodDestinazioneOrig] VARCHAR (10)    NOT NULL,
    [Anno]                DECIMAL (5)     NOT NULL,
    [Mese]                INT             NOT NULL,
    [Tipo]                SMALLINT        NOT NULL,
    [Valore]              DECIMAL (19, 6) DEFAULT (0) NULL,
    [UtenteModifica]      VARCHAR (25)    NOT NULL,
    [DataModifica]        DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([Ambiente] ASC, [CodDestinazione] ASC, [UnitaMisura] ASC, [CodDestinazioneOrig] ASC, [Anno] ASC, [Mese] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [CGesStoricoQuantita_AmbDUAM]
    ON [dbo].[CGesStoricoQuantita]([Ambiente] ASC, [CodDestinazione] ASC, [UnitaMisura] ASC, [Anno] ASC, [Mese] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [CGesStoricoQuantita_AmbUAM]
    ON [dbo].[CGesStoricoQuantita]([Ambiente] ASC, [UnitaMisura] ASC, [Anno] ASC, [Mese] ASC) WITH (FILLFACTOR = 90);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesStoricoQuantita] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesStoricoQuantita] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesStoricoQuantita] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesStoricoQuantita] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesStoricoQuantita] TO [Metodo98]
    AS [dbo];

