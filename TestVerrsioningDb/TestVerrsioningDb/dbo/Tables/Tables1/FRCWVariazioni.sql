CREATE TABLE [dbo].[FRCWVariazioni] (
    [NrTerminale]      DECIMAL (5)     NOT NULL,
    [Riga]             INT             NOT NULL,
    [DescrizioneCampo] VARCHAR (500)   DEFAULT ('') NULL,
    [PercQuantita]     DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [PercPrezzo]       DECIMAL (19, 6) DEFAULT ((0)) NULL,
    [CampoAlfa]        VARCHAR (50)    NOT NULL,
    [CampoDec]         DECIMAL (19, 6) NOT NULL,
    [UtenteModifica]   VARCHAR (25)    NOT NULL,
    [DataModifica]     DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([NrTerminale] ASC, [Riga] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRCWVariazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRCWVariazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCWVariazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCWVariazioni] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRCWVariazioni] TO [Metodo98]
    AS [dbo];

