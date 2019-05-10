
CREATE PROCEDURE [dbo].[GEM_INT_TO_MET_CAMBIO_TECNICO] (@AZRIF as varchar(3),
	   					        @IDRAPPORTO as varchar(14),
							@Progressivo as decimal(10,0)) 
AS
BEGIN
		-- aggiorno il campo 
		UPDATE MET
		SET MET.TECNICO_PREV = INS.TECNICO_PREV
		   ,MET.AZ_TEC_EFF = INS.AZ_TEC_EFF
           ,MET.STATO = INS.STATO
		--,MET.AZIENDADIRIFERIMENTO = INS.AZIENDADIRIFERIMENTO
		FROM GEM_SEZIONECONTRATTORAPPORTI MET
		INNER JOIN GemmaSync.dbo.GEM_SEZIONECONTRATTORAPPORTI INS ON MET.IDRAPPORTO = INS.IDRAPPORTO COLLATE Latin1_General_CI_AS
                                                                 and INS.AZRIF = @AZRIF
                                                                 and INS.Progressivo = @Progressivo
		WHERE MET.IDRAPPORTO = @IDRAPPORTO 

		UPDATE GemmaSync.dbo.GEM_SEZIONECONTRATTORAPPORTI	
		SET CAMBIO_TECNICO = NULL
		WHERE IDRAPPORTO = @IDRAPPORTO
          and AZRIF = @AZRIF
          and Progressivo = @Progressivo
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[GEM_INT_TO_MET_CAMBIO_TECNICO] TO [Metodo98]
    AS [dbo];

