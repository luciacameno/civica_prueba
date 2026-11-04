with orders as (
    SELECT * FROM {{ ref('slv_sql_server_dbo__orders') }} 
), users as (
     SELECT * FROM {{ ref('slv_sql_server_dbo__users')}}
), addresses as(
    SELECT * FROM  {{ ref('slv_sql_server_dbo__addresses')}}
)

FROM 
LEFT JOIN 