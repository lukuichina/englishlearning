CREATE VIEW NoExplanationWordView AS
SELECT TOP 100 PERCENT
    2 AS ViewType,
    WordView.SessionID,
    WordView.ViewID,
    Word.Word,
    WordType.ID AS WordTypeID,
    WordType.Name AS WordType,
    WordExplanation.ExplanationID,
    WordExplanation.Explanation,
    Picture.PictureID,
    Picture.PictureName,
    Picture.MainPicture
FROM
    Word
LEFT JOIN WordExplanation ON
    WordExplanation.Word = Word.Word
LEFT JOIN Picture ON
    Picture.Word = WordExplanation.Word AND
    Picture.WordType = WordExplanation.WordType AND
    Picture.ExplanationID = WordExplanation.ExplanationID
LEFT JOIN WordType ON
    WordType.ID = WordExplanation.WordType
INNER JOIN WordView ON
    WordView.Word = Word.Word
WHERE
    --Word BETWEEN :WordStart AND :WordEnd AND
    NOT EXISTS
    (SELECT * FROM WordExplanation WHERE Word = Word.Word)
ORDER BY
	Word.Word ASC,
	WordExplanation.WordType ASC,
	WordExplanation.ExplanationID ASC,
	Picture.PictureID ASC
GO