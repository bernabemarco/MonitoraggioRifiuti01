
CREATE FUNCTION [dbo].[EC_FunCheckContoConsistency](@IdSessione as Decimal(5,0), @RifProgressivo decimal(18,0) = 0)

RETURNS smallint
AS
BEGIN

    -- Declare the return variable here
    DECLARE @Result smallint = -1;

    select @Result = case when left((case when len(ccr.conto) = 1 then ccr.conto else coalesce(acf.tipoconto,acf.codconto,ag.codconto) end),1) = left(ect.CliForGen,1) or
							   left((case when len(ccr.conto) = 1 then ccr.conto else coalesce(acf.tipoconto,acf.codconto,ag.codconto) end),1) = '?'
						  then 0 else 1
					 end
	from
		causalicontabili cc 
	inner join
		causalicontabilirighe  ccr
	on
		ccr.codicecausale = cc.codicecausale
	inner join
		EC_EstrattoConto_Tmp ect
	on 
		ect.CausaleABI = cc.codcausabiec
	left join
		anagraficacf acf
	on
		acf.codconto = ccr.conto
	left join
		anagraficagenerici ag
	on
		ag.codconto = ccr.conto
	where 
		ccr.progrighe = 1 
		and ect.Progressivo = @RifProgressivo and ect.IDSessione = @IdSessione;
    
    /*Equivale al print*/
    --select @Result as [processing-instruction(x)] FOR XML PATH;

    -- Return the result of the function
    RETURN @Result

END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[EC_FunCheckContoConsistency] TO [Metodo98]
    AS [dbo];

