CREATE PROCEDURE BetweenWordPicture
(
	@BeginWord varchar(20),
	@EndWord varchar(20),
	@ViewType INTEGER = 1,
	@WordType INTEGER = 0,
	@Ret INTEGER = -1 OUTPUT
)
AS
	IF @WordType = 0
    BEGIN
		IF @ViewType = 1
			SELECT * FROM MainPictureWord WHERE Word BETWEEN @BeginWord AND @EndWord 
			ORDER BY Word ASC, WordTypeID ASC, ExplanationID ASC, PictureID ASC;
		ELSE IF @ViewType = 2
			SELECT * FROM NoMainPictureWord WHERE Word BETWEEN @BeginWord AND @EndWord
			ORDER BY Word ASC, WordTypeID ASC, ExplanationID ASC, PictureID ASC;
		ELSE IF @ViewType = 3
			SELECT * FROM NoExplanationWord WHERE Word BETWEEN @BeginWord AND @EndWord
			ORDER BY Word ASC, WordTypeID ASC, ExplanationID ASC, PictureID ASC;
		ELSE IF @ViewType = 0
			SELECT * FROM MainPictureWord WHERE Word BETWEEN @BeginWord AND @EndWord
			UNION
			SELECT * FROM NoMainPictureWord WHERE Word BETWEEN @BeginWord AND @EndWord
			UNION
			SELECT * FROM NoExplanationWord WHERE Word BETWEEN @BeginWord AND @EndWord
			ORDER BY Word ASC, WordTypeID ASC, ExplanationID ASC, PictureID ASC;
    END;
	ELSE IF @WordType IN (SELECT ID FROM WordType)
	BEGIN
		IF @ViewType = 1
			SELECT * FROM MainPictureWord WHERE Word BETWEEN @BeginWord AND @EndWord AND WordTypeID = @WordType
			ORDER BY Word ASC, WordTypeID ASC, ExplanationID ASC, PictureID ASC;
		ELSE IF @ViewType = 2
			SELECT * FROM NoMainPictureWord WHERE Word BETWEEN @BeginWord AND @EndWord AND WordTypeID = @WordType
			ORDER BY Word ASC, WordTypeID ASC, ExplanationID ASC, PictureID ASC;
		ELSE IF @ViewType = 3
			SELECT * FROM NoExplanationWord WHERE Word BETWEEN @BeginWord AND @EndWord AND WordTypeID = @WordType
			ORDER BY Word ASC, WordTypeID ASC, ExplanationID ASC, PictureID ASC;
		ELSE IF @ViewType = 0
			SELECT * FROM MainPictureWord WHERE Word BETWEEN @BeginWord AND @EndWord AND WordTypeID = @WordType
			UNION
			SELECT * FROM NoMainPictureWord WHERE Word BETWEEN @BeginWord AND @EndWord AND WordTypeID = @WordType
			UNION
			SELECT * FROM NoExplanationWord WHERE Word BETWEEN @BeginWord AND @EndWord AND WordTypeID = @WordType
			ORDER BY Word ASC, WordTypeID ASC, ExplanationID ASC, PictureID ASC;
	END;
	
	SELECT @Ret = 1;
GO