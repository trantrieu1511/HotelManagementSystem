using System;
using System.Collections.Generic;

#nullable disable

namespace HMS_CMS.Models
{
    public partial class BookDetail
    {
        public int BdId { get; set; }
        public int BookId { get; set; }
        public int RoomId { get; set; }
        public DateTime CheckIn { get; set; }
        public DateTime CheckOut { get; set; }
        public decimal Amount { get; set; }

        public virtual Booking Book { get; set; }
        public virtual Room Room { get; set; }
    }
}
