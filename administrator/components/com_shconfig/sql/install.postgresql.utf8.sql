--
-- Table structure for table `jos_sh_config`
--

CREATE TABLE #__sh_config (
  id serial NOT NULL,
  name varchar(45) NOT NULL,
  value text DEFAULT NULL,
  PRIMARY KEY (id)
);
create unique index uk_name on #__sh_config (name)
;
--
-- Default table data for `jos_sh_config`
--
delete from #__sh_config where name in('platform:version', 'platform:import', 'user:autoregister', 'user:defaultgroup', 'user:type');

insert INTO #__sh_config (name, value) values ('platform:version', '2.0.0.0');

insert INTO #__sh_config (name, value) values ('platform:import', '{}');

insert INTO #__sh_config (name, value) values ('user:autoregister', '2');

insert INTO #__sh_config (name, value) values ('user:defaultgroup', '2');

insert INTO #__sh_config (name, value) values ('user:type', '');
