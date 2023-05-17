using Microsoft.AspNetCore.Mvc;
using SqlSugar;

namespace SlotMachineAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SlotMachineController : Controller
    {
        private readonly IConfiguration _configuration;

        private readonly ISqlSugarClient _db;

        public SlotMachineController(IConfiguration configuration, ISqlSugarClient db)
        {
            _configuration = configuration;
            _db = db;
        }

        [HttpGet]
        public ActionResult<List<int>> GetPrizePositions()
        {
            List<int> prizePositions = new List<int>();

            try
            {
                string sql = "SELECT TOP 3 Position FROM Prizes ORDER BY NEWID()";
                using var reader = _db.Ado.GetDataReader(sql);
                while (reader.Read())
                {
                    int position = Convert.ToInt32(reader["Position"]);
                    prizePositions.Add(position);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            return prizePositions;
        }
    }
}