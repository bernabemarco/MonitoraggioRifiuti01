
CREATE PROCEDURE CGesConfrontoAnalisiIndividualeRighe_INSERT(@Progressivo Decimal(10), @ProgrNumero INT, @CodConto VarChar(20), @Descrizione VarChar(80), @ImportoRif Decimal(19,6), @PercentualeRif Decimal(7,2), @ImportoC1 Decimal(19,6), @PercentualeC1 Decimal(7,2), @ImportoDiffC1 Decimal(19,6), @PercentualeDiffC1 Decimal(7,2), @PercentualeDifPC1 Decimal(7,2), @ImportoC2 Decimal(19,6), @PercentualeC2 Decimal(7,2), @ImportoDiffC2 Decimal(19,6), @PercentualeDiffC2 Decimal(7,2), @PercentualeDifPC2 Decimal(7,2), @ImportoC3 Decimal(19,6), @PercentualeC3 Decimal(7,2), @ImportoDiffC3 Decimal(19,6), @PercentualeDiffC3 Decimal(7,2), @PercentualeDifPC3 Decimal(7,2), @Grassetto Smallint, @Colore Smallint, @TabulazioneStampa Smallint, @StampaImporto Smallint, @Utente VarChar(25), @ColoreSeNegativo Smallint, @Gruppo Varchar(80), @OrdineGruppo Integer, @VoceGruppo Varchar(10)) AS

BEGIN
    
    INSERT INTO CGesConfrontoAnalisiIndividualeRighe ( RifProgressivo, Numero, ContoVoce, Descrizione, ImportoRif, PercentualeRif, ImportoC1, PercentualeC1, ImportoDiffC1, PercentualeDiffC1, PercentualeDifPC1, ImportoC2, PercentualeC2, ImportoDiffC2, PercentualeDiffC2, PercentualeDifPC2, ImportoC3, PercentualeC3, ImportoDiffC3, PercentualeDiffC3, PercentualeDifPC3, Grassetto, Colore, TabulazioneStampa, StampaImporto, UtenteModifica, DataModifica, ColoreSeNegativo, Gruppo, OrdineGruppo, VoceGruppo ) 
    VALUES ( @Progressivo, @ProgrNumero, @CodConto, @Descrizione, @ImportoRif, @PercentualeRif, @ImportoC1, @PercentualeC1, @ImportoDiffC1, @PercentualeDiffC1, @PercentualeDifPC1, @ImportoC2, @PercentualeC2, @ImportoDiffC2, @PercentualeDiffC2, @PercentualeDifPC2, @ImportoC3, @PercentualeC3, @ImportoDiffC3, @PercentualeDiffC3, @PercentualeDifPC3, @Grassetto, @Colore, @TabulazioneStampa, @StampaImporto, @Utente, GETDATE(), @ColoreSeNegativo, @Gruppo, @OrdineGruppo, @VoceGruppo )
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[CGesConfrontoAnalisiIndividualeRighe_INSERT] TO [Metodo98]
    AS [dbo];

