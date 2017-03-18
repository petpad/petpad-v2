CREATE SEQUENCE currency_id;

CREATE TABLE currencies (
	id          IDENT NOT NULL DEFAULT NEXTVAL('currency_id'),
	iso_alpha   CHARACTER (3) NOT NULL,
	iso_numeric NUMERIC (3, 3),
	precision   SMALLINT,
	priority    SMALLINT NOT NULL DEFAULT 1,
	name        TEXT,

	CONSTRAINT currencies_pkey
		PRIMARY KEY (id),
	CONSTRAINT currencies_iso_alpha_unq
		UNIQUE (iso_alpha),
	CONSTRAINT currencies_iso_numeric_unq
		UNIQUE (iso_numeric)
);

COMMENT ON TABLE currencies IS 'Currencies';
COMMENT ON SEQUENCE currency_id IS 'Currency identifiers';

COMMENT ON COLUMN currencies.id          IS 'Unique identifier';
COMMENT ON COLUMN currencies.iso_alpha   IS 'ISO 4217 letter code';
COMMENT ON COLUMN currencies.iso_numeric IS 'ISO 4217 numeric code';
COMMENT ON COLUMN currencies.precision   IS 'Precision';
COMMENT ON COLUMN currencies.priority    IS 'Priority';
COMMENT ON COLUMN currencies.name        IS 'Name';

INSERT INTO currencies
	(iso_alpha, iso_numeric, precision, priority, name)
VALUES
	('RUB', 643, 2, 1, 'Russian ruble'),
	('XXX', 999, 2, 0, 'No currency');
