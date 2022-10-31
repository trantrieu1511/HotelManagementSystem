using System;
using System.Collections.Generic;

#nullable disable

namespace ContentManagementSystem.Models
{
    public partial class Room
    {
        public Room()
        {
            BookDetails = new HashSet<BookDetail>();
        }

        public int RoomId { get; set; }
        public string Name { get; set; }
        public int RoomTypeId { get; set; }
        public int Floor { get; set; }
        public string View { get; set; }
        public bool? IsAvailable { get; set; }

        public virtual RoomType RoomType { get; set; }
        public virtual ICollection<BookDetail> BookDetails { get; set; }
    }
}
