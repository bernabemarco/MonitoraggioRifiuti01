

CREATE FUNCTION [dbo].[FunValorePremioFF](@ESERCIZIO DECIMAL(5,0),
                                           @CODCONTO nVARCHAR(7),
                                            @CODARTICOLO nVARCHAR(50),
                                             @TIPODOC nVARCHAR(7))
RETURNS TABLE 
AS
RETURN 
(
    
    SELECT
        UMCONV.TIPODOC,
        (CALC.QTAGEST * UMCONV.FATTORE) AS A,
        CALC.QTAGEST AS B,
        CALC.Valore,
        CALC.Budget,
        ISNULL(CALC.Valore / (CALC.QTAGEST * UMCONV.FATTORE),0) as ValoreConsuntivato,
        ISNULL(CALC.Budget / (CALC.QTAGEST * UMCONV.FATTORE),0) as ValoreBudget
    FROM
        (
        SELECT
            @CODARTICOLO AS CODART,
            PD.CODICE AS TIPODOC,
            AFC.FATTORE
        FROM 
            PARAMETRIDOC PD,
            TP_EXTRAPARDOC TPD,
            ARTICOLIUMPREFERITE UMDOC,
            ARTICOLIUMPREFERITE UMART,
            ARTICOLIFATTORICONVERSIONE AFC
        WHERE
            ((PD.CODICE = @TIPODOC OR @TIPODOC = '')) AND
            PD.FLAGDOCDO = 1 AND
            PD.CLIFOR = 'F' AND
            TPD.CODICE = PD.CODICE AND
            UMDOC.CODART = @CODARTICOLO AND UMDOC.TIPOUM = PD.TIPOUMPREZZO AND
            UMART.CODART = @CODARTICOLO AND UMART.TIPOUM = 1 AND
            AFC.CODART = @CODARTICOLO AND AFC.UM1 = UMART.UM AND AFC.UM2 = UMDOC.UM
        ) UMCONV
    LEFT JOIN (
                SELECT
                    RD.CODART,
                    SUM(CAST(RB.Contratti.value('if (sum(/contratti/rc/attribute::valore) = 0) then 0 else sum(/contratti/rc/attribute::valore)','float') as decimal(19,6))) As Valore,
                    SUM(CAST(RB.Contratti.value('if (sum(/contratti/rc/attribute::budget) = 0) then 0 else sum(/contratti/rc/attribute::budget)','float') as decimal(19,6))) As Budget,
                    SUM(RD.QTA1MAG) AS QTAGEST
                FROM
                    TESTE_CONTRATTI TC,
                    RIGHEDOCUMENTI_BUDGET RB,
                    RIGHEDOCUMENTI RD
                WHERE
                    TC.ESERCIZIO = @ESERCIZIO AND
                    TC.CODICE = @CODCONTO AND
                    RB.Contratti.value('(/contratti/rc/@progressivo)[1]','decimal(10,0)') = TC.PROGRESSIVO AND
                    RD.IDTESTA = RB.IDTESTA AND RD.IDRIGA = RB.IDRIGA AND
                    RD.CODART = @CODARTICOLO 
                GROUP BY
                    RD.CODART
                ) CALC
    ON
        CALC.CODART = UMCONV.CODART

)



GO
GRANT SELECT
    ON OBJECT::[dbo].[FunValorePremioFF] TO [Metodo98]
    AS [dbo];

