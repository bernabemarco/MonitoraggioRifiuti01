﻿CREATE TABLE [dbo].[TP_AGENDAUTENTEORDINI_T] (
    [Progressivo]    DECIMAL (18) NOT NULL,
    [Utente]         VARCHAR (25) NOT NULL,
    [Supervisor]     SMALLINT     NOT NULL,
    [UtenteModifica] VARCHAR (25) NOT NULL,
    [DataModifica]   DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([Progressivo] ASC)
);


GO

CREATE TRIGGER [dbo].[TD_TP_AGENDAUTENTEORDINI_T] ON [dbo].[TP_AGENDAUTENTEORDINI_T] FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN

    /*  DELETE ALL CHILDREN IN "TP_AGENDAUTENTEORDINI_R"  */
    DELETE TP_AGENDAUTENTEORDINI_R
    FROM   TP_AGENDAUTENTEORDINI_R T2, DELETED T1
    WHERE  T2.RIFPROGRESSIVO = T1.PROGRESSIVO
	
	/*  DELETE ALL CHILDREN IN "TP_AGENDAUTENTEORDINI_A"  */
    DELETE TP_AGENDAUTENTEORDINI_A
    FROM   TP_AGENDAUTENTEORDINI_A T2, DELETED T1
    WHERE  T2.UTENTE = T1.UTENTE

    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END


GO
GRANT DELETE
    ON OBJECT::[dbo].[TP_AGENDAUTENTEORDINI_T] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TP_AGENDAUTENTEORDINI_T] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TP_AGENDAUTENTEORDINI_T] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TP_AGENDAUTENTEORDINI_T] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TP_AGENDAUTENTEORDINI_T] TO [Metodo98]
    AS [dbo];
