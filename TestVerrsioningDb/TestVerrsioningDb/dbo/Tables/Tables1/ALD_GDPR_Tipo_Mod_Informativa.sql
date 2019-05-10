CREATE TABLE [dbo].[ALD_GDPR_Tipo_Mod_Informativa] (
    [IdCodice]       VARCHAR (6)   NOT NULL,
    [DescTipoInf]    VARCHAR (100) NULL,
    [NoteTipoInf]    VARCHAR (100) NULL,
    [AllegTipoInf]   VARCHAR (300) NULL,
    [UTENTEMODIFICA] VARCHAR (25)  NULL,
    [DATAMODIFICA]   DATETIME      NULL,
    CONSTRAINT [PK_ALD_GDPR_Tipo_Mod_Informativa] PRIMARY KEY CLUSTERED ([IdCodice] ASC)
);


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_GDPR_Tipo_Mod_Informativa] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_GDPR_Tipo_Mod_Informativa] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_GDPR_Tipo_Mod_Informativa] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_GDPR_Tipo_Mod_Informativa] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_GDPR_Tipo_Mod_Informativa] TO [Metodo98]
    AS [dbo];

