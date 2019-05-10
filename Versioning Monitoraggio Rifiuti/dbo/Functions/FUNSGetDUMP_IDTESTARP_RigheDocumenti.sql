
-- =============================================
-- Author:          Pasquale De Biase
-- Create date: 23-07-2012
-- Description:     FindIdrif
-- =============================================
CREATE FUNCTION [dbo].[FUNSGetDUMP_IDTESTARP_RigheDocumenti] 
(
       -- Add the parameters for the function here
       @IdTesta Decimal(10,0),
       @IdRiga int,
       @NumsAscents Int,
       @BlockAscentsNULL int
)
RETURNS DECIMAL(10,0)
AS
BEGIN
       -- Declare the return variable here
       DECLARE @Result int
       DECLARE @Idrif As decimal(10,0)
       DECLARE @StartDump int
       SET @Idrif=@IdTesta
       SET @StartDump = 0
       IF @NumsAscents =0
             SET @NumsAscents = 9999
       
       IF @BlockAscentsNULL = 1
             BEGIN
                    WHILE @Idrif <> 0 AND  @StartDump <> @NumsAscents
                           BEGIN
                                  SET @StartDump = @StartDump +1
                                  (Select @Idrif=IDTESTARP, @IdRiga = IDRIGARP 
                                   from RIGHEDOCUMENTI 
                                   Where idtesta = @IdTesta AND IDRIGA = @idriga )
                                  IF @@ROWCOUNT =0 
                                        BEGIN
                                               SET  @Idrif =0
                                               SET @Idtesta = 0
                                        END
                                  IF @Idrif > 0 
                                        SET @Idtesta = @Idrif
                           END
             END
       ELSE
             BEGIN
                    WHILE @Idrif <> 0 AND  @StartDump <> @NumsAscents
                           BEGIN
                                  SET @StartDump = @StartDump +1
                                  (Select  @Idrif=IDTESTARP, @IdRiga = IDRIGARP 
                                   from RIGHEDOCUMENTI 
                                   Where idtesta = @IdTesta AND IDRIGA = @idriga )
                                  IF @Idrif > 0 
                                        SET @Idtesta = @Idrif
                           END
             END
       RETURN @Idtesta
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[FUNSGetDUMP_IDTESTARP_RigheDocumenti] TO [Metodo98]
    AS [dbo];

