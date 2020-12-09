using System;
using System.Collections.Generic;

namespace WebStore.Models.ProductsData
{
    public partial class Storage
    {
        public int ProductId { get; set; }
        public int Count { get; set; }
        public int CityId { get; set; }

        public virtual City City { get; set; }
    }
}
