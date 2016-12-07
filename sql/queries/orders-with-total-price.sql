SELECT
  o.*,
  sum(p.Price * i.Quantity) AS TotalPrice
FROM Orders o, OrderItem i, Product p
WHERE i.OrderID = o.ID AND i.ProductID = p.ID
GROUP BY i.OrderID;