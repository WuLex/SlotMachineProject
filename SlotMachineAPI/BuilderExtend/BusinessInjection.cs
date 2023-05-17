using Lm.Common.DB;
using SqlSugar;

namespace SlotMachineAPI.BuilderExtend
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
            services.AddScoped<ISqlSugarClient>(o =>
            {
                return new SqlSugarClient(new SqlSugar.ConnectionConfig()
                {
                    ConnectionString = BaseDBConfig.ConnectionString, //必填, 数据库连接字符串
                    DbType = (SqlSugar.DbType)BaseDBConfig.DbType, //必填, 数据库类型
                    IsAutoCloseConnection = true, //默认false, 时候知道关闭数据库连接, 设置为true无需使用using或者Close操作
                    InitKeyType = SqlSugar.InitKeyType.SystemTable //默认SystemTable, 字段信息读取, 如：该属性是不是主键，标识列等等信息
                });
            });
        }
    }
}