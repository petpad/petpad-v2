CREATE SEQUENCE pet_id;

CREATE TABLE pets (
	id                IDENT NOT NULL,
	owner_id          IDENT NOT NULL,
	creation_time     TIMEVAL NOT NULL,
	modification_time TIMEVAL NOT NULL,
	status_id         IDENT NOT NULL,
	name              TEXT,
	avatar_id         IDENT,
	type_id           IDENT NOT NULL,
	size_id           IDENT NOT NULL,
	gender            ENUM('M', 'F'),
	sterile           BOOLEAN,
	birth_date        DATE,
	description       TEXT,
	rules             TEXT,

	CONSTRAINT pets_pkey
		PRIMARY KEY (id),
	CONSTRAINT pets_owner_id_fkey
		FOREIGN KEY (owner_id) REFERENCES users (id)
			ON UPDATE CASCADE
			ON DELETE CASCADE,
	CONSTRAINT pets_status_id_fkey
		FOREIGN KEY (status_id) REFERENCES account_statuses (id)
			ON UPDATE CASCADE
			ON DELETE RESTRICT,
	CONSTRAINT pets_modification_time_chk
		CHECK (modification_time >= creation_time)
);

COMMENT ON TABLE pets IS 'Pets';
COMMENT ON SEQUENCE pet_id IS 'Pet identifiers';

COMMENT ON COLUMN pets.id                IS 'Unique identifier';
COMMENT ON COLUMN pets.owner_id          IS 'Owner identifier';
COMMENT ON COLUMN pets.creation_time     IS 'Creation timestamp (UTC)';
COMMENT ON COLUMN pets.modification_time IS 'Last modification timestamp (UTC)';
COMMENT ON COLUMN pets.status_id         IS 'Status identifier';
COMMENT ON COLUMN pets.name              IS 'Name';
COMMENT ON COLUMN pets.avatar_id         IS 'Avatar image identifier';
COMMENT ON COLUMN pets.type_id           IS 'Type identifier';
COMMENT ON COLUMN pets.size_id           IS 'Size identifier';
COMMENT ON COLUMN pets.gender            IS 'Gender';
COMMENT ON COLUMN pets.sterile           IS 'Sterile flag';
COMMENT ON COLUMN pets.birth_date        IS 'Birth date';
COMMENT ON COLUMN pets.description       IS 'Short description';
COMMENT ON COLUMN pets.rules             IS 'Keeping rules';
