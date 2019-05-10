CREATE TABLE [dbo].[FRCDistinteBasiEsploseCLav] (
    [ID]                    INT             IDENTITY (1, 1) NOT NULL,
    [ANNO]                  DECIMAL (5)     NULL,
    [RIFDISTINTA]           DECIMAL (10)    NULL,
    [RIFNRRIGA]             DECIMAL (10)    NULL,
    [COMPOSTO]              VARCHAR (50)    NULL,
    [DSCCOMPOSTO]           VARCHAR (500)   NULL,
    [QUANTITACOMPOSTO]      DECIMAL (16, 6) NULL,
    [DATAVALUTAZIONE]       DATETIME        NULL,
    [UMCOMPOSTO]            VARCHAR (3)     NULL,
    [LIVPRODUZIONECOMPOSTO] CHAR (1)        NULL,
    [COMPONENTE]            VARCHAR (50)    NULL,
    [DSCCOMPONENTE]         VARCHAR (500)   NULL,
    [TIPO]                  SMALLINT        NULL,
    [LIVELLO]               INT             NULL,
    [LIVPRODUZIONE]         VARCHAR (1)     NULL,
    [UMCOMPONENTE]          VARCHAR (3)     NULL,
    [QUANTITA]              DECIMAL (16, 6) NULL,
    [COSTOTOTEURO]          DECIMAL (19, 6) NULL,
    [UTENTEMODIFICA]        VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]          DATETIME        NOT NULL,
    CONSTRAINT [KEY_FRCDistinteBasiEsploseCLav] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRCDistinteBasiEsploseCLav] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRCDistinteBasiEsploseCLav] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCDistinteBasiEsploseCLav] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCDistinteBasiEsploseCLav] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRCDistinteBasiEsploseCLav] TO [Metodo98]
    AS [dbo];

