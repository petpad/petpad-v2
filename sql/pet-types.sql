CREATE SEQUENCE pet_type_id;

CREATE TABLE pet_types (
	id          IDENT NOT NULL DEFAULT NEXTVAL('pet_type_id'),
	parent_id   IDENT,
	sid         CODE NOT NULL,
	name        TEXT NOT NULL,
	position    INTEGER DEFAULT 0,
	size_id     IDENT,
	description TEXT,

	CONSTRAINT pet_types_pkey
		PRIMARY KEY (id),
	CONSTRAINT pet_types_sid_unq
		UNIQUE (sid),
	CONSTRAINT pet_types_parent_id_fkey
		FOREIGN KEY (parent_id) REFERENCES pet_types (id)
			ON UPDATE CASCADE
			ON DELETE CASCADE
);

CREATE UNIQUE INDEX pet_types_name_unq1 ON pet_types (name) WHERE parent_id IS NULL;
CREATE UNIQUE INDEX pet_types_name_unq2 ON pet_types (parent_id, name) WHERE parent_id IS NOT NULL;

COMMENT ON TABLE pet_types IS 'Pet types';
COMMENT ON SEQUENCE pet_type_id IS 'Pet type identifier';

COMMENT ON COLUMN pet_types.id          IS 'Unique identifier';
COMMENT ON COLUMN pet_types.parent_id   IS 'Parent identifier';
COMMENT ON COLUMN pet_types.name        IS 'Name';
COMMENT ON COLUMN pet_types.position    IS 'Position';
COMMENT ON COLUMN pet_types.size_id     IS 'Default size identifiert';
COMMENT ON COLUMN pet_types.description IS 'Short description';

INSERT INTO pet_types
	(sid, name)
VALUES
	('dog', 'Dog'),
	('cat', 'Cat');
