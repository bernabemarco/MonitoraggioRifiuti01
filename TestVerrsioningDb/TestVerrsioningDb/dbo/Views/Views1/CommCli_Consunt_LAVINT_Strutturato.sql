

CREATE VIEW CommCli_Consunt_LAVINT_Strutturato as
SELECT 
        VB.RIFCOMMCLI,
        VB.TIPOASSEGNAZIONE,
        IsNull(VB.CODNODO_DEST,   'TT') CODNODO_DEST,         
        IsNull(VB.CODLIVELLO_DEST,'TT') CODLIVELLO_DEST,
        IsNull(VB.TIPONODO,1) as TIPONODO_DEST,
        VB.LIVPADRE_DEST,
        IsNull(VB.PERCRIPARTIZIONE,100) AS PRC_DEST,
        IsNull(VB.nrrigastrutt_dest,1) AS nrrigastrutt_dest,
        IsNull(VB.nrrigastruttpadre_dest,1) AS nrrigastruttpadre_dest,
        VB.DESCRIZIONE as DESCRIZIONE_DEST,
        (VR.COSTOTOTALE*IsNull(VB.PERCRIPARTIZIONE,100)/100) COSTOTOTRIP,
        (VR.COSTOTOTALEeuro*IsNull(VB.PERCRIPARTIZIONE,100)/100) COSTOTOTRIPeuro,
        VR.*
FROM 
        CCBilancioConsLavINT VR  
        LEFT OUTER JOIN VistaAssegnazioniConsComm VB ON (VR.IDCOMMPROD = VB.IDTESTA) AND 
                                                        (VR.IDORDPROD = VB.IDRIGA) AND 
                                                        (VR.ORIGINEEVENTO = VB.ORIGINEEVENTO) AND 
                                                        (VR.idcommcli = VB.idcommcli)
WHERE
        VR.TIPOREC in ('P1','P2') 

GO
GRANT SELECT
    ON OBJECT::[dbo].[CommCli_Consunt_LAVINT_Strutturato] TO [Metodo98]
    AS [dbo];

