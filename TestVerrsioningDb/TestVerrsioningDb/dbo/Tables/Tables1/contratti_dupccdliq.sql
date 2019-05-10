CREATE TABLE [dbo].[contratti_dupccdliq] (
    [codice]         VARCHAR (50) NOT NULL,
    [rigapadre]      DECIMAL (10) NOT NULL,
    [riga]           INT          NOT NULL,
    [data]           DATETIME     NOT NULL,
    [utentemodifica] VARCHAR (20) NOT NULL,
    [datamodifica]   DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([codice] ASC, [rigapadre] ASC, [riga] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[contratti_dupccdliq] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[contratti_dupccdliq] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[contratti_dupccdliq] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[contratti_dupccdliq] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[contratti_dupccdliq] TO [Metodo98]
    AS [dbo];

