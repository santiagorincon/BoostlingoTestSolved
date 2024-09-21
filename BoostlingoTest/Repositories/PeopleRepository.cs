using BoostlingoTest.Database;
using BoostlingoTest.Model;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BoostlingoTest.Repositories
{
    public static class PeopleRepository
    {
        // Method to store people data in database
        public static void SavePeople(List<Person> people)
        {
            using (BoostlingoDbContext dbcontext = new BoostlingoDbContext())
            {
                // Delete all existing data in the table to avoid duplicated data
                dbcontext.Database.ExecuteSqlRaw("TRUNCATE TABLE People");

                foreach (Person person in people)
                {
                    // Getting name and lastname from name property
                    var nameAsArray = person.name.Split(' ');
                    var newPersonName = nameAsArray[0];
                    var newPersonLastname = nameAsArray.Length > 1 ? nameAsArray[1] : string.Empty;

                    // Adding new person in database
                    People newPerson = new People
                    {
                        id = person.id,
                        name = newPersonName,
                        lastname = newPersonLastname,
                        bio = person.bio,
                        language = person.language,
                        version = person.version
                    };
                    dbcontext.People.Add(newPerson);
                }

                // Saving changes in database
                dbcontext.SaveChanges();
            }
        }

        // Method to get people stored in database, sorting by Person’s Last Name Then by First Name.
        public static List<Person> GetAllPeople() {
            using (BoostlingoDbContext dbcontext = new BoostlingoDbContext())
            {
                var peopleFromDB = dbcontext.People.Select(p => new Person{
                    bio = p.bio,
                    id = p.id,
                    name = p.name,
                    lastname = p.lastname,
                    language = p.language,
                    version = p.version
                })
                .OrderBy(p => p.lastname)
                .ThenBy(p => p.name)
                .ToList();

                return peopleFromDB;
            }
        }
    }
}
