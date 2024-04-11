

public class AppService
{
    private readonly AppDbContext _context;

    public AppService(AppDbContext context)
    {
        _context = context;
    }

    public void AddPerson(Person person)
    {
        _context.People.Add(person);
        _context.SaveChanges();
    }

    public List<Person> GetPeople()
    {
        return _context.People.ToList();
    }
}