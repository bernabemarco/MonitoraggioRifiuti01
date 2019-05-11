﻿CREATE VIEW VISTACLIENTIAGENTI AS
        SELECT AC.CODCONTO, AC.DSCCONTO1, AC.DSCCONTO2,
        RC.ESERCIZIO, RC.CODAGENTE1, RC.CODAGENTE2, RC.CODAGENTE3
        FROM ANAGRAFICACF AC, ANAGRAFICARISERVATICF RC
        WHERE AC.CODCONTO = RC.CODCONTO AND  AC.TIPOCONTO = 'C'

GO
GRANT SELECT
    ON OBJECT::[dbo].[VISTACLIENTIAGENTI] TO [Metodo98]
    AS [dbo];
