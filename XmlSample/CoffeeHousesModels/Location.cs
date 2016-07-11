namespace CoffeeHouse.CoffeeHousesModels
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Serializable()]
    public partial class Location
    {
        public Location()
        {
            Contacts = new HashSet<Contact>();
        }

        [StringLength(10)]
        public string Id { get; set; }

        [StringLength(10)]
        public string country { get; set; }

        [StringLength(50)]
        public string city { get; set; }
        
        [StringLength(50)]
        public string street { get; set; }

        [StringLength(30)]
        public string building_number { get; set; }

        public ICollection<Contact> Contacts { get; set; }

    }
}
