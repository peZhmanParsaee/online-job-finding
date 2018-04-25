using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace OnlineJobFinding.DAL.Database
{
    public class DALBase
    {
        string ConnectionString
        {
            get 
            {
                return "Data Source=(local);Initial Catalog=OnlineJobFinding;Integrated Security=True";
            }
        }

        protected object DoExecuteScalar(CommandType commandType, string commandText, params SqlParameter[] commandParameters)
        {
            using (SqlConnection con = new SqlConnection(ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = commandType;
                cmd.CommandText = commandText;
                cmd.Parameters.AddRange(commandParameters);

                con.Open();                
                object retVal = (object) cmd.ExecuteScalar();
                con.Close();

                return retVal;
            }
            
        }

        protected int DoExecuteNonQuery(CommandType commandType, string commandText, params SqlParameter[] commandParameters)
        {
            using (SqlConnection con = new SqlConnection(ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = commandType;
                cmd.CommandText = commandText;
                cmd.Parameters.AddRange(commandParameters);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                int affectedRows = 0;
                return affectedRows;
            }
        }
                
        protected DataTable DoExecuteDataTable(CommandType commandType, string commandText, params SqlParameter[] commandParameters)
        {
            using (SqlConnection con = new SqlConnection(ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = commandType;
                cmd.CommandText = commandText;
                cmd.Parameters.AddRange(commandParameters);

                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);

                con.Open();
                da.Fill(dt);
                con.Close();

                return dt;
            }
        }

        protected SqlDataReader DoExecuteReader(CommandType commandType, string commandText, params SqlParameter[] commandParameters)
        {
            SqlConnection con = new SqlConnection(ConnectionString);
            
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = commandType;
            cmd.CommandText = commandText;
            cmd.Parameters.AddRange(commandParameters);

            Boolean mustCloseConnection = false;

            try
            {
                if (con.State != ConnectionState.Open)
                {
                    mustCloseConnection = true;
                    con.Open();
                }
                else
                    mustCloseConnection = false;

                SqlDataReader dataReader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
                return dataReader;
            }
            catch
            {
                if (mustCloseConnection)
                    con.Close();
                throw;
            }
        }

        protected DataSet DoExecuteDataset(CommandType commandType, string commandText, params SqlParameter[] commandParameters)
        {
            using (SqlConnection con = new SqlConnection(ConnectionString))
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = commandType;
                cmd.CommandText = commandText;
                cmd.Parameters.AddRange(commandParameters);
                DataSet ds = new DataSet();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                con.Open();
                da.Fill(ds);
                con.Close();
                return ds;
            }
        }

    }
}
