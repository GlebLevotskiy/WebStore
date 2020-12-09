using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;

namespace WebStore.Areas.Identity.Data
{
    // Add profile data for application users by adding properties to the StoreUser class
    public class StoreUser : IdentityUser
    {
        [PersonalData]
        [Column(TypeName="nvarchar(100)")]
        public string FirstName { get; set; }
        [PersonalData]
        public string LastName { get; set; }
    }
}
