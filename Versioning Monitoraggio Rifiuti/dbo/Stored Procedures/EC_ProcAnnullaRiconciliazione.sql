

CREATE PROCEDURE [dbo].[EC_ProcAnnullaRiconciliazione](@RifMovimento decimal(18,0) = 0) 
AS

DECLARE @RifPN decimal(18,0) = 0
DECLARE @RifEC decimal(18,0) = 0
    
    select @RifEC = RifProgressivoEC, @RifPN = RifProgressivoPN from EC_MovimentiEcPn where progressivo = @RifMovimento;

    IF (@RifEC <> 0) AND (@RifPN <> 0)
        BEGIN
            /*Aggiorno il flag su testecontabilita*/
            UPDATE TESTECONTABILITA SET FLGMOVRICONCILIATOEC = 0 WHERE PROGRESSIVO = @RifPN;

            /*Elimino il record su Ec_EstrattoConto*/
            DELETE FROM EC_EstrattoConto WHERE Progressivo = @RifEC;

            /*Elimino il record su EC_MovimentiEcPn (Tabella di associazione)*/
            DELETE FROM EC_MovimentiEcPn WHERE Progressivo = @RifMovimento and RifProgressivoEC = @RifEC And RifProgressivoPN = @RifPN;
        END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[EC_ProcAnnullaRiconciliazione] TO [Metodo98]
    AS [dbo];

