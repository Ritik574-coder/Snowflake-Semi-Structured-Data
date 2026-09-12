-- switch to corrent databse 
USE DATABASE SEMI_STRUCTURED_DB ;


-- querying customers profile info 
SELECT 
    c.customer_id,
    c.customer_name,

    c.customer_data:profile:first_name::STRING as first_name,
    c.customer_data:profile:last_name::STRING as last_name,
    c.customer_data:profile:gender::STRING as gender,
    c.customer_data:profile:email::STRING as email,
    c.customer_data:profile:is_active::BOOLEAN as is_active,
    c.customer_data:profile:loyalty_tier::STRING as loyalty_tier,
    c.customer_data:profile:account_balance::NUMBER(7,2) as account_balance,
    c.customer_data:profile:lifetime_value::NUMBER(7,2) as lifetime_value,
    c.customer_data:profile:birth_date::DATE as birth_date,
    c.customer_data:profile:join_date::DATE as join_date
FROM staging.customers as c ;


-- querying customers address info 
SELECT 
    c.customer_data:address:city::STRING as city,
    c.customer_data:address:country::STRING as country,
    c.customer_data:address:state::STRING as state,
    c.customer_data:address:type::STRING as type,
    c.customer_data:address:street::STRING as street,
    c.customer_data:address:zip::STRING as zip,
    c.customer_data:address:coordinates:lat::NUMBER(7,4) as lat,
    c.customer_data:address:coordinates:lng::NUMBER(7,4) as lng
FROM staging.customers as c ; 

-- querying customers preferences info 
SELECT 
    c.customer_data:preferences:preferred_currency::STRING as preferred_currency,
    UPPER(c.customer_data:preferences:preferred_language::STRING) as preferred_language,
    c.customer_data:preferences:newsletter_opt_in::BOOLEAN as newsletter_opt_in,
    p.value::STRING as marketing_channels,
    c.customer_data:preferences:notification_settings:email::BOOLEAN as email,
    c.customer_data:preferences:notification_settings:push::BOOLEAN as push,
    c.customer_data:preferences:notification_settings:sms::BOOLEAN as sms
FROM staging.customers as c 
CROSS JOIN LATERAL FLATTEN(
    INPUT => c.customer_data:preferences:marketing_channels
    ) as p 
;

-- querying customers devices info 
SELECT
    d.value:device_id::STRING as device_id,
    d.value:device_type::STRING as device_type,
    d.value:is_trusted::BOOLEAN as is_trusted,
    d.value:last_login::TIMESTAMP_TZ as last_login,
    d.value:os::STRING as os
FROM staging.customers as c 
CROSS JOIN LATERAL FLATTEN(
    INPUT => c.customer_data:devices 
) as d ; 

-- querying customers table 
SELECT 
    c.customer_id,
    c.customer_name,

    c.customer_data:address:city::STRING as city,
    c.customer_data:address:country::STRING as country,
    c.customer_data:address:state::STRING as state,
    c.customer_data:address:type::STRING as type,
    c.customer_data:address:street::STRING as street,
    c.customer_data:address:zip::STRING as zip,
    c.customer_data:address:coordinates:lat::NUMBER(7,4) as lat,
    c.customer_data:address:coordinates:lng::NUMBER(7,4) as lng,

    c.customer_data:profile:first_name::STRING as first_name,
    c.customer_data:profile:last_name::STRING as last_name,
    c.customer_data:profile:gender::STRING as gender,
    c.customer_data:profile:email::STRING as email,
    c.customer_data:profile:is_active::BOOLEAN as is_active,
    c.customer_data:profile:loyalty_tier::STRING as loyalty_tier,
    c.customer_data:profile:account_balance::NUMBER(7,2) as account_balance,
    c.customer_data:profile:lifetime_value::NUMBER(7,2) as lifetime_value,
    c.customer_data:profile:birth_date::DATE as birth_date,
    c.customer_data:profile:join_date::DATE as join_date,

    c.customer_data:preferences:preferred_currency::STRING as preferred_currency,
    c.customer_data:preferences:preferred_language::STRING as preferred_language,
    c.customer_data:preferences:newsletter_opt_in::BOOLEAN as newsletter_opt_in,
    p.value::STRING as marketing_channels,
    c.customer_data:preferences:notification_settings:email::BOOLEAN as email,
    c.customer_data:preferences:notification_settings:push::BOOLEAN as push,
    c.customer_data:preferences:notification_settings:sms::BOOLEAN as sms,
 
    d.value:device_id::STRING as device_id,
    d.value:device_type::STRING as device_type,
    d.value:is_trusted::BOOLEAN as is_trusted,
    d.value:last_login::TIMESTAMP_TZ as last_login,
    d.value:os::STRING as os

FROM staging.customers as c 
CROSS JOIN LATERAL FLATTEN(
    INPUT => c.customer_data:preferences:marketing_channels
    ) as p

CROSS JOIN LATERAL FLATTEN(
    INPUT => c.customer_data:devices
    ) as d
; 


