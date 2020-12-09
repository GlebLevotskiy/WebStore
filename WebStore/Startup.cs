using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using WebStore.Models.ProductsData;
using Newtonsoft.Json;

namespace WebStore
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddSession();
            //services.AddMvc(options => options.EnableEndpointRouting = false);
            services.AddMvc().AddNewtonsoftJson();
            services.AddRazorPages();
            services.AddDbContext<WebStoreProductsModelContext>(options =>
           options.UseSqlServer(Configuration.GetConnectionString("ProductConnection")));
            services.AddMemoryCache();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }
            app.UseHttpsRedirection();
            app.UseStaticFiles();
                
            app.UseRouting();
            app.UseSession();

            app.UseAuthentication();
            app.UseAuthorization();

            //app.UseMvc(configureRoutes =>
            //{
            //    //configureRoutes.MapRoute(
            //    //    name: null,
            //    //    template: "{category}/Page{productPage:int}",
            //    //    defaults: new { controller = "Home", action = "List" }
            //    //);

            //    //configureRoutes.MapRoute(
            //    //    name: null,
            //    //    template: "Page{productPage:int}",
            //    //    defaults: new { controller = "Home", action = "GetProducts", productPage = 1 }
            //    //);

            //    //configureRoutes.MapRoute(
            //    //    name: null,
            //    //    template: "{category}",
            //    //    defaults: new { controller = "Home", action = "GetSubCategory" }
            //    //);

            //    configureRoutes.MapRoute(
            //       name: null,
            //       template: "{controller=Home}/{action=GetProducts}/{subC&productPage}"
            //   );

            //    configureRoutes.MapRoute(
            //        name: "default",
            //        template: "{controller=Home}/{action=Index}"
            //    );

            //    configureRoutes.MapRoute(
            //        name: null,
            //        template: "{controller=Home}/{action=GetSubcategory}/{category}"
            //        );

            //    //configureRoutes.MapRoute(
            //    //    name: null,
            //    //    template: "{controller}/{action}/{id?}"
            //    //);
            //});
            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=Home}/{action=Index}/{id?}");
                endpoints.MapRazorPages();
            });

        }
    }
}
