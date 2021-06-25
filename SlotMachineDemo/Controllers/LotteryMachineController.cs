using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Mime;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using Lm.Common.Helper;
using Microsoft.Extensions.Configuration;
using SqlSugar;

namespace SlotMachine.Controllers
{
    public class LotteryMachineController : Controller
    {
        protected StringBuilder sbProductlist= new StringBuilder();

        protected StringBuilder sbscrolllist = new StringBuilder();

        int wincount = 0;

        private readonly IConfiguration Configuration;

        private readonly ISqlSugarClient _db;


        public LotteryMachineController(IConfiguration configuration, ISqlSugarClient db)
        {
            Configuration = configuration;
            _db = db;
        }


        // GET: LotteryMachineController
        [HttpGet]
        public async Task<ActionResult> Index()
        {
            try
            {
                await GetProductlist();
                await GetScrollList();
            }
            catch (Exception exception)
            {
                await HttpContext.Response.WriteAsync(exception.ToString());
                await HttpContext.Response.WriteAsync("系统不稳定，请稍后再试！");
            }

            return View();
        }

        private async Task GetProductlist()
        {
            var sqlstr = "select * from Products;";
            var product_dt = await _db.Ado.GetDataTableAsync(sqlstr);
            if (product_dt != null && product_dt.Rows.Count > 0)
                for (var i = 0; i < product_dt.Rows.Count; i++)
                {
                    sbProductlist.Append("<li>");
                    sbProductlist.Append("     <img src=\"" +
                                            SecurityHelper.ToStr(product_dt.Rows[i]["gameimgurl"]) +
                                            "\" productid=\"" + SecurityHelper.ToStr(product_dt.Rows[i]["productid"]) +
                                            "\" alt=\"" + SecurityHelper.ToStr(product_dt.Rows[i]["productname"]) +
                                            "\">");
                    sbProductlist.Append("</li>");
                }
 
            ViewBag.sbProductlistone= sbProductlist;
            ViewBag.sbProductlisttwo = sbProductlist;
            ViewBag.sbProductlistthree = sbProductlist;
            ViewBag.sbProductlistfour = sbProductlist;
        }

        private async Task GetScrollList()
        {
            string SqlStr = @"SELECT info.cellphone,erInfo.prizedesc,
                                   p.productname, 
                                   win.* 
                            FROM   elevenrewardwin win 
                                   JOIN orderitem o 
                                     ON o.productvals = win.pidsquence 
                                   JOIN elevenrewardinfo erInfo 
                                     ON erInfo.id = win.prizeid 
                                   JOIN basicinfo info 
                                     ON info.openid = o.openid 
                                   JOIN products p 
                                     ON p.productid = erInfo.winproductid order by win.id";

            DataTable dt = await _db.Ado.GetDataTableAsync(SqlStr);
            wincount = dt.Rows.Count;

            if (wincount == 0)
            {
                sbscrolllist.Append("<li class=\"contentcenter\">暂无中奖记录，请等待开奖。</li>");
                sbscrolllist.Append("<li></li>");
                sbscrolllist.Append("<li></li>");
                sbscrolllist.Append("<li></li>");
                sbscrolllist.Append("<li></li>");
            }
            else if (wincount > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    //sbscrolllist.AppendFormat("<li>恭喜{0}用户获得泰普尔{1}</li>", Security.ToStr(dt.Rows[i]["cellphone"]),
                    //    Security.ToStr(dt.Rows[i]["productname"]));
                    sbscrolllist.AppendFormat("<li>恭喜{0}用户获得{1}</li>",
                        Regex.Replace(SecurityHelper.ToStr(dt.Rows[i]["cellphone"]), "(\\d{3})\\d{4}(\\d{4})",
                            "$1****$2"),
                        SecurityHelper.ToStr(dt.Rows[i]["prizedesc"]));
                }

                //为了平滑滚动效果，需要追加空的li
                sbscrolllist.Append("<li></li>");
                sbscrolllist.Append("<li></li>");
                sbscrolllist.Append("<li></li>");
                sbscrolllist.Append("<li></li>");

                ViewBag.sbscrolllist = sbscrolllist;
            }
            else
            {
                //for (int i = 0; i < dt.Rows.Count; i++)
                //{
                //    sbscrolllist.AppendFormat("<li>恭喜{0}用户获得泰普尔{1}</li>",
                //        Regex.Replace(SecurityHelper.ToStr(dt.Rows[i]["cellphone"]), "(\\d{3})\\d{4}(\\d{4})", "$1****$2"),
                //        SecurityHelper.ToStr(dt.Rows[i]["productname"]));
                //}
            }

            //string sql ="INSERT INTO OrderItem(Openid,Productvals,product1,product2,product3,product4)VALUES(@OpenID,@Productvals,@Product1,@Product2,@Product3,@Product4)";
            //int result = await _db.Ado.ExecuteCommandAsync(sql);
        }
    }
}