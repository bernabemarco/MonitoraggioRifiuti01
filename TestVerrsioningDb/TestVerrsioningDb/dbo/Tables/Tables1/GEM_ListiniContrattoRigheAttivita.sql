CREATE TABLE [dbo].[GEM_ListiniContrattoRigheAttivita] (
    [idGListinoContr] DECIMAL (10)    NOT NULL,
    [IdRigaListinoC]  DECIMAL (5)     NOT NULL,
    [idAttivita]      DECIMAL (5)     NOT NULL,
    [IdRigaListino]   DECIMAL (10)    NULL,
    [Listino]         DECIMAL (19, 6) CONSTRAINT [DF__GEM_Listi__Listi__2D6ADC87] DEFAULT ((0)) NULL,
    [Netto]           DECIMAL (19, 6) CONSTRAINT [DF__GEM_Listi__Netto__2E5F00C0] DEFAULT ((0)) NULL,
    [SCONTO]          DECIMAL (16, 6) CONSTRAINT [DF__GEM_Listi__SCONT__2F5324F9] DEFAULT ((0)) NULL,
    [PROVVAG1]        DECIMAL (16, 6) CONSTRAINT [DF__GEM_Listi__PROVV__30474932] DEFAULT ((0)) NULL,
    [PROVVAG2]        DECIMAL (16, 6) CONSTRAINT [DF__GEM_Listi__PROVV__313B6D6B] DEFAULT ((0)) NULL,
    [PROVVAG3]        DECIMAL (16, 6) CONSTRAINT [DF__GEM_Listi__PROVV__322F91A4] DEFAULT ((0)) NULL,
    [UTENTEMODIFICA]  VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]    DATETIME        NOT NULL,
    CONSTRAINT [GEM_ListiniContrattoRigheAttivita_PK] PRIMARY KEY CLUSTERED ([idGListinoContr] ASC, [IdRigaListinoC] ASC, [idAttivita] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GEM_ListiniContrattoRigheAttivita] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GEM_ListiniContrattoRigheAttivita] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_ListiniContrattoRigheAttivita] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GEM_ListiniContrattoRigheAttivita] TO [Metodo98]
    AS [dbo];

