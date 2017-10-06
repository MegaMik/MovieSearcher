using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MovieSearch
{
    public static class clsGlobalVars
    {
        public static int Total_results{ get; set; }
        public static int PageNum { get; set; }
        public static string StrSearchTitle { get; set; }
        //Keep Title in memory if radiobutton(page) is pressed 
        public static string StrSearchTitlePage { get; set; }

    }
}