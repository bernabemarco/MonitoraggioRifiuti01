CREATE TABLE [dbo].[TesteSchemaRicl] (
    [IDSchema]       NUMERIC (10)  NOT NULL,
    [NomeSchema]     VARCHAR (80)  NOT NULL,
    [Note]           VARCHAR (255) NOT NULL,
    [DocCollegato]   VARCHAR (80)  NULL,
    [UtenteModifica] VARCHAR (25)  NOT NULL,
    [DataModifica]   DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([IDSchema] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [NomeSchema]
    ON [dbo].[TesteSchemaRicl]([NomeSchema] ASC) WITH (FILLFACTOR = 90);


GO

/*  Update trigger "tu_testeschemaricl" for table "TesteSchemaRicl"  */
CREATE TRIGGER tu_testeschemaricl on TesteSchemaRicl for update as
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

      
      /*  Modify parent code of "TesteSchemaRicl" for all children in "RigheSchemaRicl"  */
      if update(IDSchema)
      begin
         update RigheSchemaRicl
          set   IDSchema = i1.IDSchema
         from   RigheSchemaRicl t2, inserted i1, deleted d1
         where  t2.IDSchema = d1.IDSchema
          and  (i1.IDSchema != d1.IDSchema)
      end

      return

/*  Errors handling  */
error:
    RAISERROR (@ERRMSG, 1, 1)
    rollback  transaction
end

GO

/*  Delete trigger "td_testeschemaricl" for table "TesteSchemaRicl"  */
CREATE TRIGGER td_testeschemaricl on TesteSchemaRicl for delete as
begin
    declare
       @numrows  int,
       @errno    int,
       @errmsg   varchar(255)

    select  @numrows = @@rowcount
    if @numrows = 0
       return

    
    /*  Delete all children in "RigheSchemaRicl"  */
    delete RigheSchemaRicl
    from   RigheSchemaRicl t2, deleted t1
    where  t2.IDSchema = t1.IDSchema

    return

/*  Errors handling  */
error:
    RAISERROR (@ERRMSG, 1, 1)
    rollback  transaction
end

GO
GRANT DELETE
    ON OBJECT::[dbo].[TesteSchemaRicl] TO [AnaBilancio]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[TesteSchemaRicl] TO [AnaBilancio]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[TesteSchemaRicl] TO [AnaBilancio]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[TesteSchemaRicl] TO [AnaBilancio]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[TesteSchemaRicl] TO [AnaBilancio]
    AS [dbo];

