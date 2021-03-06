﻿
CREATE PROCEDURE [dbo].[BRIO_CALCOLAPREZZOMPARTICOLI_2] AS
 -----------------------------------------------------------------------------------
 -- ELIMINO TUTTI I VALORI PRECEDENTEMENTE SALVATI
 -----------------------------------------------------------------------------------
begin tran	    
	DELETE FROM BRIO_PREZZIARTICOLIMP
commit tran	
 -----------------------------------------------------------------------------------
 -- GENERO 12 MESI PER OGNI ESERCIZIO.. PER OGNI ARTICOLI IN STORICO MAG
 -----------------------------------------------------------------------------------
begin tran	    
	INSERT INTO BRIO_PREZZIARTICOLIMP(CODART,ANNO,MESE,QTATOT,IMPORTOTOTEURO,QTASCAR,IMPSCAR,QTAMESEP,IMPORTOMESEP)
    (SELECT DISTINCT SM.CODART,ES.CODICE,NR.NUMERO,0,0,0,0,0,0
    FROM STORICOMAG AS SM, TABESERCIZI ES, NUMERI NR
    WHERE NR.NUMERO<13)
commit tran	
 -----------------------------------------------------------------------------------
 -- SCRIVO QTA E VALORE CARICHI PER ANNO MESE ARTICOLO
 -----------------------------------------------------------------------------------
begin tran	   		
	UPDATE BRIO_PREZZIARTICOLIMP
		SET BRIO_PREZZIARTICOLIMP.QTATOT=BRIO_VISTACARICHIANNOMESE.QTA,
			BRIO_PREZZIARTICOLIMP.IMPORTOTOTEURO=BRIO_VISTACARICHIANNOMESE.IMPORTOEURO
		FROM BRIO_PREZZIARTICOLIMP INNER JOIN BRIO_VISTACARICHIANNOMESE ON
		BRIO_PREZZIARTICOLIMP.CODART=BRIO_VISTACARICHIANNOMESE.CODART AND
		BRIO_PREZZIARTICOLIMP.ANNO=BRIO_VISTACARICHIANNOMESE.ANNO AND
		BRIO_PREZZIARTICOLIMP.MESE=BRIO_VISTACARICHIANNOMESE.MESE
commit tran	
 -----------------------------------------------------------------------------------
 -- CALCOLO E SCRIVO QTA PROGRESSIVA E VALORE PROGRESSIVO CARICHI PER ANNO MESE ARTICOLO
 -----------------------------------------------------------------------------------
begin tran	
		UPDATE BRIO_PREZZIARTICOLIMP 
		SET BRIO_PREZZIARTICOLIMP.QTAMESEP=(SELECT SUM(BPPR.QTATOT) FROM BRIO_PREZZIARTICOLIMP BPPR WHERE BPPR.ANNO=BRIO_PREZZIARTICOLIMP.ANNO AND BPPR.CODART=BRIO_PREZZIARTICOLIMP.CODART AND BPPR.MESE <=BRIO_PREZZIARTICOLIMP.MESE)
commit tran	
begin tran	
		UPDATE BRIO_PREZZIARTICOLIMP 
		SET BRIO_PREZZIARTICOLIMP.IMPORTOMESEP=(SELECT SUM(BPPR.IMPORTOTOTEURO) FROM BRIO_PREZZIARTICOLIMP BPPR WHERE BPPR.ANNO=BRIO_PREZZIARTICOLIMP.ANNO AND BPPR.CODART=BRIO_PREZZIARTICOLIMP.CODART AND BPPR.MESE <=BRIO_PREZZIARTICOLIMP.MESE)
commit tran	

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[BRIO_CALCOLAPREZZOMPARTICOLI_2] TO [Metodo98]
    AS [dbo];

