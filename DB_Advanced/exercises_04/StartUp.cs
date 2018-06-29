using exercises_01;
using System;
using System.Data.SqlClient;

namespace exercises_04
{
    public class StartUp
    {
        public static void Main(string[] args)
        {
            string villainsInfo = @"SELECT V.[Name], COUNT(MV.MinionId) AS MinionsCount	FROM Villains AS V	JOIN MinionsVillains AS MV	ON MV.VillainId = V.Id	GROUP BY V.[Name]	HAVING COUNT(MV.MinionId) >= 3	ORDER BY MinionsCount DESC";

            using (SqlConnection connection = new SqlConnection(Configuration.ConnectionString))
            {

                connection.Open();

                using (SqlCommand command = new SqlCommand(villainsInfo, connection))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Console.WriteLine($"{reader[0]} -> {reader[1]}");
                        }
                    }
                }

                connection.Close();
            }
        }
    }
}
