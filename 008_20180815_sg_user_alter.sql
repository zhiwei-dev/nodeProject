use sg_user;

DROP PROCEDURE IF EXISTS schema_xixin_change_ENTERPRISE_SWITCH;

CREATE PROCEDURE schema_xixin_change_ENTERPRISE_SWITCH ()
BEGIN

DECLARE CurrentDatabase VARCHAR (100) ; 
SELECT
	DATABASE () INTO CurrentDatabase ;
IF NOT EXISTS (
	SELECT	* FROM	information_schema.COLUMNS
	WHERE
		TABLE_SCHEMA = CurrentDatabase
	AND table_name = 'user_desc'
	AND column_name = 'ENTERPRISE_SWITCH') 
THEN
	ALTER TABLE user_desc  add ENTERPRISE_SWITCH char(1) DEFAULT '0' COMMENT '是否显示全部信息(0:不显示1:显示)';
END IF;
END;

CALL schema_xixin_change_ENTERPRISE_SWITCH ();


