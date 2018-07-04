using System;

namespace P02_DatabaseFirst
{
    using Data;
    using System.Linq;

    public class StartUp_03
    {
        static void Main(string[] args)
        {
            SoftUniContext dbContext = new SoftUniContext();

            using (dbContext)
            {
                var employees = dbContext
                    .Employees
                    .OrderBy(e => e.EmployeeId)
                    .ToList();

                foreach (var employee in employees)
                {
                    Console.WriteLine(employee.ToString());
                }

                //employees.ForEach(x => Console.WriteLine($"{x.FirstName} {x.LastName} {x.MiddleName} {x.JobTitle} {x.Salary:f2}"));
            }
        }
    }
}
