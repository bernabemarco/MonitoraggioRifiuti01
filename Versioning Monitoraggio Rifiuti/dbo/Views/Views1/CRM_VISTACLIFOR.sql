
CREATE VIEW [dbo].[CRM_VISTACLIFOR] AS
        SELECT 
						(SELECT     TOP (1) IdSocieta
                            FROM          dbo.ALD_TabDittaDatiAggiuntivi) AS IdSocieta,
		AF.TIPOCONTO, 
		 (SELECT     TOP (1) IdSocieta
                            FROM          dbo.ALD_TabDittaDatiAggiuntivi)+AF.CODCONTO as CODCONTO,
		AF.CODCONTO AS CODCONTOMETODO,
		AF.DSCCONTO1, 
		AF.DSCCONTO2, 
		AF.CODMASTRO, 
        AF.INDIRIZZO, 
		AF.CAP, 
		AF.LOCALITA, 
		AF.PROVINCIA, 
		AF.TELEFONO, 
		AF.FAX, 
		AF.TELEX, 
        AF.CODFISCALE, 
		AF.PARTITAIVA, 
		(SELECT DESCRIZIONE FROM TABNAZIONI WHERE CODICE = AF.CODNAZIONE) AS CODNAZIONE,
		AF.CODICEISO, 
		AF.CODLINGUA, 
		AF.NOTE, 
        AF.UTENTEMODIFICA, 
		AF.DATAMODIFICA, 
		AF.CODREGIONE, 
		AF.FLGBLACKLIST,
		RF.ESERCIZIO, 
		 (SELECT     TOP (1) IdSocieta
                       FROM          ALD_TabDittaDatiAggiuntivi)+ CAST(RF.CODSETTORE AS varchar(15)) as CODSETTORE,
		--RF.CODSETTORE,
        AF.FLGPERSFISICA,
		AF.DATANASCITAPERSFIS,
		AF.COMNASCITAPERSFIS,
		AF.PROVNASCITAPERSFIS,
		AF.COGNOMEPERSFIS,
		AF.NOMEPERSFIS,
		AF.SESSOPERSFIS,
        AF.CODSTATOESTERO,
		AF.STATOPROVCONTEA,
		AF.INDIRIZZOESTERO,
		AF.CODDEST_EDI,
        AF.TIPOPROFESSIONISTA,
		AF.TIPODOCRTACC,
		AF.FLGELENCOCF,
		AF.FLGSISTRI,
		AF.FLGQUALITY,
        AF.LUOGONASCITA, 
		AF.VERSPRESSO, 
		AF.INDIRIZZOINTERNET, 
		AF.CODFISCALERITACC, 
		AF.PARTITAIVARITACC, 
		AF.CAPRITACC, 
		AF.PROVINCIARITACC, 
        AF.LOCALITARITACC, 
		AF.INDIRIZZORITACC, 
		AF.ZONASPED, 
		AF.DATANASCITA, 
		AF.TIPOCLIENTEBUDGET, 
		AF.CONSIDERABUDGET, 
		AF.PERCORSODOCUMENTI,
		AF.FLGDOGANA,
		AF.CODDESTINATARIOPA,
		AF.RIFAMMINISTRAZIONEPA,

		 (SELECT     TOP (1) IdSocieta
                       FROM          ALD_TabDittaDatiAggiuntivi)+ CAST(RF.CODZONA AS varchar(15)) as CODZONA,
        --RF.CODZONA, 
				 (SELECT     TOP (1) IdSocieta
                       FROM          ALD_TabDittaDatiAggiuntivi)+ CAST(RF.CODCATEGORIA AS varchar(15)) as CODCATEGORIA,
		--RF.CODCATEGORIA, 
		--RF.CODSPED, 
		(SELECT     TOP (1) IdSocieta
                       FROM          ALD_TabDittaDatiAggiuntivi)+ CAST(RF.CODSPED AS varchar(15)) as CODSPED,
		RF.PRCTRASPORTO, 
		RF.INOLTROTRASP, 
					   (SELECT     TOP (1) IdSocieta 
                       FROM          ALD_TabDittaDatiAggiuntivi) + CODPAG as CODPAG,
        RF.MESEESCL1, 
		RF.GGESCL1, 
		RF.MESEESCL2, 
		RF.GGESCL2,
        (SELECT BANCAAPPOGGIO FROM BANCAAPPCF 		
		WHERE CODCONTO=RF.CODCONTO AND CODICE=BANCAANAGR) AS DscBANCAAPPOGGIO,
        (SELECT CAB FROM BANCAAPPCF WHERE CODCONTO=RF.CODCONTO AND CODICE=BANCAANAGR) AS CAB, 
        (SELECT ABI FROM BANCAAPPCF WHERE CODCONTO=RF.CODCONTO AND CODICE=BANCAANAGR) AS ABI, 
		(SELECT CODICEIBAN FROM BANCAAPPCF WHERE CODCONTO=RF.CODCONTO AND CODICE=BANCAANAGR) AS CODICEIBAN, 
        (SELECT CONTOCORRENTE FROM BANCAAPPCF WHERE CODCONTO=RF.CODCONTO AND CODICE=BANCAANAGR) AS CCDEBITORE, 
        RF.CODBANCA, 
        RF.BANCAANAGR, 
							     (SELECT     TOP (1) IdSocieta
                       FROM          ALD_TabDittaDatiAggiuntivi)+ RF.CODAGENTE1 as CODAGENTE1,	 
			      RF.CODAGENTE2 + '' +(select DSCAGENTE from ANAGRAFICAAGENTI AA where AA.CODAGENTE=RF.CODAGENTE2) as CODAGENTE2,
					   			    RF.CODAGENTE3 + '' +(select DSCAGENTE from ANAGRAFICAAGENTI AA where AA.CODAGENTE=RF.CODAGENTE3) as CODAGENTE3,
		RF.PROVV1, 
		RF.PROVV2, 
        RF.PROVV3, 
		RF.SCONTO1, 
		(SELECT     TOP (1) IdSocieta
                       FROM          ALD_TabDittaDatiAggiuntivi)+ CAST(RF.CODIVA AS varchar(15)) as CODIVA,		
		--RF.CODIVA, 
		RF.DICHESIVA, 
		(SELECT     TOP (1) IdSocieta
                       FROM          ALD_TabDittaDatiAggiuntivi)+ CAST(RF.LISTINO AS varchar(15)) as LISTINO,		
		
		--RF.LISTINO, 
		RF.CODCAMBIO, 
        RF.DESTDIVMERCI, 
		RF.DESTDIVDOCUMENTI, 
		RF.SPESEDOCUM, 
		RF.SPESEEFFETTO, 
        RF.SPESETRASPORTO, 
		RF.SPESEIMBALLO, RF.FIDO, 
		RF.FIDOEURO, 
		(SELECT     TOP (1) IdSocieta
                       FROM          ALD_TabDittaDatiAggiuntivi)+ CAST(RF.PORTO AS varchar(15)) as PORTO,		
		
		--RF.PORTO, 
				(SELECT     TOP (1) IdSocieta
                       FROM          ALD_TabDittaDatiAggiuntivi)+ CAST(RF.TRASPACURA AS varchar(15)) as TRASPACURA,		

        --RF.TRASPACURA,
		RF.APPLSCONTORIGA, 
		RF.APPLSCONTOFINALE, 
		(case when RF.CODCONTOFATT=RF.CODCONTO then '' else ((SELECT     TOP (1) IdSocieta
                            FROM          dbo.ALD_TabDittaDatiAggiuntivi)+RF.CODCONTOFATT) end
							) as CODCONTOFATT, 
        RF.FATTFINEMESE, 
		RF.NONRAGGRUPPDOC, 
		RF.CODDEPOSITO, 
        RF.CODDEPOSITOCOLL, 
		RF.CODDEPCOMP, 
		RF.CODDEPCOMPCOLL, 
		RF.RIVIVAOMAGGI, 
        RF.NRCONTROPCONT, 
		RF.USAPRZPRVPART, 
		RF.CODDEBITORE, 
		RF.NOTE1,
        RF.STATOCONTABILITA, 
		RF.STATOMAGAZZINO,
		RF.STATOORDINI, 
		RF.STATOBOLLE, 
		RF.STATOFATTURE, 
		RF.STATONOTEACCREDITO, 
		RF.STATOALTRO,
        RF.CODGRUPPOPREZZIPART, 
		RF.CODGRUPPOPROVPART,
		RF.RAGGSCADENZE,
        RF.EXPORTECOMMERCE, 
		RF.USAPRZCOMMERCIALI,
				(SELECT     TOP (1) IdSocieta
                       FROM          ALD_TabDittaDatiAggiuntivi)+ CAST(exc.ClassCID AS varchar(15)) as ClassCID,
		--exc.ClassCID ,
		exc.CodSap ,
		exc.RefSegrCons ,
		(SELECT DESCRIZIONE FROM TABRESPONSABILI 
		WHERE codice=exc.RefSegrCons) AS DscRefSegrCons, 
		exc.RefSegrMedicina,
		(SELECT DESCRIZIONE FROM TABRESPONSABILI 
		WHERE codice=exc.RefSegrMedicina) AS DscRefSegrMedicina, 
		exc.CodClienteNew,
		RF.DATAINIZIOCALCOLOFIDO,
		exc.Condominio,
 (SELECT     TOP (1) IdSocieta
                       FROM          ALD_TabDittaDatiAggiuntivi)+ CAST(exc.IdTrust AS varchar(15)) as IdTrust,
		tt.Descrizione as DscIdTrust,
		 (SELECT     TOP (1) IdSocieta
                       FROM          ALD_TabDittaDatiAggiuntivi)+ CAST(exc.idTipologiaCli AS varchar(15)) as idTipologiaCli, 

		4 as ava_stato, --3 in portafoglio da qualificare; 4 in portafoglio qualificato
		2 as ava_tipocliente
		, (SELECT     ava_Tipologia 
                       FROM          ALD_TAB_TipoCliente TpC where TpC.codice=exc.idtipocli) as ava_Tipologia
		, exc.IdAmministratore
		, (select Nominativo from ald_tblAmministratoriCondomini TAmm where TAmm.IdAmmnistratore = exc.IdAmministratore) as DscAmministratore
FROM
        ANAGRAFICACF AF, ANAGRAFICARISERVATICF RF, TABUTENTI, EXTRACLIENTI EXC,ALD_TabTrust TT
WHERE (AF.CODCONTO = RF.CODCONTO) AND (USERDB = CAST(USER_NAME() AS VARCHAR(25))) 
       AND RF.ESERCIZIO = ESERCIZIOATTIVO AND AF.TIPOCONTO IN('C')
       AND ((AF.CODCONTO=TABUTENTI.CODCLIFOR) OR (TABUTENTI.CODCLIFOR=''))
	  -- and  exc.CodSap  is not null and exc.CodSap <>'' 
	   and
	   (AF.CODCONTO = EXC.CODCONTO)  and (TT.IdTrust = exc.IdTrust)
	   and TT.ExportCrm=1

GO
GRANT DELETE
    ON OBJECT::[dbo].[CRM_VISTACLIFOR] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[CRM_VISTACLIFOR] TO [Metodo98]
    AS [dbo];


GO
GRANT REFERENCES
    ON OBJECT::[dbo].[CRM_VISTACLIFOR] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[CRM_VISTACLIFOR] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[CRM_VISTACLIFOR] TO [Metodo98]
    AS [dbo];

