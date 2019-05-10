
CREATE Function[Price].[FUNSpecialCommission4Item]  (
    @Progr decimal(10,0),
    @NRiga smallint
    )
RETURNS TABLE
--ENCRY-- 
AS
RETURN 
        SELECT PT.CODAGENTE
               , PT.CODCLIENTE
                ,CODARTICOLO
                ,ISNULL(PR.PROVVIGIONE,'') as Provvigione
                ,ISNULL(NCampagna,'') AS NCampagna
                ,ISNULL(NPromozione,'') AS NPromozione
                ,[DASCONTO]
                ,[DAIMPORTO]
                ,[DAIMPORTOEURO]
                ,[UM]
                ,[DAQTA]
                ,[DAFATTURATO]
                ,[DAFATTURATOEURO]
                FROM dbo.TABPROVVIGIONI PT
                    INNER JOIN dbo.RIGHEPROVVIGIONI  PR
                ON PR.RIFPROGRESSIVO =  PT.PROGRESSIVO
                WHERE PT.PROGRESSIVO = @Progr AND PR.NRRIGA = @NRiga

