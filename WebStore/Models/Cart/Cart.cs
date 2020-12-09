using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebStore.Models.ProductsData;

namespace WebStore.Models.Cart
{
    public class Cart
    {
        private List<CartLine> lineCollection = new List<CartLine>();

        public virtual void AddItem(Product product, int quantity)
        {
            CartLine line = lineCollection
                .Where(p => p.Product.Id == product.Id).FirstOrDefault();

            if(line == null) {
                lineCollection.Add(new CartLine
                {
                    Product = product,
                    Quantity = quantity
                });
            }
            else {
                line.Quantity += quantity;
            }
        }
        public virtual void RemoveLine(Product product)
            => lineCollection.RemoveAll(l => l.Product.Id == product.Id);
        public virtual decimal ComputeTotalValue()
            => lineCollection.Sum(e => e.Product.Price * e.Quantity);
        public virtual void Clear() => lineCollection.Clear();
        public IEnumerable<CartLine> Lines => lineCollection;
    }
}
