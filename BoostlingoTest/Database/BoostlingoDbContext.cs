using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BoostlingoTest.Database
{
    public class BoostlingoDbContext : DbContext
    {
        // Reference to 'People' table
        public DbSet<People> People { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            // Connection string, it would be updated as needed
            optionsBuilder.UseSqlServer("Server=localhost;Database=boostlingoDB;Integrated Security=True;TrustServerCertificate=true;");
        }
    }
}
