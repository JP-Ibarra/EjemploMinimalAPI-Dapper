using DataAccess.DbAccess;
using DataAccess.Models;

namespace DataAccess.Data
{
    public class DataUsuario : IDataUsuario
    {
        private readonly ISqlDataAccess _db;

        public DataUsuario(ISqlDataAccess db)
        {
            _db = db;
        }

        public Task<IEnumerable<UsuarioModel>> GetUsuarios() => _db.getData<UsuarioModel, dynamic>(storedProcedure: "dbo.spGetUserList", new { });
        public async Task<UsuarioModel?> GetUsuario(int Id)
        {
            var resultado = await _db.getData<UsuarioModel, dynamic>(storedProcedure: "dbo.spGetUser",
                                                                     new { Id = Id });
            return resultado.FirstOrDefault();
        }

        public Task CreateUsuario(UsuarioModel usuario) => _db.setData(storedProcedure: "dbo.spCreateUser",
                                                                       new { usuario.Nombre, usuario.Apellidos, usuario.Correo });

        public Task UpdateUsuario(UsuarioModel usuario) => _db.setData(storedProcedure: "dbo.spUpdateUser",
                                                                       new { usuario.Id, usuario.Nombre, usuario.Apellidos, usuario.Correo });
        public Task DeleteUsuario(int Id) => _db.setData(storedProcedure: "dbo.spDeleteUser", new { Id = Id });
    }
}
