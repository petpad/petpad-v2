CREATE TABLE content_statuses () INHERITS (statuses);

ALTER TABLE content_statuses
	ADD CONSTRAINT content_statuses_pkey
		PRIMARY KEY (id);
ALTER TABLE content_statuses
	ADD CONSTRAINT content_statuses_sid_unq
		UNIQUE (sid);

COMMENT ON TABLE content_statuses IS 'Content statuses';

CREATE FUNCTION content_status(CODE) RETURNS IDENT AS $$
	SELECT id FROM content_statuses WHERE sid = $1;
$$ LANGUAGE SQL;

INSERT INTO content_statuses
	(id, sid, description)
VALUES
	(1, 'new',     'New'),
	(2, 'active',  'Active'),
	(3, 'blocked', 'Blocked'),
	(4, 'expired', 'Expired'),
	(5, 'deleted', 'Deleted');
