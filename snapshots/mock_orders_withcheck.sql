{% snapshot mock_orders_withcheck()%}
{% set new_schema='demo_schema_snapshot'%}
{{
    
    config(
       
        target_database='demo',
        target_schema=new_schema,
        unique_key='order_id',
        strategy='check',   
        check_cols=['product_defective','status','updated_at']


    )
}}
    select * from  demo.demo_schema.amortan_mock_orders

{% endsnapshot%}