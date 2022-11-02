using System;
using System.Collections.Generic;

#nullable disable

namespace HMS_CMS.Models
{
    public partial class BedType
    {
        public BedType()
        {
            RoomTypeDetails = new HashSet<RoomTypeDetail>();
        }

        public int BedTypeId { get; set; }
        public string Name { get; set; }

        public virtual ICollection<RoomTypeDetail> RoomTypeDetails { get; set; }
    }
}
