using ElectronicsStore.Infrastructure;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebStore.Models;
using WebStore.Models.ProductsData;

namespace WebStore.ViewComponents
{
    [ViewComponent(Name = "CategoriesList")]
    public class CategoriesViewComponent : ViewComponent
    {
        private readonly WebStoreProductsModelContext db;

        public CategoriesViewComponent(WebStoreProductsModelContext _context)
        {
            db = _context; 
        }
        public async Task<IViewComponentResult> InvokeAsync()
        {
            string category = GetCategory() ?? "default";
            var items = await GetCategoriesAsync();
            return View(new SideBarCategoriesInfo { Categories = items, SelectedCategory = GetCategory() });
        }
        private async Task<List<string>> GetCategoriesAsync()
        {
            return await db.ProductSet.Select(c => c.Name).OrderBy(c => c).ToListAsync();
        }
        private string GetCategory()
        {
            return HttpContext.Session.GetJson<string>("Category");
        }
    }
}
