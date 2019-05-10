

CREATE PROCEDURE FRCConfrontoBilancioRigheCDC_INSERT(@Progressivo Decimal(10), @ProgrNumero INT, @CodConto VarChar(20), @Descrizione VarChar(80), @CodDestinazione VarChar(10), @ImportoRif Decimal(19,6), @PercentualeRif Decimal(19,6), @ImportoC1 Decimal(19,6), @PercentualeC1 Decimal(19,6), @ImportoDiffC1 Decimal(19,6), @PercentualeDiffC1 Decimal(19,6), @PercentualeDifPC1 Decimal(19,6), @ImportoC2 Decimal(19,6), @PercentualeC2 Decimal(19,6), @ImportoDiffC2 Decimal(19,6), @PercentualeDiffC2 Decimal(19,6), @PercentualeDifPC2 Decimal(19,6), @Grassetto Smallint, @Colore Smallint, @TabulazioneStampa Smallint, @StampaImporto Smallint, @Utente VarChar(25), @ColoreSeNegativo Smallint, @Gruppo Varchar(80), @OrdineGruppo Integer, @VoceGruppo Varchar(10)) AS

BEGIN
    
    INSERT INTO FRCConfrontoBilancioRigheCDC ( RifProgressivo, Numero, ContoVoce, Descrizione, CodDestinazione, ImportoRif, PercentualeRif, ImportoC1, PercentualeC1, ImportoDiffC1, PercentualeDiffC1, PercentualeDifPC1, ImportoC2, PercentualeC2, ImportoDiffC2, PercentualeDiffC2, PercentualeDifPC2, Grassetto, Colore, TabulazioneStampa, StampaImporto, UtenteModifica, DataModifica, ColoreSeNegativo, Gruppo, OrdineGruppo, VoceGruppo ) 
    VALUES ( @Progressivo, @ProgrNumero, @CodConto, @Descrizione, @CodDestinazione, @ImportoRif, @PercentualeRif, @ImportoC1, @PercentualeC1, @ImportoDiffC1, @PercentualeDiffC1, @PercentualeDifPC1, @ImportoC2, @PercentualeC2, @ImportoDiffC2, @PercentualeDiffC2, @PercentualeDifPC2, @Grassetto, @Colore, @TabulazioneStampa, @StampaImporto, @Utente, GETDATE(), @ColoreSeNegativo, @Gruppo, @OrdineGruppo, @VoceGruppo )
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[FRCConfrontoBilancioRigheCDC_INSERT] TO [Metodo98]
    AS [dbo];

