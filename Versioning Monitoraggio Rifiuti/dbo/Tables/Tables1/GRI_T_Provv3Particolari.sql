CREATE TABLE [dbo].[GRI_T_Provv3Particolari] (
    [IdRiga]              DECIMAL (10)    NOT NULL,
    [CODGRUPPOPROVMAG]    DECIMAL (5)     NULL,
    [DASCONTO]            DECIMAL (8, 5)  DEFAULT ((0)) NOT NULL,
    [ProvvPart3MatSerAcc] NUMERIC (10, 2) DEFAULT ((0)) NULL,
    [INIZIOVALIDITA]      DATETIME        NULL,
    [FINEVALIDITA]        DATETIME        NULL,
    [UtenteModifica]      VARCHAR (25)    NOT NULL,
    [DataModifica]        SMALLDATETIME   NOT NULL,
    CONSTRAINT [PK_GRI_T_Provv3Particolari] PRIMARY KEY CLUSTERED ([IdRiga] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[GRI_T_Provv3Particolari] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[GRI_T_Provv3Particolari] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[GRI_T_Provv3Particolari] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[GRI_T_Provv3Particolari] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[GRI_T_Provv3Particolari] TO [Metodo98]
    AS [dbo];

