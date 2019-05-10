CREATE TABLE [dbo].[RigheFlussiRicl] (
    [IDFlusso]           NUMERIC (10)    NOT NULL,
    [IDLivPadre]         VARCHAR (8)     NOT NULL,
    [IDLivello]          VARCHAR (8)     NOT NULL,
    [Importo]            NUMERIC (19, 6) NOT NULL,
    [Posizione]          INT             NOT NULL,
    [TipoRiclass]        SMALLINT        NOT NULL,
    [Descrizione]        VARCHAR (80)    NULL,
    [StampaLivello]      INT             NULL,
    [ImportoInt]         DECIMAL (19, 4) DEFAULT (0) NULL,
    [ImportoRett]        DECIMAL (19, 4) DEFAULT (0) NULL,
    [TipoVarSimulazione] SMALLINT        NULL,
    [ValoreSimulazione]  DECIMAL (19, 4) DEFAULT (0) NULL,
    [ImportoSimulazione] DECIMAL (19, 4) DEFAULT (0) NULL,
    [UtenteModifica]     VARCHAR (25)    NOT NULL,
    [DataModifica]       DATETIME        NOT NULL,
    PRIMARY KEY CLUSTERED ([IDFlusso] ASC, [IDLivello] ASC, [TipoRiclass] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [Posizione]
    ON [dbo].[RigheFlussiRicl]([Posizione] ASC) WITH (FILLFACTOR = 90);


GO

/*  Insert trigger "ti_righeflussiricl" for table "RigheFlussiRicl"  */
CREATE TRIGGER ti_righeflussiricl on RigheFlussiRicl for insert as
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

    
    /*  Parent "TesteFlussiRicl" must exist when inserting a child in "RigheFlussiRicl"  */
    if update(IDFlusso)
    begin
       if (select count(*)
           from   TesteFlussiRicl t1, inserted t2
           where  t1.IDFlusso = t2.IDFlusso) != @numrows
          begin
             select @errno  = 30002,
                    @errmsg = 'Parent does not exist in "TesteFlussiRicl". Cannot create child in "RigheFlussiRicl".'
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

/*  Update trigger "tu_righeflussiricl" for table "RigheFlussiRicl"  */
CREATE TRIGGER tu_righeflussiricl on RigheFlussiRicl for update as
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

      
      /*  Parent "TesteFlussiRicl" must exist when updating a child in "RigheFlussiRicl"  */
      if update(IDFlusso)
      begin
         if (select count(*)
             from   TesteFlussiRicl t1, inserted t2
             where  t1.IDFlusso = t2.IDFlusso) != @numrows
            begin
               select @errno  = 30003,
                      @errmsg = '"TesteFlussiRicl" does not exist. Cannot modify child in "RigheFlussiRicl".'
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
    ON OBJECT::[dbo].[RigheFlussiRicl] TO [AnaBilancio]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[RigheFlussiRicl] TO [AnaBilancio]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[RigheFlussiRicl] TO [AnaBilancio]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[RigheFlussiRicl] TO [AnaBilancio]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[RigheFlussiRicl] TO [AnaBilancio]
    AS [dbo];

