
CREATE PROCEDURE CGesBilancioRighe_INSERT(@Progressivo Decimal(10), @ProgrNumero INT, @CodConto VarChar(20), @Descrizione VarChar(80), @Importo Decimal(19,6), @Percentuale Decimal(7,2), @Grassetto Smallint, @Colore Smallint, @TabulazioneStampa Smallint, @StampaImporto Smallint, @Utente VarChar(25), @Importo01 Decimal(19,6), @Importo02 Decimal(19,6), @Importo03 Decimal(19,6), @Importo04 Decimal(19,6), @Importo05 Decimal(19,6), @Importo06 Decimal(19,6), @Importo07 Decimal(19,6), @Importo08 Decimal(19,6), @Importo09 Decimal(19,6), @Importo10 Decimal(19,6), @Importo11 Decimal(19,6), @Importo12 Decimal(19,6), @ColoreSeNegativo Smallint, @Gruppo Varchar(80), @OrdineGruppo Integer, @VoceGruppo Varchar(10)) AS

BEGIN
    
    INSERT INTO CGesBilancioRighe ( RifProgressivo, Numero, ContoVoce, Descrizione, Importo, Percentuale, Grassetto, Colore, TabulazioneStampa, StampaImporto, Importo01, Importo02, Importo03, Importo04, Importo05, Importo06, Importo07, Importo08, Importo09, Importo10, Importo11, Importo12, UtenteModifica, DataModifica, ColoreSeNegativo, Gruppo, OrdineGruppo, VoceGruppo ) 
    VALUES ( @Progressivo, @ProgrNumero, @CodConto, @Descrizione, @Importo, @Percentuale, @Grassetto, @Colore, @TabulazioneStampa, @StampaImporto, @Importo01, @Importo02, @Importo03, @Importo04, @Importo05, @Importo06, @Importo07, @Importo08, @Importo09, @Importo10, @Importo11, @Importo12, @Utente, GETDATE(), @ColoreSeNegativo, @Gruppo, @OrdineGruppo, @VoceGruppo )
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[CGesBilancioRighe_INSERT] TO [Metodo98]
    AS [dbo];

