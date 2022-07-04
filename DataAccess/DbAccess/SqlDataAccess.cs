using Dapper;
using Microsoft.Extensions.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace DataAccess.DbAccess
{
    public class SqlDataAccess : ISqlDataAccess
    {
        private readonly IConfiguration _config;

        public SqlDataAccess(IConfiguration config)
        {
            _config = config;
        }

        /// <summary>
        /// Donde IEnumerable<T> correspondería a una colección del Tipo T
        /// </summary>
        /// <typeparam name="T">Corresponde a un genérico, el cual representa a cualquier tipo de dato queramos retornar</typeparam>
        /// <typeparam name="U">Corresponde a los parámetros que serán pasados al procedimiento Almecenado</typeparam>
        /// <returns></returns>
        public async Task<IEnumerable<T>> getData<T, U>(string storedProcedure,
                                                        U parameters,
                                                        string connectionId = "Default")
        {
            using IDbConnection connection = new SqlConnection(_config.GetConnectionString(connectionId));

            return await connection.QueryAsync<T>(storedProcedure, parameters, commandType: CommandType.StoredProcedure);
        }

        public async Task setData<U>(string storedProcedure,
                                    U parameters,
                                  string connectionId = "Default")
        {
            using IDbConnection connection = new SqlConnection(_config.GetConnectionString(connectionId));

            await connection.ExecuteAsync(storedProcedure, parameters, commandType: CommandType.StoredProcedure);

        }
    }
}
