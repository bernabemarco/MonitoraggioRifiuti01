
-- EXEC _FEGetScadenze '495'; EXEC _FEGetScadenze '577'
CREATE PROCEDURE _FEGetScadenze  (@Chiave1 as varchar(100)) AS
		
		  SELECT 
			td.progressivo    as ProgressivoScad,
			CondizioniPag as CondizioniPagamento, 
			ALD_CodPagamentoSDI as TtpiFattPaTipo,
			--DATADEC as DataDecorrenzaPagamento, -- commentato perche mancano i giorni
			DataScadenza as DataScadenza,
			ImportoSCVAL as ImportoRataVal,
			ImponibSCVAL as ImportoRataValNoIVA,
			DSCBanca as AisfDAisf,
			Codiceiban as KCAISDIBANBI,
			abi as AisfDABI,
			cab as AisfDCAB,
			codicebic as aisfDBIC
		 FROM VISTASCADENZEPA  VS INNER JOIN TIPIEFFETTI TF ON TF.Effetto =Vs.TipoEffetto 
			 inner join testedocumenti TD
			  on td.ESERCIZIO = VS.ESERCIZIO and td.tipodoc=VS.tipodoc and td.numerodoc=VS.numdoc and td.bis = VS.bis
		 WHERE 
			 td.progressivo  = @Chiave1
		 
