
Create View [dbo].[EC_ViewPrimaNota]
AS
    select
          eet.IDSessione
         ,eet.Progressivo
         ,Row_Number() Over(Partition By eet.idsessione Order By eet.Progressivo) As NrRiga
         ,eet.NrAssegno as Descrizione
         ,eet.CodBanca
         ,ab.DscBanca
         ,eet.CliForGen As CodConto
         ,eet.CodFlusso
         ,(Case when cc.CODICECAUSALE is null then ep.CodCausaleDef else cc.CODICECAUSALE end) As CodCausale
         ,eet.CausaleABI As CodCausaleABI
         ,(Case ep.GestioneDataReg when 1 then eet.DataOpBanca else Getdate() end) As DataRegistrazione
         ,eet.DataValuta
         ,eet.DataOpBanca
         ,(case when esc.RifProgressivoEC Is Null Then (Case when eet.Segno = 0 then 1 else 0 end) Else ts.SCADATTPASS end) As Segno
         ,(case when esc.RifProgressivoEC Is Null Then eet.Importo Else esc.Importo end) Importo
         ,(case when esc.RifProgressivoEC Is Null Then eet.Importo Else esc.ImportoEuro end) ImportoEuro
         ,(case when esc.RifProgressivoEC Is Null Then 0 Else 1 end) IsScadenza
         ,ts.CODCAMBIO As CodCambio
         ,ts.DATAFATTURA As DataRif
         ,ts.DATASCADENZA As DataScadenza
         ,ts.ESITO As ListaEsiti
         ,ts.PROGRESSIVO As ListaProgressivi
         ,ts.NUMEROPROT As NrProt
         ,ts.NUMRIF As NumRif
         ,ts.NUMRIFPARTCONT As NumRifPart
         ,ts.VALCAMBIO As ValCambio
    from
        EC_EstrattoConto_Tmp eet
    left join
        ANAGRAFICABANCHE ab
    on
        ab.CODBANCA = eet.CodBanca
    left join
        CAUSALICONTABILI cc
    on
        cc.CODCAUSABIEC = eet.CausaleABI
    left join
        EC_TabScadenze_Tmp esc
    on
            esc.idsessione = eet.IDSessione
        and esc.RifProgressivoEC = eet.Progressivo
    left join
        tabscadenze ts
    on
        esc.RifProgressivoSC = ts.PROGRESSIVO
    cross join
        EC_Parametri as ep
    where
        eet.SelRiconc = 1 and eet.Stato = 0 and (ts.NRREGESITO Is Null or ts.NRREGESITO = 0)
    Union
    select Distinct
          eet.IDSessione
         ,0 As Progressivo
         ,0 As NrRiga
         ,(Case when cc.CODICECAUSALE is null then ccd.DESCRIZIONE else cc.DESCRIZIONE end) as Descrizione
         ,eet.CodBanca
         ,ab.DscBanca
         ,(Case when ab.CODCONTORIF is null then ep.CodContoDef else ab.CODCONTORIF end) As CodConto
         ,eet.CodFlusso
         ,(Case when cc.CODICECAUSALE is null then ep.CodCausaleDef else cc.CODICECAUSALE end) As CodCausale
         ,eet.CausaleABI As CodCausaleABI
         ,(Case ep.GestioneDataReg when 1 then Min(eet.DataOpBanca) over(partition by eet.IdSessione) else Getdate() end) As DataRegistrazione
         ,GetDate() As DataValuta
         ,GetDate() As DataOpBanca
         ,(case when (SUM((case when esc.RifProgressivoEC Is Null Then eet.Importo Else esc.Importo end) * (case when (case when esc.RifProgressivoEC Is Null Then eet.segno Else (Case When ts.SCADATTPASS = 0 then 1 else 0 end) end) = 0 then -1 else 1 end)) OVER(Partition BY eet.CodBanca,eet.IdSessione)) <= 0 then 0 else 1 end) as Segno
         ,ABS(SUM((case when esc.RifProgressivoEC Is Null Then eet.Importo Else esc.Importo end) * (case when (case when esc.RifProgressivoEC Is Null Then eet.segno Else ts.SCADATTPASS end) = 0 then -1 else 1 end)) OVER(Partition BY eet.CodBanca,eet.IdSessione)) As Importo
         ,ABS(SUM((case when esc.RifProgressivoEC Is Null Then eet.Importo Else esc.ImportoEuro end) * (case when (case when esc.RifProgressivoEC Is Null Then eet.segno Else ts.SCADATTPASS end) = 0 then -1 else 1 end)) OVER(Partition BY eet.CodBanca,eet.IdSessione)) As ImportoEuro
         ,0 IsScadenza
         ,0 As CodCambio
         ,GetDate() As DataRif
         ,GetDate() As DataScadenza
         ,0 As ListaEsiti
         ,0 As ListaProgressivi
         ,'' As NrProt
         ,'' As NumRif
         ,'' As NumRifPart
         ,0 As ValCambio
    from
        EC_EstrattoConto_Tmp eet
    left join
        ANAGRAFICABANCHE ab
    on
        ab.CODBANCA = eet.CodBanca
    left join
        CAUSALICONTABILI cc
    on
        cc.CODCAUSABIEC = eet.CausaleABI
    cross join
        EC_Parametri as ep
    left join
        CAUSALICONTABILI ccd
    on
        ccd.CODICECAUSALE = ep.CodCausaleDef
    left join
        EC_TabScadenze_Tmp esc
    on
            esc.idsessione = eet.IDSessione
        and esc.RifProgressivoEC = eet.Progressivo
    left join
        tabscadenze ts
    on
        esc.RifProgressivoSC = ts.PROGRESSIVO
    where
        eet.SelRiconc = 1 and eet.Stato = 0 and (ts.NRREGESITO Is Null or ts.NRREGESITO = 0)


GO
GRANT SELECT
    ON OBJECT::[dbo].[EC_ViewPrimaNota] TO [Metodo98]
    AS [dbo];

