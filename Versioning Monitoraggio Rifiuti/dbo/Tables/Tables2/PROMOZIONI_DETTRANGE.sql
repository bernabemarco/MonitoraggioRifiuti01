CREATE TABLE [dbo].[PROMOZIONI_DETTRANGE] (
    [RifProgressivo] DECIMAL (18)    NOT NULL,
    [NrRiga]         INT             NOT NULL,
    [Tipo]           VARCHAR (20)    NOT NULL,
    [NumRiga]        INT             NOT NULL,
    [da]             DECIMAL (16, 6) CONSTRAINT [DF_PROMOZIONI_DETTRANGE_da] DEFAULT ((0)) NULL,
    [a]              DECIMAL (16, 6) CONSTRAINT [DF_PROMOZIONI_DETTRANGE_a] DEFAULT ((0)) NULL,
    [valore]         VARCHAR (20)    NULL,
    [UTENTEMODIFICA] VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]   DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([RifProgressivo] ASC, [NrRiga] ASC, [Tipo] ASC, [NumRiga] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[PROMOZIONI_DETTRANGE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[PROMOZIONI_DETTRANGE] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[PROMOZIONI_DETTRANGE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[PROMOZIONI_DETTRANGE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[PROMOZIONI_DETTRANGE] TO [Metodo98]
    AS [dbo];

