//using System;

//namespace P02_DatabaseFirst
//{
//    using Data;
//    using System.Collections.Generic;
//    using System.Linq;

//    public class StartUp_04
//    {
//        static void Main(string[] args)
//        {
//            SoftUniContext dbContext = new SoftUniContext();

//            using (dbContext)
//            {
//                List<string> employeesNames = dbContext
//                    .Employees
//                    .Where(e => e.Salary > 50000)
//                    .Select(e => e.FirstName)
//                    .OrderBy(e => e)
//                    .ToList();

//                foreach (string employee in employeesNames)
//                {
//                    Console.WriteLine(employee);
//                }
//            }
//        }
//    }
//}