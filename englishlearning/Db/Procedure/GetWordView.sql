CREATE PROCEDURE GetWordView
(
	@SessionID varchar(38),
	@ViewType INTEGER = 1,
	@WordType INTEGER = 0,
	@Ret INTEGER = -1 OUTPUT
)
AS
	IF @WordType = 0
    BEGIN
		IF @ViewType = 1
			SELECT * FROM MainPictureWordView WHERE SessionID = @SessionID 
			ORDER BY Word ASC, WordTypeID ASC, ExplanationID ASC, PictureID ASC;
		ELSE IF @ViewType = 2
			SELECT * FROM NoMainPictureWordView WHERE SessionID = @SessionID
			ORDER BY Word ASC, WordTypeID ASC, ExplanationID ASC, PictureID ASC;
		ELSE IF @ViewType = 3
			SELECT * FROM NoExplanationWordView WHERE SessionID = @SessionID
			ORDER BY Word ASC, WordTypeID ASC, ExplanationID ASC, PictureID ASC;
		ELSE IF @ViewType = 0
			SELECT * FROM MainPictureWordView WHERE SessionID = @SessionID
			UNION
			SELECT * FROM NoMainPictureWordView WHERE SessionID = @SessionID
			UNION
			SELECT * FROM NoExplanationWordView WHERE SessionID = @SessionID
			ORDER BY Word ASC, WordTypeID ASC, ExplanationID ASC, PictureID ASC;
    END;
	ELSE IF @WordType IN (SELECT ID FROM WordType)
	BEGIN
		IF @ViewType = 1
			SELECT * FROM MainPictureWordView WHERE SessionID = @SessionID AND WordTypeID = @WordType
			ORDER BY Word ASC, WordTypeID ASC, ExplanationID ASC, PictureID ASC;
		ELSE IF @ViewType = 2
			SELECT * FROM NoMainPictureWordView WHERE SessionID = @SessionID AND WordTypeID = @WordType
			ORDER BY Word ASC, WordTypeID ASC, ExplanationID ASC, PictureID ASC;
		ELSE IF @ViewType = 3
			SELECT * FROM NoExplanationWordView WHERE SessionID = @SessionID AND WordTypeID = @WordType
			ORDER BY Word ASC, WordTypeID ASC, ExplanationID ASC, PictureID ASC;
		ELSE IF @ViewType = 0
			SELECT * FROM MainPictureWordView WHERE SessionID = @SessionID AND WordTypeID = @WordType
			UNION
			SELECT * FROM NoMainPictureWordView WHERE SessionID = @SessionID AND WordTypeID = @WordType
			UNION
			SELECT * FROM NoExplanationWordView WHERE SessionID = @SessionID AND WordTypeID = @WordType
			ORDER BY Word ASC, WordTypeID ASC, ExplanationID ASC, PictureID ASC;
	END;
	
	SELECT @Ret = 1;
GO