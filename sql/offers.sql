CREATE SEQUENCE offer_id;

CREATE TABLE offers (
	id IDENT NOT NULL,
	request_id        IDENT NOT NULL,
	executor_id       IDENT NOT NULL,
	employee_id       IDENT NOT NULL,
	creation_time     TIMEVAL NOT NULL,
	modification_time TIMEVAL NOT NULL,
	expiration_time   TIMEVAL NOT NULL,
	cost              MONEY,
	currency_id       IDENT,
	description       TEXT,
	status_id         IDENT NOT NULL,

	CONSTRAINT offers_pkey
		PRIMARY KEY (id),
	CONSTRAINT offers_request_id_fkey
		FOREIGN KEY (request_id) REFERENCES requests (id)
			ON UPDATE CASCADE
			ON DELETE RESTRICT,
	CONSTRAINT offers_executor_id_fkey
		FOREIGN KEY (executor_id) REFERENCES executors (id)
			ON UPDATE CASCADE
			ON DELETE CASCADE,
	CONSTRAINT offers_employee_id_fkey
		FOREIGN KEY (employee_id) REFERENCES users (id)
			ON UPDATE CASCADE
			ON DELETE RESTRICT,
	CONSTRAINT offers_currency_id_fkey
		FOREIGN KEY (currency_id) REFERENCES currencies (id)
			ON UPDATE CASCADE
			ON DELETE RESTRICT,
	CONSTRAINT offers_modification_time_chk
		CHECK (modification_time >= creation_time),
	CONSTRAINT offers_expiration_time_chk
		CHECK (expiration_time >= creation_time)
);

COMMENT ON TABLE offers IS 'Offers';
COMMENT ON SEQUENCE offer_id IS 'Offer identifiers';

COMMENT ON COLUMN offers.id                IS 'Unique identifier';
COMMENT ON COLUMN offers.request_id        IS 'Request identifier';
COMMENT ON COLUMN offers.executor_id       IS 'Executor identifier';
COMMENT ON COLUMN offers.employee_id       IS 'Executor employee identifier';
COMMENT ON COLUMN offers.creation_time     IS 'Creation timestamp (UTC)';
COMMENT ON COLUMN offers.modification_time IS 'Last modification timestamp (UTC)';
COMMENT ON COLUMN offers.expiration_time   IS 'Expiration timestamp (UTC)';
COMMENT ON COLUMN offers.cost              IS 'Cost';
COMMENT ON COLUMN offers.currency_id       IS 'Currency identifier';
COMMENT ON COLUMN offers.description       IS 'Short description';
COMMENT ON COLUMN offers.status_id         IS 'Status identifier';
