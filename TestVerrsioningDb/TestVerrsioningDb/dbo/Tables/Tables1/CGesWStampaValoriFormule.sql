CREATE TABLE [dbo].[CGesWStampaValoriFormule] (
    [NrTerminale]        DECIMAL (5)     NOT NULL,
    [ProgressivoFormula] DECIMAL (10)    NOT NULL,
    [Intestazione01]     VARCHAR (50)    DEFAULT ('') NULL,
    [Intestazione02]     VARCHAR (50)    DEFAULT ('') NULL,
    [Intestazione03]     VARCHAR (50)    DEFAULT ('') NULL,
    [Intestazione04]     VARCHAR (50)    DEFAULT ('') NULL,
    [Intestazione05]     VARCHAR (50)    DEFAULT ('') NULL,
    [Intestazione06]     VARCHAR (50)    DEFAULT ('') NULL,
    [Intestazione07]     VARCHAR (50)    DEFAULT ('') NULL,
    [Intestazione08]     VARCHAR (50)    DEFAULT ('') NULL,
    [Intestazione09]     VARCHAR (50)    DEFAULT ('') NULL,
    [Intestazione10]     VARCHAR (50)    DEFAULT ('') NULL,
    [Valore01]           DECIMAL (19, 6) DEFAULT (0) NULL,
    [Valore02]           DECIMAL (19, 6) DEFAULT (0) NULL,
    [Valore03]           DECIMAL (19, 6) DEFAULT (0) NULL,
    [Valore04]           DECIMAL (19, 6) DEFAULT (0) NULL,
    [Valore05]           DECIMAL (19, 6) DEFAULT (0) NULL,
    [Valore06]           DECIMAL (19, 6) DEFAULT (0) NULL,
    [Valore07]           DECIMAL (19, 6) DEFAULT (0) NULL,
    [Valore08]           DECIMAL (19, 6) DEFAULT (0) NULL,
    [Valore09]           DECIMAL (19, 6) DEFAULT (0) NULL,
    [Valore10]           DECIMAL (19, 6) DEFAULT (0) NULL,
    [UtenteModifica]     VARCHAR (25)    NOT NULL,
    [DataModifica]       DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([NrTerminale] ASC, [ProgressivoFormula] ASC) WITH (FILLFACTOR = 90)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[CGesWStampaValoriFormule] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CGesWStampaValoriFormule] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CGesWStampaValoriFormule] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CGesWStampaValoriFormule] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CGesWStampaValoriFormule] TO [Metodo98]
    AS [dbo];

