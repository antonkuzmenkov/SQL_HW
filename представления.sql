CREATE VIEW info_name
SELECT s.name nam, r.name namm
FROM SEGMENTS s, SEGMENT_REQUEST_RULES r
WHERE s.SEGMENT_REQUEST_RULE_ID = r.SEGMENT_REQUEST_RULE_ID

----------------------------

CREATE VIEW Sale_Amt_Avg
 SELECT s.name nam, count(s.name) na, r.name namm, count(r.name) naa
FROM SEGMENTS s, SEGMENT_REQUEST_RULES r
WHERE s.SEGMENT_REQUEST_RULE_ID = r.SEGMENT_REQUEST_RULE_ID
GROUP BY s.name , r.name

________________________________

# Проверка на дубликаты
CREATE VIEW dup AS
select
	model_id mod
	, model_group_id mod_gro
	, count(*) coun
from
	models
group by
	model_id
	, model_group_id
having
	count(*)>1

# Обьедиение сегмента и модели
------------------------------------
CREATE VIEW segin AS
select 
	s.name nam
	, m.name namm
from
	models m
	left join segmets s 
		on m.segment_id = s.segment_id
where segment_id not in(1,2)

# Обьединение и убираем null значения
---------------------------------------
CREATE VIEW namnull AS
select
	s.name nam
	, r.name namm
from
	segments s
	left join SEGMENT_REQUEST_RULES r
		on s.SEGMENT_REQUEST_RULES_id = r.SEGMENT_REQUEST_RULES_id
where
	r.name is not null