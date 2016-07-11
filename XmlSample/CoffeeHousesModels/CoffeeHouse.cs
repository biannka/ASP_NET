namespace CoffeeHouse.CoffeeHousesModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Serializable()]
    public partial class CoffeeHouse
    {
        public CoffeeHouse()
        {
            Products = new HashSet<Product>();
            Employees = new HashSet<Employee>();
            Contacts = new Contact();
            Gifts = new Gift();
        }

        public string Id { get; set; }

        [Required]
        [StringLength(50)]
        public string name { get; set; }

        [Required]
        [StringLength(50)]
        public string working_time { get; set; }

        public virtual ICollection<Product> Products { get; set; }

        public virtual Contact Contacts { get; set; }

        public virtual ICollection<Employee> Employees { get; set; }

        public virtual Gift Gifts { get; set; }
    }
}
