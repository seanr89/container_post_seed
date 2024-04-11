

using Microsoft.EntityFrameworkCore;

public class AppDbContext : DbContext
{
    public DbSet<Person> People { get; set; }
    public DbSet<Movie> Movies { get; set; }
    public AppDbContext()
    {
        // Create a new instance of the DbContext
    }

    public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
    {
        this.ChangeTracker.LazyLoadingEnabled = false;
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Person>()
            .HasKey(p => p.Id);
    
        modelBuilder.Entity<Movie>()
            .HasKey(p => p.Id);
    }
}