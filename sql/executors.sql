CREATE SEQUENCE executor_id;

CREATE TABLE executors (
	id                IDENT NOT NULL,
	creation_time     TIMEVAL NOT NULL,
	modification_time TIMEVAL NOT NULL,
	status_id         IDENT NOT NULL,
	reason_id         IDENT NOT NULL,
	reason_comment    TEXT,
	name              TEXT,
	title             TEXT,
	avatar_id         IDENT,
	principles        TEXT,
	conditions        TEXT,
	pets              TEXT,
	verified          BOOLEAN NOT NULL,
	veterinary        BOOLEAN NOT NULL,
	apartment_type_id IDENT,
	apartment_rank    SMALLINT,
	ext_profile_url   TEXT,
	location_id       IDENT NOT NULL,
	location_coords   EARTH NOT NULL,
	address           TEXT NOT NULL,
	station_id        IDENT,
	legal_type_id     IDENT NOT NULL,
	legal_name        TEXT,
	legal_agent_name  TEXT,
	legal_agent_role  TEXT,
	legal_basis_id    IDENT,
	legal_basis_ref   TEXT,
	legal_basis_date  DATE,
	legal_address     TEXT,

	CONSTRAINT executors_pkey
		PRIMARY KEY (id),
	CONSTRAINT executors_status_id_fkey
		FOREIGN KEY (status_id) REFERENCES account_statuses (id)
			ON UPDATE CASCADE
			ON DELETE RESTRICT,
	CONSTRAINT executors_modification_time_chk
		CHECK (modification_time >= creation_time)
);

COMMENT ON TABLE executors IS 'Executors';
COMMENT ON SEQUENCE executor_id IS 'Executor identifiers';

COMMENT ON COLUMN executors.id                IS 'Unique identifier';
COMMENT ON COLUMN executors.creation_time     IS 'Creation timestamp (UTC)';
COMMENT ON COLUMN executors.modification_time IS 'Last modification timestamp (UTC)';
COMMENT ON COLUMN executors.status_id         IS 'Status identifier';
COMMENT ON COLUMN executors.reason_id         IS 'Blocking reason identifier';
COMMENT ON COLUMN executors.reason_comment    IS 'Blocking reason description';
COMMENT ON COLUMN executors.name              IS 'Name';
COMMENT ON COLUMN executors.title             IS 'Profile title';
COMMENT ON COLUMN executors.avatar_id         IS 'Avatar image identifier';
COMMENT ON COLUMN executors.principles        IS 'Principles information';
COMMENT ON COLUMN executors.conditions        IS 'Conditions information';
COMMENT ON COLUMN executors.pets              IS 'Pets information';
COMMENT ON COLUMN executors.verified          IS 'Verification flag';
COMMENT ON COLUMN executors.veterinary        IS 'Veterinary flag';
COMMENT ON COLUMN executors.apartment_type_id IS 'Apartment type identifier';
COMMENT ON COLUMN executors.apartment_rank    IS 'Apartment rank';
COMMENT ON COLUMN executors.ext_profile_url   IS 'External profile URL';
COMMENT ON COLUMN executors.location_id       IS 'Location identifier';
COMMENT ON COLUMN executors.location_coords   IS 'Location coordinates';
COMMENT ON COLUMN executors.address           IS 'Address';
COMMENT ON COLUMN executors.station_id        IS 'Transport station identifier';
COMMENT ON COLUMN executors.legal_type_id     IS 'Legal type identifiers';
COMMENT ON COLUMN executors.legal_name        IS 'Legal name';
COMMENT ON COLUMN executors.legal_agent_name  IS 'Legal agent name';
COMMENT ON COLUMN executors.legal_agent_role  IS 'Legal agent role';
COMMENT ON COLUMN executors.legal_basis_id    IS 'Legal basis type identifier';
COMMENT ON COLUMN executors.legal_basis_ref   IS 'Legal basis reference number';
COMMENT ON COLUMN executors.legal_basis_date  IS 'Legal basis date';
COMMENT ON COLUMN executors.legal_address     IS 'Legal address';

CREATE TABLE executor_stats (
	executor_id   IDENT NOT NULL,
	rating        FLOAT,
	order_count   INTEGER NOT NULL DEFAULT 0,
	reorder_count INTEGER NOT NULL DEFAULT 0,
	report_count  INTEGER NOT NULL DEFAULT 0,

	CONSTRAINT executor_stats_pkey
		PRIMARY KEY (executor_id),
	CONSTRAINT executor_stats_executor_id_fkey
		FOREIGN KEY (executor_id) REFERENCES executors (id)
			ON UPDATE CASCADE
			ON DELETE CASCADE
);

COMMENT ON TABLE executor_stats IS 'Executor statistics';

COMMENT ON COLUMN executor_stats.executor_id   IS 'Executor identifier';
COMMENT ON COLUMN executor_stats.rating        IS 'Rating';
COMMENT ON COLUMN executor_stats.order_count   IS 'Total order count';
COMMENT ON COLUMN executor_stats.reorder_count IS 'Repeated order count';
COMMENT ON COLUMN executor_stats.report_count  IS 'Report count';
