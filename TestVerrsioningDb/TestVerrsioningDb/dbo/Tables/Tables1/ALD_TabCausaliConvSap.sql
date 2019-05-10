CREATE TABLE [dbo].[ALD_TabCausaliConvSap] (
    [CODCausale]                        DECIMAL (5)   NOT NULL,
    [TipoDoc]                           VARCHAR (2)   NULL,
    [NrRiga]                            SMALLINT      NOT NULL,
    [CodConto]                          VARCHAR (7)   NULL,
    [ChContabile]                       VARCHAR (2)   NULL,
    [SegnoSap]                          VARCHAR (1)   NULL,
    [AliquotaIva]                       VARCHAR (2)   NULL,
    [ChContabileCliente]                VARCHAR (2)   NULL,
    [ChContabileFornitore]              VARCHAR (2)   NULL,
    [ChContabileGenerico]               VARCHAR (2)   NULL,
    [UtenteModifica]                    VARCHAR (25)  NOT NULL,
    [DataModifica]                      SMALLDATETIME NOT NULL,
    [ChContabileCambioSezione]          VARCHAR (7)   NULL,
    [chkMOVIntegr]                      SMALLINT      NULL,
    [NaturaConto]                       VARCHAR (1)   NULL,
    [ChContabileClienteCambioSezione]   VARCHAR (2)   NULL,
    [ChContabileFornitoreCambioSezione] VARCHAR (2)   NULL,
    CONSTRAINT [PK_ALD_TabCausaliConvSap] PRIMARY KEY CLUSTERED ([NrRiga] ASC, [CODCausale] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_TabCausaliConvSap] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_TabCausaliConvSap] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_TabCausaliConvSap] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_TabCausaliConvSap] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_TabCausaliConvSap] TO [Metodo98]
    AS [dbo];

