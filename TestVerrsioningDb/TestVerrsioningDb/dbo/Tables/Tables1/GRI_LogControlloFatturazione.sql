CREATE TABLE [dbo].[GRI_LogControlloFatturazione] (
    [idSessione]     INT           NOT NULL,
    [idRiga]         INT           NOT NULL,
    [Messaggio]      VARCHAR (255) NOT NULL,
    [DataModifica]   DATETIME      NOT NULL,
    [UtenteModifica] VARCHAR (50)  NOT NULL,
    CONSTRAINT [PK_GRI_LogControlloFatturazione] PRIMARY KEY CLUSTERED ([idSessione] ASC, [idRiga] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GRI_LogControlloFatturazione] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GRI_LogControlloFatturazione] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GRI_LogControlloFatturazione] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GRI_LogControlloFatturazione] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GRI_LogControlloFatturazione] TO [Metodo98]
    AS [dbo];

