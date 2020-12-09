using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebStore.Models.ProductsData;

namespace WebStore.Models
{
    public class DeepProductInfo
    {
        public Product Product { get; set; }

        public bool IsAuth { get; set; }
        public string[] Criterias { get; set; }
        public string[] Description { get; set; }
    }
}
