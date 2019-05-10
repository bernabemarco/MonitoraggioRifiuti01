

CREATE PROCEDURE [dbo].[CONTRATTI_CLEARCONSUNTIVCONDIZ] 
    @PROGRESSIVOCONTRATTO DECIMAL(10,0),
    @DATA                 Varchar(8),
    @RES                  int out,
    @ERRORNR              int out,
    @ERRORMS              Varchar(2048) out,
    @ERRORLINE            int out,
    @WHERE                Varchar(8000) 
AS
BEGIN

    DECLARE @FINOADATA  as date

    set @RES = 1;

    set @FINOADATA = convert(varchar(8), @DATA ,112)

    Begin Try
        
        if ( (@PROGRESSIVOCONTRATTO > 0) And (@WHERE = '') )
        
            Begin

                Update      RCON 
                Set         RCON.PREMIOMATURATO                     =   0,
                            RCON.CONSUNTIVATOQTA                    =   0,
                            RCON.CONSUNTIVATOVALORE                 =   0,
                            RCON.CONSUNTIVATOQTASTORICO             =   0,
                            RCON.CONSUNTIVATOVALORESTORICO          =   0,
                            RCON.PREMIONONVALIDO                    =   0
                From        ContrattiRange_CON RCON
                Inner Join  CONTRATTI_CON CON
                On          CON.PROGRESSIVO                         =   RCON.RIFPROGRESSIVO 
                Inner Join  TESTE_CONTRATTI T
                On          T.PROGRESSIVO                           =   CON.RIFCONTRATTO 
                Where       T.PROGRESSIVO                           =   @PROGRESSIVOCONTRATTO
                And         CON.DADATA                              >=  @FINOADATA
                And         RCON.ESCLUSOLOGICAMENTE                 =   0

            End
            
        Else

            Begin

                DECLARE @COMANDO    AS VARCHAR(8000) 

                Set @COMANDO = ' Update         RCON                                                                ' + CHAR(13) +
                               ' Set            RCON.PREMIOMATURATO                                 =   0,          ' + CHAR(13) +
                               '                RCON.CONSUNTIVATOQTA                                =   0,          ' + CHAR(13) +
                               '                RCON.CONSUNTIVATOVALORE                             =   0,          ' + CHAR(13) +
                               '                RCON.CONSUNTIVATOQTASTORICO                         =   0,          ' + CHAR(13) +
                               '                RCON.CONSUNTIVATOVALORESTORICO                      =   0,          ' + CHAR(13) +
                               '                RCON.PREMIONONVALIDO                                =   0           ' + CHAR(13) +
                               ' From           ContrattiRange_CON RCON                                             ' + CHAR(13) +
                               ' Inner Join     CONTRATTI_CON CON                                                   ' + CHAR(13) +
                               ' On             CON.PROGRESSIVO                         =   RCON.RIFPROGRESSIVO     ' + CHAR(13) +
                               ' Inner Join     VISTA_TESTE_CONTRATTI  VISTA_TESTE_CONTRATTI                        ' + CHAR(13) +
                               ' On             VISTA_TESTE_CONTRATTI.PROGRESSIVO       =   CON.RIFCONTRATTO        ' + CHAR(13) +
                               ' Where          CON.DADATA                              >=            ''' + @DATA + '''' + CHAR(13) +
                               ' And                                                                                ' + 
                               @WHERE

                Execute(@COMANDO)           

            End

    End Try

    Begin Catch

        set @RES        = 0
        set @ERRORNR    = ERROR_NUMBER()
        set @ERRORMS    = ERROR_MESSAGE()
        set @ERRORLINE  = ERROR_LINE()

    End Catch
    
END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[CONTRATTI_CLEARCONSUNTIVCONDIZ] TO [Metodo98]
    AS [dbo];

