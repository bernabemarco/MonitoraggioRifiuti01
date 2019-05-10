CREATE TABLE [dbo].[FRCDistinteBasiEsplose] (
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
    [COSTOUNIEURO]          DECIMAL (19, 6) NULL,
    [COSTOTOTEURO]          DECIMAL (19, 6) NULL,
    [CONTOACQITA]           VARCHAR (7)     NULL,
    [CONTOACQEST]           VARCHAR (7)     NULL,
    [UTENTEMODIFICA]        VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]          DATETIME        NOT NULL,
    [NomeEsplosione]        VARCHAR (50)    NULL,
    CONSTRAINT [KEY_FRCDistinteBasiEsplose] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [FRCDistinteBasiEsplose_ANC]
    ON [dbo].[FRCDistinteBasiEsplose]([ANNO] ASC, [NomeEsplosione] ASC, [COMPOSTO] ASC);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRCDistinteBasiEsplose] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRCDistinteBasiEsplose] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCDistinteBasiEsplose] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCDistinteBasiEsplose] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRCDistinteBasiEsplose] TO [Metodo98]
    AS [dbo];

