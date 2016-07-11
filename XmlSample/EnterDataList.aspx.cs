using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text.RegularExpressions;
using System.Data.Entity.Validation;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace CoffeeHouse
{
    public partial class EnterDataList : System.Web.UI.Page
    {

        CoffeeHousesModels.CoffeeHouseDbContext context = new CoffeeHousesModels.CoffeeHouseDbContext();
         
        public List<CoffeeHousesModels.Food> foods { get; set; }
         
        public List<CoffeeHousesModels.Employee> employees { get; set; }

        public List<CoffeeHousesModels.Product> products { get; set; }

        public List<CoffeeHousesModels.Coffee> coffees { get; set; }


        protected void Page_Load(object sender, EventArgs e)
        {
            products = ViewState["products"] as List<CoffeeHousesModels.Product>;
            if (products == null)
            {
                products = new List<CoffeeHousesModels.Product>();
                ViewState["products"] = products;
            }

            foods = ViewState["foods"] as List<CoffeeHousesModels.Food>;
            if (foods == null)
            {
                foods = new List<CoffeeHousesModels.Food>();
                ViewState["foods"] = foods;
            }

            coffees = ViewState["coffees"] as List<CoffeeHousesModels.Coffee>;
            if (coffees == null)
            {
                coffees = new List<CoffeeHousesModels.Coffee>();
                ViewState["coffees"] = coffees;
            }

            employees = ViewState["employees"] as List<CoffeeHousesModels.Employee>;
            if (employees == null)
            {
                employees = new List<CoffeeHousesModels.Employee>();
                ViewState["employees"] = employees;
            }
        }

        protected void ValidateCoffeeHouseID(object source, ServerValidateEventArgs args)
        {
            string cofeeHouseID = args.Value;
            if (Regex.IsMatch(cofeeHouseID, @"^\w+\-?\w*$"))
            {
                if (context.CoffeeHouses.Count(ch => ch.Id.Equals(cofeeHouseID)) == 0)
                {
                    args.IsValid = true;
                }
                else
                {
                    CustomValidatorCoffeeHouseID.ErrorMessage = "Зададеното ID вече се използва в другo кафене";
                    args.IsValid = false;
                }
            }
            else
            {
                CustomValidatorCoffeeHouseID.ErrorMessage = "Зададеното ID не е отговаря на правилата за ID на кафене";
                args.IsValid = false;
            }

        }  

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<CoffeeHouse.CoffeeHousesModels.Product> ProductsListView_GetData()
        {
            return products.AsQueryable();
        }

        public void ProductsListView_InsertItem()
        {
            var item = new CoffeeHouse.CoffeeHousesModels.Product();
            TryUpdateModel(item);
            if (coffees.Count > 0)
            {
                List<CoffeeHousesModels.Coffee> insertedCoffees = new List<CoffeeHousesModels.Coffee>();
                insertedCoffees.AddRange(coffees);
                item.Coffees = insertedCoffees;
                coffees.Clear();
            }
            if (foods.Count > 0)
            {
                List<CoffeeHousesModels.Food> insertedFoods = new List<CoffeeHousesModels.Food>();
                insertedFoods.AddRange(foods);
                item.Foods = insertedFoods;
                foods.Clear();
            }
            // Проверка дали съществува продукт със зададеното ProductId
            // измежду въведените продукти, или в БД
            if (products.Count(p => p.Id.Equals(item.Id)) != 0 || context.Products.Count(p => p.Id.Equals(item.Id)) != 0)
            {
                ModelState.AddModelError("productId", "Зададеното ID вече се използва в друг продукт");
            }

            if (ModelState.IsValid)
            {
                products.Add(item);
            }
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            DbStatusLabel.Text = "Успешно записване в БД.";
            DbStatusLabel.ForeColor = Color.Green;

            XmlStatusLabel.Text = "Успешно записване в XML файл.";
            XmlStatusLabel.ForeColor = Color.Green;

            CoffeeHousesModels.CoffeeHouse coffeeHouse = null;

            try
            {
                coffeeHouse = ControlsToModel();
                context.CoffeeHouses.Add(coffeeHouse);
                context.SaveChanges();
            }///ujhbkiuvgfuktcdkyrx
            /////// BLA
            catch (DbEntityValidationException exception)
            {
                String status = null;
                foreach (var eve in exception.EntityValidationErrors)
                {
                    status = eve.Entry.Entity.GetType().Name + " " + eve.Entry.State + "\n";
                    Console.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
                        eve.Entry.Entity.GetType().Name, eve.Entry.State);
                    foreach (var ve in eve.ValidationErrors)
                    {
                        Console.WriteLine("- Property: \"\", Error: \"\"",
                            ve.PropertyName, ve.ErrorMessage);
                        status = status + "- Property: \"" + ve.PropertyName + " Error: \"" + ve.ErrorMessage + "\"\n";
                    }
                }
                DbStatusLabel.Text = status;
            }
            catch (Exception ex)
            {
                DbStatusLabel.Text = "Грешка при записване в БД: " + ex.Message;
               DbStatusLabel.ForeColor = Color.Red;

                coffeeHouse = null;

            }

            try
            {
                if (coffeeHouse == null)
                {
                    throw new Exception("Не се записва XML файл при грешка в записването в БД");
                }
                XDocument coffeeHouseXml = CreateXml(coffeeHouse);
                coffeeHouseXml.Save(Server.MapPath("~/App_Data/" + coffeeHouse.name + coffeeHouse.Id + ".xml"));
            }
            catch (Exception ex)
            {
                XmlStatusLabel.Text = "Грешка при записване в XML файл: " + ex.Message;
                XmlStatusLabel.ForeColor = Color.Red;

                coffeeHouse = null;
            }

            if (coffeeHouse != null)
            {
                foreach (Control control in Master.FindControl("ContentPlaceHolder1").Controls)
                {
                    if (control is TextBox)
                    {
                        (control as TextBox).Text = "";
                    }
                }

                employees = new List<CoffeeHousesModels.Employee>();
                products = new List<CoffeeHousesModels.Product>();
                coffees = new List<CoffeeHousesModels.Coffee>();
                foods = new List<CoffeeHousesModels.Food>();

                ViewState["employees"] = employees;
                EmployeeListView.DataBind();

                ViewState["products"] = products;
                ProductsListView.DataBind();
            }
        }

        private CoffeeHousesModels.CoffeeHouse ControlsToModel()
        {
            var coffeeHouse = new CoffeeHousesModels.CoffeeHouse();

            coffeeHouse.Id = InpCoffeeHouseID.Text;
            coffeeHouse.name = InpCoffeeHouseName.Text;
            coffeeHouse.working_time = working_time.Text;
            var contacts = new CoffeeHousesModels.Contact();
            contacts.Id = InpCoffeeHouseID.Text;
            contacts.email = InpEmail.Text;
            contacts.website = InpSite.Text;
            contacts.phone = InpNumber.Text;

            var locations = new CoffeeHousesModels.Location();
            locations.Id = InpCoffeeHouseID.Text;
            locations.city = InpCity.Text;
            if (locations.country != null)
            {
                locations.country = InpCountry.Text;
            }
            if (locations.street != null)
            {
                locations.street = InpStreet.Text;
            }
            locations.building_number = InpBuildingNumber.Text;

            contacts.Locations = locations;
            coffeeHouse.Contacts = contacts;

            foreach (var enteredEmployee in employees)
            {
                var employee = new CoffeeHousesModels.Employee()
                {
                    id = enteredEmployee.id,
                    position = enteredEmployee.position,
                    sex = enteredEmployee.sex,
                    emp_name = enteredEmployee.emp_name,
                    salary = enteredEmployee.salary,
                    age = enteredEmployee.age
                };
                coffeeHouse.Employees.Add(employee);
            }

            foreach (var enteredProduct in products)
            {
                int count = 0;
                var product = new CoffeeHousesModels.Product()
                {
                    Id = enteredProduct.Id,
                    product_name = enteredProduct.product_name,
                    price = enteredProduct.price,
                    description = enteredProduct.description
                };

                foreach (var enteredCoffee in enteredProduct.Coffees)
                {
                    var coffee = new CoffeeHousesModels.Coffee()
                    {
                        Id = enteredProduct.Id + count,
                        coffee_type = enteredCoffee.coffee_type,
                        coffee_name = enteredCoffee.coffee_name,
                        supplement_price = enteredCoffee.supplement_price,
                        supplement_type = enteredCoffee.supplement_type != null ? enteredCoffee.supplement_type : "Без",
                        drink_type = enteredCoffee.drink_type != null ? enteredCoffee.drink_type : "Гореща"
                    };
                    count++;
                    product.Coffees.Add(coffee);
                }
                foreach (var enteredFood in enteredProduct.Foods)
                {
                    var food = new CoffeeHousesModels.Food()
                    {
                        Id = enteredProduct.Id + count,
                        food_name = enteredFood.food_name,
                        food_type = enteredFood.food_type
                    };
                    product.Foods.Add(food);
                    count++;
                }
                coffeeHouse.Products.Add(product);
            }

            if (InpGiftName.Text != "")
            {
                var gift = new CoffeeHousesModels.Gift();
                gift.Id = InpCoffeeHouseID.Text;
                gift.gift_type = InpGiftType.Text;
                gift.gift_reason = InpGiftReason.Text;
                gift.gift_name = InpGiftName.Text;
                coffeeHouse.Gifts = gift;
            }
            else
            {
                coffeeHouse.Gifts = null;
            }
            return coffeeHouse;
        }

        private XDocument CreateXml(CoffeeHousesModels.CoffeeHouse kafe)
        {
            var doc = new XDocument(new XDocumentType("CoffeeHouse", null, "coffeHouse.dtd", null));

            XElement root = new XElement("CoffeеHouse");
            root.Add(new XElement("name", kafe.name));
            root.Add(new XElement("working_time", kafe.working_time));
            root.SetAttributeValue("id", kafe.Id);

            root.Add(new XElement("products"));
            XElement products = root.Element("products");
            XElement product = null;
            foreach (var item in kafe.Products)
            {
                product = new XElement("product");
                product.SetAttributeValue("id","П" + item.Id);
                product.Add(new XElement("price", item.price));
                product.Add(new XElement("product_name", item.product_name));

                if (item.Coffees.Count > 0)
                {
                    XElement coffees = product.Element("coffee");
                    foreach (var insideItem in item.Coffees)
                    {
                        coffees = new XElement("coffee");
                        coffees.SetAttributeValue("id", "К" + insideItem.Id);
                        if (insideItem.supplement_type != null)
                        {
                            coffees.SetAttributeValue("supplement_type",insideItem.supplement_type);
                        }
                        coffees.SetAttributeValue("drink_type", insideItem.drink_type);
                        coffees.Add(new XElement("coffee_name", insideItem.coffee_name));
                        coffees.Add(new XElement("coffee_type", insideItem.coffee_type));
                        if (insideItem.supplement_price != null)
                        {
                            coffees.Add(new XElement("supplement_price", insideItem.supplement_price));
                        }
                        product.Add(coffees);
                    }
                }
                if (item.Foods.Count > 0)
                {
                    XElement foods = root.Element("food");
                    foreach (var insideItem in item.Foods)
                    {
                        foods = new XElement("food");
                        foods.SetAttributeValue("id", "Х" + insideItem.Id);
                        foods.SetAttributeValue("food_type", insideItem.food_type);
                        foods.Add(new XElement("food_name", insideItem.food_name));

                        product.Add(foods);
                    }
                }
                products.Add(product);
            }

            if (kafe.Gifts != null)
            {
                root.Add(new XElement("gift"));
                XElement gifts = root.Element("gift");
                gifts.SetAttributeValue("id", "Г" + kafe.Id);
                gifts.Add(new XElement("gift_name", kafe.Gifts.gift_name));
                gifts.SetAttributeValue("gift_reason", kafe.Gifts.gift_reason);
                gifts.SetAttributeValue("gift_type", kafe.Gifts.gift_type);
            }

            XElement contact = new XElement("contacts");

            XElement locations = new XElement("location");
            locations.SetAttributeValue("id", "К" + kafe.Contacts.Locations.Id);
            if (kafe.Contacts.Locations.country != null)
            {
                locations.Add(new XElement("country", kafe.Contacts.Locations.country));
            }
            locations.Add(new XElement("city", kafe.Contacts.Locations.city));
            if (kafe.Contacts.Locations.street != null)
            {
                locations.Add(new XElement("street", kafe.Contacts.Locations.street));
            }
            locations.Add(new XElement("building_number", kafe.Contacts.Locations.building_number));

            contact.Add(locations);

            contact.SetAttributeValue("id", "Л" + kafe.Contacts.Id);
            contact.Add(new XElement("phone", kafe.Contacts.phone));
            contact.Add(new XElement("website", kafe.Contacts.website));
            contact.Add(new XElement("e-mail", kafe.Contacts.email));

            
            root.Add(contact);

            root.Add(new XElement("employees"));
            XElement employees = root.Element("employees");
            XElement employee = null;
            foreach (var item in kafe.Employees)
            {
                employee = new XElement("employee");
                employee.SetAttributeValue("id", "E" + item.id);
                employee.SetAttributeValue("position", item.position);
                employee.SetAttributeValue("sex", item.sex); 
                employee.Add(new XElement("emp_name", item.emp_name));
                employee.Add(new XElement("salary", item.salary));
                if(item.age != null)
                {
                    employee.Add(new XElement("age", item.age));
                }
                employees.Add(employee);
            }

            doc.Add(root);

            return doc;
        }

        public void EmployeeListView_InsertItem()
        {
            var item = new CoffeeHouse.CoffeeHousesModels.Employee();
            TryUpdateModel(item);
            employees.Add(item);
            
        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<CoffeeHouse.CoffeeHousesModels.Employee> EmployeeListView_GetData()
        {
            return employees.AsQueryable(); ;
        }

        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<CoffeeHouse.CoffeeHousesModels.Coffee> CoffeesListView_GetData()
        {
            if (foods != null)
            {
                return coffees.AsQueryable();
            }
            else
            {
                return null;
            }
        }

        public void CoffeesListView_InsertItem()
        {
                var item = new CoffeeHouse.CoffeeHousesModels.Coffee();
                TryUpdateModel(item);
                coffees.Add(item);
        }
        // The return type can be changed to IEnumerable, however to support
        // paging and sorting, the following parameters must be added:
        //     int maximumRows
        //     int startRowIndex
        //     out int totalRowCount
        //     string sortByExpression
        public IQueryable<CoffeeHouse.CoffeeHousesModels.Food> FoodListView_GetData()
        {
            if (foods != null)
            {
                return foods.AsQueryable();
            }
            else
            {
                return null;
            }
        }

        public void FoodListView_InsertItem()
        {
            var item = new CoffeeHouse.CoffeeHousesModels.Food();
            TryUpdateModel(item);
                foods.Add(item);
        }
   }
}