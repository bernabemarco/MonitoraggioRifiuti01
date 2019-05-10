CREATE PROCEDURE [SetSecurity] (
		@ID int,
		@Data ntext
		) AS
		SELECT @ID = ID FROM [Security] WHERE ID = @ID
		IF @@ROWCOUNT = 0 
		BEGIN
			INSERT INTO [Security] (ID, Data) VALUES (@ID, @Data)
		END
		ELSE
		BEGIN
			UPDATE [Security] SET Data = @Data WHERE ID = @ID
		END
GO
GRANT EXECUTE
    ON OBJECT::[dbo].[SetSecurity] TO [Metodo98]
    AS [dbo];

