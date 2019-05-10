﻿CREATE TABLE [dbo].[TABGRUPPIUTENTE] (
    [CODICE]         DECIMAL (5)  NOT NULL,
    [DESCRIZIONE]    VARCHAR (80) NULL,
    [UTENTEMODIFICA] VARCHAR (25) NOT NULL,
    [DATAMODIFICA]   DATETIME     NOT NULL,
    CONSTRAINT [PK_TABGRUPPIUTENTE] PRIMARY KEY CLUSTERED ([CODICE] ASC) WITH (FILLFACTOR = 90)
);


GO

CREATE TRIGGER [TD_TABGRUPPIUTENTE] ON [TABGRUPPIUTENTE] FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255)

    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN

    
    /*  DELETE ALL CHILDREN IN "TABMEMBRIGRUPPO"  */
    DELETE TABMEMBRIGRUPPO
    FROM   TABMEMBRIGRUPPO T2, DELETED T1
    WHERE  T2.CODGRUPPO = T1.CODICE
    
    /*  DELETE ALL CHILDREN IN "TABACCESSIGRUPPO"  */
    DELETE TABACCESSIGRUPPO
    FROM   TABACCESSIGRUPPO T2, DELETED T1
    WHERE  T2.CODGRUPPO = T1.CODICE
    
    /*  DELETE ALL CHILDREN IN "TABAGENTIGRUPPO"  */
    DELETE TABAGENTIGRUPPO
    FROM   TABAGENTIGRUPPO T2, DELETED T1
    WHERE  T2.CODGRUPPO = T1.CODICE
    
    /*  DELETE ALL CHILDREN IN "TABPROFILI"  */
    DELETE TABPROFILI
    FROM   TABPROFILI T2, DELETED T1
    WHERE  T2.CODGRUPPO = T1.CODICE

    RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO

CREATE TRIGGER [TU_TABGRUPPIUTENTE] ON [TABGRUPPIUTENTE] FOR UPDATE AS
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

      
      /*  MODIFY PARENT CODE OF "TABGRUPPIUTENTE" FOR ALL CHILDREN IN "TABMEMBRIGRUPPO"  */
      IF UPDATE(CODICE)
      BEGIN
         UPDATE TABMEMBRIGRUPPO
          SET   CODGRUPPO = I1.CODICE
         FROM   TABMEMBRIGRUPPO T2, INSERTED I1, DELETED D1
         WHERE  T2.CODGRUPPO = D1.CODICE
          AND  (I1.CODICE != D1.CODICE)
      END
      
      /*  MODIFY PARENT CODE OF "TABGRUPPIUTENTE" FOR ALL CHILDREN IN "TABACCESSIGRUPPO"  */
      IF UPDATE(CODICE)
      BEGIN
         UPDATE TABACCESSIGRUPPO
          SET   CODGRUPPO = I1.CODICE
         FROM   TABACCESSIGRUPPO T2, INSERTED I1, DELETED D1
         WHERE  T2.CODGRUPPO = D1.CODICE
          AND  (I1.CODICE != D1.CODICE)
      END
      
      /*  MODIFY PARENT CODE OF "TABGRUPPIUTENTE" FOR ALL CHILDREN IN "TABAGENTIGRUPPO"  */
      IF UPDATE(CODICE)
      BEGIN
         UPDATE TABAGENTIGRUPPO
          SET   CODGRUPPO = I1.CODICE
         FROM   TABAGENTIGRUPPO T2, INSERTED I1, DELETED D1
         WHERE  T2.CODGRUPPO = D1.CODICE
          AND  (I1.CODICE != D1.CODICE)
      END
      
      /*  MODIFY PARENT CODE OF "TABGRUPPIUTENTE" FOR ALL CHILDREN IN "TABPROFILI"  */
      IF UPDATE(CODICE)
      BEGIN
         UPDATE TABPROFILI
          SET   CODGRUPPO = I1.CODICE
         FROM   TABPROFILI T2, INSERTED I1, DELETED D1
         WHERE  T2.CODGRUPPO = D1.CODICE
          AND  (I1.CODICE != D1.CODICE)
      END

      RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO

CREATE TRIGGER [TI_TABGRUPPIUTENTE] ON [TABGRUPPIUTENTE] FOR INSERT AS
BEGIN
   DECLARE
      @NUMROWS  INT,
      @Codice   DECIMAL(25),
      @LastProg INT,
      @ERRNO    INT,
      @ERRMSG   varCHAR(255)

   SELECT @NUMROWS = @@ROWCOUNT
   IF @NUMROWS = 0
      RETURN

   IF UPDATE([CODICE])
   BEGIN
      DECLARE CUR_Codice CURSOR FOR SELECT [CODICE] FROM INSERTED
      OPEN CUR_Codice
      FETCH NEXT FROM CUR_Codice INTO @Codice

      WHILE @@FETCH_STATUS = 0
      BEGIN
         SELECT @LastProg = ISNULL(MAX([PROGRESSIVO]),0) FROM [TABPROFILI]

         INSERT INTO [TABPROFILI] ([PROGRESSIVO],[CODGRUPPO],[CODUTENTE],[CODRUOLO],[UTENTEMODIFICA],[DATAMODIFICA])
         VALUES (@LastProg+1, @Codice, NULL, 0, 'dbo', GETDATE())

         FETCH NEXT FROM CUR_Codice INTO @Codice
      END
      CLOSE CUR_Codice
      DEALLOCATE CUR_Codice
   END

   RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO
GRANT DELETE
    ON OBJECT::[dbo].[TABGRUPPIUTENTE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TABGRUPPIUTENTE] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TABGRUPPIUTENTE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TABGRUPPIUTENTE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TABGRUPPIUTENTE] TO [Metodo98]
    AS [dbo];

