{% snapshot mock_orders()%}
{% set new_schema='demo_schema_snapshot'%}
{{
    
    config(
        target_database='demo',
        target_schema=new_schema,
        unique_key='order_id',

        strategy='timestamp',
        updated_at='updated_at'


    )
}}
    select * from  demo.demo_schema.amortan_mock_orders

{% endsnapshot%}