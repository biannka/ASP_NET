namespace CoffeeHouse.CoffeeHousesModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Serializable()]
    public partial class Employee
    {
        public Employee()
        {
            CoffeeHouses = new HashSet<CoffeeHouse>();
        }

        public string id { get; set; }
         
        [StringLength(13)]
        public string position { get; set; }

        [Required]
        [StringLength(15)]
        public string sex { get; set; }

        [StringLength(100)]
        public string emp_name { get; set; }

        [StringLength(15)]
        public string salary { get; set; }

        [StringLength(5)]
        public string age { get; set; }

        public virtual ICollection<CoffeeHouse> CoffeeHouses { get; set; }
    }
}
