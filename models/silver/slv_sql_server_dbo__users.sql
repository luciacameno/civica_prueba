
with source as (
    select * from {{ ref('stg_sql_server_dbo__users') }}
),

renamed as (
    select
          user_id
        , first_name
        , last_name
        , email 
        , phone_number 
        , address_id
        , created_at_utc                             
        , updated_at
        --, is_deleted
        , date_load

        from source
        where not is_deleted
    qualify row_number() over (partition by user_id order by date_load desc) = 1

    
)

select * from renamed



