CREATE TABLE [dbo].[RigheCollegRicl] (
    [IDCollegamento]  NUMERIC (10)  NOT NULL,
    [IDLivello]       VARCHAR (8)   NOT NULL,
    [IDLivPadre]      VARCHAR (8)   NOT NULL,
    [FormulaValSaldo] VARCHAR (255) NULL,
    [TipoRiclass]     SMALLINT      NOT NULL,
    [UtenteModifica]  VARCHAR (25)  NOT NULL,
    [DataModifica]    DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([IDCollegamento] ASC, [IDLivello] ASC, [TipoRiclass] ASC) WITH (FILLFACTOR = 90)
);


GO


/*  Insert trigger "ti_righecollegricl" for table "RigheCollegRicl"  */
CREATE TRIGGER ti_righecollegricl on RigheCollegRicl for insert as
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

    
    /*  Parent "TesteCollegRicl" must exist when inserting a child in "RigheCollegRicl"  */
    if update(IDCollegamento)
    begin
       if (select count(*)
           from   TesteCollegRicl t1, inserted t2
           where  t1.IDCollegamento = t2.IDCollegamento) != @numrows
          begin
             select @errno  = 30002,
                    @errmsg = 'Parent does not exist in "TesteCollegRicl". Cannot create child in "RigheCollegRicl".'
             goto error
          end
    end

    return

/*  Errors handling  */
error:
    RAISERROR (@ERRMSG, 1, 1)
    rollback  transaction
end

GO

/*  Update trigger "tu_righecollegricl" for table "RigheCollegRicl"  */
CREATE TRIGGER tu_righecollegricl on RigheCollegRicl for update as
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

      
      /*  Parent "TesteCollegRicl" must exist when updating a child in "RigheCollegRicl"  */
      if update(IDCollegamento)
      begin
         if (select count(*)
             from   TesteCollegRicl t1, inserted t2
             where  t1.IDCollegamento = t2.IDCollegamento) != @numrows
            begin
               select @errno  = 30003,
                      @errmsg = '"TesteCollegRicl" does not exist. Cannot modify child in "RigheCollegRicl".'
               goto error
            end
      end

      return

/*  Errors handling  */
error:
    RAISERROR (@ERRMSG, 1, 1)
    rollback  transaction
end

GO
GRANT DELETE
    ON OBJECT::[dbo].[RigheCollegRicl] TO [AnaBilancio]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[RigheCollegRicl] TO [AnaBilancio]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[RigheCollegRicl] TO [AnaBilancio]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[RigheCollegRicl] TO [AnaBilancio]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[RigheCollegRicl] TO [AnaBilancio]
    AS [dbo];

