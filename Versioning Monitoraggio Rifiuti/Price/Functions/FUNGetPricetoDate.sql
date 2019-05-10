CREATE FUNCTION [Price].[FUNGetPricetoDate]
(
    @Codart varchar(50),
    @Date datetime,
    @List decimal(5,0),
    @UM varchar(3)
)
RETURNS TABLE AS RETURN
(
    Select PREZZO, PREZZOEURO
    FROM (SELECT Top 1  ISNULL(PREZZO,0) PREZZO, ISNULL(PREZZOEURO,0) PREZZOEURO
    FROM  TP_LISTINIART              
    WHERE  CODART = @Codart
        And NRLISTINO = @List
        And UM = @UM
        And DATAVAL <=  @Date
        And Aggiornato= 0
        And ISNULL(TP_Sconti,'') =''
    Order By             DATAVAL DESC                 
    UNION ALL
    SELECT 0 AS PREZZO, 0 AS PREZZOEURO
    WHERE NOT EXISTS (SELECT 1
    FROM TP_LISTINIART 
    WHERE  CODART = @Codart
        And NRLISTINO = @List
        And UM = @UM
        And DATAVAL <=  @Date
        And Aggiornato= 0
        And ISNULL(TP_Sconti,'') =''
        )
    ) REST
            

)
