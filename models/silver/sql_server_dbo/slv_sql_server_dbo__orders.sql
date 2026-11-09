--SILVER ORDERS 


with source as (
    select * from {{ source('sql_server_dbo', 'orders') }}
),

renamed as (
    select
          order_id
        , user_id
        , address_id
        , promo_id
        , created_at                               as created_at_utc
        , estimated_delivery_at 
        , delivered_at
        , tracking_id
        , shipping_service 
        , shipping_cost
        , order_cost 
        , order_total 
        , status 
        , coalesce(_fivetran_deleted, false)       as is_deleted
        , _fivetran_synced                         as date_load
    from source
    where not is_deleted
    qualify row_number() over (partition by order_id order by date_load desc) = 1
)

select * from renamed
