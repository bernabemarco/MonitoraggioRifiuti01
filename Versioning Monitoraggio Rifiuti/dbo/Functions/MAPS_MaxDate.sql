
CREATE FUNCTION dbo.MAPS_MaxDate(
    @val1   DATETIME
    ,@val2  DATETIME
)
RETURNS DATETIME
AS
BEGIN
  IF @val1 > @val2
    RETURN @val1

  RETURN isnull(@val2,@val1)

END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[MAPS_MaxDate] TO [Metodo98]
    AS [dbo];

