using System;
using System.Collections.Generic;

namespace WebStore.Models.ProductsData
{
    public partial class ProductTypeDescription
    {
        public ProductTypeDescription()
        {
            ModelType = new HashSet<ModelType>();
        }

        public int Id { get; set; }
        public int ProductTypeId { get; set; }
        public string Description { get; set; }

        public virtual ProductType ProductType { get; set; }
        public virtual ICollection<ModelType> ModelType { get; set; }
    }
}
