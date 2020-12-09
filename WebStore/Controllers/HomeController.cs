using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using ElectronicsStore.Infrastructure;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using WebStore.Areas.Identity.Data;
using WebStore.Models;
using WebStore.Models.ProductsData;
using WebStore.Models.ViewModels;

namespace WebStore.Controllers
{
    public class HomeController : Controller
    {
        WebStoreProductsModelContext dbContext;
        private readonly UserManager<StoreUser> userManager;
        private readonly SignInManager<StoreUser> signInManager;

        public int PageSize = 4;

        public HomeController(WebStoreProductsModelContext _context,
            UserManager<StoreUser> _userManager, SignInManager<StoreUser> _signInManager)
        {
            dbContext = _context;
            userManager = _userManager;
            signInManager = _signInManager;
        }
        public IActionResult Index()
        {
            return View(dbContext.ProductSet.Select(c => c).OrderBy(c => c));
        }
        public IActionResult ViewProduct(Product product)
        {
            return View("Product", product);
        }
        public IActionResult GetProducts(string subC = "default", int productPage = 1)
        {
            if (subC == "default")
            {
                subC = GetSubCategory();
                if (subC == null)
                    return RedirectToAction("Index");
            }
            else
                SaveSubCategory(subC);


            ProductsListViewModel result = new ProductsListViewModel
            {
                Products = GetProductsWithSubCategory(subC).OrderBy(p => p.Id)
                            .Skip((productPage - 1) * PageSize)
                            .Take(PageSize).ToList(),
                PagingInfo = new PagingInfo
                {
                    CurrentPage = productPage,
                    ItemsPerPage = PageSize,
                    TotalItems = dbContext.Product.Count(p => p.ProductType.Name == subC)
                },
                IsAuth = signInManager.IsSignedIn(User)
            };

            foreach (var product in result.Products) {
                LoadProduct(product);
            }
            return View("Products", result);
        }
        public IActionResult GetSubCategory(string category)
        {
            SaveCategory(category);
            var subCategories = from subCategory in dbContext.ProductType
                                where subCategory.ProductSet.Name == category
                                select subCategory;
            return View("SubCategories", subCategories);
        }
        [HttpGet]
        public IActionResult GetProduct(int productId)
        {
            Product product = dbContext.Product.Find(productId);

            if (product != null)
            {
                LoadProduct(product);
                string[] desription = product.ModelType.DescriptionValues.Split(",");
                ProductTypeDescription ptd = (from p in dbContext.ProductTypeDescription
                                              where p.ProductTypeId == product.ProductTypeId
                                              select p).First();
                string[] criterias = ptd.Description.Split(",");
                return View("Product", new DeepProductInfo 
                {
                    Product = product,
                    IsAuth = signInManager.IsSignedIn(User),
                    Criterias = criterias,
                    Description = desription
                });
            }
            return View("Index");
        }

        public IActionResult GetStoreInfo()
        {
            return View("AboutUs");
        }
        public IActionResult Privacy()
        {
            return View();
        }
        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
        private IEnumerable<Product> GetProductsWithSubCategory(string subCategory)
        {
            return from product in dbContext.Product
                   where product.ProductType.Name == subCategory
                   select product;
        }
        private void LoadProduct(Product product)
        {
            product.ModelType = (from modelType in dbContext.ModelType
                                 where modelType.Id == product.ModelTypeId
                                 select modelType).First();
            product.ProductType = (from productType in dbContext.ProductType
                                   where productType.Id == product.ProductTypeId
                                   select productType).First();
        }
        private void SaveSubCategory(string subC)
        {
            HttpContext.Session.SetJson("SubCategory", subC);
        }  
        private void SaveCategory(string category)
        {
            HttpContext.Session.SetJson("Category", category);
        }
        private string GetSubCategory()
        {
            return HttpContext.Session.GetJson<string>("SubCategory");
        }
    }
}
