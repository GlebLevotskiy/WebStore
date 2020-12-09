using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Runtime.Serialization;

namespace WebStore.Models.ProductsData
{
    public partial class ModelType
    {
        public ModelType()
        {
        }   

        public int Id { get; set; }
        public string Name { get; set; }
        public int Ptdid { get; set; }
        public string DescriptionValues { get; set; }

        public virtual ProductTypeDescription Ptd { get; set; }
    }
}
