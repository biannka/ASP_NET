using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Drawing;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.Schema;

namespace CoffeeHouse
{
    public partial class AddXml : System.Web.UI.Page
    {
        CoffeeHousesModels.CoffeeHouseDbContext context = new CoffeeHousesModels.CoffeeHouseDbContext();

        protected void Page_Load(object sender, EventArgs e)
        {

            foreach (string filename in Directory.GetFiles(Server.MapPath("~/App_Data"), "*.xml"))
            {
                string status = "успешно прехвърлен в БД";
                Boolean success = true;

                try
                {
                    XmlReaderSettings settings = new XmlReaderSettings();
                    settings.ValidationType = ValidationType.Schema;
                    settings.ValidationFlags = settings.ValidationFlags | XmlSchemaValidationFlags.ReportValidationWarnings;
                    settings.DtdProcessing = DtdProcessing.Ignore;

                    // Зареждане на файла и валидиране
                    XmlReader reader = XmlReader.Create(filename, settings);
                    XmlDocument doc = new XmlDocument();
                    doc.Load(reader);
                    doc.Schemas.Add(null, Server.MapPath("~/App_Data/coffeeHouse.xsd"));
                    doc.Validate(null);

                    // Преобразуване от обекти на XML в обекти на модела и проверка дали вече съществуват в БД
                    XmlToDb(doc);
                }
                catch (DbEntityValidationException exception)
                {
                    foreach (var eve in exception.EntityValidationErrors)
                    {
                        status = "Грешка при прехвърлянето. " + eve.Entry.Entity.GetType().Name + eve.Entry.State + "\n";
                        Console.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
                            eve.Entry.Entity.GetType().Name, eve.Entry.State);
                        foreach (var ve in eve.ValidationErrors)
                        {
                            Console.WriteLine("- Property: \"{0}\", Error: \"{1}\"",
                                ve.PropertyName, ve.ErrorMessage);
                            status = status + "- Property: \"" + ve.PropertyName + " Error: \"{1}\"" + ve.ErrorMessage + "\n";
                        }
                    }
                }
                catch (Exception ex)
                {
                    status = status + "Грешка при прехвърлянето: " + ex.Message;
                    success = false;
                }

                // Добавяне на ред в таблицата на състоянията на прехвърлянето
                TableRow fileRow = new TableRow();
                fileRow.Cells.Add(new TableCell() { Text = Path.GetFileName(filename) });
                fileRow.Cells.Add(new TableCell() { Text = "– " + status, ForeColor = success ? Color.Green : Color.Red });
                ImportStatusTable.Rows.Add(fileRow);
            }
        }

        private void XmlToDb(XmlNode xmlDocument)
        {
            using (var isolatedContext = new CoffeeHousesModels.CoffeeHouseDbContext())
            {
                var coffeeHouseXml = xmlDocument.SelectSingleNode("CoffeeHouse");

                var cofeeHouse = new CoffeeHousesModels.CoffeeHouse();
                cofeeHouse.Id = coffeeHouseXml.Attributes["id"].InnerText;
                cofeeHouse.name = coffeeHouseXml.SelectSingleNode("name").InnerText;
                cofeeHouse.working_time = coffeeHouseXml.SelectSingleNode("working_time").InnerText;

                if (isolatedContext.CoffeeHouses.Count(bs => bs.Id == cofeeHouse.Id) != 0)
                {
                    throw new Exception("такова кафене (ID " + cofeeHouse.Id + ") вече е в БД");
                }

                var contactsXml = coffeeHouseXml.SelectSingleNode("contacts");
                var contacts = new CoffeeHousesModels.Contact();
                contacts.Id = contactsXml.Attributes["id"].InnerText;
                if (isolatedContext.CoffeeHouses.Count(bs => bs.Id == contacts.Id) != 0)
                {
                    throw new Exception("такъв контакт (ID " + cofeeHouse.Id + ") вече е в БД");
                }
                contacts.phone = contactsXml.SelectSingleNode("phone").InnerText;
                contacts.email = contactsXml.SelectSingleNode("e-mail").InnerText;
                contacts.website = contactsXml.SelectSingleNode("website").InnerText;

                var locationXml1 = contactsXml.SelectSingleNode("location");
                var location = new CoffeeHousesModels.Location();
                location.Id = locationXml1.Attributes["id"].InnerText;
                if (isolatedContext.CoffeeHouses.Count(bs => bs.Id == location.Id) != 0)
                {
                    throw new Exception("това адрес (ID " + location.Id + ") вече е в БД");
                }
                if (locationXml1.SelectSingleNode("country") != null)
                {
                    location.country = locationXml1.SelectSingleNode("country").InnerText;
                }
                location.city = locationXml1.SelectSingleNode("city").InnerText;
                      
                if (locationXml1.SelectSingleNode("street") != null)
                {
                    location.street = locationXml1.SelectSingleNode("street").InnerText;
                }
                        
                location.building_number = locationXml1.SelectSingleNode("building_number").InnerText;
                contacts.Locations = location;
                cofeeHouse.Contacts = contacts;
                
                foreach (XmlNode employeesXml in coffeeHouseXml.SelectNodes("employees/employee"))
                    {
                        var employee = new CoffeeHousesModels.Employee();
                        employee.id = employeesXml.Attributes["id"].InnerText;
                        if (isolatedContext.CoffeeHouses.Count(bs => bs.Id == employee.id) != 0)
                        {
                            throw new Exception("такъв служител (ID " + cofeeHouse.Id + ") вече е в БД");
                        }
                        employee.position = employeesXml.Attributes["position"].InnerText;
                        employee.sex = employeesXml.Attributes["sex"].InnerText;
                        employee.emp_name = employeesXml.SelectSingleNode("emp_name").InnerText;
                        employee.salary = employeesXml.SelectSingleNode("salary").InnerText;
                        if (employeesXml.SelectSingleNode("age") != null)
                        {
                            employee.age = employeesXml.SelectSingleNode("age").InnerText;
                        }
                        cofeeHouse.Employees.Add(employee);
                    }

                var workingHoursXml = coffeeHouseXml.SelectSingleNode("workingHours");
              
                foreach (XmlNode productXml in coffeeHouseXml.SelectNodes("products/product"))
                {
                    var product = new CoffeeHousesModels.Product();
                    product.Id = productXml.Attributes["id"].InnerText;
                    if (isolatedContext.CoffeeHouses.Count(bs => bs.Id == product.Id) != 0)
                    {
                        throw new Exception("тази книжарница (ID " + cofeeHouse.Id + ") вече е в БД");
                    }
                    product.price = productXml.SelectSingleNode("price").InnerText;
                    product.product_name = productXml.SelectSingleNode("product_name").InnerText;

                       if (productXml.SelectSingleNode("description") != null)
                        {
                            product.description = productXml.SelectSingleNode("description").InnerText;
                        } 
                    
                        foreach (XmlNode coffeeXml in productXml.SelectNodes("coffee"))
                        {
                            var coffee = new CoffeeHousesModels.Coffee();
                            coffee.Id = coffeeXml.Attributes["id"].InnerText;
                            if (isolatedContext.CoffeeHouses.Count(bs => bs.Id == coffee.Id) != 0)
                            {
                                throw new Exception("тази напитка (ID " + coffee.Id + ") вече е в БД");
                            }
                            coffee.drink_type = coffeeXml.Attributes["drink_type"].InnerText;
                            if (coffeeXml.Attributes["supplement_type"] != null)
                            {
                                coffee.supplement_type = coffeeXml.Attributes["supplement_type"].InnerText;
                            }
                            else
                            {
                                coffee.supplement_type = "Без";
                            }
                            coffee.coffee_type = coffeeXml.SelectSingleNode("coffee_type").InnerText;
                            coffee.coffee_name = coffeeXml.SelectSingleNode("coffee_name").InnerText;
                            if (coffeeXml.SelectSingleNode("supplement_price") != null)
                            {
                                coffee.supplement_price = coffeeXml.SelectSingleNode("supplement_price").InnerText;
                            }
                            product.Coffees.Add(coffee);
                        }
                        product.Coffees.Add(null);
                    
                        foreach (XmlNode foodXml in productXml.SelectNodes("food"))
                        {
                            var food = new CoffeeHousesModels.Food();
                            food.Id = foodXml.Attributes["id"].InnerText;
                            if (isolatedContext.CoffeeHouses.Count(bs => bs.Id == food.Id) != 0)
                            {
                                throw new Exception("тази храна (ID " + food.Id + ") вече е в БД");
                            }
                            food.food_type = foodXml.Attributes["food_type"].InnerText;
                            food.food_name = foodXml.SelectSingleNode("food_name").InnerText;
                            product.Foods.Add(food);
                        }
                        product.Foods.Add(null);
                        cofeeHouse.Products.Add(product);
                   }

                if (coffeeHouseXml.SelectSingleNode("gift") != null)
                {
                    XmlNode giftXml = coffeeHouseXml.SelectSingleNode("gift");

                    var gift = new CoffeeHousesModels.Gift();
                    gift.Id = giftXml.Attributes["id"].InnerText;
                    if (isolatedContext.CoffeeHouses.Count(bs => bs.Id == gift.Id) != 0)
                    {
                        throw new Exception("тази отстъпка (ID " + gift.Id + ") вече е в БД");
                    }
                    gift.gift_type = giftXml.Attributes["gift_type"].InnerText;
                    gift.gift_reason = giftXml.Attributes["gift_reason"].InnerText;
                    gift.gift_name = giftXml.SelectSingleNode("gift_name").InnerText;
                    cofeeHouse.Gifts = gift;

                }
                else
                {
                    cofeeHouse.Gifts = null;
                }
                // добавяне на всички обекти, свързани с CoffeeHouse
                isolatedContext.CoffeeHouses.Add(cofeeHouse);

                isolatedContext.SaveChanges();
            }
        }

    }
}