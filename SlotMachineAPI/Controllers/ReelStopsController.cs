using Microsoft.AspNetCore.Mvc;

namespace SlotMachineAPI.Controllers
{
    [ApiController]
    [Route("api")]
    public class ReelStopsController : ControllerBase
    {
        [HttpGet("reelstopsdata")]
        public List<int> GetReelStops()
        {
            // TODO: retrieve reel stops from database or other data source
            // in this example, return a fixed set of reel stops for demonstration purposes
            return new List<int> { 2, 4, 1 };
        }
    }
}
