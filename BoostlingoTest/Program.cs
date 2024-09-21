using BoostlingoTest.Database;
using BoostlingoTest.Model;
using BoostlingoTest.Repositories;
using Microsoft.EntityFrameworkCore;
using System.Data;
using System.Net;
using System.Runtime.CompilerServices;
using System.Text.Json;

namespace BoostlingoTest
{
    internal class Program
    {
        static async Task Main(string[] args)
        {
            // Provided URL with Json Data
            string jsonUrl = "https://microsoftedge.github.io/Demos/json-dummy-data/64KB.json";

            // Method to read Json From URL
            List<Person>? people = await ReadPeopleFromJsonUrlAsync(jsonUrl);

            if(people != null)
            {
                // Save data retrieved from URL
                PeopleRepository.SavePeople(people);

                // Read data from Database, result is already sorted as requested
                var peopleFromDB = PeopleRepository.GetAllPeople();

                foreach(Person person in peopleFromDB)
                {
                    // Show result data in console
                    Console.WriteLine(person.ToString());
                }
            }
            else
            {
                // Message when data was not retrieved for any reason
                Console.WriteLine("Data was not available");
            }
        }

        public static async Task<List<Person>?> ReadPeopleFromJsonUrlAsync(string url)
        {
            // Open a HTTP client
            using (HttpClient client = new HttpClient())
            {
                try
                {
                    // Get the data
                    HttpResponseMessage response = await client.GetAsync(url);
                    // Throw an exception if status code is an error code
                    response.EnsureSuccessStatusCode();

                    // Save data as json string and then it is mapped
                    string jsonResponse = await response.Content.ReadAsStringAsync();
                    var people = JsonSerializer.Deserialize<List<Person>>(jsonResponse);

                    if(people == null || !people.Any())
                    {
                        throw new Exception("There is no data in provided URL");
                    }
                    return people;
                }
                catch (Exception e)
                {
                    // Error message when it gets an exception
                    Console.WriteLine("Error trying to get data from URL: ", e.Message);
                    return null;
                }
            }
        }
    }
}