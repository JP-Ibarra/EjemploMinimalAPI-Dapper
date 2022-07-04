using DataAccess.Models;

namespace DataAccess.Data
{
    public interface IDataUsuario
    {
        Task CreateUsuario(UsuarioModel usuario);
        Task DeleteUsuario(int Id);
        Task<UsuarioModel?> GetUsuario(int Id);
        Task<IEnumerable<UsuarioModel>> GetUsuarios();
        Task UpdateUsuario(UsuarioModel usuario);
    }
}