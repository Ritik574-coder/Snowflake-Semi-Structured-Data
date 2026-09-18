-- creating view of orders table 
CREATE OR REPLACE VIEW analytics.dnz_orders AS 
SELECT
    i.value:product_id::STRING                             as product_id,
    i.value:product_name::STRING                           as product_name,
    i.value:options:color::STRING                          as color,
    i.value:options:size::STRING                           as size,
    i.value:quantity::NUMBER(4,0)                          as quantity,
    i.value:unit_price::NUMBER(10,2)                       as unit_price,
    i.value:line_total::NUMBER(10,2)                       as line_total,

    d.value:applied_amount::NUMBER(5,2)                    as applied_amount,
    d.value:code::STRING                                   as code,
    d.value:type::STRING                                   as type,
    d.value:value::NUMBER(5,2)                             as value,

    o.order_data:order_details:currency::STRING            as currency,
    o.order_data:order_details:order_channel::STRING       as order_channel,
    o.order_data:order_details:order_date::TIMESTAMP_TZ    as order_date,
    o.order_data:order_details:order_status::STRING        as order_status,

    o.order_data:payment:transaction_id::STRING            as transaction_id,   
    o.order_data:payment:method::STRING                    as payment_method,
    o.order_data:payment:payment_status::STRING            as payment_status,
    o.order_data:payment:amount_paid::NUMBER(10,2)         as amount_paid,

    o.order_data:payment:billing_address:country::STRING   as billing_address_country,
    o.order_data:payment:billing_address:state::STRING     as billing_address_state,
    o.order_data:payment:billing_address:city::STRING      as billing_address_city,
    o.order_data:payment:billing_address:zip::STRING       as billing_address_zip,
    o.order_data:payment:billing_address:street::STRING    as billing_address_street,

    o.order_data:shipping:tracking_number::STRING          as tracking_number,
    o.order_data:shipping:carrier::STRING                  as carrier,
    o.order_data:shipping:cost::NUMBER(10,2)               as cost,
    o.order_data:shipping:estimated_delivery::DATE         as estimated_delivery,
    o.order_data:shipping:method::STRING                   as shipping_method,
 
    o.order_data:shipping:shipping_address:country::STRING as shipping_country,
    o.order_data:shipping:shipping_address:state::STRING   as shipping_state,
    o.order_data:shipping:shipping_address:city::STRING    as shipping_city,
    o.order_data:shipping:shipping_address:zip::STRING     as shipping_zip,
    o.order_data:shipping:shipping_address:street::STRING  as shipping_street
FROM staging.orders as o 

CROSS JOIN LATERAL FLATTEN(
        INPUT => o.order_data:items
    ) as i 

CROSS JOIN LATERAL FLATTEN(
        INPUT => o.order_data:discounts
    ) as d 
; 