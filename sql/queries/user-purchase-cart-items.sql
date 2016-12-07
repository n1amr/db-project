BEGIN;

INSERT INTO Orders (UserID, OrderDate, Status,
                    ShippingName, ShippingAddress,
                    ShippingPhone)
VALUES (:USER_ID, NOW(), 'PNDNG',
        :SHIPPING_NAME, :SHIPPING_ADDRESS, :SHIPPING_PHONE);

SET @last_order_id = last_insert_id();

INSERT INTO OrderItem (OrderID, ProductID, Quantity)
  SELECT
    @last_order_id,
    CartItem.ProductID,
    CartItem.Quantity
  FROM CartItem
  WHERE CartItem.UserID = :USER_ID;

DELETE FROM CartItem
WHERE UserID = :USER_ID;

COMMIT;
