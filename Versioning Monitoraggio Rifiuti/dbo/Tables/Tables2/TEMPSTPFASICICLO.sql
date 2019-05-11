﻿CREATE TABLE [dbo].[TEMPSTPFASICICLO] (
    [IDSESSIONE]          SMALLINT        NOT NULL,
    [RIFPROGRESSIVO]      DECIMAL (10)    NOT NULL,
    [NUMERORIGA]          INT             DEFAULT (0) NOT NULL,
    [RIFCICLO]            VARCHAR (25)    NULL,
    [RIFFASE]             INT             NOT NULL,
    [TEMPOSETUP]          VARCHAR (15)    NULL,
    [UMTEMPOSETUP]        VARCHAR (1)     DEFAULT ('O') NULL,
    [TEMPORISORSA]        VARCHAR (15)    NULL,
    [UMTEMPORISORSA]      VARCHAR (1)     DEFAULT ('O') NULL,
    [TEMPOUOMO]           VARCHAR (15)    NULL,
    [UMTEMPOUOMO]         VARCHAR (1)     DEFAULT ('O') NULL,
    [DURATA]              VARCHAR (15)    NULL,
    [UMDURATA]            VARCHAR (1)     DEFAULT ('O') NULL,
    [TEMPOMOVIMENTAZIONE] VARCHAR (15)    NULL,
    [TEMPOCODA]           VARCHAR (15)    NULL,
    [TEMPOATTRAV]         VARCHAR (15)    NULL,
    [INIZIOLAVORAZIONE]   DATETIME        NULL,
    [FINELAVORAZIONE]     DATETIME        NULL,
    [COSTOSETUP]          DECIMAL (19, 6) DEFAULT (0) NULL,
    [COSTOSETUPEURO]      DECIMAL (19, 6) DEFAULT (0) NULL,
    [COSTORISORSA]        DECIMAL (19, 6) DEFAULT (0) NULL,
    [COSTORISORSAEURO]    DECIMAL (19, 6) DEFAULT (0) NULL,
    [COSTOUOMO]           DECIMAL (19, 6) DEFAULT (0) NULL,
    [COSTOUOMOEURO]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [COSTOESTERNO]        DECIMAL (19, 6) DEFAULT (0) NULL,
    [COSTOESTERNOEURO]    DECIMAL (19, 6) DEFAULT (0) NULL,
    [COSTOINDVAR]         DECIMAL (19, 6) DEFAULT (0) NULL,
    [COSTOINDVAREURO]     DECIMAL (19, 6) DEFAULT (0) NULL,
    [COSTOINDFISSO]       DECIMAL (19, 6) DEFAULT (0) NULL,
    [COSTOINDFISSOEURO]   DECIMAL (19, 6) DEFAULT (0) NULL,
    [UTENTEMODIFICA]      VARCHAR (25)    NOT NULL,
    [DATAMODIFICA]        DATETIME        NOT NULL,
    CONSTRAINT [PK_TEMPSTPFASICICLO] PRIMARY KEY CLUSTERED ([IDSESSIONE] ASC, [RIFPROGRESSIVO] ASC, [NUMERORIGA] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [CKC_UMDURATA_TEMPSTPF] CHECK ([UMDURATA]='H' OR [UMDURATA]='G' OR [UMDURATA]='O' OR [UMDURATA]='M' OR [UMDURATA]='S' OR [UMDURATA]='C' OR [UMDURATA]='T' OR [UMDURATA]='P'),
    CONSTRAINT [CKC_UMTEMPORISORSA_TEMPSTPF] CHECK ([UMDURATA]='H' OR [UMDURATA]='G' OR [UMDURATA]='O' OR [UMDURATA]='M' OR [UMDURATA]='S' OR [UMDURATA]='C' OR [UMDURATA]='T' OR [UMDURATA]='P'),
    CONSTRAINT [CKC_UMTEMPOSETUP_TEMPSTPF] CHECK ([UMDURATA]='H' OR [UMDURATA]='G' OR [UMDURATA]='O' OR [UMDURATA]='M' OR [UMDURATA]='S' OR [UMDURATA]='C' OR [UMDURATA]='T' OR [UMDURATA]='P'),
    CONSTRAINT [CKC_UMTEMPOUOMO_TEMPSTPF] CHECK ([UMDURATA]='H' OR [UMDURATA]='G' OR [UMDURATA]='O' OR [UMDURATA]='M' OR [UMDURATA]='S' OR [UMDURATA]='C' OR [UMDURATA]='T' OR [UMDURATA]='P')
);


GO

/*  INSERT TRIGGER "TI_TEMPSTPFASICICLO" FOR TABLE "TEMPSTPFASICICLO"  */
CREATE TRIGGER TI_TEMPSTPFASICICLO ON TEMPSTPFASICICLO FOR INSERT AS
BEGIN
    DECLARE
       @MAXCARD  INT,
       @NUMROWS  INT,
       @NUMNULL  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN

    
    /*  PARENT "TEMPSTPTESTACICLO" MUST EXIST WHEN INSERTING A CHILD IN "TEMPSTPFASICICLO"  */
    IF UPDATE(IDSESSIONE) OR
       UPDATE(RIFPROGRESSIVO)
    BEGIN
       IF (SELECT COUNT(*)
           FROM   TEMPSTPTESTACICLO T1, INSERTED T2
           WHERE  T1.IDSESSIONE = T2.IDSESSIONE
            AND   T1.PROGRESSIVO = T2.RIFPROGRESSIVO) != @NUMROWS
          BEGIN
             SELECT @ERRNO  = 30002,
                    @ERRMSG = 'Parent does not exist in "TEMPSTPTESTACICLO". Cannot create child in "TEMPSTPFASICICLO".'
             GOTO ERROR
          END
    END

    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO

/*  UPDATE TRIGGER "TU_TEMPSTPFASICICLO" FOR TABLE "TEMPSTPFASICICLO"  */
CREATE TRIGGER TU_TEMPSTPFASICICLO ON TEMPSTPFASICICLO FOR UPDATE AS
BEGIN
   DECLARE
      @MAXCARD  INT,
      @NUMROWS  INT,
      @NUMNULL  INT,
      @ERRNO    INT,
      @ERRMSG   VARCHAR(255)

      SELECT  @NUMROWS = @@ROWCOUNT
      IF @NUMROWS = 0
         RETURN

      
      /*  PARENT "TEMPSTPTESTACICLO" MUST EXIST WHEN UPDATING A CHILD IN "TEMPSTPFASICICLO"  */
      IF UPDATE(IDSESSIONE) OR
         UPDATE(RIFPROGRESSIVO)
      BEGIN
         IF (SELECT COUNT(*)
             FROM   TEMPSTPTESTACICLO T1, INSERTED T2
             WHERE  T1.IDSESSIONE = T2.IDSESSIONE
              AND   T1.PROGRESSIVO = T2.RIFPROGRESSIVO) != @NUMROWS
            BEGIN
               SELECT @ERRNO  = 30003,
                      @ERRMSG = '"TEMPSTPTESTACICLO" does not exist. Cannot modify child in "TEMPSTPFASICICLO".'
               GOTO ERROR
            END
      END

      RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO
GRANT DELETE
    ON OBJECT::[dbo].[TEMPSTPFASICICLO] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TEMPSTPFASICICLO] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TEMPSTPFASICICLO] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TEMPSTPFASICICLO] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TEMPSTPFASICICLO] TO [Metodo98]
    AS [dbo];
