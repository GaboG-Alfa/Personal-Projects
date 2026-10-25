Select *, date_add(orderDate,interval 1 year) as one_year_after,
date_sub(orderdate,interval 2 month) as two_months_ago
from orders