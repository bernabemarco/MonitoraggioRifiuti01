
CREATE PROCEDURE _FEEndOk         (@Chiave1 as varchar(100),@ProgressivoInvio as int,@PathFile as varchar(500),@PathFileInvio as varchar(500),@UrlFileHTM as varchar(500) , @Buffer AS varchar(500)) AS
--select 1
update  EXTRATESTEDOC set [PROGRESSIVOINVIO] = @ProgressivoInvio where IDTESTA = @Chiave1

