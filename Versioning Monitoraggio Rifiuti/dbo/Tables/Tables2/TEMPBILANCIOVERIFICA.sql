CREATE TABLE [dbo].[TEMPBILANCIOVERIFICA] (
    [CODMASTRO]          DECIMAL (5)     NULL,
    [CODCONTO]           VARCHAR (7)     NULL,
    [DSCCONTO1]          VARCHAR (80)    NULL,
    [DSCMASTRO]          VARCHAR (80)    NULL,
    [TIPOCONTO]          VARCHAR (1)     NULL,
    [SALDO]              DECIMAL (19, 4) NULL,
    [SALDOEURO]          DECIMAL (19, 4) NULL,
    [DARE]               DECIMAL (19, 4) NULL,
    [DAREEURO]           DECIMAL (19, 4) NULL,
    [AVERE]              DECIMAL (19, 4) NULL,
    [AVEREEURO]          DECIMAL (19, 4) NULL,
    [DATAREG]            DATETIME        NULL,
    [NRGIORNALE]         DECIMAL (5)     NULL,
    [ESERCIZIO]          DECIMAL (5)     NULL,
    [ESERCIZIOSI]        DECIMAL (5)     NULL,
    [PROVVISORIO]        SMALLINT        NULL,
    [CAUSALE]            DECIMAL (5)     NULL,
    [DATAINIVALGEN]      DATETIME        NULL,
    [DATAFINEVALGEN]     DATETIME        NULL,
    [DATARINIZ]          DATETIME        NULL,
    [DATARFINE]          DATETIME        NULL,
    [NRTERMINALE]        SMALLINT        NULL,
    [CambioControDivisa] SMALLINT        DEFAULT ((0)) NULL,
    [CORDINE]            SMALLINT        NULL
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[TEMPBILANCIOVERIFICA] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TEMPBILANCIOVERIFICA] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TEMPBILANCIOVERIFICA] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TEMPBILANCIOVERIFICA] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TEMPBILANCIOVERIFICA] TO [Metodo98]
    AS [dbo];

