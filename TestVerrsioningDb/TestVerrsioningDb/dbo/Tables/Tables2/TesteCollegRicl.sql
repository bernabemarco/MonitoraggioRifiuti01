CREATE TABLE [dbo].[TesteCollegRicl] (
    [NomeDitta]      VARCHAR (30) NOT NULL,
    [IDSchema]       NUMERIC (10) NOT NULL,
    [Descrizione]    VARCHAR (80) NOT NULL,
    [IDCollegamento] NUMERIC (10) NOT NULL,
    [UtenteModifica] VARCHAR (25) NOT NULL,
    [DataModifica]   DATETIME     NOT NULL,
    PRIMARY KEY CLUSTERED ([IDCollegamento] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [IDSchema]
    ON [dbo].[TesteCollegRicl]([IDSchema] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [Ditta]
    ON [dbo].[TesteCollegRicl]([NomeDitta] ASC) WITH (FILLFACTOR = 90);


GO
CREATE NONCLUSTERED INDEX [DscCollegamento]
    ON [dbo].[TesteCollegRicl]([Descrizione] ASC) WITH (FILLFACTOR = 90);


GO

/*  Update trigger "tu_testecollegricl" for table "TesteCollegRicl"  */
CREATE TRIGGER tu_testecollegricl on TesteCollegRicl for update as
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

      
      /*  Modify parent code of "TesteCollegRicl" for all children in "RigheCollegRicl"  */
      if update(IDCollegamento)
      begin
         update RigheCollegRicl
          set   IDCollegamento = i1.IDCollegamento
         from   RigheCollegRicl t2, inserted i1, deleted d1
         where  t2.IDCollegamento = d1.IDCollegamento
          and  (i1.IDCollegamento != d1.IDCollegamento)
      end

      return

/*  Errors handling  */
error:
    RAISERROR (@ERRMSG, 1, 1)
    rollback  transaction
end

GO

/*  Delete trigger "td_testecollegricl" for table "TesteCollegRicl"  */
CREATE TRIGGER td_testecollegricl on TesteCollegRicl for delete as
begin
    declare
       @numrows  int,
       @errno    int,
       @errmsg   varchar(255)

    select  @numrows = @@rowcount
    if @numrows = 0
       return

    
    /*  Delete all children in "RigheCollegRicl"  */
    delete RigheCollegRicl
    from   RigheCollegRicl t2, deleted t1
    where  t2.IDCollegamento = t1.IDCollegamento

    return

/*  Errors handling  */
error:
    RAISERROR (@ERRMSG, 1, 1)
    rollback  transaction
end

GO
GRANT DELETE
    ON OBJECT::[dbo].[TesteCollegRicl] TO [AnaBilancio]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TesteCollegRicl] TO [AnaBilancio]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TesteCollegRicl] TO [AnaBilancio]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TesteCollegRicl] TO [AnaBilancio]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TesteCollegRicl] TO [AnaBilancio]
    AS [dbo];

