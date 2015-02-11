﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RecipeHelper.Domain
{
    public class RecipeCategory
    {
        public Category Category { get; set; }
        public IEnumerable<Recipe> Recipes { get; set; }
    }
}