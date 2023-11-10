CREATE TABLE customers(
	customer_id             	VARCHAR(50),
    customer_unique_id			VARCHAR(50),
    customer_zip_code_prefix	VARCHAR(50),
    customer_city               VARCHAR(50),
    customer_state				VARCHAR(50)
)

----

CREATE TABLE geolocation (
	geolocation_zip_code_prefix 	VARCHAR(50),
	geolocation_lat 				FLOAT,
	geolocation_lng					FLOAT,
	geolocation_city 				VARCHAR(50),
	geolocation_state				VARCHAR(50)
)

----

CREATE TABLE items(
	order_id                VARCHAR(50),
	order_item_id           INT,
	product_id              VARCHAR(50),
	seller_id               VARCHAR(50),
	shipping_limit_date		DATETIME,
	price                   FLOAT,
	freight_value           FLOAT
)

----

CREATE TABLE payments (
	order_id				VARCHAR(50),
	paymnet_sequential  	INT,
	payment_type			VARCHAR(50),
	payment_installments 	INT,
	payment_value			FLOAT
)

----

CREATE TABLE orders (
	order_id						VARCHAR(50),
	customer_id                     VARCHAR(50),
	order_status                    VARCHAR(50),
	order_purchase_timestamp        DATETIME,
	order_approved_at               DATETIME,
	order_delivered_carrier_date    DATETIME,
	order_delivered_customer_date   DATETIME,
	order_estimated_delivery_date   DATE
)

----

CREATE TABLE 














