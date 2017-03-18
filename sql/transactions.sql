CREATE SEQUENCE transaction_id;

CREATE TABLE transactions (
	id                 IDENT NOT NULL,
	account_id         IDENT NOT NULL,
	creation_time      TIMEVAL NOT NULL,
	completion_time    TIMEVAL NOT NULL,
	order_id           IDENT NOT NULL,
	currency_id        IDENT NOT NULL,
	amount             MONEY NOT NULL,
	reference_id       IDENT NOT NULL,
	status_id          IDENT NOT NULL,
	ext_system_id      IDENT,
	ext_transaction_id TEXT,
	ext_status_code    TEXT,
	ext_status_message TEXT,
	description        TEXT,

	CONSTRAINT transactions_pkey
		PRIMARY KEY (id),
	CONSTRAINT transactions_accounts_id_fkey
		FOREIGN KEY (account_id) REFERENCES accounts (id)
			ON UPDATE CASCADE
			ON DELETE CASCADE,
	CONSTRAINT transactions_currency_id_fkey
		FOREIGN KEY (currency_id) REFERENCES currencies (id)
			ON UPDATE CASCADE
			ON DELETE RESTRICT,
	CONSTRAINT transactions_reference_id_fkey
		FOREIGN KEY (reference_id) REFERENCES transactions (id)
			ON UPDATE CASCADE
			ON DELETE CASCADE
			DEFERRABLE INITIALLY DEFERRED,
	CONSTRAINT transactions_status_id_fkey
		FOREIGN KEY (status_id) REFERENCES transaction_statuses (id)
			ON UPDATE CASCADE
			ON DELETE RESTRICT,
	CONSTRAINT transactions_completion_time_chk
		CHECK (completion_time >= creation_time)
);

COMMENT ON TABLE transactions IS 'Transactions';
COMMENT ON SEQUENCE transaction_id IS 'Transaction identifiers';

COMMENT ON COLUMN transactions.id                 IS 'Unique identifier';
COMMENT ON COLUMN transactions.account_id         IS 'Account identifier';
COMMENT ON COLUMN transactions.creation_time      IS 'Creation timestamp (UTC)';
COMMENT ON COLUMN transactions.completion_time    IS 'Completion timestamp (UTC)';
COMMENT ON COLUMN transactions.order_id           IS 'Order identifier';
COMMENT ON COLUMN transactions.currency_id        IS 'Currency identifier';
COMMENT ON COLUMN transactions.amount             IS 'Amount';
COMMENT ON COLUMN transactions.reference_id       IS 'Paired transaction identifier';
COMMENT ON COLUMN transactions.status_id          IS 'Status identifier';
COMMENT ON COLUMN transactions.ext_system_id      IS 'External system identifier';
COMMENT ON COLUMN transactions.ext_transaction_id IS 'External transaction identifier';
COMMENT ON COLUMN transactions.ext_status_code    IS 'External status code';
COMMENT ON COLUMN transactions.ext_status_message IS 'External status message';
COMMENT ON COLUMN transactions.description        IS 'Short description';
