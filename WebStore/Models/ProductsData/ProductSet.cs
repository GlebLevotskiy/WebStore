using System;
using System.Collections.Generic;

namespace WebStore.Models.ProductsData
{
    public partial class ProductSet
    {
        public ProductSet()
        {
            ProductType = new HashSet<ProductType>();
        }

        public int Id { get; set; }
        public string Name { get; set; }

        public virtual ICollection<ProductType> ProductType { get; set; }
    }
}
