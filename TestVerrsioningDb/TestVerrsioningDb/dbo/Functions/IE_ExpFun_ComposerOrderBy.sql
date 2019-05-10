
CREATE FUNCTION [dbo].[IE_ExpFun_ComposerOrderBy](@RifProgressivo decimal(18,0) = 0)

RETURNS VARCHAR(MAX)
AS
BEGIN
    -- Declare the return variable here
    DECLARE @Result varchar(MAX) = NULL;

    --Order by
	Select
		@Result = COALESCE(@Result + ',', ' ORDER BY ') + CHAR(13) + CHAR(10) + T.FieldName 
	From
	(
		SELECT 
			--@Result = COALESCE(@Result + ',', ' ORDER BY ') + CHAR(13) + CHAR(10) + O.FieldName 
			 row_number() over(Partition by O.FieldName Order By S.Sorting) as FieldCount
			,S.Sorting
			,O.FieldName
		FROM   
			IE_ExpProfileFieldsMap O
		INNER JOIN
			(
				select
					row_number() over(Partition by RifProgressivo Order By (Len(XmlNodePath) - LEN(REPLACE(XmlNodePath,'\', '')))) Sorting,
					Progressivo,
					RifProgressivo
				from 
					IE_ExpProfileFieldsMap 
				where
					RifProgressivo = @RifProgressivo And IsKey = 1 And IsFixed = 0
			) S
		ON
			S.RifProgressivo = O.RifProgressivo And
			S.Progressivo = O.Progressivo
		where 
			O.RifProgressivo = @RifProgressivo And O.FieldName IS NOT NULL And O.IsKey = 1
	) T /*Livello aggiunto il 16.10.2018 per eliminare i duplicati*/
	Where
		T.FieldCount = 1
    Order By
        T.Sorting;

    /*Equivale al print*/
    --select @Result as [processing-instruction(x)] FOR XML PATH;

    -- Return the result of the function
    RETURN ISNULL(@Result,'');

END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[IE_ExpFun_ComposerOrderBy] TO [Metodo98]
    AS [dbo];

