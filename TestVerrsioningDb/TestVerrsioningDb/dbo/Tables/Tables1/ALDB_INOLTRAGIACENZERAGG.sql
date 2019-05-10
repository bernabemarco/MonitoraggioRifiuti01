CREATE TABLE [dbo].[ALDB_INOLTRAGIACENZERAGG] (
    [RecSel]               SMALLINT      CONSTRAINT [DF__ALDB_INOL__RecSe__4BF1C5AC] DEFAULT ((0)) NULL,
    [idsessione]           DECIMAL (5)   NOT NULL,
    [IDRiga]               INT           NOT NULL,
    [IndirizzoMail]        VARCHAR (255) NULL,
    [CodTecnico]           VARCHAR (7)   NULL,
    [DescTecnico]          VARCHAR (80)  NULL,
    [Deposito]             VARCHAR (10)  NULL,
    [UtenteModifica]       VARCHAR (25)  NOT NULL,
    [DataModifica]         VARCHAR (25)  NOT NULL,
    [Ubicazione]           VARCHAR (10)  NULL,
    [CORDINATORE]          VARCHAR (80)  NULL,
    [INDIRIZZOCORDINATORE] VARCHAR (255) NULL,
    [datainserted]         DATETIME      DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_ALDB_INOLTRAGIACENZERAGG] PRIMARY KEY CLUSTERED ([idsessione] ASC, [IDRiga] ASC)
);


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALDB_INOLTRAGIACENZERAGG] TO [SendGiacenze]
    AS [dbo];


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALDB_INOLTRAGIACENZERAGG] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALDB_INOLTRAGIACENZERAGG] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALDB_INOLTRAGIACENZERAGG] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALDB_INOLTRAGIACENZERAGG] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALDB_INOLTRAGIACENZERAGG] TO [Metodo98]
    AS [dbo];

