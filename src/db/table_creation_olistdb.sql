CREATE TABLE customers(
	customer_id             	VARCHAR(100),
    customer_unique_id			VARCHAR(100),
    customer_zip_code_prefix	VARCHAR(100),
    customer_city               VARCHAR(100),
    customer_state				VARCHAR(100)
)

CREATE TABLE geolocation(
	geolocation_zip_code_prefix 	VARCHAR(100),
	geolocation_lat 				FLOAT,
	geolocation_lng					FLOAT,
	geolocation_city 				VARCHAR(100),
	geolocation_state				VARCHAR(100)
);

CREATE TABLE items(
	order_id                VARCHAR(100),
	order_item_id           INT,
	product_id              VARCHAR(100),
	seller_id               VARCHAR(100),
	shipping_limit_date		DATETIME,
	price                   FLOAT,
	freight_value           FLOAT
);

CREATE TABLE payments (
	order_id				VARCHAR(100),
	payment_sequential  	INT,
	payment_type			VARCHAR(100),
	payment_installments 	INT,
	payment_value			FLOAT
);

CREATE TABLE orders (
	order_id						VARCHAR(100),
	customer_id                     VARCHAR(100),
	order_status                    VARCHAR(100),
	order_purchase_timestamp        DATETIME,
	order_approved_at               DATETIME,
	order_delivered_carrier_date    DATETIME,
	order_delivered_customer_date   DATETIME,
	order_estimated_delivery_date   DATE
);

CREATE TABLE products (
	product_id					VARCHAR(100),
	product_category_name       VARCHAR(100),
	product_name_lenght         FLOAT,
	product_description_lenght  FLOAT,
	product_photos_qty          FLOAT,
	product_weight_g            FLOAT,
	product_length_cm           FLOAT,
	product_height_cm           FLOAT,
	product_width_cm            FLOAT
);

CREATE TABLE sellers(
	seller_id				VARCHAR(100),
	seller_zip_code_prefix  VARCHAR(100),
	seller_city             VARCHAR(100),
	seller_state            VARCHAR(100)
)
