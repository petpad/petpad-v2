CREATE TABLE account_statuses () INHERITS (statuses);

ALTER TABLE account_statuses
	ADD CONSTRAINT account_statuses_pkey
		PRIMARY KEY (id);
ALTER TABLE account_statuses
	ADD CONSTRAINT account_statuses_sid_unq
		UNIQUE (sid);

COMMENT ON TABLE account_statuses IS 'Account statuses';

CREATE FUNCTION account_status(CODE) RETURNS IDENT AS $$
	SELECT id FROM account_statuses WHERE sid = $1;
$$ LANGUAGE SQL;

INSERT INTO account_statuses
	(id, sid, description)
VALUES
	(1, 'new',     'New'),
	(2, 'active',  'Active'),
	(3, 'hidden',  'Hidden'),
	(4, 'blocked', 'Blocked'),
	(5, 'deleted', 'Deleted');
