CREATE TABLE [dbo].[EXTRARIGHEDOC] (
    [IDTESTA]                                 DECIMAL (10)    NOT NULL,
    [IDRIGA]                                  INT             NOT NULL,
    [POSIZIONE]                               INT             NULL,
    [UTENTEMODIFICA]                          VARCHAR (10)    NULL,
    [DATAMODIFICA]                            DATETIME        NOT NULL,
    [DATACONS]                                DATETIME        NULL,
    [ProgressivoReg]                          DECIMAL (10)    DEFAULT (0) NULL,
    [IdRapportoGemma]                         VARCHAR (14)    NULL,
    [idTecnicoRisorsa]                        VARCHAR (7)     NULL,
    [TipoFatturazione]                        VARCHAR (20)    NULL,
    [Validita]                                VARCHAR (20)    NULL,
    [NaturaAddebMateriali]                    VARCHAR (1)     CONSTRAINT [DF__EXTRARIGH__Natur__51533742] DEFAULT ('') NULL,
    [ProvIntervento]                          VARCHAR (4)     DEFAULT ('') NULL,
    [locintervento]                           VARCHAR (80)    DEFAULT ('') NULL,
    [IdDivisione]                             SMALLINT        DEFAULT ((0)) NULL,
    [DerogaMagDivisisione]                    SMALLINT        DEFAULT ((0)) NULL,
    [ctrlDtCons]                              SMALLINT        DEFAULT ((0)) NULL,
    [ctrlRitiro]                              SMALLINT        DEFAULT ((0)) NULL,
    [ctrlPrepMatMag]                          SMALLINT        DEFAULT ((0)) NULL,
    [qtaPreparata]                            DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [IDCONTRATTOGemma]                        VARCHAR (13)    NULL,
    [flagPrezzoUniNettoEuroNonConforme]       SMALLINT        DEFAULT ((0)) NULL,
    [AldPrezzoUniNettoEuroNonConformeStorico] DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [NonConfermato]                           SMALLINT        DEFAULT ((1)) NULL,
    [VerQLT]                                  VARCHAR (1)     DEFAULT ('') NULL,
    [Matricola]                               VARCHAR (255)   DEFAULT ('') NULL,
    [AnnoProd]                                DATETIME        NULL,
    [Marca]                                   VARCHAR (255)   DEFAULT ('') NULL,
    [RifBudget]                               VARCHAR (255)   DEFAULT ('') NULL,
    CONSTRAINT [PK_EXTRARIGHEDOC] PRIMARY KEY CLUSTERED ([IDTESTA] ASC, [IDRIGA] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [FK_EXTRARIGHEDOC_IDTESTA_IDRIGA] FOREIGN KEY ([IDTESTA], [IDRIGA]) REFERENCES [dbo].[RIGHEDOCUMENTI] ([IDTESTA], [IDRIGA]) ON DELETE CASCADE ON UPDATE CASCADE
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[EXTRARIGHEDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[EXTRARIGHEDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[EXTRARIGHEDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[EXTRARIGHEDOC] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[EXTRARIGHEDOC] TO [Metodo98]
    AS [dbo];

