CREATE SEQUENCE location_id;

CREATE TABLE locations (
	id        IDENT NOT NULL,
	parent_id IDENT,
	name      TEXT NOT NULL,

	CONSTRAINT locations_pkey
		PRIMARY KEY (id),
	CONSTRAINT locations_parent_id_fkey
		FOREIGN KEY (parent_id) REFERENCES locations (id)
			ON UPDATE CASCADE
			ON DELETE RESTRICT
);

CREATE UNIQUE INDEX locations_name_unq1 ON locations (name) WHERE parent_id IS NULL;
CREATE UNIQUE INDEX locations_name_unq2 ON locations (parent_id, name) WHERE parent_id IS NOT NULL;

COMMENT ON TABLE locations IS 'Locations';
COMMENT ON SEQUENCE location_id IS 'Location identifiers';

COMMENT ON COLUMN locations.id        IS 'Unique identifier';
COMMENT ON COLUMN locations.parent_id IS 'Parent identifier';
COMMENT ON COLUMN locations.name      IS 'Name';
