


CREATE view [dbo].[ALD_VistaUnionAgentiTarget]
as 
SELECT     'Agente 1' AS posizione, Ditta, CodAgente AS CodAgente1, AnnoTarget, MeseTarget,  ImportoTarget, UtenteModfica, DataModifica, IdAsa, 
                      idOrFatt
FROM         ALD_TargetAsaAgenti
WHERE     (AnnoTarget IN
                          (SELECT     ESERCIZIOATTIVO
                            FROM          TABUTENTI
                            WHERE      (USERDB = CAST(USER_NAME() AS VARCHAR(25)))))
union all
SELECT     'Agente 2' as posizione
, Ditta, CodAgente2 AS CodAgente1, AnnoTarget, MeseTarget,  ImportoTarget, UtenteModfica, DataModifica,  IdAsa, 
                      idOrFatt
FROM         ALD_TargetAsaAgenti2
where AnnoTarget in (select ESERCIZIOATTIVO from TABUTENTI where USERDB = CAST(USER_NAME() AS VARCHAR(25)))
union all
SELECT     'Agente 3' as posizione
, Ditta, CodAgente3 AS CodAgente1, AnnoTarget, MeseTarget,  ImportoTarget, UtenteModfica, DataModifica,  IdAsa, 
                      idOrFatt
					  FROM         ALD_TargetAsaAgenti3
where AnnoTarget in (select ESERCIZIOATTIVO from TABUTENTI where USERDB = CAST(USER_NAME() AS VARCHAR(25)))



GO
GRANT SELECT
    ON OBJECT::[dbo].[ALD_VistaUnionAgentiTarget] TO [Metodo98]
    AS [dbo];

