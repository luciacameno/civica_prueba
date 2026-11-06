-- =============================================================================
-- fct_orders
-- =============================================================================
-- Hechos de pedidos. Grano: una fila por pedido.
-- =============================================================================

with orders as (
    select * from {{ ref('int_orders__enriched') }} -- O 'gold_orders__enriched' según el nombre que uses
),

final as (
    select
          order_id
        , user_id
        , address_id
        , promo_id
        , order_status
        , shipping_service
        , tracking_id
        , item_order_cost_usd
        , shipping_cost_usd
        , total_order_cost_usd
        , discount_usd
        , total_order_cost_usd - discount_usd       as net_order_cost_usd
        , created_at_utc                            as order_created_at_utc
        , estimated_delivery_at
        , delivered_at
        , days_to_deliver
        , date_load
    from orders
)

select * from final