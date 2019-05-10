

CREATE PROCEDURE [dbo].[MB_SET_Righe_Pivot]

AS


DECLARE @return_value int,
        @Sqlcmd varchar(max)

BEGIN TRY

    --BEGIN TRAN
    -- Elimino tabella ------------------------------------------------------------------------------------------------------------------
         DELETE FROM mb_righe_Pivot 
         --FROM mb_righe_Pivot INNER JOIN   dbo.TESTEDOCUMENTI  TD ON  TD.progressivo  = mb_righe_Pivot.idtestadoc
        --   WHERE YEAR(Td.datadoc) =YEAR(GETDATE()) 


         EXEC   @return_value = [dbo].[MB_GET_MergeQuery]
                @TableName = 'MB_Righe_Pivot',
                @Sqlcmd = @Sqlcmd OUTPUT

        PRINT 'Exec Cmd'


        EXEC(@Sqlcmd)

    --COMMIT TRAN
END TRY
BEGIN CATCH
    ROLLBACK
END CATCH




GO
GRANT EXECUTE
    ON OBJECT::[dbo].[MB_SET_Righe_Pivot] TO [Metodo98]
    AS [dbo];

