
{% set exclude_cols = ['event_id'] %}
with events as (
    select * from {{ ref('slv_sql_server_dbo__events') }}
),

final as (
    select
        {{ dbt_utils.star(from=ref('slv_sql_server_dbo__events'), except=exclude_cols) }}
    from events
)

select * from final