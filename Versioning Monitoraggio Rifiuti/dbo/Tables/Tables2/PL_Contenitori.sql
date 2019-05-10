CREATE TABLE [dbo].[PL_Contenitori] (
    [Codice]             VARCHAR (10)    NOT NULL,
    [Descrizione]        VARCHAR (50)    DEFAULT ('') NULL,
    [CodArt]             VARCHAR (50)    DEFAULT ('') NULL,
    [Volume]             DECIMAL (10, 6) DEFAULT ((0)) NULL,
    [AltezzaU]           DECIMAL (10, 6) DEFAULT ((0)) NULL,
    [AltezzaB]           DECIMAL (10, 6) DEFAULT ((0)) NULL,
    [Larghezza]          DECIMAL (10, 6) DEFAULT ((0)) NULL,
    [Profondita]         DECIMAL (10, 6) DEFAULT ((0)) NULL,
    [Attivo]             SMALLINT        DEFAULT ((0)) NULL,
    [PesoContenitore]    DECIMAL (16, 6) DEFAULT ((0)) NULL,
    [RiferimentoUDC]     VARCHAR (1)     NOT NULL,
    [TipoContenitore]    SMALLINT        DEFAULT ((0)) NULL,
    [Progressivo]        DECIMAL (10)    DEFAULT ((0)) NOT NULL,
    [AltezzaVariabile]   SMALLINT        DEFAULT ((0)) NULL,
    [DESCRIZIONELINGUA1] VARCHAR (80)    DEFAULT ('') NULL,
    [DESCRIZIONELINGUA2] VARCHAR (80)    DEFAULT ('') NULL,
    [DESCRIZIONELINGUA3] VARCHAR (80)    DEFAULT ('') NULL,
    [DESCRIZIONELINGUA4] VARCHAR (80)    DEFAULT ('') NULL,
    [DESCRIZIONELINGUA5] VARCHAR (80)    DEFAULT ('') NULL,
    [DESCRIZIONELINGUA6] VARCHAR (80)    DEFAULT ('') NULL,
    [DESCRIZIONELINGUA7] VARCHAR (80)    DEFAULT ('') NULL,
    [DESCRIZIONELINGUA8] VARCHAR (80)    DEFAULT ('') NULL,
    [DESCRIZIONELINGUA9] VARCHAR (80)    DEFAULT ('') NULL,
    [UtenteModifica]     VARCHAR (25)    NOT NULL,
    [DataModifica]       DATETIME        NOT NULL,
    CONSTRAINT [PK_PL_Contenitori] PRIMARY KEY CLUSTERED ([Codice] ASC)
);


GO


CREATE TRIGGER TU_PL_Contenitori ON PL_Contenitori FOR UPDATE AS
BEGIN
          
      DECLARE @NUMROWS  INT,
              @ERRMSG   VARCHAR(255)


      SELECT  @NUMROWS = @@ROWCOUNT
      IF @NUMROWS = 0
         RETURN

      
      /*  CONTROLLO DUPLICATI RIFERIMENTOUDC */
      IF UPDATE(RIFERIMENTOUDC)
      BEGIN
         IF (SELECT COUNT(*)
             FROM   PL_Contenitori T1, INSERTED T2
             WHERE  T1.RIFERIMENTOUDC = T2.RIFERIMENTOUDC AND T1.CODICE <> T2.CODICE) != 0

               BEGIN
                   SELECT @ERRMSG = 'CODICE RIFERIMENTO UDC GIA'' INSERITO.'
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


CREATE TRIGGER TI_PL_Contenitori ON PL_Contenitori FOR INSERT AS
BEGIN
          
      DECLARE @NUMROWS  INT,
              @ERRMSG   VARCHAR(255)


      SELECT  @NUMROWS = @@ROWCOUNT
      IF @NUMROWS = 0
         RETURN
      
      /*  CONTROLLO DUPLICATI RIFERIMENTOUDC */
      IF UPDATE(RIFERIMENTOUDC)
      BEGIN
         IF (SELECT COUNT(*)
             FROM   PL_Contenitori T1, INSERTED T2
             WHERE  T1.RIFERIMENTOUDC = T2.RIFERIMENTOUDC AND T1.CODICE <> T2.CODICE) != 0

               BEGIN
                 SELECT @ERRMSG = 'CODICE RIFERIMENTO UDC GIA'' INSERITO.'
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
    ON OBJECT::[dbo].[PL_Contenitori] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[PL_Contenitori] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[PL_Contenitori] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[PL_Contenitori] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[PL_Contenitori] TO [Metodo98]
    AS [dbo];

