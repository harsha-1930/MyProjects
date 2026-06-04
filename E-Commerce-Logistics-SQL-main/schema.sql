-- Drop old tables if they exists

DROP TABLE IF EXISTS deliverylogs;
DROP TABLE IF EXISTS shipments;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS partners;
DROP TABLE IF EXISTS customers;

-- Customers table
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    address TEXT
);

-- Orders table
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    product VARCHAR(100) NOT NULL,
    quantity INT NOT NULL,
    order_date DATE DEFAULT CURRENT_DATE,
    status VARCHAR(20) DEFAULT 'pending',
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Partners table
CREATE TABLE partners (
    partner_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    contact_email VARCHAR(100)
);

-- Shipments table
CREATE TABLE shipments (
    shipment_id INT AUTO_INCREMENT PRIMARY KEY,
    partner_id INT,
    order_id INT,
    promised_date DATE NOT NULL,
    actual_delivery_date DATE,
    destination_city VARCHAR(100),
    status VARCHAR(20) DEFAULT 'in_transit',
    FOREIGN KEY (partner_id) REFERENCES partners(partner_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

-- DeliveryLogs table
CREATE TABLE deliverylogs (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    shipment_id INT,
    log_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    event VARCHAR(50) NOT NULL,
    FOREIGN KEY (shipment_id) REFERENCES shipments(shipment_id),
    CHECK (event IN ('PickedUp','InTransit','Delivered','Returned'))
);
