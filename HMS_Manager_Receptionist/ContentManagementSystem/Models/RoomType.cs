using System;
using System.Collections.Generic;

#nullable disable

namespace ContentManagementSystem.Models
{
    public partial class RoomType
    {
        public RoomType()
        {
            RoomTypeDetails = new HashSet<RoomTypeDetail>();
            Rooms = new HashSet<Room>();
        }

        public int RoomTypeId { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public string Img { get; set; }
        public string Description { get; set; }
        public int Adult { get; set; }
        public int Children { get; set; }

        public virtual ICollection<RoomTypeDetail> RoomTypeDetails { get; set; }
        public virtual ICollection<Room> Rooms { get; set; }
    }
}
