CREATE SEQUENCE request_id;

CREATE TABLE requests (
	id                IDENT NOT NULL,
	customer_id       IDENT NOT NULL,
	pet_id            IDENT NOT NULL,
	creation_time     TIMEVAL NOT NULL,
	modification_time TIMEVAL NOT NULL,
	expiration_time   TIMEVAL NOT NULL,
	start_date        DATE NOT NULL,
	start_after       TIME,
	start_before      TIME,
	end_date          DATE,
	end_after         TIME,
	end_before        TIME,
	duration          INTEGER,
	min_rating        SMALLINT,
	min_rank          SMALLINT,
	verified_only     BOOLEAN,
	status_id         IDENT NOT NULL,
	reason_id         IDENT,
	reason_comment    TEXT,

	CONSTRAINT requests_pkey
		PRIMARY KEY (id),
	CONSTRAINT requests_customer_id_fkey
		FOREIGN KEY (customer_id) REFERENCES users (id)
			ON UPDATE CASCADE
			ON DELETE RESTRICT,
	CONSTRAINT requests_modification_time_chk
		CHECK (modification_time >= creation_time),
	CONSTRAINT requests_expiration_time_chk
		CHECK (expiration_time >= creation_time),
	CONSTRAINT requests_end_date_chk
		CHECK ((end_date IS NULL) OR (end_date >= start_date)),
	CONSTRAINT requests_start_time_chk
		CHECK ((start_after IS NULL) OR (start_before IS NULL) OR (start_after <= start_before)),
	CONSTRAINT requests_end_time_chk
		CHECK ((end_after IS NULL) OR (end_before IS NULL) OR (end_after <= end_before))
);

COMMENT ON TABLE requests IS 'Requests';
COMMENT ON SEQUENCE request_id IS 'Request identifiers';

COMMENT ON COLUMN requests.id                IS 'Unique identifier';
COMMENT ON COLUMN requests.customer_id       IS 'Customer identifier';
COMMENT ON COLUMN requests.pet_id            IS 'Pet identifier';
COMMENT ON COLUMM requests.creation_time     IS 'Creation timestamp (UTC)';
COMMENT ON COLUMN requests.modification_time IS 'Last modification timestamp (UTC)';
COMMENT ON COLUMN requests.expiration_time   IS 'Expiration timestamp (UTC)';
COMMENT ON COLUMN requests.start_date        IS 'Start date';
COMMENT ON COLUMN requests.start_after       IS 'Minimum start time';
COMMENT ON COLUMN requests.start_before      IS 'Maximum start time';
COMMENT ON COLUMN requests.end_date          IS 'End date';
COMMENT ON COLUMN requests.end_after         IS 'Minimum end time';
COMMENT ON COLUMN requests.end_before        IS 'Maximum end time';
COMMENT ON COLUMN requests.duration          IS 'Duration (nights)';
COMMENT ON COLUMN requests.min_rating        IS 'Minimum executor rating';
COMMENT ON COLUMN requests.min_rank          IS 'Minimum executor rank';
COMMENT ON COLUMN requests.verified_only     IS 'Required verification flag';
COMMENT ON COLUMN requests.status_id         IS 'Status identifiers';
COMMENT ON COLUMN requests.reason_id         IS 'Blocking reason identifiers';
COMMENT ON COLUMN requests.reason_comment    IS 'Blocking reason description';
