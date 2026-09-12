-- switch to corrent databse 
USE DATABASE SEMI_STRUCTURED_DB ;

SELECT

    -- extracting customer reviews 
    product_id,
    r.value:comment::STRING as comment,
    r.value:customer_id::NUMBER(5,0) as customer_id,
    r.value:rating::NUMBER(5,0) as rating,
    r.value:review_date::DATE as review_date,
    r.value:review_id::STRING as review_id,
    r.value:verified_purchase::BOOLEAN as verified_purchase,

    -- extracting suppliers info 
    s.value:country::STRING as country,
    s.value:is_primary::BOOLEAN as is_primary,
    s.value:lead_time_days::NUMBER(4,0) as lead_time_days,
    s.value:supplier_id::STRING as supplier_id,
    s.value:supplier_name::STRING as supplier_name,

    -- extracting specifications info 
    p.product_data:specifications:brand::STRING as brand,
    p.product_data:specifications:category::STRING as category,

    c.value::STRING as color_options,

    p.product_data:specifications:dimensions:height::NUMBER(7,2) as hight,
    p.product_data:specifications:dimensions:length::NUMBER(7,2) as length,
    p.product_data:specifications:dimensions:unit::STRING as unit,
    p.product_data:specifications:dimensions:width::NUMBER(7,2) as width,
    p.product_data:specifications:weight_kg::NUMBER(7,2) as weight_kg,

    p.product_data:pricing:base_price::NUMBER(10,2) as base_price,
    p.product_data:pricing:currency::STRING as currency,
    p.product_data:pricing:tax_rate::NUMBER(10,5) as tax_rate,

    ph.value:date::DATE as date,
    ph.value:price::NUMBER(10,3) as price

FROM staging.products as p  

CROSS JOIN LATERAL FLATTEN(
    INPUT => p.product_data:reviews
    ) as r 

CROSS JOIN LATERAL FLATTEN(
    INPUT => p.product_data:suppliers
    ) as s 

CROSS JOIN LATERAL FLATTEN(
    INPUT => p.product_data:specifications:color_options
    ) as c 

CROSS JOIN LATERAL FLATTEN(
    INPUT => p.product_data:pricing:price_history
    ) as ph 
; 
