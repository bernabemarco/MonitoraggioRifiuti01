
CREATE PROCEDURE CGesAnalisiIndividualeRighe_INSERT(@Progressivo Decimal(10), @ProgrNumero INT, @CodConto VarChar(20), @Descrizione VarChar(80), @ImportoVariabile Decimal(19,6), @ImportoFisso Decimal(19,6), @ImportoTotale Decimal(19,6), @Percentuale Decimal(7,2), @Indice Decimal(19,6), @Grassetto Smallint, @Colore Smallint, @TabulazioneStampa Smallint, @StampaImporto Smallint, @Utente VarChar(25), @Importo01 Decimal(19,6), @Importo02 Decimal(19,6), @Importo03 Decimal(19,6), @Importo04 Decimal(19,6), @Importo05 Decimal(19,6), @Importo06 Decimal(19,6), @Importo07 Decimal(19,6), @Importo08 Decimal(19,6), @Importo09 Decimal(19,6), @Importo10 Decimal(19,6), @Importo11 Decimal(19,6), @Importo12 Decimal(19,6), @ColoreSeNegativo Smallint, @Gruppo Varchar(80), @OrdineGruppo Integer, @VoceGruppo Varchar(10)) AS

BEGIN
    
    INSERT INTO CGesAnalisiIndividualeRighe ( RifProgressivo, Numero, ContoVoce, Descrizione, ImportoVariabile, ImportoFisso, ImportoTotale, Percentuale, Indice, Grassetto, Colore, TabulazioneStampa, StampaImporto, Importo01, Importo02, Importo03, Importo04, Importo05, Importo06, Importo07, Importo08, Importo09, Importo10, Importo11, Importo12, UtenteModifica, DataModifica, ColoreSeNegativo, Gruppo, OrdineGruppo, VoceGruppo ) 
    VALUES ( @Progressivo, @ProgrNumero, @CodConto, @Descrizione, @ImportoVariabile, @ImportoFisso, @ImportoTotale, @Percentuale, @Indice, @Grassetto, @Colore, @TabulazioneStampa, @StampaImporto, @Importo01, @Importo02, @Importo03, @Importo04, @Importo05, @Importo06, @Importo07, @Importo08, @Importo09, @Importo10, @Importo11, @Importo12, @Utente, GETDATE(), @ColoreSeNegativo, @Gruppo, @OrdineGruppo, @VoceGruppo )
    
END;

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[CGesAnalisiIndividualeRighe_INSERT] TO [Metodo98]
    AS [dbo];

