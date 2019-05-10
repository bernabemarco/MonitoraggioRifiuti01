
create view [dbo].[GEM_Vista_SezioniGiriVisite]
as
SELECT     VSC.IDCONTRATTO, VSC.SEZIONECONTRATTO, 
                      CASE WHEN CODDEST = 0 THEN exc.CodSettoreGiriVisite ELSE DDV.CodSettoreGiriVisite END AS CodGiroVisita, 
                      CASE WHEN CODDEST = 0 THEN TGiriVCli.Descrizione ELSE TGiriVDDV.Descrizione END AS DscGiroVisita, VSC.CODDEST, EXC.CodSettoreGiriVisite, 
                      DDV.CodSettoreGiriVisite AS CodGiroVDDV, TGiriVDDV.Descrizione AS DscGiroVDDV, TGiriVCli.Descrizione AS DscGiroVCli
FROM         GEM_VistaContratti AS VSC LEFT OUTER JOIN
                      DESTINAZIONIDIVERSE AS DDV LEFT OUTER JOIN
                      ALD_TabSettoriGiriVisite AS TGiriVDDV ON DDV.CodSettoreGiriVisite = TGiriVDDV.Codice ON VSC.CODCLIENTE = DDV.CODCONTO AND 
                      VSC.CODDEST = DDV.CODICE LEFT OUTER JOIN
                      EXTRACLIENTI AS EXC LEFT OUTER JOIN
                      ALD_TabSettoriGiriVisite AS TGiriVCli ON EXC.CodSettoreGiriVisite = TGiriVCli.Codice ON VSC.CODCLIENTE = EXC.CODCONTO
GROUP BY VSC.IDCONTRATTO, VSC.SEZIONECONTRATTO, VSC.CODDEST, EXC.CodSettoreGiriVisite, DDV.CodSettoreGiriVisite, TGiriVDDV.Descrizione, 
                      TGiriVCli.Descrizione

GO
GRANT SELECT
    ON OBJECT::[dbo].[GEM_Vista_SezioniGiriVisite] TO [Metodo98]
    AS [dbo];

