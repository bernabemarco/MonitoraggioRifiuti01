CREATE TABLE [dbo].[IntegrazioniFlussi] (
    [NomeDitta]      VARCHAR (30)    NOT NULL,
    [IDFLusso]       NUMERIC (10)    NOT NULL,
    [IDLivello]      VARCHAR (8)     NOT NULL,
    [TipoRiclass]    SMALLINT        NOT NULL,
    [NrRiga]         INT             NOT NULL,
    [Descrizione]    VARCHAR (80)    NULL,
    [TipoVar]        SMALLINT        DEFAULT (0) NULL,
    [ValoreInt]      DECIMAL (19, 4) DEFAULT (0) NULL,
    [ValoreFlusso]   DECIMAL (19, 4) DEFAULT (0) NULL,
    [IntManuale]     SMALLINT        NOT NULL,
    [UtenteModifica] VARCHAR (25)    NOT NULL,
    [DataModifica]   DATETIME        NOT NULL,
    CONSTRAINT [PK_IntegrazioniFlussi] PRIMARY KEY CLUSTERED ([IDFLusso] ASC, [IDLivello] ASC, [TipoRiclass] ASC, [NrRiga] ASC, [IntManuale] ASC) WITH (FILLFACTOR = 90),
    CHECK ([IntManuale] = 0 or [IntManuale] = 1)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[IntegrazioniFlussi] TO [AnaBilancio]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[IntegrazioniFlussi] TO [AnaBilancio]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[IntegrazioniFlussi] TO [AnaBilancio]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[IntegrazioniFlussi] TO [AnaBilancio]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[IntegrazioniFlussi] TO [AnaBilancio]
    AS [dbo];

