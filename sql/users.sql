CREATE SEQUENCE user_id;

CREATE TABLE users (
	id                IDENT NOT NULL,
	creation_time     TIMEVAL NOT NULL,
	modification_time TIMEVAL NOT NULL.
	email             TEXT NOT NULL,
	email_key         CODE,
	phone             NUMERIC (10, 0),
	phone_key         NUMERIC (5, 0),
	password          CHARACTER VARYING (64),
	family_name       TEXT,
	other_names       TEXT,
	avatar_id         IDENT,
	location_id       IDENT,
	executor_id       IDENT,
	role_id           IDENT,
	status_id         IDENT,
	reason_id         IDENT,
	reason_comment    TEXT,

	CONSTRAINT users_pkey
		PRIMARY KEY (id),
	CONSTRAINT users_executor_id_fkey
		FOREIGN KEY (executor_id) REFERENCES executors (id)
			ON UPDATE CASCADE
			ON DELETE SET NULL,
	CONSTRAINT users_status_id_fkey
		FOREIGN KEY (status_id) REFERENCES account_statuses (id)
			ON UPDATE CASCADE
			ON DELETE RESTRICT,
	CONSTRAINT users_modification_time_chk
		CHECK (modification_time >= creation_time)
);

COMMENT ON TABLE users IS 'Users';
COMMENT ON SEQUENCE user_id IS 'User identifiers';

COMMENT ON COLUMN users.id                IS 'Unique identifier';
COMMENT ON COLUMN users.creation_time     IS 'Creation timestamp (UTC)';
COMMENT ON COLUMN users.modification_time IS 'Last modification timestamp (UTC)';
COMMENT ON COLUMN users.email             IS 'E-mail address';
COMMENT ON COLUMN users.email_key         IS 'E-mail address verification key';
COMMENT ON COLUMN users.phone             IS 'Phone number';
COMMENT ON COLUMN users.phone_key         IS 'Phone number verification key';
COMMENT ON COLUMN users.password          IS 'Password hash (SHA-256, hex)';
COMMENT ON COLUMN users.family_name       IS 'Family name';
COMMENT ON COLUMN users.other_names       IS 'Other names';
COMMENT ON COLUMN users.avatar_id         IS 'Avatar image identifier';
COMMENT ON COLUMN users.location_id       IS 'Location identifier';
COMMENT ON COLUMN users.executor_id       IS 'Executor identifier';
COMMENT ON COLUMN users.role_id           IS 'Role identifier';
COMMENT ON COLUMN users.status_id         IS 'Status identifier';
COMMENT ON COLUMN users.reason_id         IS 'Blocking reason identifier';
COMMENT ON COLUMN users.blocking_comment  IS 'Blocking reason description';
