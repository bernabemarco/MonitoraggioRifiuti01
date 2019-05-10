

CREATE FUNCTION IE_ExpFun_ComposerField(@RifProgressivo decimal(18,0) = 0, @Field varchar(max) = '')

RETURNS VARCHAR(MAX)
AS
BEGIN

Declare @TableAlias         varchar(MAX) = '';
Declare @TableName          varchar(MAX) = '';
Declare @TableType          varchar(2)   = '';
Declare @FunctionParameter  varchar(MAX) = Null;
Declare @FunctionOwner      varchar(MAX) = '';

declare @Result         varchar(max) = '';

    /*Recupero l'Alias della tabella ed il nome del campo oppure l'alias della funzione*/
    if (CHARINDEX('.',@Field, 1) > 0)
        begin
            Set @TableAlias = SUBSTRING(@Field, 1, (CHARINDEX('.',@Field,1) - 1));
        end
    else
        begin
            Set @TableAlias = @Field
        end

    /*Recupero il nome della tabella o funzione*/
    select @TableName = TableName from IE_ExpProfileTables where RifProgressivo = @RifProgressivo and TableCaption = @TableAlias;

    /*
    'All Type
    C       CHECK_CONSTRAINT  
    D       DEFAULT_CONSTRAINT  
    F       FOREIGN_KEY_CONSTRAINT  
    FN      SQL_SCALAR_FUNCTION  
    FS      CLR_SCALAR_FUNCTION  
    IT      INTERNAL_TABLE  
    P       SQL_STORED_PROCEDURE  
    PK      PRIMARY_KEY_CONSTRAINT  
    S       SYSTEM_TABLE  
    SQ      SERVICE_QUEUE  
    TR      SQL_TRIGGER  
    U       USER_TABLE  
    UQ      UNIQUE_CONSTRAINT  
    V       VIEW  

    'Managed Type
    FN      SQL_SCALAR_FUNCTION  
    V       VIEW  
    U       USER_TABLE  
    */
    /*Recupero il tipo di oggetto*/
    select distinct @FunctionOwner = user_name(objectproperty(object_id, 'OwnerID')), @TableType = [Type] FROM Sys.Objects where name = @TableName;

    if upper(@TableType) = 'FN'
        begin
            select @FunctionParameter = COALESCE(@FunctionParameter + ',', '') + (SourceTable + '.' + SourceField) 
            from IE_ExpProfileTablesLink 
            Where RifProgressivo = @RifProgressivo And (DestinationTable = @TableAlias) 
            Order By Progressivo;

            Set @Result = @FunctionOwner + '.' + @TableName + '(' +  @FunctionParameter + ')'
        end
    else
        begin
            Set @Result = @Field;
        end

    -- Return the result of the function
    RETURN @Result

END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[IE_ExpFun_ComposerField] TO [Metodo98]
    AS [dbo];

