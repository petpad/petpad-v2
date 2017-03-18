CREATE SEQUENCE pet_size_id;

CREATE TABLE pet_sizes (
	id IDENT NOT NULL,
	type_id IDENT NOT NULL,
	name TEXT NOT NULL,
	position INTEGER NOT NULL DEFAULT 0,
	description TEXT,

	CONSTRAINT pet_sizes_pkey
		PRIMARY KEY (id),
	CONSTRAINT pet_sizes_name_unq
		UNIQUE (type_id, name),
	CONSTRAINT pet_sizes_type_id_fkey
		FOREIGN KEY (type_id) REFERENCES pet_types (id)
			ON UPDATE CASCADE
			ON DELETE CASCADE
);

COMMENT ON TABLE pet_sizes IS 'Pet sizes';
COMMENT ON SEQUENCE pet_size_id IS 'Pet size identifiers';

COMMENT ON COLUMN pet_sizes.id          IS 'Unique identifier';
COMMENT ON COLUMN pet_sizes.type_id     IS 'Pet type identifier';
COMMENT ON COLUMN pet_sizes.name        IS 'Name';
COMMENT ON COLUMN pet_sizes.position    IS 'Position';
COMMENT ON COLUMN pet_sizes.description IS 'Short description';
