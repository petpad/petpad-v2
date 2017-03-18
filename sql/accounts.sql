CREATE SEQUENCE account_id;

CREATE TABLE accounts (
	id          IDENT NOT NULL,
	executor_id IDENT,
	currency_id IDENT NOT NULL,
	cur_balance MONEY NOT NULL DEFAULT 0,
	min_balance MONEY NOT NULL DEFAULT 0,
	status_id   IDENT NOT NULL,

	CONSTRAINT accounts_pkey
		PRIMARY KEY (id),
	CONSTRAINT accounts_executor_id_fkey
		FOREIGN KEY (executor_id) REFERENCES executors (id)
			ON UPDATE CASCADE
			ON DELETE CASCADE,
	CONSTRAINT accounts_currency_id_fkey
		FOREIGN KEY (currency_id) REFERENCES currencies (id)
			ON UPDATE CASCADE
			ON DELETE RESTRICT
);

COMMENT ON TABLE accounts IS 'Accounts';
COMMENT ON SEQUENCE account_id IS 'Account identifiers';

COMMENT ON COLUMN accounts.id          IS 'Unique identifier';
COMMENT ON COLUMN accounts.executor_id IS 'Executor identifier';
COMMENT ON COLUMN accounts.currency_id IS 'Currency identifier';
COMMENT ON COLUMN accounts.cur_balance IS 'Current balance';
COMMENT ON COLUMN accounts.min_balance IS 'Minumum balance';
COMMENT ON COLUMN accounts.status_id   IS 'Status identifier';
