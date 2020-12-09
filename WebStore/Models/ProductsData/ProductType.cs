using System;
using System.Collections.Generic;

namespace WebStore.Models.ProductsData
{
    public partial class ProductType
    {
        public ProductType()
        {
            ProductTypeDescription = new HashSet<ProductTypeDescription>();
        }

        public int Id { get; set; }
        public string Name { get; set; }
        public int ProductSetId { get; set; }

        public virtual ProductSet ProductSet { get; set; }
        public virtual ICollection<ProductTypeDescription> ProductTypeDescription { get; set; }
    }
}
