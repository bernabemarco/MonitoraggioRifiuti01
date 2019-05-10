CREATE TABLE [dbo].[PackingTesta] (
    [Progressivo]         DECIMAL (18)    NOT NULL,
    [Esercizio]           DECIMAL (5)     NOT NULL,
    [Data]                DATETIME        NOT NULL,
    [Cliente]             VARCHAR (7)     NOT NULL,
    [DestinazioneDiversa] DECIMAL (5)     NULL,
    [NsRif]               VARCHAR (50)    NULL,
    [VsRif]               VARCHAR (50)    NULL,
    [Spedizione]          CHAR (1)        NULL,
    [NumPartColli]        DECIMAL (18)    NULL,
    [Note]                VARCHAR (6500)  NULL,
    [UTENTEMODIFICA]      VARCHAR (50)    NOT NULL,
    [DATAMODIFICA]        DATETIME        NOT NULL,
    [Spedizioniere]       DECIMAL (5)     NULL,
    [TOTALECOLLI]         DECIMAL (16, 6) CONSTRAINT [DF_PACKINGTESTA_TOTALECOLLI] DEFAULT (0) NOT NULL,
    [TOTALEPESONETTO]     DECIMAL (16, 6) CONSTRAINT [DF_PACKINGTESTA_TOTALEPESONETTO] DEFAULT (0) NOT NULL,
    [TOTALEPESOLORDO]     DECIMAL (16, 6) CONSTRAINT [DF_PACKINGTESTA_TOTALEPESOLORDO] DEFAULT (0) NOT NULL,
    [TOTALEVOLUME]        DECIMAL (16, 6) CONSTRAINT [DF_PACKINGTESTA_TOTALEVOLUME] DEFAULT (0) NOT NULL,
    [NUMPL]               DECIMAL (19)    NULL,
    [DOCPRELEVATI]        VARCHAR (500)   NULL,
    CONSTRAINT [PK_PackingTesta] PRIMARY KEY CLUSTERED ([Progressivo] ASC) WITH (FILLFACTOR = 90)
);


GO

CREATE TRIGGER PackingTesta_Cancellazione ON PackingTesta
FOR DELETE 
AS
Delete PackingRighe Where RifProgressivo=(Select top 1 progressivo From Deleted)
Delete PackingRigheRagg Where RifProgressivo=(Select top 1 progressivo From Deleted)

GO
GRANT DELETE
    ON OBJECT::[dbo].[PackingTesta] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[PackingTesta] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[PackingTesta] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[PackingTesta] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[PackingTesta] TO [Metodo98]
    AS [dbo];

