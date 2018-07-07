using System;

namespace P02_DatabaseFirst
{
    using Data;
    using System.Collections.Generic;
    using System.Linq;

    public class StartUp_05
    {
        static void Main(string[] args)
        {
            SoftUniContext dbContext = new SoftUniContext();

            using (dbContext)
            {
                var employees = dbContext
                    .Employees
                    .Where(e => e.Department.Name == "Research and Development")
                    .Select(x => new
                    {
                        x.FirstName,
                        x.LastName,
                        DepartmentName = x.DepartmentId,
                        x.Salary

                    })
                    .OrderBy(e => e.Salary)
                    .ThenByDescending(e => e.FirstName)
                    .ToList();

                foreach (var e in employees)
                {
                    Console.WriteLine($"{e.FirstName} {e.LastName} from {e.DepartmentName} - ${e.Salary:f2}");
                }
            }
        }
    }
}