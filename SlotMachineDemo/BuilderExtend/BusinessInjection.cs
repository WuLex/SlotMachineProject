﻿using Lm.Common.DB;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.DependencyInjection;
using SqlSugar;

namespace SlotMachine.BuilderExtend
{
    public static class DBInit
    {
        /// <summary>
        ///  配置数据库的链接
        /// </summary>
        /// <param name="services"></param>
        /// <param name="webpath"></param>
        public static void DbInitialization(this IServiceCollection services, IWebHostEnvironment webpath)
        {
            // 把多个连接对象注入服务，这里必须采用Scope，因为有事务操作
            //     services.AddScoped<ISqlSugarClient>(o =>
            //        {
            //            return new SqlSugarClient(new SqlSugar.ConnectionConfig()
            //            {
            //                //ConnectionString = @"F:\VSGitHub\myCustom\MyCode\QinOpen-3.0\QinOpen\eeee.db",
            //                ConnectionString = @$"DataSource={webpath.ContentRootPath}\eeee.db",//必填, 数据库连接字符串
            //                DbType = SqlSugar.DbType.Sqlite,//必填, 数据库类型
            //                IsAutoCloseConnection = true,//默认false, 时候知道关闭数据库连接, 设置为true无需使用using或者Close操作
            //                InitKeyType = InitKeyType.Attribute//默认SystemTable, 字段信息读取, 如：该属性是不是主键，标识列等等信息
            //            });
            //        });

            services.AddScoped<ISqlSugarClient>(o =>
            {
                return new SqlSugarClient(new SqlSugar.ConnectionConfig()
                {
                    //"Server=localhost;Port=3306;Database=ut;Uid=root;Pwd=root;CharSet=utf8;CharSet=utf8;"
                    ConnectionString = BaseDBConfig.ConnectionString, //必填, 数据库连接字符串
                    DbType = (SqlSugar.DbType)BaseDBConfig.DbType, //必填, 数据库类型
                    IsAutoCloseConnection = true, //默认false, 时候知道关闭数据库连接, 设置为true无需使用using或者Close操作
                    InitKeyType = SqlSugar.InitKeyType.SystemTable //默认SystemTable, 字段信息读取, 如：该属性是不是主键，标识列等等信息
                });
            });
        }
    }
}