ALTER TABLE  #__sh_ldap_config 
	ADD  checked_out INT UNSIGNED NOT NULL DEFAULT  0,
	ADD  checked_out_time timestamp NOT NULL DEFAULT '1970-01-01 00:00:00'::timestamp;

