using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebStore.Models
{
    public class SideBarCategoriesInfo
    {
        public IEnumerable<string> Categories { get; set; }

        public string SelectedCategory { get; set; }
    }
}
