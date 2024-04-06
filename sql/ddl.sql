-- 创建库
create database if not exists apidb;

-- 切换库
use apidb;

-- 用户表
create table if not exists user
(
    id           bigint auto_increment comment 'id' primary key,
    userName     varchar(256)                           null comment '用户昵称',
    userAccount  varchar(256)                           not null comment '账号',
    userAvatar   varchar(1024)                          null comment '用户头像',
    gender       tinyint                                null comment '性别',
    userRole     varchar(256) default 'user'            not null comment '用户角色：user / admin',
    userPassword varchar(512)                           not null comment '密码',
    `accessKey` varchar(512)  null comment 'accessKey',
    `secretKey` varchar(512)  null comment 'secretKey',
    createTime   datetime     default CURRENT_TIMESTAMP not null comment '创建时间',
    updateTime   datetime     default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    isDelete     tinyint      default 0                 not null comment '是否删除',
    constraint uni_userAccount
        unique (userAccount)
) comment '用户';

-- 接口信息
create table if not exists apidb.`interface_info`
(
    `id` bigint not null auto_increment comment '主键' primary key,
    `name` varchar(256) not null comment '名称',
    `description` varchar(256) null comment '描述',
    `url` varchar(512) not null comment '接口地址',
    `requestParams` text not null comment '请求参数',
    `requestHeader` text null comment '请求头',
    `responseHeader` text null comment '响应头',
    `status` int default 0 not null comment '接口状态（0-关闭，1-开启）',
    `method` varchar(256) not null comment '请求类型',
    `userId` bigint not null comment '创建人',
    `createTime` datetime default CURRENT_TIMESTAMP not null comment '创建时间',
    `updateTime` datetime default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    `isDelete` tinyint default 0 not null comment '是否删除(0-未删, 1-已删)'
) comment '接口信息';

-- 用户调用接口关系表
create table if not exists apidb.`user_interface_info`
(
    `id` bigint not null auto_increment comment '主键' primary key,
    `userId` bigint not null comment '调用用户 id',
    `interfaceInfoId` bigint not null comment '接口 id',
    `totalNum` int default 0 not null comment '总调用次数',
    `leftNum` int default 0 not null comment '剩余调用次数',
    `status` int default 0 not null comment '0-正常，1-禁用',
    `createTime` datetime default CURRENT_TIMESTAMP not null comment '创建时间',
    `updateTime` datetime default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment '更新时间',
    `isDelete` tinyint default 0 not null comment '是否删除(0-未删, 1-已删)'
) comment '用户调用接口关系';


INSERT INTO apidb.interface_info (id, name, description, url, requestParams, requestHeader, responseHeader, status, method, userId, createTime, updateTime, isDelete) VALUES (1, '1', 'test', '1', '1', '1', '1', 0, 'post', 2, '2024-03-20 23:52:26', '2024-03-23 23:17:27', 1);
INSERT INTO apidb.interface_info (id, name, description, url, requestParams, requestHeader, responseHeader, status, method, userId, createTime, updateTime, isDelete) VALUES (2, '请求', 'aaa', '/admin', 'rewq·', 'ewq', 'ewqeqwe', 0, 'post', 2, '2024-03-21 23:54:35', '2024-03-28 22:35:00', 0);
INSERT INTO apidb.interface_info (id, name, description, url, requestParams, requestHeader, responseHeader, status, method, userId, createTime, updateTime, isDelete) VALUES (3, '1', 'test', '1', '1', '1', '1', 1, 'post', 2, '2024-03-23 22:14:58', '2024-03-24 18:10:25', 0);
INSERT INTO apidb.interface_info (id, name, description, url, requestParams, requestHeader, responseHeader, status, method, userId, createTime, updateTime, isDelete) VALUES (4, 'getUsernameByPost', '获取用户名', 'http://localhost:8123/api/name/user', '{\'userName\':\'name\'}', '{\'Content-Type\':\'application/json\'}', '{\'Content-Type\':\'application/json\'}', 1, 'POST', 2, '2024-03-24 00:04:56', '2024-03-27 22:18:45', 0);
INSERT INTO apidb.interface_info (id, name, description, url, requestParams, requestHeader, responseHeader, status, method, userId, createTime, updateTime, isDelete) VALUES (5, 'getlover', '获取你未来对象的微信', 'http://localhost:8123/api/name/queryLoversWx', '{\'name\':\'name\'}', '{\'Content-Type\':\'application/json\'}', '{\'Content-Type\':\'application/json\'}', 1, 'POST', 2, '2024-03-27 22:56:24', '2024-03-27 22:56:24', 0);

INSERT INTO apidb.user (id, userName, userAccount, userAvatar, gender, userRole, userPassword, accessKey, secretKey, createTime, updateTime, isDelete) VALUES (2, 'pp', 'pxy', '', null, 'admin', 'ba85be716df69c74e8daad0398b5aa85', '1234', '1234', '2024-03-20 23:25:58', '2024-04-06 10:54:09', 0);

INSERT INTO apidb.user_interface_info (id, userId, interfaceInfoId, totalNum, leftNum, status, createTime, updateTime, isDelete) VALUES (1, 1, 1, 11, 0, 1, '2024-03-23 22:22:53', '2024-03-23 22:22:53', 0);
