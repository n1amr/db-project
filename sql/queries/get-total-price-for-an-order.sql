SELECT
  o.*,
  sum(p.Price * i.Quantity) AS TotalPrice
FROM Orders o, OrderItem i, Product p
WHERE o.ID = :ORDER_ID
      AND i.OrderID = o.ID
      AND i.ProductID = p.ID
GROUP BY i.OrderID;