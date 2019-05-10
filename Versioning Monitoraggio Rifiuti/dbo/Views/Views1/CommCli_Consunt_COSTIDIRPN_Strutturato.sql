

CREATE VIEW CommCli_Consunt_COSTIDIRPN_Strutturato as
SELECT 
        VB.RIFCOMMCLI,
        VB.TIPOASSEGNAZIONE,
        IsNull(VB.CODNODO_DEST,   'TT') CODNODO_DEST,         
        IsNull(VB.CODLIVELLO_DEST,'TT') CODLIVELLO_DEST,
        IsNull(VB.TIPONODO,1) as TIPONODO_DEST,
        VB.LIVPADRE as LIVPADRE_DEST,
        IsNull(VB.PERCRIPARTIZIONE,100) AS PRC_DEST,
        IsNull(VB.nrrigastrutt_dest,1) AS nrrigastrutt_dest,
        IsNull(VB.nrrigastruttpadre_dest,1) AS nrrigastruttpadre_dest,
        VB.DESCRIZIONE as DESCRIZIONE_DEST,
        (VR.IMPORTO*IsNull(VB.PERCRIPARTIZIONE,100)/100) COSTOTOTRIP,
        (VR.IMPORTOeuro*IsNull(VB.PERCRIPARTIZIONE,100)/100) COSTOTOTRIPeuro,
        VR.*
FROM 
        CCBilancioConsCostiDirPN VR  
        LEFT OUTER JOIN VistaAssegnazioniConsComm VB ON (VR.NRREG = VB.IDTESTA) AND 
                                                        (VR.NRRIGAPN = VB.IDRIGA) AND 
                                                        (VR.ORIGINEEVENTO = VB.ORIGINEEVENTO) AND 
                                                        (VR.idcommcli = VB.idcommcli)

GO
GRANT SELECT
    ON OBJECT::[dbo].[CommCli_Consunt_COSTIDIRPN_Strutturato] TO [Metodo98]
    AS [dbo];

