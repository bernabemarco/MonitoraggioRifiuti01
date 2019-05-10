CREATE TABLE [dbo].[VBSituazioneCassaD] (
    [RIFProgressivo]      DECIMAL (18)    NOT NULL,
    [NRRiga]              INT             NOT NULL,
    [FlagRiga]            SMALLINT        NULL,
    [Posizione]           INT             NULL,
    [CodicePagamento]     DECIMAL (19, 6) NOT NULL,
    [FondoAperturaValuta] DECIMAL (19, 6) NULL,
    [FondoAperturaEuro]   DECIMAL (19, 6) NULL,
    [VenditeValuta]       DECIMAL (19, 6) NULL,
    [VenditeEuro]         DECIMAL (19, 6) NULL,
    [UTENTEMODIFICA]      VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]        DATETIME        NOT NULL,
    [Divisa]              DECIMAL (18)    NOT NULL,
    [IdTesta]             DECIMAL (10)    NOT NULL,
    [CodContoRif]         VARCHAR (7)     NULL,
    CONSTRAINT [PK_VBSituazioneCassaD] PRIMARY KEY CLUSTERED ([RIFProgressivo] ASC, [NRRiga] ASC, [CodicePagamento] ASC, [Divisa] ASC, [IdTesta] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[VBSituazioneCassaD] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[VBSituazioneCassaD] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[VBSituazioneCassaD] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[VBSituazioneCassaD] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[VBSituazioneCassaD] TO [Metodo98]
    AS [dbo];

