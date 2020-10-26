CREATE OR REPLACE FUNCTION getDate() RETURNS text AS 
$BODY$
BEGIN
RETURN CURRENT_TIMESTAMP;
END
$BODY$
LANGUAGE 'plpgsql' ;

----------------------


CREATE PROCEDURE num_mod(i INT)
    begin
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
				count(*)>1;
		select model_id from num_mod where model_id = i;
	end
-------------------------------