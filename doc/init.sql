CREATE TABLE sys_role
(
  id          SERIAL                                                NOT NULL
    CONSTRAINT sys_role_pkey
    PRIMARY KEY,
  describe    VARCHAR(100)                                          NOT NULL,
  create_time TIMESTAMP(6) WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
  update_time TIMESTAMP(6) WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
  role_name   VARCHAR(100)
);

COMMENT ON COLUMN sys_role.id IS '自增id';

COMMENT ON COLUMN sys_role.describe IS '角色描述';

COMMENT ON COLUMN sys_role.create_time IS '创建时间';

COMMENT ON COLUMN sys_role.update_time IS '更新时间';

COMMENT ON COLUMN sys_role.role_name IS '角色名称';


INSERT INTO sys_role ( describe, create_time, update_time, role_name) VALUES ('所有权限', '2019-05-15 03:25:07.078138', '2019-05-15 03:25:07.078138', '超级管理员');



CREATE TABLE sys_role_permission
(
  id            SERIAL NOT NULL
    CONSTRAINT sys_role_permission_pkey
    PRIMARY KEY,
  role_id       INTEGER,
  permission_id INTEGER
);

COMMENT ON COLUMN sys_role_permission.id IS '自增id';

COMMENT ON COLUMN sys_role_permission.role_id IS '角色id';

COMMENT ON COLUMN sys_role_permission.permission_id IS '权限id';

INSERT INTO sys_role_permission (role_id, permission_id) VALUES (1, 1);
INSERT INTO sys_role_permission (role_id, permission_id) VALUES (1, 2);
INSERT INTO sys_role_permission (role_id, permission_id) VALUES (1, 3);
INSERT INTO sys_role_permission (role_id, permission_id) VALUES (1, 4);
INSERT INTO sys_role_permission (role_id, permission_id) VALUES (1, 5);
INSERT INTO sys_role_permission (role_id, permission_id) VALUES (1, 6);
INSERT INTO sys_role_permission (role_id, permission_id) VALUES (1, 7);
INSERT INTO sys_role_permission (role_id, permission_id) VALUES (1, 8);
INSERT INTO sys_role_permission (role_id, permission_id) VALUES (1, 9);
INSERT INTO sys_role_permission (role_id, permission_id) VALUES (1, 10);
INSERT INTO sys_role_permission (role_id, permission_id) VALUES (1, 11);
INSERT INTO sys_role_permission (role_id, permission_id) VALUES (1, 12);
INSERT INTO sys_role_permission (role_id, permission_id) VALUES (1, 13);
INSERT INTO sys_role_permission (role_id, permission_id) VALUES (1, 14);
INSERT INTO sys_role_permission (role_id, permission_id) VALUES (1, 15);
INSERT INTO sys_role_permission (role_id, permission_id) VALUES (1, 16);
INSERT INTO sys_role_permission (role_id, permission_id) VALUES (1, 17);
INSERT INTO sys_role_permission (role_id, permission_id) VALUES (1, 18);
INSERT INTO sys_role_permission (role_id, permission_id) VALUES (1, 19);
INSERT INTO sys_role_permission (role_id, permission_id) VALUES (1, 20);
INSERT INTO sys_role_permission (role_id, permission_id) VALUES (1, 21);
INSERT INTO sys_role_permission (role_id, permission_id) VALUES (1, 22);
INSERT INTO sys_role_permission (role_id, permission_id) VALUES (1, 23);
INSERT INTO sys_role_permission (role_id, permission_id) VALUES (1, 24);
INSERT INTO sys_role_permission (role_id, permission_id) VALUES (1, 25);
INSERT INTO sys_role_permission (role_id, permission_id) VALUES (1, 26);
INSERT INTO sys_role_permission (role_id, permission_id) VALUES (1, 27);
INSERT INTO sys_role_permission (role_id, permission_id) VALUES (1, 28);
INSERT INTO sys_role_permission (role_id, permission_id) VALUES (1, 29);
INSERT INTO sys_role_permission (role_id, permission_id) VALUES (1, 30);
INSERT INTO sys_role_permission (role_id, permission_id) VALUES (1, 31);
INSERT INTO sys_role_permission (role_id, permission_id) VALUES (1, 32);


CREATE TABLE sys_permission
(
  id                 SERIAL                                                NOT NULL
    CONSTRAINT sys_permission_pkey
    PRIMARY KEY,
  url                VARCHAR(200)                                           NOT NULL,
  describe           VARCHAR(100)                                          NOT NULL,
  create_time        TIMESTAMP(6) WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
  update_time        TIMESTAMP(6) WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP NOT NULL,
  status             INTEGER DEFAULT 0,
  sub_permission_ids INTEGER [],
  navigation_flag    INTEGER DEFAULT 0
);

COMMENT ON COLUMN sys_permission.id IS '自增id';

COMMENT ON COLUMN sys_permission.url IS '权限地址';

COMMENT ON COLUMN sys_permission.describe IS '权限描述';

COMMENT ON COLUMN sys_permission.create_time IS '创建时间';

COMMENT ON COLUMN sys_permission.update_time IS '更新时间';

COMMENT ON COLUMN sys_permission.status IS '0:导航栏不显示,1:导航栏显示';

COMMENT ON COLUMN sys_permission.sub_permission_ids IS '子权限id列表';

COMMENT ON COLUMN sys_permission.navigation_flag IS '是否映射导航栏';

INSERT INTO sys_permission (id, url, describe, create_time, update_time, status, sub_permission_ids, navigation_flag) VALUES (1, '/qtalk_background_management/startalk/management/addUser/user', '', '2019-05-15 09:56:18.263012', '2019-05-15 09:56:18.263012', 1, null, 0);
INSERT INTO sys_permission (id, url, describe, create_time, update_time, status, sub_permission_ids, navigation_flag) VALUES (2, '/qtalk_background_management/startalk/management/download/template', '', '2019-05-15 09:56:18.308918', '2019-05-15 09:56:18.308918', 1, null, 0);
INSERT INTO sys_permission (id, url, describe, create_time, update_time, status, sub_permission_ids, navigation_flag) VALUES (3, '/qtalk_background_management/startalk/management/update/user', '', '2019-05-15 09:57:07.807083', '2019-05-15 09:57:07.807083', 1, null, 0);
INSERT INTO sys_permission (id, url, describe, create_time, update_time, status, sub_permission_ids, navigation_flag) VALUES (4, '/qtalk_background_management/startalk/management/delete/user', '', '2019-05-15 09:57:07.835557', '2019-05-15 09:57:07.835557', 1, null, 0);
INSERT INTO sys_permission (id, url, describe, create_time, update_time, status, sub_permission_ids, navigation_flag) VALUES (5, '/qtalk_background_management/startalk/management/getuserDetail', '', '2019-05-15 09:57:08.712239', '2019-05-15 09:57:08.712239', 1, null, 0);
INSERT INTO sys_permission (id, url, describe, create_time, update_time, status, sub_permission_ids, navigation_flag) VALUES (6, '/qtalk_background_management/startalk/management/organ/addDep', '', '2019-05-15 09:57:08.140355', '2019-05-15 09:57:08.140355', 1, null, 0);
INSERT INTO sys_permission (id, url, describe, create_time, update_time, status, sub_permission_ids, navigation_flag) VALUES (7, '/qtalk_background_management/startalk/management/organ/deleteDep', '', '2019-05-15 09:57:08.169407', '2019-05-15 09:57:08.169407', 1, null, 0);
INSERT INTO sys_permission (id, url, describe, create_time, update_time, status, sub_permission_ids, navigation_flag) VALUES (8, '/qtalk_background_management/startalk/management/organ/addRoleClass', '', '2019-05-15 09:57:08.226841', '2019-05-15 09:57:08.226841', 1, null, 0);
INSERT INTO sys_permission (id, url, describe, create_time, update_time, status, sub_permission_ids, navigation_flag) VALUES (9, '/qtalk_background_management/startalk/management/organ/addRole', '', '2019-05-15 09:57:08.252260', '2019-05-15 09:57:08.252260', 1, null, 0);
INSERT INTO sys_permission (id, url, describe, create_time, update_time, status, sub_permission_ids, navigation_flag) VALUES (10, '/qtalk_background_management/startalk/management/organ/updateRole', '', '2019-05-15 09:57:08.284820', '2019-05-15 09:57:08.284820', 1, null, 0);
INSERT INTO sys_permission (id, url, describe, create_time, update_time, status, sub_permission_ids, navigation_flag) VALUES (11, '/qtalk_background_management/startalk/management/organ/deleteRole', '', '2019-05-15 09:57:08.316238', '2019-05-15 09:57:08.316238', 1, null, 0);
INSERT INTO sys_permission (id, url, describe, create_time, update_time, status, sub_permission_ids, navigation_flag) VALUES (12, '/qtalk_background_management/startalk/management/organ/getRoleClass', '', '2019-05-15 09:57:08.359823', '2019-05-15 09:57:08.359823', 1, null, 0);
INSERT INTO sys_permission (id, url, describe, create_time, update_time, status, sub_permission_ids, navigation_flag) VALUES (13, '/qtalk_background_management/startalk/management/searchUser', '用户搜索', '2019-05-17 07:11:11.408295', '2019-05-17 07:11:11.408295', 1, null, 0);
INSERT INTO sys_permission (id, url, describe, create_time, update_time, status, sub_permission_ids, navigation_flag) VALUES (14, '/qtalk_background_management/startalk/management/unbindRole', '解绑用户', '2019-05-17 07:11:11.408295', '2019-05-17 07:11:11.408295', 1, null, 0);
INSERT INTO sys_permission (id, url, describe, create_time, update_time, status, sub_permission_ids, navigation_flag) VALUES (15, '/qtalk_background_management/startalk/management/bindRole', '绑定用户', '2019-05-17 07:11:11.408295', '2019-05-17 07:11:11.408295', 1, null, 0);
INSERT INTO sys_permission (id, url, describe, create_time, update_time, status, sub_permission_ids, navigation_flag) VALUES (16, '/qtalk_background_management/startalk/management/findAllRoles', '所有角色', '2019-05-17 07:11:11.408295', '2019-05-17 07:11:11.408295', 1, '{18,19,20,21,22}', 1);
INSERT INTO sys_permission (id, url, describe, create_time, update_time, status, sub_permission_ids, navigation_flag) VALUES (17, '/qtalk_background_management/startalk/management/queryUserList', '用户列表', '2019-05-17 07:11:11.408295', '2019-05-17 07:11:11.408295', 1, '{13,14,15,16}', 1);
INSERT INTO sys_permission (id, url, describe, create_time, update_time, status, sub_permission_ids, navigation_flag) VALUES (18, '/qtalk_background_management/startalk/management/findAllPermissions', '所有权限', '2019-05-17 07:11:11.408295', '2019-05-17 07:11:11.408295', 1, null, 0);
INSERT INTO sys_permission (id, url, describe, create_time, update_time, status, sub_permission_ids, navigation_flag) VALUES (19, '/qtalk_background_management/startalk/management/findPermissionByRoleId', '角色查找权限', '2019-05-17 07:11:11.408295', '2019-05-17 07:11:11.408295', 1, null, 0);
INSERT INTO sys_permission (id, url, describe, create_time, update_time, status, sub_permission_ids, navigation_flag) VALUES (20, '/qtalk_background_management/startalk/management/updateRolePermissions', '更新权限', '2019-05-17 07:11:11.408295', '2019-05-17 07:11:11.408295', 1, null, 0);
INSERT INTO sys_permission (id, url, describe, create_time, update_time, status, sub_permission_ids, navigation_flag) VALUES (21, '/qtalk_background_management/startalk/management/deleteRole', '删除角色', '2019-05-17 07:11:11.408295', '2019-05-17 07:11:11.408295', 1, null, 0);
INSERT INTO sys_permission (id, url, describe, create_time, update_time, status, sub_permission_ids, navigation_flag) VALUES (22, '/qtalk_background_management/startalk/management/addNewRole', '添加角色', '2019-05-17 07:11:11.408295', '2019-05-17 07:11:11.408295', 1, null, 0);
INSERT INTO sys_permission (id, url, describe, create_time, update_time, status, sub_permission_ids, navigation_flag) VALUES (23, '/qtalk_background_management/startalk/management/organ/getStructure', '', '2019-05-15 09:57:08.078643', '2019-05-15 09:57:08.078643', 1, '{6,7}', 1);
INSERT INTO sys_permission (id, url, describe, create_time, update_time, status, sub_permission_ids, navigation_flag) VALUES (24, '/qtalk_background_management/startalk/management/organ/getAllRole', '', '2019-05-15 09:57:08.501870', '2019-05-15 09:57:08.501870', 1, '{8,9,10,11,12}', 1);
INSERT INTO sys_permission (id, url, describe, create_time, update_time, status, sub_permission_ids, navigation_flag) VALUES (25, '/qtalk_background_management/startalk/management/search', '', '2019-05-15 09:57:08.662159', '2019-05-15 09:57:08.662159', 1, '{1,2,3,4,5}', 1);

INSERT INTO sys_permission (id, url, describe, create_time, update_time, status, sub_permission_ids, navigation_flag) VALUES (26, '/qtalk_background_management/startalk/management/find/add/application', '', '2019-05-15 09:56:18.263012', '2019-05-15 09:56:18.263012', 1, null, 0);
INSERT INTO sys_permission (id, url, describe, create_time, update_time, status, sub_permission_ids, navigation_flag) VALUES (27, '/qtalk_background_management/startalk/management/find/get/group', '', '2019-05-15 09:56:18.263012', '2019-05-15 09:56:18.263012', 1, null, 0);
INSERT INTO sys_permission (id, url, describe, create_time, update_time, status, sub_permission_ids, navigation_flag) VALUES (28, '/qtalk_background_management/startalk/management/find/update/app', '', '2019-05-15 09:56:18.263012', '2019-05-15 09:56:18.263012', 1, null, 0);
INSERT INTO sys_permission (id, url, describe, create_time, update_time, status, sub_permission_ids, navigation_flag) VALUES (29, '/qtalk_background_management/startalk/management/find/action/app', '', '2019-05-15 09:56:18.263012', '2019-05-15 09:56:18.263012', 1, null, 0);
INSERT INTO sys_permission (id, url, describe, create_time, update_time, status, sub_permission_ids, navigation_flag) VALUES (30, '/qtalk_background_management/startalk/management/find/add/group', '', '2019-05-15 09:56:18.263012', '2019-05-15 09:56:18.263012', 1, null, 0);
INSERT INTO sys_permission (id, url, describe, create_time, update_time, status, sub_permission_ids, navigation_flag) VALUES (31, '/qtalk_background_management/startalk/management/file/upload', '', '2019-05-15 09:56:18.263012', '2019-05-15 09:56:18.263012', 1, null, 0);
INSERT INTO sys_permission (id, url, describe, create_time, update_time, status, sub_permission_ids, navigation_flag) VALUES (32, '/qtalk_background_management/startalk/management/find/management', '', '2019-05-15 09:57:08.662159', '2019-05-15 09:57:08.662159', 1, '{26,27,28,29,30,31}', 1);

alter sequence sys_permission_id_seq restart with 33;


CREATE TABLE sys_user_role
(
  id      SERIAL      NOT NULL
    CONSTRAINT sys_user_role_pkey
    PRIMARY KEY,
  role_id INTEGER,
  user_id VARCHAR(60) NOT NULL
);

COMMENT ON COLUMN sys_user_role.id IS '自增id';

COMMENT ON COLUMN sys_user_role.role_id IS '角色id';

COMMENT ON COLUMN sys_user_role.user_id IS '用户id';

CREATE UNIQUE INDEX sys_user_role_user_id_uindex ON sys_user_role (user_id);
INSERT INTO sys_user_role (role_id, user_id) VALUES ( 1, 'admin');



CREATE TABLE persistent_logins
(
  username  VARCHAR(64) NOT NULL,
  series    VARCHAR(64) NOT NULL
    CONSTRAINT persistent_logins_pkey
    PRIMARY KEY,
  token     VARCHAR(64) NOT NULL,
  last_used TIMESTAMP   NOT NULL
);

create table find_application_table
(
    id                  serial              not null
        constraint find_application_table_pk
            primary key,
    application_type    integer             not null,
    visible_range       text,
    application_name    text                not null,
    application_class   text                not null,
    application_icon    text                not null,
    application_version integer             not null,
    ios_version         integer,
    android_version     integer,
    ios_bundle          text,
    android_bundle      text,
    application_desc    text,
    create_time         timestamp default now(),
    update_time         timestamp default now(),
    disable_flag        smallint  default 0 not null,
    member_id           integer             not null,
    h5_action           text,
    entrance            text,
    properties          text,
    module              text,
    show_native_nav     boolean,
    nav_title           text,
    valid_platform      text,
    visible_platform    smallint,
    bundle_name         text,
    h5_action_ios       text,
    h5_action_android   text,
    delete_flag         smallint  default 0 not null,
    native_flag         smallint  default 0 not null,
    app_uuid            varchar(50)
);

comment on column find_application_table.id is '自增id';

comment on column find_application_table.application_type is '应用类型，2RN应用，3 H5应用';

comment on column find_application_table.visible_range is '可见性范围，空标识全员可见';

comment on column find_application_table.application_name is '应用名称';

comment on column find_application_table.application_class is '应用分类';

comment on column find_application_table.application_icon is '应用图标';

comment on column find_application_table.application_version is '应用版本号';

comment on column find_application_table.ios_version is 'ios版本号';

comment on column find_application_table.android_version is '安卓版本号';

comment on column find_application_table.ios_bundle is 'iosbundle包，h5应用的话对应的是h5的地址';

comment on column find_application_table.android_bundle is 'android的bundle包，h5应用对应的是地址';

comment on column find_application_table.application_desc is '应用描述';

comment on column find_application_table.create_time is '创建时间';

comment on column find_application_table.update_time is '更新时间';

comment on column find_application_table.disable_flag is '禁用标志位';

comment on column find_application_table.member_id is '在群组的id';

comment on column find_application_table.h5_action is 'h5页面地址';

comment on column find_application_table.entrance is 'RN应用的入口地址';

comment on column find_application_table.properties is '额外初始属性 map的json';

comment on column find_application_table.module is 'RN应用的程序入口';

comment on column find_application_table.show_native_nav is '是否显示导航';

comment on column find_application_table.nav_title is '导航title h5应用不生效';

comment on column find_application_table.valid_platform is '可适配的客户端类型，IOS Angroid PC';

comment on column find_application_table.visible_platform is 'ios|Android|pc(101):5';

comment on column find_application_table.bundle_name is 'bundle 包的文件名 不同于applicaName';

comment on column find_application_table.h5_action_ios is 'ios h5的页面地址';

comment on column find_application_table.h5_action_android is 'h5 android页面地址';

comment on column find_application_table.delete_flag is '删除标记位，1删除 0未删除';

comment on column find_application_table.native_flag is '原生应用标记0是自定义，1是原生应用禁止修改';

comment on column find_application_table.app_uuid is '应用的UUID';


create unique index find_application_table_id_uindex
    on find_application_table (id);

create index find_application_table_application_name_index
    on find_application_table (application_name);

create table find_class_table
(
    id         serial       not null
        constraint find_class_table_pk
            primary key,
    group_name varchar(200) not null,
    group_icon varchar(200) not null
);

comment on table find_class_table is '应用分类表';

comment on column find_class_table.id is '自增ID';

comment on column find_class_table.group_name is '分组名称';

comment on column find_class_table.group_icon is '分组封面';


create unique index find_class_table_group_name_uindex
    on find_class_table (group_name);

create unique index find_class_table_id_uindex
    on find_class_table (id);

create table startalk_dep_table
(
    id          serial                              not null
        constraint startalk_dep_table_pk
            primary key,
    dep_name    text                                not null,
    dep_level   integer                             not null,
    dep_vp      text,
    dep_hr      text,
    dep_visible text,
    dep_leader  text,
    parent_id   integer,
    delete_flag integer   default 0                 not null,
    dep_desc    text,
    create_time timestamp default now()             not null,
    update_time timestamp default CURRENT_TIMESTAMP not null
);

comment on table startalk_dep_table is '部门信息表';

comment on column startalk_dep_table.id is '自增ID';

comment on column startalk_dep_table.dep_name is '部门名称';

comment on column startalk_dep_table.dep_level is '部门层级';

comment on column startalk_dep_table.dep_vp is '部门领导';

comment on column startalk_dep_table.dep_hr is '部门HR';

comment on column startalk_dep_table.dep_visible is '部门可见性';

comment on column startalk_dep_table.parent_id is '父级部门的ID';

comment on column startalk_dep_table.delete_flag is '部门删除标记位,0是未删除 1是已删除';

comment on column startalk_dep_table.dep_desc is '部门信息备注';

comment on column startalk_dep_table.create_time is '创建时间';

comment on column startalk_dep_table.update_time is '更新时间';

CREATE UNIQUE INDEX startalk_dep_table_depName_uindex ON startalk_dep_table(dep_name);
create unique index startalk_dep_table_id_uindex
    on startalk_dep_table (id);
    
INSERT INTO startalk_dep_table (dep_name, dep_level)
VALUES('/管理员',1);

INSERT INTO startalk_dep_table (dep_name, dep_level)
VALUES('/智能服务助手',1);

create table startalk_role_class
(
    id             serial            not null
        constraint startalk_role_class_pk
            primary key,
    role_class     varchar(200)      not null,
    available_flag integer default 1 not null
);

comment on table startalk_role_class is '角色分组';

comment on column startalk_role_class.id is '自增id';

comment on column startalk_role_class.role_class is '角色分组';

comment on column startalk_role_class.available_flag is '可用标志 1是可用 0表示不可用';


create unique index startalk_role_class_id_uindex
    on startalk_role_class (id);

create unique index startalk_role_class_role_class_uindex
    on startalk_role_class (role_class);

create table startalk_user_role_table
(
    id             serial            not null
        constraint startalk_user_role_table_pk
            primary key,
    role_name      text              not null,
    available_flag integer default 1 not null,
    class_id       integer           not null,
    constraint startalk_user_role_table_pk_2
        unique (role_name, class_id)
);

comment on table startalk_user_role_table is 'startalk用户角色表';

comment on column startalk_user_role_table.id is '主键自增id';

comment on column startalk_user_role_table.role_name is '角色名';

comment on column startalk_user_role_table.available_flag is '可用标志位,1可用 0 不可用';

comment on column startalk_user_role_table.class_id is '角色所属组别的ID';


create unique index startalk_user_role_table_id_uindex
    on startalk_user_role_table (id);

insert into host_info (host, description, host_admin) values ('qtalk', 'qtalk', 'admin');
insert into host_users (host_id, user_id, user_name, department, dep1, pinyin, frozen_flag, version, user_type, hire_flag, gender, password, initialpwd, pwd_salt, ps_deptid) values ('1', 'admin', '管理员', '/管理员', '管理员', 'admin', '0', '1', 'U', '1', '1', 'CRY:fd540f073cc09aa98220bbb234153bd5', '1', 'qtalkadmin_pwd_salt_d2bf42081aab47f4ac00697d7dd32993', 'qtalk');
insert into vcard_version (username, version, profile_version, gender, host, url) values ('admin', '1', '1', '1', 'yourhost', '/file/v2/download/214b6c4f070cf08a1ed27dbd73fdee5d.png');
insert into host_users (host_id, user_id, user_name, department, dep1, pinyin, frozen_flag, version, user_type, hire_flag, gender, password, initialpwd, pwd_salt, ps_deptid) values ('1', 'file-transfer', '文件传输助手', '/智能服务助手', '智能服务助手', 'file-transfer', '1', '1', 'U', '1', '1', 'CRY:fd540f073cc09aa98220bbb234153bd5', '1', 'qtalkadmin_pwd_salt_d2bf42081aab47f4ac00697d7dd32993', 'qtalk');
insert into vcard_version (username, version, profile_version, gender, host, url) values ('file-transfer', '1', '1', '1', 'yourhost', '/file/v2/download/214b6c4f070cf08a1ed27dbd73fdee5d.png');
