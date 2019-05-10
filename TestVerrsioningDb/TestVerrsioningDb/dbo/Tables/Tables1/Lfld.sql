CREATE TABLE [dbo].[Lfld] (
    [LfldPProgr]        INT            NULL,
    [LfldCNome]         VARCHAR (80)   NOT NULL,
    [LfldCTipo]         VARCHAR (3)    NULL,
    [LfldNLunghezza]    INT            NULL,
    [LfldNDecimali]     INT            NULL,
    [LfldDHelpString]   VARCHAR (1024) NULL,
    [LfldWAttributi]    VARCHAR (80)   NULL,
    [LfldIProprieta]    VARCHAR (3)    DEFAULT ('S') NOT NULL,
    [lfldCltab]         VARCHAR (80)   DEFAULT ('') NOT NULL,
    [lfldCLtabRiferita] VARCHAR (80)   NULL,
    [lfldVincoloIR]     INT            CONSTRAINT [lfldVincoloIRdflt] DEFAULT ((0)) NULL,
    [lfldLivello]       INT            NULL,
    CONSTRAINT [lfldprimary] PRIMARY KEY CLUSTERED ([lfldCltab] ASC, [LfldCNome] ASC)
);

