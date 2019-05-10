

CREATE PROCEDURE [dbo].[MB_GET_MergeQuery] 
       @TableName varchar(100) = 'MB_Righe_Pivot',
       @Sqlcmd nvarchar(MAX) OUT
AS


BEGIN
    SET NOCOUNT ON 

    declare @sql varchar(max),@SourceInsertColumns varchar(5000),@DestInsertColumns varchar(5000),@UpdateClause varchar(5000)
    declare @ColumnName varchar(100), @identityColName varchar(100)
    declare @IsIdentity int,@IsComputed int, @Data_Type varchar(50)

    declare @SourceDB as varchar(200)


    -- source/dest i.e. 'instance.catalog.owner.' - table names will be appended to this
    -- the destination is your current db context
    set @SourceDB = DB_NAME()

    set @sql = ''
    set @SourceInsertColumns  = ''
    set @DestInsertColumns  = ''
    set @UpdateClause  = ''
    set @ColumnName  = ''
    set @isIdentity = 0
    set @IsComputed = 0
    set @identityColName  = ''
    set @Data_Type  = ''


DECLARE @ColNames CURSOR
SET @ColNames = CURSOR FOR 
    select   column_name, COLUMNPROPERTY(object_id(TABLE_NAME), COLUMN_NAME, 'IsIdentity') as IsIdentity ,
        COLUMNPROPERTY(object_id(TABLE_NAME), COLUMN_NAME, 'IsComputed') as IsComputed , DATA_TYPE
    from information_schema.columns where table_name = @TableName order by ordinal_position


OPEN @ColNames
FETCH NEXT FROM @ColNames INTO @ColumnName, @isIdentity, @IsComputed, @DATA_TYPE




WHILE @@FETCH_STATUS = 0
    BEGIN
        if @IsComputed = 0 and @DATA_TYPE <> 'timestamp'
            BEGIN
                --Print @ColumnName
                set @SourceInsertColumns = @SourceInsertColumns + 
                    case when @SourceInsertColumns = '' THEN '' ELSE ',' end +
                    'S.' + @ColumnName

                set @DestInsertColumns = @DestInsertColumns + 
                    case when @DestInsertColumns = '' THEN '' ELSE ',' end +
                    @ColumnName

                  if @isIdentity = 0
                    BEGIN

                        set @UpdateClause = @UpdateClause + 
                        case when @UpdateClause = '' THEN '' ELSE ',' end
                         + @ColumnName + '=' + 'S.' + @ColumnName + ''

                END

                if @isIdentity = 1  OR (@Columnname = 'IDTESTADOC') OR ( @Columnname = 'IDRIGADOC') 
                    BEGIN
                        SET @isIdentity =1
                        set @identityColName = @ColumnName
                        --PRINT @Columnname
                    end              

            END

        FETCH NEXT FROM @ColNames INTO @ColumnName, @isIdentity, @IsComputed, @DATA_TYPE
    END

CLOSE @ColNames


DEALLOCATE @ColNames



SET @SourceDB ='(SELECT * FROM VISTA_mb_righe_Pivot)'







         SET @sql = ' MERGE ' + @TableName + ' AS D
                        USING ' + @SourceDB  + ' AS S
                        ON (S.IDTESTADOC = D.IDTESTADOC
                        AND S.IDRIGADOC = D.IDRIGADOC

                        )
                    WHEN NOT MATCHED BY TARGET
                        THEN INSERT 
                        VALUES(' + @SourceInsertColumns + ')
                    --WHEN MATCHED 
                    --    THEN UPDATE SET ' + @UpdateClause + '
                    WHEN NOT MATCHED BY SOURCE
                        THEN DELETE
                    OUTPUT $action Azione, Inserted.*, Deleted.*;'
            SET @Sqlcmd = @sql

    RETURN 0 

END



GO
GRANT EXECUTE
    ON OBJECT::[dbo].[MB_GET_MergeQuery] TO [Metodo98]
    AS [dbo];

