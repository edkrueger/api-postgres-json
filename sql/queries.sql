select
	business_info -> 'id' as id,
	business_info -> 'name' as name,
	business_info -> 'alias' as alias,
	business_info -> 'categories' -> 0 -> 'alias'  as category_0,
	business_info -> 'categories' -> 1 -> 'alias'  as category_1,
	business_info -> 'categories' -> 2 -> 'alias'  as category_2,
	business_info -> 'categories' -> 3 -> 'alias'  as category_3,
	business_info
from
	business