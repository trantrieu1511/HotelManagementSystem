using System;
using System.IO;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.Extensions.Configuration;

#nullable disable

namespace ContentManagementSystem.Models
{
    public partial class MyHotelContext : DbContext
    {
        public MyHotelContext()
        {
        }

        public MyHotelContext(DbContextOptions<MyHotelContext> options)
            : base(options)
        {
        }

        public virtual DbSet<BedType> BedTypes { get; set; }
        public virtual DbSet<BookDetail> BookDetails { get; set; }
        public virtual DbSet<Booking> Bookings { get; set; }
        public virtual DbSet<Customer> Customers { get; set; }
        public virtual DbSet<Employee> Employees { get; set; }
        public virtual DbSet<Room> Rooms { get; set; }
        public virtual DbSet<RoomType> RoomTypes { get; set; }
        public virtual DbSet<RoomTypeDetail> RoomTypeDetails { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            var builder = new ConfigurationBuilder()
                              .SetBasePath(Directory.GetCurrentDirectory())
                              .AddJsonFile("appsettings.json", optional: true, reloadOnChange: true);
            IConfigurationRoot configuration = builder.Build();
            optionsBuilder.UseSqlServer(configuration.GetConnectionString("MyCnn"));
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "SQL_Latin1_General_CP1_CI_AS");

            modelBuilder.Entity<BedType>(entity =>
            {
                entity.ToTable("BedType");

                entity.Property(e => e.BedTypeId).HasColumnName("BedTypeID");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(100);
            });

            modelBuilder.Entity<BookDetail>(entity =>
            {
                entity.HasKey(e => e.BdId)
                    .HasName("PK__BookDeta__DACD68A99E78A7A4");

                entity.ToTable("BookDetail");

                entity.Property(e => e.BdId).HasColumnName("BD_ID");

                entity.Property(e => e.Amount).HasColumnType("money");

                entity.Property(e => e.BookId).HasColumnName("BookID");

                entity.Property(e => e.CheckIn).HasColumnType("date");

                entity.Property(e => e.CheckOut).HasColumnType("date");

                entity.Property(e => e.RoomId).HasColumnName("RoomID");

                entity.HasOne(d => d.Book)
                    .WithMany(p => p.BookDetails)
                    .HasForeignKey(d => d.BookId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__BookDetai__BookI__398D8EEE");

                entity.HasOne(d => d.Room)
                    .WithMany(p => p.BookDetails)
                    .HasForeignKey(d => d.RoomId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__BookDetai__RoomI__3A81B327");
            });

            modelBuilder.Entity<Booking>(entity =>
            {
                entity.HasKey(e => e.BookId)
                    .HasName("PK__Booking__3DE0C227F4911DCD");

                entity.ToTable("Booking");

                entity.Property(e => e.BookId).HasColumnName("BookID");

                entity.Property(e => e.BookDate).HasColumnType("datetime");

                entity.Property(e => e.CusId)
                    .IsRequired()
                    .HasMaxLength(4000)
                    .HasColumnName("CusID");

                entity.Property(e => e.IsCancelled).HasColumnName("isCancelled");

                entity.HasOne(d => d.Cus)
                    .WithMany(p => p.Bookings)
                    .HasForeignKey(d => d.CusId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Booking__isCance__36B12243");
            });

            modelBuilder.Entity<Customer>(entity =>
            {
                entity.HasKey(e => e.CusId)
                    .HasName("PK__Customer__2F1871309EED12A7");

                entity.ToTable("Customer");

                entity.Property(e => e.CusId)
                    .HasMaxLength(4000)
                    .HasColumnName("CusID")
                    .HasComputedColumnSql("(('CUS'+replicate('0',(5)-len([Id])))+CONVERT([nvarchar],[Id]))", true)
                    .ValueGeneratedNever();

                entity.Property(e => e.Dob)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("DOB");

                entity.Property(e => e.Email)
                    .IsRequired()
                    .HasMaxLength(35)
                    .IsUnicode(false);

                entity.Property(e => e.FirstName)
                    .IsRequired()
                    .HasMaxLength(25);

                entity.Property(e => e.Id).ValueGeneratedOnAdd();

                entity.Property(e => e.LastName)
                    .IsRequired()
                    .HasMaxLength(25);

                entity.Property(e => e.Password)
                    .HasMaxLength(25)
                    .IsUnicode(false);

                entity.Property(e => e.PhoneNumber)
                    .HasMaxLength(35)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Employee>(entity =>
            {
                entity.HasKey(e => e.EmpId)
                    .HasName("PK__Employee__AF2DBA793AF9BDA7");

                entity.ToTable("Employee");

                entity.Property(e => e.EmpId)
                    .HasMaxLength(4000)
                    .HasColumnName("EmpID")
                    .HasComputedColumnSql("((upper(left([FirstName],(1))+left([LastName],(1)))+replicate('0',(5)-len([Id])))+CONVERT([nvarchar],[Id]))", true)
                    .ValueGeneratedNever();

                entity.Property(e => e.Dob)
                    .HasMaxLength(50)
                    .IsUnicode(false)
                    .HasColumnName("DOB");

                entity.Property(e => e.Email)
                    .HasMaxLength(35)
                    .IsUnicode(false);

                entity.Property(e => e.FirstName)
                    .IsRequired()
                    .HasMaxLength(25);

                entity.Property(e => e.HireDate)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Id).ValueGeneratedOnAdd();

                entity.Property(e => e.LastName)
                    .IsRequired()
                    .HasMaxLength(25);

                entity.Property(e => e.Password)
                    .IsRequired()
                    .HasMaxLength(25)
                    .IsUnicode(false);

                entity.Property(e => e.PhoneNumber)
                    .HasMaxLength(35)
                    .IsUnicode(false);

                entity.Property(e => e.ReportsTo).HasMaxLength(4000);

                entity.Property(e => e.Username)
                    .IsRequired()
                    .HasMaxLength(25)
                    .IsUnicode(false);

                entity.HasOne(d => d.ReportsToNavigation)
                    .WithMany(p => p.InverseReportsToNavigation)
                    .HasForeignKey(d => d.ReportsTo)
                    .HasConstraintName("FK__Employee__Report__267ABA7A");
            });

            modelBuilder.Entity<Room>(entity =>
            {
                entity.ToTable("Room");

                entity.Property(e => e.RoomId).HasColumnName("RoomID");

                entity.Property(e => e.IsAvailable)
                    .IsRequired()
                    .HasColumnName("isAvailable")
                    .HasDefaultValueSql("((1))");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.RoomTypeId).HasColumnName("RoomTypeID");

                entity.HasOne(d => d.RoomType)
                    .WithMany(p => p.Rooms)
                    .HasForeignKey(d => d.RoomTypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Room__RoomTypeID__31EC6D26");
            });

            modelBuilder.Entity<RoomType>(entity =>
            {
                entity.ToTable("RoomType");

                entity.Property(e => e.RoomTypeId).HasColumnName("RoomTypeID");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.Property(e => e.Price).HasColumnType("money");
            });

            modelBuilder.Entity<RoomTypeDetail>(entity =>
            {
                entity.HasKey(e => e.RtdId)
                    .HasName("PK__RoomType__F67F5A992EB1ABC2");

                entity.ToTable("RoomTypeDetail");

                entity.Property(e => e.RtdId).HasColumnName("RTD_ID");

                entity.Property(e => e.BedTypeId).HasColumnName("BedTypeID");

                entity.Property(e => e.RoomTypeId).HasColumnName("RoomTypeID");

                entity.HasOne(d => d.BedType)
                    .WithMany(p => p.RoomTypeDetails)
                    .HasForeignKey(d => d.BedTypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__RoomTypeD__BedTy__2E1BDC42");

                entity.HasOne(d => d.RoomType)
                    .WithMany(p => p.RoomTypeDetails)
                    .HasForeignKey(d => d.RoomTypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__RoomTypeD__RoomT__2D27B809");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
