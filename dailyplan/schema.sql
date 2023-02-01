DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS task;

CREATE TABLE user (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	name VARCHAR(40) NOT NULL,
	email VARCHAR(120) UNIQUE NOT NULL,
	password_hash VARCHAR(128) NOT NULL,
	date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	last_login TIMESTAMP,
	timezone VARCHAR(40)
);

CREATE TABLE task (
	id INTEGER PRIMARY KEY AUTOINCREMENT,
	user_id INTEGER NOT NULL,
	created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	task_text VARCHAR(128) NOT NULL,
	completed BOOLEAN NOT NULL DEFAULT FALSE,
	due_date TIMESTAMP NOT NULL,
	FOREIGN KEY (user_id) REFERENCES user (id)
);