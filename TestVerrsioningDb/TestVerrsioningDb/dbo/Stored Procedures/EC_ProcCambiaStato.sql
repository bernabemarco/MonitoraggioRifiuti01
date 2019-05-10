

CREATE PROCEDURE [dbo].[EC_ProcCambiaStato](@IdSessione Decimal(5,0),
                                             @flgNuovoStato smallint = 0) 

AS
    /*Aggiorno il flag su TesteContabilita*/
    Update TESTECONTABILITA
    SET TESTECONTABILITA.FLGMOVRICONCILIATOEC = @flgNuovoStato
    FROM TESTECONTABILITA
    INNER JOIN
    (
        select 
            * 
        from 
            ec_cambiostato_tmp 
        where 
                IdSessione = @IdSessione 
            And SelRiconc = 1
    ) AGG
    ON
        AGG.RifProgressivoPN = TESTECONTABILITA.PROGRESSIVO;

    IF @flgNuovoStato = 0
        Begin
            /*
             Se il nuovo Stato � 'Da riconciliare (0)'
             allora cancello i record dalle tabelle dell'EstrattoConto e
             dalla tabella Link EstrattoConti<==>PrimaNota
            */
            DELETE EC_EstrattoConto FROM EC_EstrattoConto
            INNER JOIN
            (
                SELECT
                    EMP.RifProgressivoEC
                FROM
                    EC_CambioStato_Tmp ECST
                INNER JOIN
                    EC_MovimentiEcPn EMP
                ON
                    EMP.Progressivo = ECST.Progressivo
                WHERE
                    ECST.IdSessione = @IdSessione
                    And ECST.SelRiconc = 1
            ) DEL
            ON
                EC_EstrattoConto.Progressivo = DEL.RifProgressivoEC;

            DELETE EC_MovimentiEcPn FROM EC_MovimentiEcPn
            INNER JOIN EC_CambioStato_Tmp
            ON EC_MovimentiEcPn.Progressivo = EC_CambioStato_Tmp.Progressivo
            WHERE
                    EC_CambioStato_Tmp.IdSessione = @IdSessione
                    And EC_CambioStato_Tmp.SelRiconc = 1;
        End


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[EC_ProcCambiaStato] TO [Metodo98]
    AS [dbo];

