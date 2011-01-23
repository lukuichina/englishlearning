CREATE TRIGGER CopyDeletedWord
ON Word
FOR DELETE,INSERT,UPDATE
AS
--Declare @JiaoHuo varchar(20)
BEGIN
	DECLARE
    @IsInsert bit,
    @IsUpdate bit,
    @IsDelete bit
    
 --   DECLARE
 --   @Word VARCHAR(20),
	--@ImportanceLevel INTEGER,
	--@DifficultyLevel INTEGER,
	--@CreateTime DATETIME,
	--@UpdateTime DATETIME
	
	--DECLARE test_cursor CURSOR FOR SELECT * FROM deleted;
	
    
	IF EXISTS(SELECT 1 FROM inserted) AND NOT EXISTS(SELECT 1 FROM deleted)
		SET @IsInsert = 1
	ELSE
		SET @IsInsert = 0
	 
	IF EXISTS(SELECT 1 FROM inserted) AND EXISTS(SELECT 1 FROM deleted)
		SET @IsUpdate = 1
	ELSE
		SET @IsUpdate = 0
	 
	IF NOT EXISTS(SELECT 1 FROM inserted) AND EXISTS(SELECT 1 FROM deleted)
		SET @IsDelete = 1
	ELSE
		SET @IsDelete = 0 
	 
	if (@IsUpdate=1)
	   PRINT 'updated '
	if (@IsInsert=1)
	   PRINT 'insert '
	if (@IsDelete=1)
	   PRINT 'delete '
	
	IF (@IsDelete = 1)
	BEGIN
		INSERT INTO WordHistory 
		SELECT 
		    Word,
			ImportanceLevel,
			DifficultyLevel,
			CreateTime,
			UpdateTime,
			GETDATE() AS DeleteTime
		FROM deleted
		
		--OPEN test_cursor 

		--FETCH NEXT FROM test_cursor INTO @Word, @ImportanceLevel, @DifficultyLevel, @CreateTime, @UpdateTime

		--WHILE @@FETCH_STATUS = 0 
		--BEGIN 
		--	--
		--	FETCH NEXT FROM test_cursor INTO @Word, @ImportanceLevel, @DifficultyLevel, @CreateTime, @UpdateTime
		--END

		--CLOSE test_cursor 

		--DEALLOCATE test_cursor  
	END
END