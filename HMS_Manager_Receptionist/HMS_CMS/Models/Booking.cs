using System;
using System.Collections.Generic;

#nullable disable

namespace HMS_CMS.Models
{
    public partial class Booking
    {
        public Booking()
        {
            BookDetails = new HashSet<BookDetail>();
        }

        public int BookId { get; set; }
        public int CusId { get; set; }
        public DateTime BookDate { get; set; }
        public int NumOfAdult { get; set; }
        public int NumOfChildren { get; set; }
        public int NumOfRoom { get; set; }
        public bool PaymentStatus { get; set; }
        public string SpecialRequests { get; set; }
        public bool IsCancelled { get; set; }

        public virtual Customer Cus { get; set; }
        public virtual ICollection<BookDetail> BookDetails { get; set; }
    }
}
