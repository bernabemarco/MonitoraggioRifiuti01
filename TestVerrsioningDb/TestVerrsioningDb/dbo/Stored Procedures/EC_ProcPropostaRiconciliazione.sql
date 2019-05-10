

CREATE PROCEDURE [dbo].[EC_ProcPropostaRiconciliazione](@IdSessione Decimal(5,0),
                                                         @flgImporto smallint = 0,
                                                          @flgCausale smallint = 0,
                                                           @varImporto decimal(18,6) = 0) 
AS
    
    UPDATE EC_EstrattoConto_Tmp
    SET 
        EC_EstrattoConto_Tmp.RifLink = '[' + CAST(RPN.PN As Varchar(7)) + ']'
    FROM EC_EstrattoConto_Tmp
    INNER JOIN
    (
        Select
            IDSessione,
            PN,
            EC,
            CodBanca,
            CodFlusso,
            CliForGen
        From
        (
            select 
                Row_Number() Over(Partition by PN.IDSessione,EC.Progressivo,EC.CodBanca,Ec.CodFlusso Order By PN.IDSessione,EC.DataOpBanca) [1],
                Row_Number() Over(Partition by PN.IDSessione,PN.Progressivo Order By PN.IDSessione,EC.DataOpBanca) [2],
                PN.IDSessione,
                PN.Progressivo As PN,
                EC.Progressivo As EC,
                EC.CodBanca,
                EC.CodFlusso,
                EC.CliForGen
            from 
                EC_TabMovimentiPN_Tmp PN
            INNER JOIN
                EC_EstrattoConto_Tmp EC
            ON
                    PN.IDSessione = @IdSessione
                And PN.IDSessione = EC.IDSessione 
                --And PN.Progressivo = EC.Progressivo 
                --And   PN.ABI = EC.ABIBanca 
                And PN.CodBanca = EC.CodBanca 
                --And PN.CliForGen = EC.CliForGen
                --And   PN.ContoCorrente = EC.ContoCorrente
                And PN.Segno = EC.Segno 
                And PN.Stato = EC.Stato And
                (
                 (EC.Importo = PN.Importo And @flgImporto = 0 ) or 
                 (EC.Importo between (PN.Importo - @varImporto) and (PN.Importo + @varImporto) and @flgImporto = 1)
                ) AND 
                (
                 (EC.CausaleABI = PN.CodCausAbiEC and @flgCausale = 1) OR (@flgCausale = 0)
                )
            Where
                    PN.Stato = 0 And PN.RifRiga <> 0
        ) RR
        Where
            RR.[1] = RR.[2]
    ) RPN
    ON
            EC_EstrattoConto_Tmp.IDSessione = RPN.IDSessione
        And EC_EstrattoConto_Tmp.Progressivo = RPN.EC
        And EC_EstrattoConto_Tmp.CodBanca = RPN.CodBanca
        And EC_EstrattoConto_Tmp.CodFlusso = RPN.CodFlusso
        --And EC_EstrattoConto_Tmp.CliForGen = RPN.CliForGen
    WHERE
        EC_EstrattoConto_Tmp.IsNew = 1


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[EC_ProcPropostaRiconciliazione] TO [Metodo98]
    AS [dbo];

