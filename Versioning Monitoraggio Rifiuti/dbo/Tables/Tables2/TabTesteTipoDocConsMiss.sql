CREATE TABLE [dbo].[TabTesteTipoDocConsMiss] (
    [PROGRESSIVO]    DECIMAL (10) NOT NULL,
    [CODCONTO]       VARCHAR (7)  NOT NULL,
    [NUMDDM]         DECIMAL (5)  NOT NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    CONSTRAINT [PK_TabTesteTipoDocConsMiss] PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC) WITH (FILLFACTOR = 90)
);


GO



CREATE TRIGGER TD_TabTesteTipoDocConsMiss  ON TabTesteTipoDocConsMiss
FOR DELETE 
AS



BEGIN

    /*  DELETE ALL CHILDREN IN "TabRigheTipoDocConsMiss"  */
    DELETE TabRigheTipoDocConsMiss
    FROM     TabRigheTipoDocConsMiss T2, DELETED T1
    WHERE  T2.RIFPROGRESSIVO = T1.PROGRESSIVO


END


GO
GRANT DELETE
    ON OBJECT::[dbo].[TabTesteTipoDocConsMiss] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TabTesteTipoDocConsMiss] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TabTesteTipoDocConsMiss] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TabTesteTipoDocConsMiss] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TabTesteTipoDocConsMiss] TO [Metodo98]
    AS [dbo];

