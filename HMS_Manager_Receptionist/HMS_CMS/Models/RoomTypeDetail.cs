using System;
using System.Collections.Generic;

#nullable disable

namespace HMS_CMS.Models
{
    public partial class RoomTypeDetail
    {
        public int RoomTypeId { get; set; }
        public int BedTypeId { get; set; }
        public int BedAmount { get; set; }

        public virtual BedType BedType { get; set; }
        public virtual RoomType RoomType { get; set; }
    }
}
