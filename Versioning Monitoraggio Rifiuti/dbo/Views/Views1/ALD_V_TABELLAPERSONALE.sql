


CREATE VIEW [dbo].[ALD_V_TABELLAPERSONALE]
AS


/******************************
Autore: Sara
Data: 24-4-2018
Usato da: SELEZIONE Ald_SEL_ReferenteCli
Commessa: Punto 140
Descrizione: 

Parametri: 
Modifiche (chi, quando, cosa):
*******************************/

select RifCodConto as CodConto, isnull(tp.codice,0) as codice, tp.rifcodconto,tp.cognome,tp.nome, 
tp.telefono, tp.email, cognome+' '+ Nome as Referente, isnull(codice,'0') + RifCodConto as CodUnivoco from  
 TABELLAPERSONALE TP 


GO
GRANT DELETE
    ON OBJECT::[dbo].[ALD_V_TABELLAPERSONALE] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[ALD_V_TABELLAPERSONALE] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[ALD_V_TABELLAPERSONALE] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_V_TABELLAPERSONALE] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[ALD_V_TABELLAPERSONALE] TO [Metodo98]
    AS [dbo];

