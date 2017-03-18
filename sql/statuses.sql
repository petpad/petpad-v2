CREATE TABLE statuses (
	id          IDENT NOT NULL,
	sid         IDENT NOT NULL,
	description TEXT
);

COMMENT ON COLUMN statuses.id          IS 'Unique identifier';
COMMENT ON COLUMN statuses.sid         IS 'Unique string identifier';
COMMENT ON COLUMN statuses.description IS 'Short description';
