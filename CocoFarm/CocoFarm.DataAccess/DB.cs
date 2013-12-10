using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace CocoFarm
{
    public sealed class DB
    {
        public static string ConnectionString
        {
            get { return ConfigurationManager.ConnectionStrings["GeorgianaDB"].ConnectionString; }
        }
    }
}