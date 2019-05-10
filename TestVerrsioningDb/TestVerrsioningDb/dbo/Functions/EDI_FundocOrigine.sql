

CREATE FUNCTION [dbo].[EDI_FundocOrigine] 
(
    @Idtesta decimal(10,0) ,
    @Idriga int
)
RETURNS varchar(15)
AS
BEGIN
    -- Declare the return variable here
    declare @NUMRIFDOC VARCHAR(15)

    Select @NUMRIFDOC = NUMRIFDOC from TESTEDOCUMENTI WHERE progressivo =
    (SELECT dbo.FUNSGetDUMP_IDTESTARP_RigheDocumenti(@IDTESTA,@IDRIGA,0,0))
    -- Add the SELECT statement with parameter references here
    -- Return the result of the function
    RETURN @NUMRIFDOC

END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[EDI_FundocOrigine] TO [Metodo98]
    AS [dbo];

