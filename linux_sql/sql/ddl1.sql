#!/bin/bash -x
CREATE TABLE IF NOT EXISTS PUBLIC.host_info
(
	id SERIAL NOT NULL ,
	host_name VARCHAR(40) NOT NULL,
	cpu_number INTEGER NOT NULL,
	cpu_architecture VARCHAR(15) NOT NULL,
	cpu_model VARCHAR(40) NOT NULL,
	cpu_mhz REAL NOT NULL,
	L2_cache SMALLINT NOT NULL,
	total_mem INTEGER NOT NULL,
	timestamp TIMESTAMP NOT NULL,
	CONSTRAINT host_agent_PK PRIMARY KEY(id),
	CONSTRAINT host_agent_u UNIQUE(host_name)
);
INSERT INTO PUBLIC.host_info
( host_name, cpu_number, cpu_architecture, cpu_model, cpu_mhz, L2_cache, total_mem, timestamp )
  VALUES
( 'spry-framework-236416.internal', 1, 'x86_64', 'Intel(R) Xeon(R) CPU @ 2.30GHZ', 2300.000, 256, 601324, '2019-05-29 17:49:53');

CREATE TABLE IF NOT EXISTS PUBLIC.host_usage
(
	timestamp TIMESTAMP NOT NULL,
	host_id INTEGER NOT NULL,
	memory_free SMALLINT NOT NuLL,
	cpu_idle SMALLINT NOT NuLL,
	cpu_kernel REAL NOT NuLL,
	disk_io SMALLINT NOT NULL,
	disk_available INTEGER NOT NULL,
	CONSTRAINT host_usage PRIMARY KEY(timestamp, host_id),
	CONSTRAINT host_usage_host_info_FK FOREIGN KEY(host_id) REFERENCES host_info(id)
);

INSERT INTO PUBLIC.host_usage1
VALUES
('2019-05-29 16:53:28', 1, 256, 95, 0, 0, 31200);
## c'est fini





