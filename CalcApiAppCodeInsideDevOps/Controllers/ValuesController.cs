using Microsoft.AspNetCore.Mvc;
using HassanCalcDev;
using System.Linq;

//https://github.com/HassanEzz1/ApiApp2.git
// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace CalcApiAppCodeInsideDevOps.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ValuesController : ControllerBase
    {

        Calc x =new Calc();

        // GET: api/<ValuesController>
        [HttpGet("/average")]
        public int Average([FromQueryAttribute]int[]nums)
        {
               return x.Average(nums);

        }


        [HttpGet("/smallest")]
        public int Smallest([FromQueryAttribute] int[] nums)
        {
          return  x.Smallest(nums);
        }


        [HttpGet("/largest")]
        public int Largest([FromQueryAttribute] int[] nums)
        {
            return x.Largest(nums);
        }
    }

        
    
}
