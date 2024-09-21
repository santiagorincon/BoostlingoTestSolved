using BoostlingoTest.Database;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace BoostlingoTest.Model
{
    public class Person
    {
        public required string id { get; set; }
        public required string name { get; set; }
        public string? lastname { get; set; }
        public required string language { get; set; }
        public required string bio {  get; set; }
        public required decimal version { get; set; }

        // Method to show object as string
        public override string ToString()
        {
            return $"---------------\r\nLastname: {lastname}\r\nName: {name}\r\nLanguage: {language}\r\nBio: {bio}\r\nVersion: {version}\r\nId: {id}";
        }
    }
}
