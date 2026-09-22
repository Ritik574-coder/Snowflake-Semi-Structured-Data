-- # checking the first normal form in customer table 

-- # switch to correct database 
USE DATABASE semi_structured_db ;

-- # describe the view 
DESCRIBE VIEW analytics.dnz_orders ;


SELECT

    COUNT(*) AS order_count,

    COUNT_IF(
        REGEXP_LIKE(PRODUCT_ID, '.*[,|:;].*')
    ) AS sps_product_id,

    COUNT_IF(
        REGEXP_LIKE(PRODUCT_NAME, '.*[,|:;].*')
    ) AS sps_product_name,

    COUNT_IF(
        REGEXP_LIKE(COLOR, '.*[,|:;].*')
    ) AS sps_color,

    COUNT_IF(
        REGEXP_LIKE(SIZE, '.*[,|:;].*')
    ) AS sps_size,

    COUNT_IF(
        REGEXP_LIKE(QUANTITY, '.*[,|:;].*')
    ) AS sps_quantity,

    COUNT_IF(
        REGEXP_LIKE(UNIT_PRICE, '.*[,|:;].*')
    ) AS sps_unit_price,

    COUNT_IF(
        REGEXP_LIKE(LINE_TOTAL, '.*[,|:;].*')
    ) AS sps_line_total,

    COUNT_IF(
        REGEXP_LIKE(APPLIED_AMOUNT, '.*[,|:;].*')
    ) AS sps_applied_amount,

    COUNT_IF(
        REGEXP_LIKE(CODE, '.*[,|:;].*')
    ) AS sps_code,

    COUNT_IF(
        REGEXP_LIKE("TYPE", '.*[,|:;].*')
    ) AS sps_type,

    COUNT_IF(
        REGEXP_LIKE(VALUE, '.*[,|:;].*')
    ) AS sps_value,

    COUNT_IF(
        REGEXP_LIKE(CURRENCY, '.*[,|:;].*')
    ) AS sps_currency,

    COUNT_IF(
        REGEXP_LIKE(ORDER_CHANNEL, '.*[,|:;].*')
    ) AS sps_order_channel,

    COUNT_IF(
        REGEXP_LIKE(ORDER_DATE, '.*[,|;].*')
    ) AS sps_order_date,

    COUNT_IF(
        REGEXP_LIKE(ORDER_STATUS, '.*[,|:;].*')
    ) AS sps_order_status,

    COUNT_IF(
        REGEXP_LIKE(TRANSACTION_ID, '.*[,|:;].*')
    ) AS sps_transaction_id,

    COUNT_IF(
        REGEXP_LIKE(PAYMENT_METHOD, '.*[,|:;].*')
    ) AS sps_payment_method,

    COUNT_IF(
        REGEXP_LIKE(PAYMENT_STATUS, '.*[,|:;].*')
    ) AS sps_payment_status,

    COUNT_IF(
        REGEXP_LIKE(AMOUNT_PAID, '.*[,|:;].*')
    ) AS sps_amount_paid,

    COUNT_IF(
        REGEXP_LIKE(BILLING_ADDRESS_COUNTRY, '.*[,|:;].*')
    ) AS sps_billing_address_country,

    COUNT_IF(
        REGEXP_LIKE(BILLING_ADDRESS_STATE, '.*[,|:;].*')
    ) AS sps_billing_address_state,

    COUNT_IF(
        REGEXP_LIKE(BILLING_ADDRESS_CITY, '.*[,|:;].*')
    ) AS sps_billing_address_city,

    COUNT_IF(
        REGEXP_LIKE(BILLING_ADDRESS_ZIP, '.*[,|:;].*')
    ) AS sps_billing_address_zip,

    COUNT_IF(
        REGEXP_LIKE(BILLING_ADDRESS_STREET, '.*[,|:;].*')
    ) AS sps_billing_address_street,

    COUNT_IF(
        REGEXP_LIKE(TRACKING_NUMBER, '.*[,|:;].*')
    ) AS sps_tracking_number,

    COUNT_IF(
        REGEXP_LIKE(CARRIER, '.*[,|:;].*')
    ) AS sps_carrier,

    COUNT_IF(
        REGEXP_LIKE(COST, '.*[,|:;].*')
    ) AS sps_cost,

    COUNT_IF(
        REGEXP_LIKE(ESTIMATED_DELIVERY, '.*[,|:;].*')
    ) AS sps_estimated_delivery,

    COUNT_IF(
        REGEXP_LIKE(SHIPPING_METHOD, '.*[,|:;].*')
    ) AS sps_shipping_method,

    COUNT_IF(
        REGEXP_LIKE(SHIPPING_COUNTRY, '.*[,|:;].*')
    ) AS sps_shipping_country,

    COUNT_IF(
        REGEXP_LIKE(SHIPPING_STATE, '.*[,|:;].*')
    ) AS sps_shipping_state,

    COUNT_IF(
        REGEXP_LIKE(SHIPPING_CITY, '.*[,|:;].*')
    ) AS sps_shipping_city,

    COUNT_IF(
        REGEXP_LIKE(SHIPPING_ZIP, '.*[,|:;].*')
    ) AS sps_shipping_zip,

    COUNT_IF(
        REGEXP_LIKE(SHIPPING_STREET, '.*[,|:;].*')
    ) AS sps_shipping_street

FROM analytics.dnz_orders;
