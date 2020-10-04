CREATE VIEW info_name
AS SELECT s.name, r.name
FROM SEGMENTS s, SEGMENT_REQUEST_RULES r
WHERE s.SEGMENT_REQUEST_RULE_ID = r.SEGMENT_REQUEST_RULE_ID

----------------------------

CREATE VIEW Sale_Amt_Avg
as SELECT s.name, count(s.name), r.name, count(r.name)
FROM SEGMENTS s, SEGMENT_REQUEST_RULES r
WHERE s.SEGMENT_REQUEST_RULE_ID = r.SEGMENT_REQUEST_RULE_ID
GROUP BY s.name, r.name