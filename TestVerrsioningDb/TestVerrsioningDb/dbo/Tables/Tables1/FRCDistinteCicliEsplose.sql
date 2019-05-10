CREATE TABLE [dbo].[FRCDistinteCicliEsplose] (
    [ID]                  INT             IDENTITY (1, 1) NOT NULL,
    [ANNO]                DECIMAL (5)     NULL,
    [COMPOSTO]            VARCHAR (50)    NULL,
    [DSCCOMPOSTO]         VARCHAR (500)   NULL,
    [QUANTITACOMPOSTO]    DECIMAL (16, 6) NULL,
    [DATAVALUTAZIONE]     DATETIME        NULL,
    [COMPONENTE]          VARCHAR (50)    NULL,
    [DSCCOMPONENTE]       VARCHAR (500)   NULL,
    [RIFCICLO]            DECIMAL (10)    NULL,
    [RIFFASE]             INT             NOT NULL,
    [POSIZIONE]           INT             NULL,
    [TIPOFASE]            SMALLINT        NULL,
    [OPERAZIONE]          VARCHAR (5)     NULL,
    [CDLAVORO]            VARCHAR (5)     NULL,
    [MACCHINA]            VARCHAR (5)     NULL,
    [TEMPOSETUP]          DECIMAL (19, 6) NULL,
    [UMTEMPOSETUP]        VARCHAR (1)     NULL,
    [TEMPORISORSA]        DECIMAL (19, 6) NULL,
    [UMTEMPORISORSA]      VARCHAR (1)     NULL,
    [TEMPOUOMO]           DECIMAL (19, 6) NULL,
    [UMTEMPOUOMO]         VARCHAR (1)     NULL,
    [DURATA]              VARCHAR (15)    NULL,
    [UMDURATA]            VARCHAR (1)     NULL,
    [TEMPOMOVIMENTAZIONE] VARCHAR (15)    NULL,
    [TEMPOCODA]           VARCHAR (15)    NULL,
    [TEMPOATTRAV]         VARCHAR (15)    NULL,
    [COSTOSETUPEURO]      DECIMAL (19, 6) NULL,
    [COSTORISORSAEURO]    DECIMAL (19, 6) NULL,
    [COSTOUOMOEURO]       DECIMAL (19, 6) NULL,
    [COSTOESTERNOEURO]    DECIMAL (19, 6) NULL,
    [COSTOINDVAREURO]     DECIMAL (19, 6) NULL,
    [COSTOINDFISSOEURO]   DECIMAL (19, 6) NULL,
    [FORNITOREPREF]       VARCHAR (7)     NULL,
    [UMFASE]              VARCHAR (3)     NOT NULL,
    [DSCOPERAZIONE]       VARCHAR (80)    NULL,
    [CDCProd]             VARCHAR (10)    NULL,
    [RendimentoProd]      DECIMAL (19, 6) NULL,
    [CDCMop]              VARCHAR (10)    NULL,
    [RendimentoMop]       DECIMAL (19, 6) NULL,
    [CDCSetup]            VARCHAR (10)    NULL,
    [RendimentoSetup]     DECIMAL (19, 6) NULL,
    [UTENTEMODIFICA]      VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]        DATETIME        NOT NULL,
    CONSTRAINT [KEY_FRCDistinteCicliEsplose] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRCDistinteCicliEsplose] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRCDistinteCicliEsplose] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCDistinteCicliEsplose] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCDistinteCicliEsplose] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRCDistinteCicliEsplose] TO [Metodo98]
    AS [dbo];

