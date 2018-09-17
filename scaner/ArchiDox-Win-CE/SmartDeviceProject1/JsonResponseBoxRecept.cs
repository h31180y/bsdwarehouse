using System;
using System.Linq;
using System.Collections.Generic;
using System.Text;

namespace ArchiDox
{
    class JsonResponseBoxRecept
    {
        public string status { get; set; }
        public object content { get; set; }
        public string error { get; set; }
    }
}
