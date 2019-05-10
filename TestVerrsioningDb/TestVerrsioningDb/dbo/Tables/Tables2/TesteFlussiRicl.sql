CREATE TABLE [dbo].[TesteFlussiRicl] (
    [IDFlusso]         NUMERIC (10)    NOT NULL,
    [IDSchema]         NUMERIC (10)    NOT NULL,
    [IDCollegamento]   NUMERIC (10)    NOT NULL,
    [Descrizione]      VARCHAR (80)    NULL,
    [NomeImpostazione] VARCHAR (50)    NULL,
    [SaldiInEuro]      SMALLINT        NULL,
    [NomeDitta]        VARCHAR (30)    NOT NULL,
    [DataElaborazione] DATETIME        NULL,
    [FlagSimulazione]  SMALLINT        NULL,
    [LivUtileEco]      VARCHAR (15)    NULL,
    [LivPerdEco]       VARCHAR (15)    NULL,
    [LivUtilePat]      VARCHAR (15)    NULL,
    [LivPerdPat]       VARCHAR (15)    NULL,
    [ValoreUtileEco]   DECIMAL (19, 4) DEFAULT (0) NULL,
    [ValorePerdEco]    DECIMAL (19, 4) DEFAULT (0) NULL,
    [ValoreUtilePat]   DECIMAL (19, 4) DEFAULT (0) NULL,
    [ValorePerdPat]    DECIMAL (19, 4) DEFAULT (0) NULL,
    [UtenteModifica]   VARCHAR (25)    NOT NULL,
    [DataModifica]     DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([IDFlusso] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [DscFlusso]
    ON [dbo].[TesteFlussiRicl]([Descrizione] ASC) WITH (FILLFACTOR = 90);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IDFlussoSchemaColleg]
    ON [dbo].[TesteFlussiRicl]([IDFlusso] ASC, [IDSchema] ASC, [IDCollegamento] ASC) WITH (FILLFACTOR = 90);


GO

/*  Update trigger "tu_testeflussiricl" for table "TesteFlussiRicl"  */
CREATE TRIGGER tu_testeflussiricl on TesteFlussiRicl for update as
begin
   declare
      @maxcard  int,
      @numrows  int,
      @numnull  int,
      @errno    int,
      @errmsg   varchar(255)

      select  @numrows = @@rowcount
      if @numrows = 0
         return

      
      /*  Modify parent code of "TesteFlussiRicl" for all children in "RigheFlussiRicl"  */
      if update(IDFlusso)
      begin
         update RigheFlussiRicl
          set   IDFlusso = i1.IDFlusso
         from   RigheFlussiRicl t2, inserted i1, deleted d1
         where  t2.IDFlusso = d1.IDFlusso
          and  (i1.IDFlusso != d1.IDFlusso)
      end

      return

/*  Errors handling  */
error:
    RAISERROR (@ERRMSG, 1, 1)
    rollback  transaction
end

GO

/*  Delete trigger "td_testeflussiricl" for table "TesteFlussiRicl"  */
CREATE TRIGGER td_testeflussiricl on TesteFlussiRicl for delete as
begin
    declare
       @numrows  int,
       @errno    int,
       @errmsg   varchar(255)

    select  @numrows = @@rowcount
    if @numrows = 0
       return

    
    /*  Delete all children in "RigheFlussiRicl"  */
    delete RigheFlussiRicl
    from   RigheFlussiRicl t2, deleted t1
    where  t2.IDFlusso = t1.IDFlusso

    return

/*  Errors handling  */
error:
    RAISERROR (@ERRMSG, 1, 1)
    rollback  transaction
end

GO
GRANT DELETE
    ON OBJECT::[dbo].[TesteFlussiRicl] TO [AnaBilancio]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TesteFlussiRicl] TO [AnaBilancio]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TesteFlussiRicl] TO [AnaBilancio]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TesteFlussiRicl] TO [AnaBilancio]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TesteFlussiRicl] TO [AnaBilancio]
    AS [dbo];

