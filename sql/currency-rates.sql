CREATE TABLE currency_rates (
	base_id    IDENT NOT NULL,
	counter_id IDENT NOT NULL,
	valid_from DATE,
	valid_till DATE,
	rate       MONEY NOT NULL,

	CONSTRAINT currency_rates_pkey
		PRIMARY KEY (base_id, counter_id, valid_from, valid_till),
	CONSTRAINT currency_rates_dates_chk
		CHECK ((valid_from IS NULL) OR (valid_till IS NULL) OR (valid_from <= valid_till))
);

COMMENT ON TABLE currency_rates IS 'Currency rates';

COMMENT ON COLUMN currency_rates.base_id    IS 'Base currency identifier';
COMMENT ON COLUMN currency_rates.counter_id IS 'Counter currency identifier';
COMMENT ON COLUMN currency_rates.valid_from IS 'Valid from date';
COMMENT ON COLUMN currency_rates.valid_till IS 'Valid till date';
COMMENT ON COLUMN currency_rates.rate       IS 'Rate';
