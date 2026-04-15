\echo '=== Customers Table ==='
SELECT * FROM customers;

\echo '=== Pending Orders ==='
SELECT * FROM orders WHERE status = 'pending';

\echo '=== Delivered Shipments ==='
SELECT * FROM shipments WHERE status = 'delivered';

\echo '=== Total Orders Per Customer ==='
SELECT customer_id, COUNT(*) AS total_orders
FROM orders
GROUP BY customer_id;

\echo '=== Orders Joined With Customers ==='
SELECT o.order_id, c.name AS customer_name, o.product, o.status
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;


\echo '=== Delayed Shipments (Delivered Later Than Promised) ==='
SELECT s.shipment_id, s.partner_id, s.promised_date, s.actual_delivery_date
FROM shipments s
WHERE s.actual_delivery_date > s.promised_date;

\echo '=== Partner Performance (Successful vs Returned Deliveries) ==='
SELECT p.name AS partner_name,
       SUM(CASE WHEN s.status = 'delivered' THEN 1 ELSE 0 END) AS successful_deliveries,
       SUM(CASE WHEN s.status = 'returned' THEN 1 ELSE 0 END) AS returned_deliveries
FROM shipments s
JOIN partners p ON s.partner_id = p.partner_id
GROUP BY p.name
ORDER BY successful_deliveries DESC;

\echo '=== Most Popular Destination City (Last 30 Days) ==='
SELECT destination_city, COUNT(*) AS total_orders
FROM shipments
WHERE promised_date >= CURRENT_DATE - INTERVAL '30 days'
GROUP BY destination_city
ORDER BY total_orders DESC
LIMIT 1;

\echo '=== Partner Scorecard (Delays vs Success Rate) ==='
SELECT p.name AS partner_name,
       COUNT(*) FILTER (WHERE s.actual_delivery_date > s.promised_date) AS delayed_shipments,
       COUNT(*) FILTER (WHERE s.status = 'delivered') AS successful_shipments,
       COUNT(*) AS total_shipments,
       ROUND(
         (COUNT(*) FILTER (WHERE s.status = 'delivered')::decimal /
          NULLIF(COUNT(*),0)) * 100, 2
       ) AS success_rate_percent
FROM shipments s
JOIN partners p ON s.partner_id = p.partner_id
GROUP BY p.name
ORDER BY delayed_shipments ASC, success_rate_percent DESC;