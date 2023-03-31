CREATE TRIGGER TR_Basket_insert_update
ON dbo.Basket
AFTER INSERT
AS
BEGIN
  UPDATE b
  SET DiscountValue = CASE
                        WHEN c.Count >= 2 THEN b.Value * 0.05
                        ELSE 0
                      END
  FROM dbo.Basket b
  INNER JOIN (
    SELECT ID_SKU, COUNT(*) AS Count
    FROM inserted
    GROUP BY ID_SKU
  ) c ON b.ID_SKU = c.ID_SKU
  WHERE b.ID IN (SELECT ID FROM inserted)
END;
