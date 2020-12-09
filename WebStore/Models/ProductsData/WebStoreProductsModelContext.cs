using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace WebStore.Models.ProductsData
{
    public partial class WebStoreProductsModelContext : DbContext
    {
        public WebStoreProductsModelContext()
        {
        }

        public WebStoreProductsModelContext(DbContextOptions<WebStoreProductsModelContext> options)
            : base(options)
        {
        }

        public virtual DbSet<City> City { get; set; }
        public virtual DbSet<DescriptionHelper> DescriptionHelper { get; set; }
        public virtual DbSet<ModelType> ModelType { get; set; }
        public virtual DbSet<Product> Product { get; set; }
        public virtual DbSet<ProductSet> ProductSet { get; set; }
        public virtual DbSet<ProductType> ProductType { get; set; }
        public virtual DbSet<ProductTypeDescription> ProductTypeDescription { get; set; }
        public virtual DbSet<Storage> Storage { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<City>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<DescriptionHelper>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(20);
            });

            modelBuilder.Entity<ModelType>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.DescriptionValues)
                    .IsRequired()
                    .HasColumnType("text");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(20);

                entity.Property(e => e.Ptdid).HasColumnName("PTDId");

                entity.HasOne(d => d.Ptd)
                    .WithMany(p => p.ModelType)
                    .HasForeignKey(d => d.Ptdid)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ModelType_ProductTypeDescription");
            });

            modelBuilder.Entity<Product>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Info).HasColumnType("text");

                entity.Property(e => e.Price).HasColumnType("money");

                entity.Property(e => e.Producer)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.HasOne(d => d.ModelType)
                    .WithMany()
                    .HasForeignKey(d => d.ModelTypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Product_ModelType");

                entity.HasOne(d => d.ProductType)
                    .WithMany()
                    .HasForeignKey(d => d.ProductTypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Product_ProductType");
            });

            modelBuilder.Entity<ProductSet>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<ProductType>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.HasOne(d => d.ProductSet)
                    .WithMany(p => p.ProductType)
                    .HasForeignKey(d => d.ProductSetId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ProductType_ProductSet");
            });

            modelBuilder.Entity<ProductTypeDescription>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Description)
                    .IsRequired()
                    .HasColumnType("text");

                entity.HasOne(d => d.ProductType)
                    .WithMany(p => p.ProductTypeDescription)
                    .HasForeignKey(d => d.ProductTypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ProductTypeDescription_ProductType");
            });

            modelBuilder.Entity<Storage>(entity =>
            {
                entity.HasNoKey();

                entity.HasOne(d => d.City)
                    .WithMany()
                    .HasForeignKey(d => d.CityId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Storage_City");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
