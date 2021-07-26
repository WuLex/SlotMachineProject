using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using SlotMachine.BuilderExtend;

namespace SlotMachine
{
    public class Startup
    {
        public IConfiguration _configuration { get; }

        public IWebHostEnvironment _env { get; }

        //public ILifetimeScope _autofacContainer { get; private set; }

        public Startup(IConfiguration configuration, IWebHostEnvironment env)
        {
            _configuration = configuration;
            _env = env;
        }

        public void ConfigureServices(IServiceCollection services)
        {

            //services.AddMvc(a =>
            //{
            //    a.EnableEndpointRouting = false;
            //});
            //services.AddControllers(o =>
            //{
            //   // o.Filters.Add(typeof(GlobalExceptionsFilter)); // 全局异常过滤
            //});

            services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();
            services.AddControllersWithViews();
        
            services.DbInitialization(_env);

        }

        public void Configure(IApplicationBuilder app, IWebHostEnvironment env,ILoggerFactory lf)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            app.UseStaticFiles();
            app.UseRouting();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=Home}/{action=Index}/{id?}");

                endpoints.MapGet("/", async context =>
                {
                    await context.Response.WriteAsync("Hello World!");
                });
            });
        }
    }
}
