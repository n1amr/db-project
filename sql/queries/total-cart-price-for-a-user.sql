SELECT coalesce(sum(p.Price * i.Quantity), 0) AS TotalPrice
FROM User u, CartItem i, Product p
WHERE u.ID = :USER_ID
      AND i.UserID = u.ID
      AND i.ProductID = p.ID;