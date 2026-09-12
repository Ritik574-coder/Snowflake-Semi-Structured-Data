-- switch to corrent databse 
USE DATABASE SEMI_STRUCTURED_DB ;

SELECT
    --extracting order items info 
    i.value:product_id::STRING as product_id,
    i.value:product_name::STRING as product_name,
    i.value:options:color::STRING as color,
    i.value:options:size::STRING as size,
    i.value:quantity::NUMBER(4,0) as quantity,
    i.value:unit_price::NUMBER(10,2) as unit_price,
    i.value:line_total::NUMBER(10,2) as line_total
FROM staging.orders as o 

CROSS JOIN LATERAL FLATTEN(
    INPUT => o.order_data:items
) as i ; 

SELECT
object_keys(o.order_data) as keys 
FROM staging.orders as o; 


/*
[
  "discounts",
  "items",
  "order_details",
  "payment",
  "shipping"
]

{
  "discounts": [
    {
      "applied_amount": 10,
      "code": "SAVE10X",
      "type": "fixed_amount",
      "value": 10
    }
  ],
  "order_details": {
    "currency": "USD",
    "order_channel": "web",
    "order_date": "2025-10-22T01:28:00Z",
    "order_status": "pending"
  },
  "payment": {
    "amount_paid": 467.71,
    "billing_address": {
      "city": "New York",
      "country": "USA",
      "state": "NY",
      "street": "905 Sunset Rd",
      "zip": "86370"
    },
    "method": "paypal",
    "payment_status": "paid",
    "transaction_id": "TXN-1957346036"
  },
  "shipping": {
    "carrier": null,
    "cost": 0,
    "estimated_delivery": "2025-10-29",
    "method": "pickup",
    "shipping_address": {
      "city": "New York",
      "country": "USA",
      "state": "NY",
      "street": "905 Sunset Rd",
      "zip": "86370"
    },
    "tracking_number": null
  }
}

 */