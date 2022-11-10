-- query business info
select
	business_info ->> 'id' as id,
	business_info ->> 'name' as name,
	business_info ->> 'alias' as alias,
	business_info -> 'categories' -> 0 ->> 'alias'  as category_0,
	business_info -> 'categories' -> 1 ->> 'alias'  as category_1,
	business_info -> 'categories' -> 2 ->> 'alias'  as category_2,
	business_info -> 'categories' -> 3 ->> 'alias'  as category_3,
	business_info
from
	business

-- a quick look at parking
with review_text_cte as (
select
	business_id,
	review_info ->> 'text' as review_text
from
	review r)
select
	business_id,
	review_text
from
	review_text_cte
where
	review_text ilike '%parking%'