CREATE TABLE [dbo].[FRCScostamentiMaterialiResa] (
    [ID]                 INT             IDENTITY (1, 1) NOT NULL,
    [ANNO]               INT             NULL,
    [MESEINIZIO]         INT             NULL,
    [MESEFINE]           INT             NULL,
    [COMPOSTO]           VARCHAR (50)    NULL,
    [DSCCOMPOSTO]        VARCHAR (500)   NULL,
    [UM_BASE]            VARCHAR (3)     NULL,
    [AMBIENTE1]          VARCHAR (3)     NULL,
    [NomeEsplosione1]    VARCHAR (50)    NULL,
    [QTABASE1]           DECIMAL (19, 6) NULL,
    [COSTOUNITARIODIBA1] DECIMAL (19, 6) NULL,
    [COSTOTOTALEDIBA1]   DECIMAL (19, 6) NULL,
    [AMBIENTE2]          VARCHAR (3)     NULL,
    [NomeEsplosione2]    VARCHAR (50)    NULL,
    [QTABASE2]           DECIMAL (19, 6) NULL,
    [COSTOUNITARIODIBA2] DECIMAL (19, 6) NULL,
    [COSTOTOTALEDIBA2]   DECIMAL (19, 6) NULL,
    [DELTATOTALE]        DECIMAL (19, 6) NULL,
    [DELTAVOLUME]        DECIMAL (19, 6) NULL,
    [DELTAPREZZO]        DECIMAL (19, 6) NULL,
    [UTENTEMODIFICA]     VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]       DATETIME        NOT NULL,
    CONSTRAINT [KEY_FRCScostamentiMaterialiResa] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[FRCScostamentiMaterialiResa] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[FRCScostamentiMaterialiResa] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[FRCScostamentiMaterialiResa] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[FRCScostamentiMaterialiResa] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[FRCScostamentiMaterialiResa] TO [Metodo98]
    AS [dbo];

