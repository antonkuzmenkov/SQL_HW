CREATE OR REPLACE FUNCTION getDate() RETURNS text AS 
$BODY$
BEGIN
RETURN CURRENT_TIMESTAMP;
END
$BODY$
LANGUAGE 'plpgsql' ;