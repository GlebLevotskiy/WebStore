using System;
using System.Collections.Generic;

namespace WebStore.Models.ProductsData
{
    public partial class Product
    {   
        public int Id { get; set; }
        public int ProductTypeId { get; set; }
        public string Producer { get; set; }
        public int ModelTypeId { get; set; }
        public decimal Price { get; set; }
        public string Info { get; set; }

        public virtual ModelType ModelType { get; set; }
        public virtual ProductType ProductType { get; set; }
    }
}
