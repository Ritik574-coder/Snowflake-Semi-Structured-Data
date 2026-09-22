-- # checking the first normal form in customer table 

-- # switch to correct database 
USE DATABASE semi_structured_db ;

-- # describe the view 
DESCRIBE VIEW analytics.dnz_customers ;

SELECT 
    COUNT(*) as customer_count,

    COUNT_IF(
        REGEXP_LIKE(
            CUSTOMER_ID, '.*[,.|*:;].*'
            )
        ) as SPS_customer_id,

    COUNT_IF(
        REGEXP_LIKE(
            CUSTOMER_NAME, '.*[,.|*:;].*'
            )
        ) as sps_customer_name,

    COUNT_IF(
        REGEXP_LIKE(
            FIRST_NAME, '.*[,.|*:;].*'
            )
        ) as sps_first_name,

    COUNT_IF(
        REGEXP_LIKE(
            LAST_NAME, '.*[,.|*:;].*'
            )
        ) as sps_last_name,

    COUNT_IF(
        REGEXP_LIKE(
            GENDER, '.*[,.|*:;].*'
            )
        ) as sps_gender,

    COUNT_IF(
        REGEXP_LIKE(
            EMAIL, '.*[,|*:;].*'
            )
        ) as sps_email,

    COUNT_IF(
        REGEXP_LIKE(
            IS_ACTIVE, '.*[,.|*:;].*'
            )
        ) as sps_is_active,

    COUNT_IF(
        REGEXP_LIKE(
            CITY, '.*[,.|*:;].*'
            )
        ) as sps_city,

    COUNT_IF(
        REGEXP_LIKE(
            COUNTRY, '.*[,.|*:;].*'
            )
        ) as sps_country,

    COUNT_IF(
        REGEXP_LIKE(
            STATE, '.*[,.|*:;].*'
            )
        ) as sps_state,

    COUNT_IF(
        REGEXP_LIKE(
            TYPE, '.*[,.|*:;].*'
            )
        ) as sps_type,

    COUNT_IF(
        REGEXP_LIKE(
            STREET, '.*[,.|*:;].*'
            )
        ) as sps_street,

    COUNT_IF(
        REGEXP_LIKE(
            ZIP, '.*[,.|*:;].*'
            )
        ) as sps_zip,

    COUNT_IF(
        REGEXP_LIKE(
            LAT, '.*[,|*:;].*'
            )
        ) as sps_lat,

    COUNT_IF(
        REGEXP_LIKE(
            LNG, '.*[,|*:;].*'
            )
        ) as sps_lng,

    COUNT_IF(
        REGEXP_LIKE(
            LOYALTY_TIER, '.*[,|*:;].*'
            )
        ) as sps_loyalty_tier,

    COUNT_IF(
        REGEXP_LIKE(
            ACCOUNT_BALANCE, '.*[,|*:;].*'
            )
        ) as sps_account_balance,

    COUNT_IF(
        REGEXP_LIKE(
            LIFETIME_VALUE, '.*[,|*:;].*'
            )
        ) as sps_lifetime_value,

    COUNT_IF(
        REGEXP_LIKE(
            BIRTH_DATE, '.*[,.|*:;].*'
            )
        ) as sps_birth_date,

    COUNT_IF(
        REGEXP_LIKE(
            JOIN_DATE, '.*[,.|*:;].*'
            )
        ) as sps_join_date,

    COUNT_IF(
        REGEXP_LIKE(
            PREFERRED_CURRENCY, '.*[,.|*:;].*'
            )
        ) as sps_preferred_currency,

    COUNT_IF(
        REGEXP_LIKE(
            PREFERRED_LANGUAGE, '.*[,.|*:;].*'
            )
        ) as sps_preferred_language,

    COUNT_IF(
        REGEXP_LIKE(
            NEWSLETTER_OPT_IN, '.*[,.|*:;].*'
            )
        ) as sps_newsletter_opt_in,

    COUNT_IF(
        REGEXP_LIKE(
            MARKETING_CHANNELS, '.*[,.|*:;].*'
            )
        ) as sps_marketing_channels,

    COUNT_IF(
        REGEXP_LIKE(
            EMAIL_NOTIFICATION, '.*[,.|*:;].*'
            )
        ) as sps_email_notification,

    COUNT_IF(
        REGEXP_LIKE(
            PUSH_NOTIFICATION, '.*[,.|*:;].*'
            )
        ) as sps_push_notification,

    COUNT_IF(
        REGEXP_LIKE(
            SMS_NOTIFICATION, '.*[,.|*:;].*'
            )
        ) as sps_sms_notification,

    COUNT_IF(
        REGEXP_LIKE(
            DEVICE_ID, '.*[,.|*:;].*'
            )
        ) as sps_device_id,

    COUNT_IF(
        REGEXP_LIKE(
            DEVICE_TYPE, '.*[,.|*:;].*'
            )
        ) as sps_device_type,

    COUNT_IF(
        REGEXP_LIKE(
            IS_TRUSTED, '.*[,.|*:;].*'
            )
        ) as sps_is_trusted,

    COUNT_IF(
        REGEXP_LIKE(
            LAST_LOGIN, '.*[,|*;].*'
            )
        ) as sps_last_login,

    COUNT_IF(
        REGEXP_LIKE(
            OS, '.*[,.|*:;].*'
        )
    ) as sps_os 

FROM analytics.dnz_customers  ;