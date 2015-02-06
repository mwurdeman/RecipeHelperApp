﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RecipeHelper.Domain
{
    public class Style
    {
        public int ID { get; set; }

        [Required]
        public string Name { get; set; }
        public string Description { get; set; }
    }
}
