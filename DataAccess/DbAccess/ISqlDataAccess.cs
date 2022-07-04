
namespace DataAccess.DbAccess
{
    public interface ISqlDataAccess
    {
        Task<IEnumerable<T>> getData<T, U>(string storedProcedure, U parameters, string connectionId = "Default");
        Task setData<U>(string storedProcedure, U parameters, string connectionId = "Default");
    }
}