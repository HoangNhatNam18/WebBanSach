using BookStore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BookStore.Areas.Admin.Commons
{
    public class OrderCommon
    {
        public static BookstoreEntities db = new BookstoreEntities();
        public static int NumberOrder = db.Orders.Count(m => m.Status == true);
    }
}