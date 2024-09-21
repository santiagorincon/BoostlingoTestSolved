using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BoostlingoTest.Database
{
    public class People
    {
        [Key]
        public string id { get; set; }
        [Required]
        public string name { get; set; }
        [Required]
        public string lastname { get; set; }
        [Required]
        public string language { get; set; }
        [Required]
        public string bio { get; set; }
        [Required]
        public decimal version { get; set; }
    }
}
