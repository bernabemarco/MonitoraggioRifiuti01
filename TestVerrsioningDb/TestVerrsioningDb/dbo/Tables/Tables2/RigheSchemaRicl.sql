CREATE TABLE [dbo].[RigheSchemaRicl] (
    [IDSchema]       NUMERIC (10)  NOT NULL,
    [IDLivello]      VARCHAR (8)   NOT NULL,
    [IDLivPadre]     VARCHAR (8)   NOT NULL,
    [Livello]        SMALLINT      NOT NULL,
    [Posizione]      INT           NOT NULL,
    [Descrizione]    VARCHAR (80)  NOT NULL,
    [FormulaVal]     VARCHAR (255) NULL,
    [TipoRiclass]    SMALLINT      NOT NULL,
    [StampaLivello]  SMALLINT      NULL,
    [InGrassetto]    INT           NULL,
    [ColoreTesto]    INT           NULL,
    [ColoreSfondo]   INT           NULL,
    [Note]           VARCHAR (255) NULL,
    [FormulaDsc]     VARCHAR (255) NULL,
    [FormulaStpLiv]  VARCHAR (255) NULL,
    [ColoreTestoR]   INT           NULL,
    [ColoreTestoG]   INT           NULL,
    [ColoreTestoB]   INT           NULL,
    [ColoreSfondoR]  INT           NULL,
    [ColoreSfondoG]  INT           NULL,
    [ColoreSfondoB]  INT           NULL,
    [UtenteModifica] VARCHAR (25)  NOT NULL,
    [DataModifica]   DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([IDSchema] ASC, [IDLivello] ASC, [TipoRiclass] ASC) WITH (FILLFACTOR = 90),
    CHECK ([InGrassetto] is null or [InGrassetto] = 0 or [InGrassetto] = 1),
    CHECK ([StampaLivello] is null or [StampaLivello] = 0 or [StampaLivello] = 1)
);


GO
CREATE NONCLUSTERED INDEX [Posizione]
    ON [dbo].[RigheSchemaRicl]([Posizione] ASC) WITH (FILLFACTOR = 90);


GO

/*  Insert trigger "ti_righeschemaricl" for table "RigheSchemaRicl"  */
CREATE TRIGGER ti_righeschemaricl on RigheSchemaRicl for insert as
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

    
    /*  Parent "TesteSchemaRicl" must exist when inserting a child in "RigheSchemaRicl"  */
    if update(IDSchema)
    begin
       if (select count(*)
           from   TesteSchemaRicl t1, inserted t2
           where  t1.IDSchema = t2.IDSchema) != @numrows
          begin
             select @errno  = 30002,
                    @errmsg = 'Parent does not exist in "TesteSchemaRicl". Cannot create child in "RigheSchemaRicl".'
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

/*  Update trigger "tu_righeschemaricl" for table "RigheSchemaRicl"  */
CREATE TRIGGER tu_righeschemaricl on RigheSchemaRicl for update as
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

      
      /*  Parent "TesteSchemaRicl" must exist when updating a child in "RigheSchemaRicl"  */
      if update(IDSchema)
      begin
         if (select count(*)
             from   TesteSchemaRicl t1, inserted t2
             where  t1.IDSchema = t2.IDSchema) != @numrows
            begin
               select @errno  = 30003,
                      @errmsg = '"TesteSchemaRicl" does not exist. Cannot modify child in "RigheSchemaRicl".'
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
    ON OBJECT::[dbo].[RigheSchemaRicl] TO [AnaBilancio]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[RigheSchemaRicl] TO [AnaBilancio]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[RigheSchemaRicl] TO [AnaBilancio]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[RigheSchemaRicl] TO [AnaBilancio]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[RigheSchemaRicl] TO [AnaBilancio]
    AS [dbo];

