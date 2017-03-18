CREATE TABLE transaction_statuses () INHERITS (statuses);

ALTER TABLE transaction_statuses
	CONSTRAINT transaction_statuses_pkey
		PRIMARY KEY (id);
ALTER TABLE transaction_statuses
	CONSTRAINT transaction_statuses_sid_unq
		UNIQUE (sid);

COMMENT ON TABLE transaction_statuses IS 'Transaction statuses';

CREATE FUNCTION transaction_status(CODE) RETURNS IDENT AS $$
	SELECT id FROM transaction_statuses WHERE sid = $1;
$$ LANGUAGE SQL;

INSERT INTO transaction_statuses
	(id, sid, description)
VALUES
	(1, 'new',        'New'),
	(2, 'confirmed',  'Confirmed'),
	(3, 'failed',     'Failed'),
	(4, 'expired',    'Expired'),
	(5, 'cancelled',  'Cancelled');
