
CREATE FUNCTION [dbo].[IE_ExpFun_ComposerJoin](@RifProgressivo decimal(18,0) = 0)

RETURNS VARCHAR(MAX)
AS
BEGIN

    -- Declare the return variable here
    DECLARE @Result varchar(MAX) = '';

    --Relation
    With TableList(RifProgressivo,SourceT,SourceF,DestinationT,DestinationF,LinkT,Position)
    AS
    (
        Select distinct
            T1.RifProgressivo,
            T1.SourceTable As SourceT,
            T1.SourceField As SourceF,
            T1.DestinationTable As DestinationT,
            T1.DestinationField As DestinationF,
            T1.LinkType As LinkT,
            0 As Position
        From 
            IE_ExpProfileTablesLink T1
        inner join
            IE_ExpProfileTables ST
        on
            ST.RifProgressivo = T1.RifProgressivo And
            ST.TableCaption = T1.SourceTable
        inner join
            Sys.Objects SO
        on
            SO.name = ST.TableName and SO.[type] in('V','U')
        inner join
            IE_ExpProfileTables DT
        on
            DT.RifProgressivo = T1.RifProgressivo And
            DT.TableCaption = T1.DestinationTable
        inner join
            Sys.Objects DO
        on
            DO.name = DT.TableName and DO.[type] in('V','U')
        Where
            T1.RifProgressivo = @RifProgressivo And
            T1.SourceTable Not In(Select Distinct DestinationTable From IE_ExpProfileTablesLink S1 Where S1.RifProgressivo = T1.RifProgressivo) 
        UNION ALL
        Select 
            T2.RifProgressivo,
            T2.SourceTable As SourceT,
            T2.SourceField As SourceF,
            T2.DestinationTable As DestinationT,
            T2.DestinationField As DestinationF,
            T2.LinkType As LinkT,
            (TableList.Position + 1) As Position
        From 
            IE_ExpProfileTablesLink T2
        inner join
            IE_ExpProfileTables ST
        on
            ST.RifProgressivo = T2.RifProgressivo And
            ST.TableCaption = T2.SourceTable
        inner join
            Sys.Objects SO
        on
            SO.name = ST.TableName and SO.[type] in('V','U')
        inner join
            IE_ExpProfileTables DT
        on
            DT.RifProgressivo = T2.RifProgressivo And
            DT.TableCaption = T2.DestinationTable
        inner join
            Sys.Objects DO
        on
            DO.name = DT.TableName and DO.[type] in('V','U')
        Inner join 
            TableList
        ON
            T2.RifProgressivo = TableList.RifProgressivo And
            T2.SourceTable = TableList.DestinationT
    )
    Select 
        @Result = @Result + (
                            CASE LinkO
                                WHEN 1 THEN
                                    (
                                    CASE TL.LinkT
                                        WHEN 0 THEN CHAR(13) + CHAR(10) + ' INNER JOIN ' + TD.TableName + ' AS ' + TL.DestinationT + CHAR(13) + CHAR(10) + ' ON ' 
                                        WHEN 1 THEN CHAR(13) + CHAR(10) + ' LEFT JOIN ' + TD.TableName + ' AS ' + TL.DestinationT + CHAR(13) + CHAR(10) + ' ON ' 
                                        WHEN 2 THEN CHAR(13) + CHAR(10) + ' RIGHT JOIN ' + TD.TableName + ' AS ' + TL.DestinationT + CHAR(13) + CHAR(10) + ' ON ' 
                                    ELSE CHAR(13) + CHAR(10) + ' INNER JOIN '
                                    END
                                    )
                                ELSE
                                    ' AND '
                            END
                            ) + TL.DestinationT + '.' + TL.DestinationF + ' = ' + TL.SourceT + '.' + TL.SourceF + ' '
    from 
        ( 
        Select 
            RifProgressivo, 
            SourceT,
            SourceF,
            DestinationT,
            DestinationF,
            LinkT,
            ROW_NUMBER() OVER(Partition By DestinationT Order By Position) As LinkO,
			Min(Position) over(partition by destinationt) as position_m,
            Position 
        from 
            TableList
        ) TL
    inner join
        IE_ExpProfileTables TD
    on
        TD.RifProgressivo = TL.RifProgressivo And
        TD.TableCaption = TL.DestinationT
    inner join
        Sys.Objects o
    on
        o.name = TD.TableName and o.[type] in('V','U')
     Order by 
        position_m, Progressivo, LinkO;

    /*Equivale al print*/
    --select @Result as [processing-instruction(x)] FOR XML PATH;

    -- Return the result of the function
    RETURN @Result

END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[IE_ExpFun_ComposerJoin] TO [Metodo98]
    AS [dbo];

