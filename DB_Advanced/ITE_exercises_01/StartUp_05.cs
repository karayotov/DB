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
            string department = "Research and Development";
            using (dbContext)
            {



                Console.WriteLine(string.Join(Environment.NewLine, dbContext
                    .Employees
                    .Where(e => e.Department.Name.Equals(department, StringComparison.OrdinalIgnoreCase))
                    .OrderBy(e => e.Salary)
                    .ThenByDescending(e => e.FirstName)
                    .Select(e => $"{e.FirstName} {e.LastName} from {department} - ${e.Salary:F2}")));

            }
        }
    }
}