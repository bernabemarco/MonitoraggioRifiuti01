CREATE TABLE [dbo].[PROMOZIONI_TOTCOND] (
    [RifProgressivo] DECIMAL (18)    NOT NULL,
    [Riga]           INT             NOT NULL,
    [Da]             DECIMAL (19, 6) CONSTRAINT [DF_PROMOZIONI_TOTCOND_Da] DEFAULT ((0)) NULL,
    [A]              DECIMAL (19, 6) CONSTRAINT [DF_PROMOZIONI_TOTCOND_A] DEFAULT ((0)) NULL,
    [CodPagamento]   VARCHAR (4)     NULL,
    [Sconto]         VARCHAR (20)    NULL,
    [UtenteModifica] VARCHAR (25)    NOT NULL,
    [DataModifica]   DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([RifProgressivo] ASC, [Riga] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[PROMOZIONI_TOTCOND] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[PROMOZIONI_TOTCOND] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[PROMOZIONI_TOTCOND] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[PROMOZIONI_TOTCOND] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[PROMOZIONI_TOTCOND] TO [Metodo98]
    AS [dbo];

