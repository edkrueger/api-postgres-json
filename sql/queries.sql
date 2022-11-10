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
with text_cte as (
select
	business_id,
	review_info ->> 'text' as text
from
	review),
	agg_text_cte as (
select
	business_id,
	string_agg(text, ' ') as text
from
	text_cte
group by
	business_id
	)
	select
	b.id,
	b.business_info ->> 'name' as name,
	text
from
	agg_text_cte t
join business b
	on
	b.id = t.business_id
where
	text ilike '%parking%'