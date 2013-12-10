using CocoFarm.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CocoFarm.DataAccess
{
    public class ProdusDataStore: IDataStore<Produs>
    {

        public IEnumerable<Produs> GetAll()
        {
            List<Produs> produse = new List<Produs>();

            using ( SqlConnection connection = new SqlConnection(DB.ConnectionString) )
            {
                connection.Open();
                SqlCommand command = connection.CreateCommand();
                command.CommandType = System.Data.CommandType.Text;
                command.CommandText = "select * from dbo.Produs";

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while(reader.Read())
                    {
                        Produs prod = new Produs();
                        prod.Id = (int)reader["Id"];
                        prod.Denumire = (string)reader["Denumire"];
                        prod.Cod = (string)reader["Cod"];
                        prod.Descriere = (string)reader["Descriere"];
                        produse.Add(prod);
                    }
                }
            }

            return produse;
        }

        public Produs GetById(int id)
        {
            Produs prod = new Produs();
            using (SqlConnection connection = new SqlConnection(DB.ConnectionString))
            {
                connection.Open();
                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "dbo.uspGetProdusById";

                    //add parameter
                    command.Parameters.AddWithValue("@id", id);

                    //exec
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            prod.Id = (int)reader["Id"];
                            prod.Denumire = (string)reader["Denumire"];
                            prod.Cod = (string)reader["Cod"];
                            prod.Descriere = (string)reader["Descriere"];
                        }
                    }
                }
            }
            return prod;
        }

        public Produs GetByIdSimple(int id)
        {
            Produs patient = null;
            using (SqlConnection connection = new SqlConnection(DB.ConnectionString))
            {
                connection.Open();
                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "dbo.uspGetProdusById";

                    //add parameter
                    command.Parameters.AddWithValue("@id", id);

                    SqlDataAdapter dataAdapter = new SqlDataAdapter(command);

                    DataTable table = new DataTable();

                    dataAdapter.Fill(table);

                   
                    if(table.Rows.Count > 0)
                    {
                        DataRow row = table.Rows[0];
                        patient = new Produs()
                        {
                            Cod = (String)row["Cod"],
                            Denumire = (String)row["Denumire"],
                            Descriere = (String)row["Descriere"],
                            Id = (int)row["Id"]
                        }; 
                    }

                }
            }
            return patient;
        }

        public Produs Create(Produs entity)
        {
            using (SqlConnection connection = new SqlConnection(DB.ConnectionString))
            {
                connection.Open();
                SqlCommand command = connection.CreateCommand();
                command.CommandType = System.Data.CommandType.Text;
                command.CommandText = @"INSERT INTO [dbo].[Produs] ([Denumire], [Cod], [Descriere]) 
                                        VALUES (@Den, @Cod, @Descr); SELECT CAST( SCOPE_IDENTITY() AS int ); ";
                
                /*SqlParameter paramId = command.CreateParameter();
                paramId.Value = entity.Id;
                paramId.ParameterName = "@Id";
                paramId.DbType = System.Data.DbType.Int32;
                command.Parameters.Add(paramId); */

                //o alta varianta
                command.Parameters.AddWithValue("@Den",entity.Denumire);
                command.Parameters.AddWithValue("@Cod", entity.Cod);
                command.Parameters.AddWithValue("@Descr", entity.Descriere);

                entity.Id = (int)command.ExecuteScalar();

            }

            return entity;
        }

        public Produs Update(Produs entity)
        {
            using (SqlConnection connection = new SqlConnection(DB.ConnectionString))
            {
                connection.Open();

                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "dbo.uspUpdateProdus";

                    //add parameter
                    command.Parameters.AddWithValue("@id", entity.Id);
                    command.Parameters.AddWithValue("@den", entity.Denumire);
                    command.Parameters.AddWithValue("@cod", entity.Cod);
                    command.Parameters.AddWithValue("@descr", entity.Descriere);

                    command.ExecuteNonQuery();  
                }
            }
            return entity;
        }

        public void Delete(int id)
        {
            
        }
    }
}
