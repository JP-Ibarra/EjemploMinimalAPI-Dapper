
namespace usuarioAPI
{
    public static class API
    {
        public static void ConfigureAPI(this WebApplication app) {
            //EndPoints
            app.MapGet("/usuarios", GetUsuarios);
            app.MapGet("/usuarios/{id}", GetUsuario);
            app.MapPost("/usuarios", CreateUsuario);
            app.MapPut("/usuarios", UpdateUsuario);
            app.MapDelete("/usuarios", DeleteUsuario);
        }


        private static async Task<IResult> GetUsuarios(IDataUsuario datos) {
            try
            {
                return Results.Ok(await datos.GetUsuarios());
            }
            catch (Exception ex)
            {
                return Results.Problem(ex.Message);
            }
        }
        private static async Task<IResult> GetUsuario(int id, IDataUsuario datos)
        {
            try
            {
                var resultados = await datos.GetUsuario(id);
                if (resultados == null) return Results.NotFound();
                return Results.Ok(resultados);
            }
            catch (Exception ex)
            {
                return Results.Problem(ex.Message);
            }
        }

        private static async Task<IResult> CreateUsuario(UsuarioModel usuario, IDataUsuario datos) {
            try
            {
                await datos.CreateUsuario(usuario);
                return Results.Ok();
            }
            catch (Exception ex)
            {
                return Results.Problem(ex.Message);
            }
        }

        private static async Task<IResult> UpdateUsuario(UsuarioModel usuario, IDataUsuario datos)
        {
            try
            {
                await datos.UpdateUsuario(usuario);
                return Results.Ok();
            }
            catch (Exception ex)
            {
                return Results.Problem(ex.Message);
            }
        }

        private static async Task<IResult> DeleteUsuario(int id, IDataUsuario datos)
        {
            try
            {
                await datos.DeleteUsuario(id);
                return Results.Ok();
            }
            catch (Exception ex)
            {
                return Results.Problem(ex.Message);
            }
        }
    }
}
