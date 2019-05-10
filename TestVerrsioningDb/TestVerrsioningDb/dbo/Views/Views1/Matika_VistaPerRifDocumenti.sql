create view Matika_VistaPerRifDocumenti as
SELECT
    RIGHEDOCUMENTI.IDTESTA, RIGHEDOCUMENTI.DESCRIZIONEART
FROM
    RIGHEDOCUMENTI RIGHEDOCUMENTI
WHERE
    RIGHEDOCUMENTI.TipoRiga='R' and  RIGHEDOCUMENTI.TipoDoc='boc' and RIGHEDOCUMENTI.DESCRIZIONEART>='Vs%'

GO
GRANT DELETE
    ON OBJECT::[dbo].[Matika_VistaPerRifDocumenti] TO [Metodo98]
    AS [dbo];


GO
GRANT INSERT
    ON OBJECT::[dbo].[Matika_VistaPerRifDocumenti] TO [Metodo98]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[Matika_VistaPerRifDocumenti] TO [Metodo98]
    AS [dbo];


GO
GRANT UPDATE
    ON OBJECT::[dbo].[Matika_VistaPerRifDocumenti] TO [Metodo98]
    AS [dbo];

