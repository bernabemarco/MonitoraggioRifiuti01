﻿CREATE TABLE [dbo].[CONTRATTI_TOP] (
    [PROGRESSIVO]    DECIMAL (10)  NOT NULL,
    [UTENTEMODIFICA] VARCHAR (50)  NOT NULL,
    [DATAMODIFICA]   DATETIME      NOT NULL,
    [RIFCONTRATTO]   DECIMAL (18)  NOT NULL,
    [DADATA]         DATETIME      NOT NULL,
    [ADATA]          DATETIME      NOT NULL,
    [NOTE]           VARCHAR (500) NULL,
    PRIMARY KEY CLUSTERED ([PROGRESSIVO] ASC) WITH (FILLFACTOR = 90)
);


GO

CREATE TRIGGER CANCELLA ON CONTRATTI_TOP
FOR DELETE 
AS

    BEGIN	

       DELETE CONTRATTIDOC_TOP
       FROM   CONTRATTIDOC_TOP T2, DELETED T1
       WHERE  T2.RIFPROGRESSIVO = T1.PROGRESSIVO

       DELETE CONTRATTIGRP_TOP
       FROM   CONTRATTIGRP_TOP T2, DELETED T1
       WHERE  T2.RIFPROGRESSIVO = T1.PROGRESSIVO

       DELETE CONTRATTICAT_TOP
       FROM   CONTRATTICAT_TOP T2, DELETED T1
       WHERE  T2.RIFPROGRESSIVO = T1.PROGRESSIVO

       DELETE CONTRATTICATST_TOP
       FROM   CONTRATTICATST_TOP T2, DELETED T1
       WHERE  T2.RIFPROGRESSIVO = T1.PROGRESSIVO

       DELETE CONTRATTIGRPPRZ_TOP
       FROM   CONTRATTIGRPPRZ_TOP T2, DELETED T1
       WHERE  T2.RIFPROGRESSIVO = T1.PROGRESSIVO

       DELETE CONTRATTIFAMREP_TOP
       FROM   CONTRATTIFAMREP_TOP T2, DELETED T1
       WHERE  T2.RIFPROGRESSIVO = T1.PROGRESSIVO

       DELETE CONTRATTIART_TOP
       FROM   CONTRATTIART_TOP T2, DELETED T1
       WHERE  T2.RIFPROGRESSIVO = T1.PROGRESSIVO

       DELETE CONTRATTIRANGE_TOP
       FROM   CONTRATTIRANGE_TOP T2, DELETED T1
       WHERE  T2.RIFPROGRESSIVO = T1.PROGRESSIVO

    END


GO
GRANT DELETE
    ON OBJECT::[dbo].[CONTRATTI_TOP] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CONTRATTI_TOP] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CONTRATTI_TOP] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CONTRATTI_TOP] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CONTRATTI_TOP] TO [Metodo98]
    AS [dbo];

