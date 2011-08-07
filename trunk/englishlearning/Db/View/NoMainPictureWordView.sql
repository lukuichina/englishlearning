CREATE VIEW NoMainPictureWordView AS
SELECT TOP 100 PERCENT
    3 AS ViewType,
    WordView.SessionID,
    WordView.ViewID,
    W.Word,
    W.WordType AS WordTypeID,
    W.Name AS WordType,
    W.ExplanationID,
    W.Explanation,
    Picture.PictureID,
    CASE WHEN Picture.PictureName IS NULL THEN Picture.PictureName ELSE NULL END AS PictureName,
    Picture.MainPicture
FROM
	(SELECT
		Word.Word,
		WordExplanation.WordType,
		WordType.Name,
		WordExplanation.ExplanationID,
		WordExplanation.Explanation
	FROM
		Word
	INNER JOIN WordExplanation ON
		WordExplanation.Word = Word.Word
	INNER JOIN WordType ON
		WordType.ID = WordExplanation.WordType
	/*WHERE
		Word.Word BETWEEN :WordStart AND :WordEnd*/) W
LEFT JOIN Picture ON
    W.Word = Picture.Word AND
    W.WordType = Picture.WordType AND
    W.ExplanationID = Picture.ExplanationID
INNER JOIN WordView ON
    WordView.Word = W.Word
WHERE
    (picture.MainPicture = 0 OR Picture.MainPicture IS NULL) AND
    NOT EXISTS
    (SELECT * FROM Picture WHERE Word = W.Word AND WordType = W.WordType AND ExplanationID = W.ExplanationID AND MainPicture = 1) AND
    (Picture.PictureID = (SELECT MIN(PictureID) FROM Picture WHERE picture.MainPicture = 0 OR Picture.MainPicture IS NULL) OR Picture.PictureID IS NULL)
ORDER BY
    W.Word ASC,
    W.WordType ASC,
    W.ExplanationID ASC,
    Picture.PictureID ASC
GO