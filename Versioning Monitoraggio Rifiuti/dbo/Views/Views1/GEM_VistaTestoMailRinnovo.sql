

Create view dbo.GEM_VistaTestoMailRinnovo
as
select 
	m.idcontratto,
	m.progressivo,
	m.idriga,
	v.codconto, v.DscConto1,
	t.datascadenza,
	t.dataefficacia,
	t.durata,
	v.statoaltro, 
	t.idmodfatt,
	isnull(mf.descrizione,'') as MFdescrizione,
	t.idtipofatt,
	isnull(tf.descrizione,'') as TFdescrizione,
	t.codcategoriacontratto,
	isnull(cc.dsccategoria,'') as dsccategoria,
	isnull(ri.dscReferente,'') as dscReferente,
	isnull(ri.Note,'') as NoteReferente,
	t.RINNOVOAUT,
	t.CondizioniParticolariCollegate,
	t.CollegatoAdAltriContratti

from GEM_MailRinnovoContratto m inner join vistaclienti v on m.codclifor = v.codconto 
	inner join dbo.GEM_TESTACONTRATTO t on m.idcontratto=t.idcontratto	
	left outer join dbo.GEM_Vista_ModalitaFatturazione mf on t.idmodfatt = mf.idmodfatt
	left outer join dbo.GEM_Vista_TipologieFatturazione tf on t.idtipofatt = tf.idtipofatt
	left outer join dbo.GEM_Vista_CategoriaContratto cc on t.codcategoriacontratto = cc.codcategoriacontratto
	left outer join dbo.GEM_Vista_ReferenteInternoGestione ri on t.codreferenteinternoGestione = ri.codreferenteinternoGestione



GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_VistaTestoMailRinnovo] TO [Metodo98]
    AS [dbo];

