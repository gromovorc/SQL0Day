CREATE PROCEDURE dbo.usp_MakeFamilyPurchase
@FamilySurName varchar(255)
AS
BEGIN
  SET NOCOUNT ON;

  DECLARE @FamilyId int;

  SELECT @FamilyId = ID
  FROM dbo.Family
  WHERE SurName = @FamilySurName;

  IF @FamilyId IS NULL
  BEGIN
    RAISERROR('Семья с фамилией "%s" не найдена.', 16, 1, @FamilySurName);
    RETURN;
  END;

  UPDATE dbo.Family
  SET BudgetValue = BudgetValue - (
    SELECT SUM(Value)
    FROM dbo.Basket
    WHERE ID_Family = @FamilyId
  )
  WHERE Id = @FamilyId;
END;