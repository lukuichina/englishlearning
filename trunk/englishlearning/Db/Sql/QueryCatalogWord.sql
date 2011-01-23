SELECT
    ROW_NUMBER() OVER(ORDER BY Word.Word ASC) AS RowId,
    Word.Word,
    Importance.ID as  ImportanceID,
    Importance.Disp as ImportanceLevel,
    Difficulty.ID as DifficultyID,
    Difficulty.Disp as DifficultyLevel,
    CASE WHEN (SELECT COUNT(*) FROM WordExplanation WHERE WordExplanation.Word = Word.Word) > 0 THEN '¡ð' ELSE '¡Á' END AS IsExplained,
    CASE WHEN (SELECT COUNT(*) FROM Picture WHERE Picture.Word = Word.Word) > 0 THEN '¡ð' ELSE '¡Á' END AS IsPictured,
    (SELECT COUNT(*) FROM (SELECT Distinct WordType FROM WordExplanation WHERE WordExplanation.Word = Word.Word) wt) AS WordTypeCount,
    (SELECT COUNT(*) FROM WordExplanation WHERE WordExplanation.Word = Word.Word) AS ExplanationCount,
    (SELECT COUNT(*) FROM Picture WHERE Picture.Word = Word.Word) AS PictureCount,
    (SELECT COUNT(*) FROM Picture WHERE Picture.Word = Word.Word AND Picture.MainPicture = 1) AS MainPictureCount,
    Word.CreateTime,
    Word.UpdateTime
FROM
    WordCatalogRelation  
INNER JOIN Word ON
    WordCatalogRelation.Word = Word.Word
INNER JOIN 
    Importance on Importance.ID = Word.ImportanceLevel
INNER JOIN
    Difficulty on Difficulty.ID = Word.DifficultyLevel
WHERE
    WordCatalogRelation.CatalogID = :CatalogID
ORDER BY
    Word.Word ASC