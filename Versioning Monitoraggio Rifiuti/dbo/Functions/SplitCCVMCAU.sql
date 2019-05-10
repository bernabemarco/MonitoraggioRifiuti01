

CREATE FUNCTION dbo.SplitCCVMCAU (@Parameter NVARCHAR(500))
RETURNS @Results TABLE (Items Int)
AS
    BEGIN
    DECLARE @CAU1 NVARCHAR(60)
    DECLARE @CAU2 NVARCHAR(60)
    DECLARE @CAU3 NVARCHAR(60)
    DECLARE @Delimiter NCHAR(1)
    DECLARE @INDEX INT
    DECLARE @SLICE NVARCHAR(500)
    DECLARE @String NVARCHAR(185)
    --Prelevo i Documenti
    IF @Parameter='VEN' 
        BEGIN
            SELECT  @CAU1=CAUSMAGCCVMVEN1,@CAU2=CAUSMAGCCVMVEN2,@CAU3=CAUSMAGCCVMVEN3 FROM TP_VINCOLIPIANIFICATORE WHERE PROGRESSIVO=1
        END
    
    IF @Parameter='CAR' 
        BEGIN
            SELECT  @CAU1=CAUSMAGCCVMACQ4,@CAU2=CAUSMAGCCVMACQ5,@CAU3=CAUSMAGCCVMACQ6 FROM TP_VINCOLIPIANIFICATORE WHERE PROGRESSIVO=1
        END
    IF ((@CAU1 IS NULL)) 
        BEGIN
            SET @CAU1 = ''
        END
    IF ((@CAU2 IS NULL)) 
        BEGIN
            SET @CAU2 = ''
        END
    IF ((@CAU3 IS NULL)) 
        BEGIN
            SET @CAU3 = ''
        END
    
    INSERT INTO @Results
    Select Item From dbo.SplitStrings_CTE(@CAU1,',')
    union
    Select Item From dbo.SplitStrings_CTE(@CAU2,',')
    union
    Select Item From dbo.SplitStrings_CTE(@CAU3,',')
    
    RETURN
END

GO
GRANT SELECT
    ON OBJECT::[dbo].[SplitCCVMCAU] TO [Metodo98]
    AS [dbo];

