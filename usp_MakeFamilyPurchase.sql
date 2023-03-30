CREATE PROCEDURE usp_MakeFamilyPurchase
	@FamilySurName varchar(255)
AS
UPDATE f 
SET f.BudgetValue = f.BudgetValue - sum(b.Value)
FROM Family as f
	INNER JOIN dbo.Basket as b ON f.ID = b.ID_Family
WHERE f.SurName = @FamilySurName
	AND f.ID = b.ID_Family;