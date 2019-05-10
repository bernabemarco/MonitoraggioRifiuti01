

CREATE FUNCTION dbo.SplitCCVMDOC (@Parameter NVARCHAR(500))
RETURNS @Results TABLE (Items NVARCHAR(500))
AS
    BEGIN
    DECLARE @DOC1 NVARCHAR(60)
    DECLARE @DOC2 NVARCHAR(60)
    DECLARE @DOC3 NVARCHAR(60)
    DECLARE @Delimiter NCHAR(1)
    DECLARE @INDEX INT
    DECLARE @SLICE NVARCHAR(500)
    DECLARE @String NVARCHAR(185)
    --Prelevo i Documenti    
    IF @Parameter='VEN' 
        BEGIN
            SELECT  @DOC1=TIPICCVMVEN1,@DOC2=TIPICCVMVEN2,@DOC3=TIPICCVMVEN3 FROM TP_VINCOLIPIANIFICATORE WHERE PROGRESSIVO=1
        END
    
    IF @Parameter='CAR' 
        BEGIN
            SELECT  @DOC1=TIPICCVMACQ4,@DOC2=TIPICCVMACQ5,@DOC3=TIPICCVMACQ6 FROM TP_VINCOLIPIANIFICATORE WHERE PROGRESSIVO=1
        END
    IF ((@DOC1 IS NULL)) 
        BEGIN
            SET @DOC1 = ''
        END
    IF ((@DOC2 IS NULL)) 
        BEGIN
            SET @DOC2 = ''
        END
    IF ((@DOC3 IS NULL)) 
        BEGIN
            SET @DOC3 = ''
        END
    
    INSERT INTO @Results
    Select Item From dbo.SplitStrings_CTE(@DOC1,',')
    union
    Select Item From dbo.SplitStrings_CTE(@DOC2,',')
    union
    Select Item From dbo.SplitStrings_CTE(@DOC3,',')
    
    RETURN
END

GO
GRANT SELECT
    ON OBJECT::[dbo].[SplitCCVMDOC] TO [Metodo98]
    AS [dbo];

