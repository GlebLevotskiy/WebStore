using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.Encodings.Web;
using System.Threading.Tasks;
using System.Web;
using ElectronicsStore.Infrastructure;
using Microsoft.AspNetCore.Mvc;
using WebStore.Models.Cart;
using WebStore.Models.ProductsData;

namespace WebStore.Controllers
{
    public class CartController : Controller
    {
        WebStoreProductsModelContext dbContext;
        public CartController(WebStoreProductsModelContext _context)
        {
            dbContext = _context;
        }

        [HttpGet]
        public RedirectToActionResult AddToCart(int productId)
        {
            Product product = dbContext.Product
                .FirstOrDefault(p => p.Id == productId);

            if (product != null) {
                Cart cart = GetCart();
                LoadProduct(product);
                cart.AddItem(product, 1);
                SaveCart(cart);
            }

            return RedirectToAction("Index");
        }

        public RedirectToActionResult RemoveFromCart(int productId)
        {
            Product product = dbContext.Product
                .FirstOrDefault(p => p.Id == productId);

            if (product != null) {
                Cart cart = GetCart();
                cart.RemoveLine(product);
                SaveCart(cart);
            }

            return RedirectToAction("Index");
        }

        public IActionResult Index()
        {
            return View( new CartIndexViewModel { Cart = GetCart() });
        }

        private Cart GetCart()
        {
            Cart cart = HttpContext.Session.GetJson<Cart>("Cart") ?? new Cart();
            return cart;
        }

        private void SaveCart(Cart cart)
        {
            HttpContext.Session.SetJson("Cart", cart);
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
    }
}
