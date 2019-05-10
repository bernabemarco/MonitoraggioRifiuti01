CREATE TABLE [dbo].[TP_RIGHEVBANCO] (
    [PROGRESSIVO]       NUMERIC (18)    NOT NULL,
    [NRRIGA]            NUMERIC (18)    NOT NULL,
    [POSIZIONE]         NUMERIC (18)    NULL,
    [ARTICOLO]          VARCHAR (50)    NOT NULL,
    [ControPartita]     VARCHAR (7)     NULL,
    [CodNumListino]     DECIMAL (5)     NOT NULL,
    [UM]                VARCHAR (3)     NOT NULL,
    [Quantita]          DECIMAL (16, 6) NOT NULL,
    [TotaleLire]        DECIMAL (19, 5) NOT NULL,
    [TotaleEuro]        DECIMAL (19, 5) NOT NULL,
    [TotImponibileLire] DECIMAL (19, 5) NOT NULL,
    [TotImponibileEuro] DECIMAL (19, 5) NOT NULL,
    [TotImpostaLire]    DECIMAL (19, 5) NOT NULL,
    [TotImpostaEuro]    DECIMAL (19, 5) NOT NULL,
    [PrezzoLire]        DECIMAL (19, 5) NOT NULL,
    [PrezzoEuro]        DECIMAL (19, 5) NOT NULL,
    [Reso]              SMALLINT        NOT NULL,
    [VariazioneSconto]  SMALLINT        NOT NULL,
    [VariazionePrezzo]  SMALLINT        NOT NULL,
    [Promozione]        DECIMAL (18)    NULL,
    [UTENTEMODIFICA]    VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]      DATETIME        NOT NULL
);


GO
CREATE NONCLUSTERED INDEX [IX_TP_RIGHEVBANCO]
    ON [dbo].[TP_RIGHEVBANCO]([PROGRESSIVO] ASC) WITH (FILLFACTOR = 90);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_RIGHEVBANCO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_RIGHEVBANCO] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_RIGHEVBANCO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_RIGHEVBANCO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_RIGHEVBANCO] TO [Metodo98]
    AS [dbo];

