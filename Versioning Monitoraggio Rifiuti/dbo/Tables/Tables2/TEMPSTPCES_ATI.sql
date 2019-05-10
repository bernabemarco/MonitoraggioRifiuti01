CREATE TABLE [dbo].[TEMPSTPCES_ATI] (
    [Progressivo]          DECIMAL (10)    NULL,
    [Descrizione]          VARCHAR (255)   NULL,
    [DataMovimento]        DATETIME        NOT NULL,
    [Cespite]              VARCHAR (10)    NOT NULL,
    [TipoMov]              INT             NULL,
    [Importo]              DECIMAL (19, 6) NULL,
    [ImportoEuro]          DECIMAL (19, 6) NULL,
    [ImportoAmm]           DECIMAL (19, 6) NULL,
    [ImportoAmmEuro]       DECIMAL (19, 6) NULL,
    [Immobilizzo]          DECIMAL (19, 6) NULL,
    [ImmobilizzoEuro]      DECIMAL (19, 6) NULL,
    [PercAmm]              DECIMAL (8, 5)  NULL,
    [ImpDocumentoIniz]     DECIMAL (19, 6) NULL,
    [ImpDocumentoInizEuro] DECIMAL (19, 6) NULL,
    [ImpDocumentoVend]     DECIMAL (19, 6) NULL,
    [ImpDocumentoVendEuro] DECIMAL (19, 6) NULL,
    [MinusPlusValenza]     DECIMAL (19, 6) NULL,
    [MinusPlusValenzaEuro] DECIMAL (19, 6) NULL,
    [ImpResiduo]           DECIMAL (19, 6) NULL,
    [ImpResiduoEuro]       DECIMAL (19, 6) NULL,
    [FondoAmm]             DECIMAL (19, 6) NULL,
    [FondoAmmEuro]         DECIMAL (19, 6) NULL,
    [PercRivSva]           DECIMAL (8, 5)  NULL,
    [IdSessione]           INT             NULL,
    [UtenteModifica]       VARCHAR (25)    NOT NULL,
    [DataModifica]         DATETIME        NOT NULL,
    [ESERCIZIO]            DECIMAL (5)     NULL,
    [ESERCIZIOSTP]         DECIMAL (5)     NULL,
    [DtaDocumento]         DATETIME        NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TEMPSTPCES_ATI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TEMPSTPCES_ATI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TEMPSTPCES_ATI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TEMPSTPCES_ATI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TEMPSTPCES_ATI] TO [Metodo98]
    AS [dbo];

