-- Drop old tables if they exist
DROP TABLE IF EXISTS customers CASCADE;
DROP TABLE IF EXISTS orders CASCADE;
DROP TABLE IF EXISTS partners CASCADE;
DROP TABLE IF EXISTS shipments CASCADE;
DROP TABLE IF EXISTS deliverylogs CASCADE;

-- Customers table
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    address TEXT
);

-- Orders table
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    product VARCHAR(100) NOT NULL,
    quantity INT NOT NULL,
    order_date DATE DEFAULT CURRENT_DATE,
    status VARCHAR(20) DEFAULT 'pending'
);

-- Partners table
CREATE TABLE partners (
    partner_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    contact_email VARCHAR(100)
);

-- Shipments table
CREATE TABLE shipments (
    shipment_id SERIAL PRIMARY KEY,
    partner_id INT REFERENCES partners(partner_id),
    order_id INT REFERENCES orders(order_id),
    promised_date DATE NOT NULL,
    actual_delivery_date DATE,
    destination_city VARCHAR(100),
    status VARCHAR(20) DEFAULT 'in_transit'
);

-- DeliveryLogs table
CREATE TABLE deliverylogs (
    log_id SERIAL PRIMARY KEY,
    shipment_id INT REFERENCES shipments(shipment_id),
    log_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    event VARCHAR(50) CHECK (event IN ('PickedUp','InTransit','Delivered','Returned'))
);