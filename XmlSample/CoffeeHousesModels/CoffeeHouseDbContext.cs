namespace CoffeeHouse.CoffeeHousesModels
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class CoffeeHouseDbContext : DbContext
    {
        public CoffeeHouseDbContext()
            : base("name=CoffeeHouseConnectionNew")
        {
        }

        public virtual DbSet<CoffeeHouse> CoffeeHouses { get; set; }
        public virtual DbSet<Product> Products { get; set; }
        public virtual DbSet<Coffee> Coffees{ get; set; }
        public virtual DbSet<Food> Foods { get; set; }
        public virtual DbSet<Employee> Employees { get; set; }
        public virtual DbSet<Gift> Gifts { get; set; }
        public virtual DbSet<Location> Locations { get; set; }
        public virtual DbSet<Contact> Contacts { get; set; }
    }
}
