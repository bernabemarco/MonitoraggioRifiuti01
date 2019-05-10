

CREATE PROCEDURE [dbo].[GEM_INT_TO_MET_GEM_SEZIONECONTRATTORAPPORTIMEZZI_Allegati] (@AZRIF as varchar(3),
                                                                                                                                                                                                                                                                                           @IDRAPPORTO as varchar(14),
                                                                                                                                                                                                                                                                                           @Progressivo as decimal(10,0) ) AS
BEGIN
             SET DATEFORMAT ymd 

             DECLARE @DATA_SYNC as datetime
             SET @DATA_SYNC = GetDate()

             -- inserisco in metodo i rapporti dei materiali non presenti
             INSERT INTO [GEM_SEZIONECONTRATTORAPPORTIMEZZI_Allegati]
                                  (      [IDCONTRATTO]
                                        ,[SEZIONECONTRATTO]
                                        ,[IDRapporto]
                                        ,[IdRigaMezzo]
                                        ,[IDRIGAAllegato]
                                        ,[UTENTEMODIFICA]
                                        ,[DATAMODIFICA] )
             SELECT INS.[IDCONTRATTO] COLLATE Latin1_General_CI_AS
                                        ,INS.[SEZIONECONTRATTO]
                                        ,INS.[IDRapporto] COLLATE Latin1_General_CI_AS
                                        ,INS.[IdRigaMezzo] 
                                        ,INS.[IDRIGAAllegato] 
                                        ,'Sincronizzazione'
                                        ,@DATA_SYNC                  
             FROM GemmaSync.dbo.[GEM_SEZIONECONTRATTORAPPORTIMEZZI_Allegati] INS   
             WHERE INS.IDRAPPORTO = @IDRAPPORTO AND INS.AZRIF = @AZRIF and INS.Progressivo = @Progressivo
             EXCEPT
             SELECT MET.[IDCONTRATTO]
                                        ,MET.[SEZIONECONTRATTO]
                                        ,MET.[IDRapporto]
                                        ,MET.[IdRigaMezzo]
                                        ,MET.[IDRIGAAllegato]
                                        ,'Sincronizzazione'
                                        ,@DATA_SYNC   
             FROM [GEM_SEZIONECONTRATTORAPPORTIMEZZI_Allegati] MET  
             WHERE MET.IDRAPPORTO = @IDRAPPORTO 

             UPDATE MET SET
                           MET.[DATAINSERIMENTO] = INS.[DATAINSERIMENTO],
                           MET.[REFERENTE] = INS.[REFERENTE],
                           MET.[OGGETTO] = INS.[OGGETTO],
                           MET.[ALLEGATO] = INS.[ALLEGATO],
                           MET.[PublicaGOnLine] = INS.[PublicaGOnLine],
                           MET.[DocValido] = INS.[DocValido],
                           MET.[DATAMODIFICA] = INS.[DATAMODIFICA],
                           MET.[UTENTEMODIFICA] = INS.[UTENTEMODIFICA]
                    FROM [GEM_SEZIONECONTRATTORAPPORTIMEZZI_Allegati] MET
                    INNER JOIN GemmaSync.dbo.[GEM_SEZIONECONTRATTORAPPORTIMEZZI_Allegati] INS ON        INS.IDCONTRATTO = MET.IDCONTRATTO COLLATE Latin1_General_CI_AS AND
                                                                                                                                                                                                                                                                                           INS.SEZIONECONTRATTO = MET.SEZIONECONTRATTO AND              
                                                                                                                                                                                                                                                                                           INS.IDRAPPORTO = MET.IDRAPPORTO COLLATE Latin1_General_CI_AS  AND
                                                                                                                                                                                                                                                                                           INS.[IdRigaMezzo]=MET.[IdRigaMezzo] AND                            
                                                                                                                                                                                                                                                                                           INS.[IDRIGAAllegato] = MET.[IDRIGAAllegato] 
                    WHERE MET.IDRAPPORTO = @IDRAPPORTO AND INS.AZRIF = @AZRIF and INS.Progressivo = @Progressivo

END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[GEM_INT_TO_MET_GEM_SEZIONECONTRATTORAPPORTIMEZZI_Allegati] TO [Metodo98]
    AS [dbo];

