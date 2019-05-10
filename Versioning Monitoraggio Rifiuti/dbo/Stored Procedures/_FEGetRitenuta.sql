



CREATE PROCEDURE [dbo].[_FEGetRitenuta]      (@Chiave1 as varchar(100)) AS

--SELECT '' AS TtriTipologia 
       -- , 0.00 AS RRIRCrIRitSogQImpValLoc  -- importo ritenuta
	   -- , 0.00  AS TcriPAliRit -- aliquota ritenuta
	   -- , ''  AS TtriCausalePag770 -- causale pagamento 770s
declare @tipoProf as int

select 	@tipoProf= AC.Condominio FROM 
			 VISTAFATTUREELETTRONICHE VFE
			inner join EXTRACLIENTI AC on VFE.CODCLIFOR = AC.CODCONTO
	WHERE progressivo = @Chiave1  

IF @tipoProf = 0 
	BEGIN
		SELECT '' AS TtriTipologia 
	END
ELSE
	BEGIN
	SELECT  DISTINCT (CASE WHEN XC.Condominio = 0 THEN '' ELSE TipoRitenuta END) AS TtriTipologia 
			,(CASE WHEN XC.Condominio = 0 THEN 0.0 ELSE  TotRitAccCondominio END) AS RRIRCrIRitSogQImpValLoc  -- importo ritenuta
			,(CASE WHEN XC.Condominio = 0 THEN 0.0 ELSE pRitCondominio END) AS TcriPAliRit -- aliquota ritenuta
			,(CASE WHEN XC.Condominio = 0 THEN '' ELSE (CASE WHEN CausalePagamentoPA='' THEN 'Z' ELSE CausalePagamentoPA END) END)  AS TtriCausalePag770 -- causale pagamento 770s
		FROM VISTAFATTUREELETTRONICHE VFE inner join 
			EXTRACLIENTI XC  on  VFE.CODCLIFOR = XC.CODCONTO
			inner join AnagraficaCF AC on Ac. CODCONTO = VFE.CODCLIFOR
			inner join EXTRATESTEDOC XTD on XTD.IDTESTA = VFE.PROGRESSIVO 
			inner join EXTRAPARDOC XPD on XPD.CODICE = VFE.TIPODOC
		WHERE progressivo = @Chiave1
	END



