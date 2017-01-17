--
-- Table structure for table `jos_sh_ldap_config`
--
CREATE TABLE #__sh_ldap_config (
  id serial NOT NULL,
  name varchar(45) NOT NULL,
  enabled smallint NOT NULL DEFAULT 1,
  ordering int DEFAULT 0,
  params text NOT NULL,
  checked_out int NOT NULL DEFAULT 0,
  checked_out_time timestamp NOT NULL DEFAULT '1970-01-01 00:00:00'::timestamp,
  PRIMARY KEY (id)
);

create unique index uk_name_ldap_config on #__sh_ldap_config (name);
--
-- LDAP default table data for `jos_sh_config`
--
delete from #__sh_config where name in ('ldap:version', 'ldap:source', 'ldap:plugin', 'user:type');

insert INTO #__sh_config (name, value) values('ldap:version', '2.0.0.0');

insert INTO #__sh_config (name, value) values('ldap:source', '1');

insert INTO #__sh_config (name, value) values('ldap:plugin', 'ldap');

insert INTO #__sh_config (name, value) values('user:type', 'ldap');

