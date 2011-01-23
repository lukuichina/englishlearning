CREATE VIEW MainPictureWord AS
SELECT TOP 100 PERCENT
    1 AS ViewType,
    WordExplanation.Word,
    WordExplanation.WordType AS WordTypeID,
    --WordType.ID AS WordTypeID,
    WordType.Name AS WordType,
    WordExplanation.ExplanationID,
    WordExplanation.Explanation,
    --Picture.ExplanationID,
    Picture.PictureID,
    Picture.PictureName,
    Picture.MainPicture
FROM
    Picture
INNER JOIN WordType ON
    WordType.ID = Picture.WordType
INNER JOIN WordExplanation ON
    WordExplanation.Word = Picture.Word AND
    WordExplanation.WordType = Picture.WordType AND
    WordExplanation.ExplanationID = Picture.ExplanationID
WHERE
    --Picture.Word BETWEEN :WordStart AND :WordEnd AND
    picture.MainPicture = 1
ORDER BY
    Picture.Word ASC,
    Picture.WordType ASC,
    Picture.ExplanationID ASC,
    Picture.PictureID ASC
GO