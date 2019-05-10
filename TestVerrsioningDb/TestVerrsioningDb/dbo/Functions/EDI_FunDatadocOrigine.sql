

CREATE FUNCTION [dbo].[EDI_FunDatadocOrigine] 
(
    @Idtesta decimal(10,0) ,
    @Idriga int
)
RETURNS datetime
AS
BEGIN
    -- Declare the return variable here
    declare @DATARIFDOC Datetime

    Select @DATARIFDOC = DATARIFDOC from TESTEDOCUMENTI WHERE progressivo =
    (SELECT dbo.FUNSGetDUMP_IDTESTARP_RigheDocumenti(@IDTESTA,@IDRIGA,0,0))
    -- Add the SELECT statement with parameter references here
    -- Return the result of the function
    RETURN @DATARIFDOC

END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[EDI_FunDatadocOrigine] TO [Metodo98]
    AS [dbo];

