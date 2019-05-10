


CREATE PROCEDURE _FEGetProgressivo  (@Chiave1 as varchar(100), @Progressivo int OUTPUT) AS
	
				BEGIN 
				DECLARE @PPROG decimal(10,0)
				exec dbo.NUOVOPROGRESSIVO 'FATTUREB2B',1,@PPROG OUTPUT
				select @Progressivo = @PPROG
				END
						 
