1. Create a ASP.Net Core Web Application Name AngularCorePayment: Select Template as Asp.Net Core Web API
2. Add Models Folder in the application
3. Add Specific Model Class into the Models Folder:
	public class PaymentDetail
    {
        [Key]
        public int PaymentDetailId { get; set; }
        [Column(TypeName ="nvarchar(100)")]
        public string CardOwnerName { get; set; }
        [Column(TypeName = "nvarchar(16)")]
        public string CardNumber { get; set; }
        [Column(TypeName = "nvarchar(5)")]
        public string ExpirationDate { get; set; }
        [Column(TypeName = "nvarchar(3)")]
        public string SecurityCode { get; set; }
    }
4. Add the required references to work with SQL Server Database & .Net Framework:
	a. Go to Tools Menu-> Nuget Package Manager-> Package Manager Consol
	b. Run below command:
		i) Install-Package Microsoft.EntityFrameworkCore
		ii) Install-Package Microsoft.EntityFrameworkCore.SqlServer
		iii) Install-Package Microsoft.EntityFrameworkCore.Tools
		iv) Install-Package Microsoft.VisualStudio.Web.CodeGeneration.Utils
	Or From Manage NuGet Packages...
		i) Install "Microsoft.EntityFrameworkCore"
		ii) Install "Microsoft.EntityFrameworkCore.SqlServer"
		iii) Install "Microsoft.EntityFrameworkCore.Tools"		
		iv) Install "Microsoft.VisualStudio.Web.CodeGeneration.Utils"
	And Rebuild Project
5. Add Specific Model Classes into the Models Folder:
	public class PaymentDetailContext:DbContext
    {
        public PaymentDetailContext(DbContextOptions<PaymentDetailContext>options):base(options)
        {

        }
        public DbSet<PaymentDetail> PaymentDetails { get; set; }
    }
6. Open Startup.cs file & add add services inside the ConfigureServices() Method:
	services.AddControllers();
	services.AddDbContext<PaymentDetailContext>(options =>
    options.UseSqlServer(Configuration.GetConnectionString("DevConnection")));

7. Add Connection String into the appsettings.json file: 	
	"ConnectionStrings": {
		"DevConnection": "Server=HASH;Database=PaymentDetailDB;user id=sa;password=sqldb123;Trusted_Connection=True;MultipleActiveResultSets=True;"
		//"DbConnection": "Server=(local)\\sqlexpress;Database=PaymentDetailDB;Trusted_Connection=True;MultipleActiveResultSets=True;"
8. Migration Database:
	a. Go to Tools Menu-> Nuget Package Manager-> Package Manager Consol
	b. Run below command: 
		PM> Add-Migration "InitialCreate"
		PM> Update-Database
	
	c. Now Open Microsoft Sql Server Management Studio and Check Primary Key Identity (Yes: 1,1): 
9. Add API Controller with actions, using Empty Framework [PaymentDetailController Name as NameController] inside Controller Folder:
	

================================================================================		

Configure the database and add model class to do the following steps:
	
	
	a) Run below scripts into the Sql Server Management Studio: 
		Create Database APICoreDB
		Use APICoreDB
		Create table Employee(Id int primary key identity(1,1),Name varchar(50)mDepartment varchar(50),Salary decimal(10,2))
		Insert into Employee(Name,Department,Salary) Values('Sumon','DotNet','65000')
		Insert into Employee(Name,Department,Salary) Values('Mahbub','DotNet','70000')
		Select * from Employee
	b) PM> Scaffold-DbContext "Server=HASH;Database=APICoreDB;user id=sa;password=sqldb123;" Microsoft.EntityFrameworkCore.SqlServer -OutputDir Models
	
	Now Add Connection String into the appsettings.json file: "DbConnection":"Server=HASH;Database=APICoreDB;user id=sa;password=sqldb123;"
3. Add Models, Views, Controllers, Interface and Services Folder in the application
4. Configure the database and add model classes to do the following steps:
	a) Run below scripts into the Sql Server Management Studio: 
		Create Database APICoreDB
		Use APICoreDB
		Create table Employee(Id int primary key identity(1,1),Name varchar(50)mDepartment varchar(50),Salary decimal(10,2))
		Insert into Employee(Name,Department,Salary) Values('Sumon','DotNet','65000')
		Insert into Employee(Name,Department,Salary) Values('Mahbub','DotNet','70000')
		Select * from Employee
	b) PM> Scaffold-DbContext "Server=HASH;Database=APICoreDB;user id=sa;password=sqldb123;" Microsoft.EntityFrameworkCore.SqlServer -OutputDir Models
	
	Now Add Connection String into the appsettings.json file: "DbConnection":"Server=HASH;Database=APICoreDB;user id=sa;password=sqldb123;"
5. Add Specific Model Classes into the Models Folder:
	public class [Class Name]
	{
		public int Id {get; set;}
		public string Name {get; set;}
		public string Remarks {get; set;}
	}
6. Add [Service Name as NameService] Class inside Services Folder
7. Add [Interface Name as INameService] Interface inside Interface Folder and Make it public
8. Now Inherit INameService Interface on NameService Class inside Services Folder
9. Open Startup.cs file & add add services inside the ConfigureServices() Method:
	//services.AddRazorPages();
	services.AddControllers();
	services.AddHttpClient();
	services.AddSingleton<IConfiguration>(Configuration);
	services.AddDbContext<APICoreDBContext>(options =>
		options.UseSqlServer(Configuration["DbConnection"]));
		
	services.AddTransient<INameService, NameService>();
	
10. Add Empty API Controller [API Controller Name as NameController] inside Controller Folder:
11. Add some method inside IEmployeeService Interface:
		IEnumerable<Employee> GetEmployees();
        Employee GetEmployeeById(int id);
        Employee DeleteEmployee(int id);
        Employee AddEmployee(Employee emp);
        Employee EditEmployee(Employee emp);
12. Now add below code inside EmployeeService class:
	private readonly APICoreDBContext dbContext;
    public EmployeeService(APICoreDBContext _dbContext)
    {
        dbContext = _dbContext;
    }
13. Add below code inside EmployeeController Controller:
	private readonly IEmployeeService employeeService;
    public EmployeeController(IEmployeeService _employeeService)
    {
        employeeService = _employeeService;
    }
