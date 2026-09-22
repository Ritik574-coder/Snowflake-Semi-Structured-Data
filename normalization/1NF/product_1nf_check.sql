-- # checking the first normal form in customer table 

-- # switch to correct database 
USE DATABASE semi_structured_db ;

-- # describe the view 
DESCRIBE VIEW analytics.dnz_products ;

SELECT

    COUNT(*) AS product_count,

    COUNT_IF(
        REGEXP_LIKE(
            PRODUCT_ID, '.*[,|*:;].*'
        )
    ) AS sps_product_id,

    COUNT_IF(
        REGEXP_LIKE(
            COMMENT, '.*[|*:;].*'
        )
    ) AS sps_comment,

    COUNT_IF(
        REGEXP_LIKE(
            CUSTOMER_ID, '.*[,|*:;].*'
        )
    ) AS sps_customer_id,

    COUNT_IF(
        REGEXP_LIKE(
            RATING, '.*[,|*:;].*'
        )
    ) AS sps_rating,

    COUNT_IF(
        REGEXP_LIKE(
            REVIEW_DATE, '.*[,|*:;].*'
        )
    ) AS sps_review_date,

    COUNT_IF(
        REGEXP_LIKE(
            REVIEW_ID, '.*[,|*:;].*'
        )
    ) AS sps_review_id,

    COUNT_IF(
        REGEXP_LIKE(
            VERIFIED_PURCHASE, '.*[,|*:;].*'
        )
    ) AS sps_verified_purchase,

    COUNT_IF(
        REGEXP_LIKE(
            COUNTRY, '.*[,|*:;].*'
        )
    ) AS sps_country,

    COUNT_IF(
        REGEXP_LIKE(
            IS_PRIMARY, '.*[,|*:;].*'
        )
    ) AS sps_is_primary,

    COUNT_IF(
        REGEXP_LIKE(
            LEAD_TIME_DAYS, '.*[,|*:;].*'
        )
    ) AS sps_lead_time_days,

    COUNT_IF(
        REGEXP_LIKE(
            SUPPLIER_ID, '.*[,|*:;].*'
        )
    ) AS sps_supplier_id,

    COUNT_IF(
        REGEXP_LIKE(
            SUPPLIER_NAME, '.*[,|*:;].*'
        )
    ) AS sps_supplier_name,

    COUNT_IF(
        REGEXP_LIKE(
            BRAND, '.*[,|*:;].*'
        )
    ) AS sps_brand,

    COUNT_IF(
        REGEXP_LIKE(
            CATEGORY, '.*[,|*:;].*'
        )
    ) AS sps_category,

    COUNT_IF(
        REGEXP_LIKE(
            COLOR_OPTIONS, '.*[,|*:;].*'
        )
    ) AS sps_color_options,

    COUNT_IF(
        REGEXP_LIKE(
            HIGHT, '.*[,|*:;].*'
        )
    ) AS sps_hight,

    COUNT_IF(
        REGEXP_LIKE(
            LENGTH, '.*[,|*:;].*'
        )
    ) AS sps_length,

    COUNT_IF(
        REGEXP_LIKE(
            UNIT, '.*[,|*:;].*'
        )
    ) AS sps_unit,

    COUNT_IF(
        REGEXP_LIKE(
            WIDTH, '.*[,|*:;].*'
        )
    ) AS sps_width,

    COUNT_IF(
        REGEXP_LIKE(
            WEIGHT_KG, '.*[,|*:;].*'
        )
    ) AS sps_weight_kg,

    COUNT_IF(
        REGEXP_LIKE(
            BASE_PRICE, '.*[,|*:;].*'
        )
    ) AS sps_base_price,

    COUNT_IF(
        REGEXP_LIKE(
            CURRENCY, '.*[,|*:;].*'
        )
    ) AS sps_currency,

    COUNT_IF(
        REGEXP_LIKE(
            TAX_RATE, '.*[,|*:;].*'
        )
    ) AS sps_tax_rate,

    COUNT_IF(
        REGEXP_LIKE(
            DATE, '.*[,|*:;].*'
        )
    ) AS sps_date,

    COUNT_IF(
        REGEXP_LIKE(
            PRICE, '.*[,|*:;].*'
        )
    ) AS sps_price

FROM analytics.dnz_products;