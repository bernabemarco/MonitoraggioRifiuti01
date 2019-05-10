CREATE TABLE [dbo].[tmpConsuntivatiRisalita] (
    [CONTRATTO]                     DECIMAL (18) NOT NULL,
    [PROGRESSIVODOCCONSUNTIVAZIONE] DECIMAL (18) NOT NULL,
    [sessione]                      DECIMAL (5)  NOT NULL,
    [PROGRESSIVODOCORIGINE]         DECIMAL (18) NOT NULL,
    [NRTERMINALE]                   DECIMAL (5)  DEFAULT ((0)) NULL,
    [FINOALLADATA]                  DATETIME     NULL,
    [DATACONSUNTIV]                 DATETIME     NULL,
    PRIMARY KEY CLUSTERED ([CONTRATTO] ASC, [PROGRESSIVODOCCONSUNTIVAZIONE] ASC, [sessione] ASC, [PROGRESSIVODOCORIGINE] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[tmpConsuntivatiRisalita] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[tmpConsuntivatiRisalita] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[tmpConsuntivatiRisalita] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[tmpConsuntivatiRisalita] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[tmpConsuntivatiRisalita] TO [Metodo98]
    AS [dbo];

