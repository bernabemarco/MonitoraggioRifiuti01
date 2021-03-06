﻿CREATE TABLE [dbo].[TIPOLOGIEARTICOLI] (
    [CODICEART]          VARCHAR (50) NOT NULL,
    [NUMEROTIP]          SMALLINT     NOT NULL,
    [CODTIPOLOGIA]       VARCHAR (3)  NULL,
    [SELVARIANTI]        SMALLINT     DEFAULT (0) NULL,
    [AGGIUNGIDES]        SMALLINT     DEFAULT (0) NULL,
    [UTENTEMODIFICA]     VARCHAR (25) NOT NULL,
    [DATAMODIFICA]       DATETIME     NOT NULL,
    [NOCODART]           SMALLINT     DEFAULT ((0)) NULL,
    [FlgExportECommerce] SMALLINT     DEFAULT ((0)) NULL,
    CONSTRAINT [PK_TIPOLOGIEARTICOLI] PRIMARY KEY CLUSTERED ([CODICEART] ASC, [NUMEROTIP] ASC) WITH (FILLFACTOR = 90),
    CONSTRAINT [CHK_TipologieArticoli_FlgExportECommerce] CHECK ([FlgExportECommerce]=(1) OR [FlgExportECommerce]=(0)),
    CONSTRAINT [CKC_AGGIUNGIDES_TIPOLOGI] CHECK ([AGGIUNGIDES] = 0 or [AGGIUNGIDES] = 1),
    CONSTRAINT [CKC_SELVARIANTI_TIPOLOGI] CHECK ([SELVARIANTI] = 0 or [SELVARIANTI] = 1)
);


GO
CREATE NONCLUSTERED INDEX [TIPOLART_CODTIP]
    ON [dbo].[TIPOLOGIEARTICOLI]([CODTIPOLOGIA] ASC) WITH (FILLFACTOR = 90);


GO
/*  DELETE TRIGGER "TD_TIPOLOGIEARTICOLI" FOR TABLE "TIPOLOGIEARTICOLI"  */
CREATE TRIGGER TD_TIPOLOGIEARTICOLI ON TIPOLOGIEARTICOLI FOR DELETE AS
BEGIN
    DECLARE
       @NUMROWS  INT,
       @ERRNO    INT,
       @ERRMSG   VARCHAR(255),
       @NUMTIP   INT,
       @CODART   VARCHAR(50)
 
    SELECT  @NUMROWS = @@ROWCOUNT
    IF @NUMROWS = 0
       RETURN
 
    DECLARE Varianti_Cursor CURSOR FOR SELECT CODICEART, NUMEROTIP FROM DELETED 
    OPEN Varianti_Cursor
    FETCH NEXT FROM Varianti_Cursor INTO @CODART, @NUMTIP
    WHILE @@FETCH_STATUS = 0
     BEGIN
     /*  DELETE CHILDREN IN "VARIANTIARTICOLI"  */
     DELETE VARIANTIARTICOLI
     FROM   VARIANTIARTICOLI T2
     WHERE  T2.CODICEART = @CODART AND T2.NUMEROTIP = @NUMTIP
 
     FETCH NEXT FROM Varianti_Cursor INTO @CODART, @NUMTIP
     END
    CLOSE Varianti_Cursor
    DEALLOCATE Varianti_Cursor
    
 
    RETURN
 
/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO

/*  INSERT TRIGGER "TI_TIPOLOGIEARTICOLI" FOR TABLE "TIPOLOGIEARTICOLI"  */
CREATE TRIGGER TI_TIPOLOGIEARTICOLI ON TIPOLOGIEARTICOLI FOR INSERT AS
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

    
    /*  PARENT "ANAGRAFICAARTICOLI" MUST EXIST WHEN INSERTING A CHILD IN "TIPOLOGIEARTICOLI"  */
    IF UPDATE(CODICEART)
    BEGIN
       IF (SELECT COUNT(*)
           FROM   ANAGRAFICAARTICOLI T1, INSERTED T2
           WHERE  T1.CODICE = T2.CODICEART) != @NUMROWS
          BEGIN
             SELECT @ERRNO  = 30002,
                    @ERRMSG = 'Parent does not exist in "ANAGRAFICAARTICOLI". Cannot create child in "TIPOLOGIEARTICOLI".'
             GOTO ERROR
          END
    END
    
    /*  PARENT "TABTIPOLOGIE" MUST EXIST WHEN INSERTING A CHILD IN "TIPOLOGIEARTICOLI"  */
    IF UPDATE(CODTIPOLOGIA)
    BEGIN
       SELECT @NUMNULL = (SELECT COUNT(*)
                          FROM   INSERTED
                          WHERE  CODTIPOLOGIA IS NULL)
       IF @NUMNULL != @NUMROWS
          IF (SELECT COUNT(*)
              FROM   TABTIPOLOGIE T1, INSERTED T2
              WHERE  T1.TIPOLOGIA = T2.CODTIPOLOGIA) != @NUMROWS - @NUMNULL
          BEGIN
             SELECT @ERRNO  = 30002,
                    @ERRMSG = 'Parent does not exist in "TABTIPOLOGIE". Cannot create child in "TIPOLOGIEARTICOLI".'
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

/*  UPDATE TRIGGER "TU_TIPOLOGIEARTICOLI" FOR TABLE "TIPOLOGIEARTICOLI"  */
CREATE TRIGGER TU_TIPOLOGIEARTICOLI ON TIPOLOGIEARTICOLI FOR UPDATE AS
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

      
      /*  PARENT "ANAGRAFICAARTICOLI" MUST EXIST WHEN UPDATING A CHILD IN "TIPOLOGIEARTICOLI"  */
      IF UPDATE(CODICEART)
      BEGIN
         IF (SELECT COUNT(*)
             FROM   ANAGRAFICAARTICOLI T1, INSERTED T2
             WHERE  T1.CODICE = T2.CODICEART) != @NUMROWS
            BEGIN
               SELECT @ERRNO  = 30003,
                      @ERRMSG = '"ANAGRAFICAARTICOLI" does not exist. Cannot modify child in "TIPOLOGIEARTICOLI".'
               GOTO ERROR
            END
      END
      
      /*  PARENT "TABTIPOLOGIE" MUST EXIST WHEN UPDATING A CHILD IN "TIPOLOGIEARTICOLI"  */
      IF UPDATE(CODTIPOLOGIA)
      BEGIN
         SELECT @NUMNULL = (SELECT COUNT(*)
                            FROM   INSERTED
                            WHERE  CODTIPOLOGIA IS NULL)
         IF @NUMNULL != @NUMROWS
            IF (SELECT COUNT(*)
                FROM   TABTIPOLOGIE T1, INSERTED T2
                WHERE  T1.TIPOLOGIA = T2.CODTIPOLOGIA) != @NUMROWS - @NUMNULL
            BEGIN
               SELECT @ERRNO  = 30003,
                      @ERRMSG = '"TABTIPOLOGIE" does not exist. Cannot modify child in "TIPOLOGIEARTICOLI".'
               GOTO ERROR
            END
      END
      
      /*  MODIFY PARENT CODE OF "TIPOLOGIEARTICOLI" FOR ALL CHILDREN IN "VARIANTIARTICOLI"  */
      IF UPDATE(CODICEART) OR
         UPDATE(NUMEROTIP)
      BEGIN
         UPDATE VARIANTIARTICOLI
          SET   CODICEART = I1.CODICEART,
                NUMEROTIP = I1.NUMEROTIP
         FROM   VARIANTIARTICOLI T2, INSERTED I1, DELETED D1
         WHERE  T2.CODICEART = D1.CODICEART
          AND   T2.NUMEROTIP = D1.NUMEROTIP
          AND  (I1.CODICEART != D1.CODICEART OR
                I1.NUMEROTIP != D1.NUMEROTIP)
      END

      RETURN

/*  ERRORS HANDLING  */
ERROR:
    RAISERROR (@ERRMSG, 1, 1)
    ROLLBACK  TRANSACTION
END

GO
GRANT DELETE
    ON OBJECT::[dbo].[TIPOLOGIEARTICOLI] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TIPOLOGIEARTICOLI] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TIPOLOGIEARTICOLI] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TIPOLOGIEARTICOLI] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TIPOLOGIEARTICOLI] TO [Metodo98]
    AS [dbo];

