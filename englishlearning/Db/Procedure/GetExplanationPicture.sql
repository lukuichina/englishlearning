CREATE PROCEDURE GetExplanationPicture
(
	@Word varchar(20),
	@WordType INTEGER = 0,
	@ExplanationID INTEGER = 0,
	@PictureType INTEGER = 0,
	@Ret INTEGER = -1 OUTPUT
)
AS
	SELECT
		WordType.ID AS WordTypeID,
		WordType.Name AS WordType,
		WordExplanation.Word,
		WordExplanation.Explanation,
		Picture.ExplanationID,
		Picture.PictureID,
		Picture.PictureName,
		Picture.PictureDisp,
		Picture.MainPicture
	FROM
		Picture
	INNER JOIN WordType ON
		WordType.ID =Picture.WordType
	INNER JOIN WordExplanation ON
		WordExplanation.Word = Picture.Word AND
		WordExplanation.WordType = Picture.WordType AND
		WordExplanation.ExplanationID = Picture.ExplanationID
	WHERE
		Picture.Word = @Word AND
		(CASE WHEN @WordType = 0 THEN 0 ELSE Picture.WordType END) = @WordType AND
		(CASE WHEN @ExplanationID = 0 THEN 0 ELSE Picture.ExplanationID END) = @ExplanationID AND
		(CASE @PictureType WHEN 0 THEN 1 WHEN 1 THEN Picture.MainPicture END) = 1	
	ORDER BY
		Picture.Word ASC,
		Picture.WordType ASC,
		Picture.ExplanationID ASC,
		Picture.PictureID ASC;

	SELECT @Ret = 1;
GO