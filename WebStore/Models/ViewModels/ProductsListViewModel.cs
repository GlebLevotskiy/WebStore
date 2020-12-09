using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebStore.Models.ProductsData;

namespace WebStore.Models.ViewModels
{
    public class ProductsListViewModel
    {
        public List<Product> Products { get; set; }
        public PagingInfo PagingInfo { get; set; }
        public bool IsAuth { get; set; }
    }
}
