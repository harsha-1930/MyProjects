--data of cus
INSERT INTO customers (name, email, address)
VALUES ('Harsha', 'harsha@example.com', 'Hyderabad'),
       ('Vardhan', 'vardhan@example.com', 'Delhi'),
       ('Seshu', 'seshu@example.com', 'Mumbai');

-- data of ord
INSERT INTO orders (customer_id, product, quantity, status)
VALUES (1, 'Laptop', 1, 'shipped'),
       (2, 'Phone', 2, 'pending'),
       (3, 'Book', 5, 'shipped');

-- data of par
INSERT INTO partners (name, contact_email)
VALUES ('SwiftCourier', 'contact@swiftcourier.com'),
       ('FastExpress', 'support@fastexpress.com'),
       ('ShipNow', 'info@shipnow.com');

-- data of ship
INSERT INTO shipments (partner_id, order_id, promised_date, actual_delivery_date, destination_city, status)
VALUES 
-- Delivered on time
(1, 1, CURRENT_DATE - INTERVAL 5 DAY, CURRENT_DATE - INTERVAL 5 DAY, 'Hyderabad', 'delivered'),
-- Delivered late
(2, 2, CURRENT_DATE - INTERVAL 4 DAY, CURRENT_DATE - INTERVAL 2 DAY, 'Delhi', 'delivered'),
-- Returned
(3, 3, CURRENT_DATE - INTERVAL 3 DAY, CURRENT_DATE - INTERVAL 3 DAY, 'Mumbai', 'returned'),
-- In transit
(1, 2, CURRENT_DATE - INTERVAL 1 DAY, NULL, 'Chennai', 'in_transit'),
-- Delivered late
(2, 3, CURRENT_DATE - INTERVAL 10 DAY, CURRENT_DATE - INTERVAL 7 DAY, 'Bangalore', 'delivered');

-- data of DeliveryLogs
INSERT INTO deliverylogs (shipment_id, event)
VALUES 
(1, 'PickedUp'),
(1, 'Delivered'),
(2, 'PickedUp'),
(2, 'InTransit'),
(2, 'Delivered'),
(3, 'PickedUp'),
(3, 'Returned'),
(4, 'PickedUp'),
(4, 'InTransit'),
(5, 'PickedUp'),
(5, 'Delivered');
