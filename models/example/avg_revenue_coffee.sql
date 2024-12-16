select coffee_name, sum(money) as revenue
from {{ source ('coffee_dataset', 'coffee_table')}}
group by coffee_name