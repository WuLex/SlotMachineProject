using Lm.Common.Helper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using SqlSugar;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Text.Encodings.Web;
using System.Threading.Tasks;

namespace SlotMachine.Controllers
{
    public class ChouJiangController : Controller
    {
        string jsonStr = "";

        //string methods = context.Request["name"].ToString();
        //string method = Jinti.Common.SecurityHelper.RequestSafeStr("op");
        //string seqpid = SecurityHelper.RequestSafeStr("seqnum");

        private readonly IConfiguration Configuration;

        private readonly ISqlSugarClient _db;
        private readonly string openid = "NTLH3596SDSD_WE";
        private static IHttpContextAccessor _contextAccessor;

        protected StringBuilder sbscrolllist = new StringBuilder();
        protected StringBuilder sbProductlist = new StringBuilder();

        public ChouJiangController(IConfiguration configuration, ISqlSugarClient db, IHttpContextAccessor contextAccessor)
        {
            Configuration = configuration;
            _db = db;
            _contextAccessor = contextAccessor;
        }

        public IActionResult Index()
        {
            return View();
        }

        public async Task<String> GetRewardwinsAsync()
        {
            string SqlStr = @"SELECT info.cellphone,erInfo.prizedesc,
                                   p.productname, 
                                   win.* 
                            FROM   elevenrewardwin win 
                                   JOIN orderitem o 
                                     ON o.productvals = win.pidsquence 
                                   JOIN elevenrewardinfo erInfo 
                                     ON erInfo.id = win.prizeInfoId 
                                   JOIN basicinfo info 
                                     ON info.openid = o.openid 
                                   JOIN products p 
                                     ON p.productid = erInfo.winproductid order by win.id";

            DataTable dt = await _db.Ado.GetDataTableAsync(SqlStr);
            int wincount = dt.Rows.Count;

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
                    sbscrolllist.AppendFormat("<li class=\"\">恭喜{0}用户获得{1}</li>",
                        Regex.Replace(SecurityHelper.ToStr(dt.Rows[i]["cellphone"]), "(\\d{3})\\d{4}(\\d{4})", "$1****$2"),
                        SecurityHelper.ToStr(dt.Rows[i]["prizedesc"]));
                }

                //为了平滑滚动效果，需要追加空的li
                sbscrolllist.Append("<li></li>");
                sbscrolllist.Append("<li></li>");
                sbscrolllist.Append("<li></li>");
                sbscrolllist.Append("<li></li>");
            }
            else
            {
                //for (int i = 0; i < dt.Rows.Count; i++)
                //{
                //    sbscrolllist.AppendFormat("<li class=\"\">恭喜{0}用户获得泰普尔{1}</li>",
                //        Regex.Replace(SecurityHelper.ToStr(dt.Rows[i]["cellphone"]), "(\\d{3})\\d{4}(\\d{4})", "$1****$2"),
                //        SecurityHelper.ToStr(dt.Rows[i]["productname"]));
                //}
            }

            jsonStr = "{\"code\":3,\"htmlstr\":\"" + HtmlEncoder.Default.Encode(sbscrolllist.ToString()) +
                      "\",\"msg\":\"\"}";
            return jsonStr;
            //return View();
        }


        public async Task<String> GetRandomArryAsync()
        {
            string sql = "select top 1 * from ElevenRewardControl where ischosen=0 ORDER BY rangeid;";
            DataTable dt = await _db.Ado.GetDataTableAsync(sql);

            if (dt.Rows.Count > 0)
            {
                jsonStr = "{\"IdArry\":\"" + SecurityHelper.ToStr(dt.Rows[0]["controldata"]) + "\",\"code\":1}";
            }
            else
            {
                jsonStr = "{\"IdArry\":\"\",\"code\":-1,\"msg\":\"奖品已抽完！\"}";
            }

            return jsonStr;
            //return View();
        }


        public async Task<string> AddRewardAsync(string seqnum)
        {  //验证
            string[] seqpidArray = seqnum.Split(new Char[] { ',' }); //返回:{"1","2.3","","4"}
            if (seqpidArray.Length != 4)
            {
                jsonStr = "{\"code\":-101,\"msg\":\"抽奖数据存在问题，请稍后再试！\"}";
                return jsonStr;
            }
            else
            {
                seqnum = String.Join(",", seqpidArray);
            }

            //SqlParameter[] sp = new SqlParameter[10];
            //sp[0] = new SqlParameter("@OpenID", openid);
            //sp[1] = new SqlParameter("@Pidsquence", seqpid);
            //sp[2] = new SqlParameter("@Ischosen", 1);
            List<SugarParameter> list = new List<SugarParameter>(){
                          new SugarParameter("@OpenID",openid),
                          new SugarParameter("@Pidsquence",seqnum),
                          new SugarParameter("@Ischosen",1)
                        };
            //事务，更新ElevenRewardControl 的ischosen=1

            string insertsql = @"BEGIN TRANSACTION 

                            DECLARE @isupdated INT; 

                            UPDATE elevenrewardcontrol 
                            SET    ischosen = @Ischosen 
                            WHERE  controldata = @Pidsquence 
                                   AND ischosen = 0; 

                            SET @isupdated = @@ROWCOUNT; 

                            IF @isupdated != 0 
                              BEGIN 
                                  INSERT INTO elevenrewardwin 
                                              (pidsquence, 
                                               status, 
                                               operatorid, 
                                               prizeInfoId) 
                                  SELECT @Pidsquence, 
                                         1, 
                                         @OpenID, 
                                         prizeInfoId 
                                  FROM   elevenrewardcontrol 
                                  WHERE  controldata = @Pidsquence; 

                                  IF @@error <> 0 
                                    BEGIN 
                                        ROLLBACK TRANSACTION 

                                        SELECT @@error          AS errornum, 
                                               Scope_identity() insertedid, 
                                               @isupdated       updateflag; 
                                    END 
                                  ELSE 
                                    BEGIN 
                                        COMMIT TRANSACTION 

                                        SELECT @@error          AS errornum, 
                                               Scope_identity() insertedid, 
                                               @isupdated       updateflag; 
                                    END 
                              END 
                            ELSE 
                              ROLLBACK TRANSACTION 
                              SELECT @@error          AS errornum, 
                                     Scope_identity() insertedid, 
                                     @isupdated       updateflag; 
                                    ";

            DataTable result_dt = await _db.Ado.GetDataTableAsync(insertsql, list);

            int errornum = SecurityHelper.ToNum(result_dt.Rows[0]["errornum"]);
            int insertedid = SecurityHelper.ToNum(result_dt.Rows[0]["insertedid"]);
            int updated = SecurityHelper.ToNum(result_dt.Rows[0]["updateflag"]);

            //更新控制奖品表成功
            if (updated != 0)
            {
                //存在错误编号，数据操作失败
                if (errornum > 0)
                {
                    jsonStr = "{\"code\":-100,\"msg\":\"系统数据存在问题，请稍后再试！\"}";
                }
                else
                {
                    if (errornum == 0 && insertedid == 0)
                    {
                        jsonStr = "{\"code\":-102,\"msg\":\"不存在此签注顺序,请重新抽奖！\"}";
                    }
                    else
                    {
                        jsonStr = "{\"code\":2,\"msg\":\"保存成功！\"}";
                    }
                }
            }
            else
            {
                jsonStr = "{\"code\":-109,\"msg\":\"抽奖机正在运行中，请勿多人使用！\"}";
            }

            return jsonStr;
            //return View();
        }
        public async Task<String> GetListforMaskAsync(string seqnum)
        {
            string[] seqpidArray = seqnum.Split(new Char[] { ',' });
            if (seqpidArray.Length != 4)
            {
                jsonStr = "{\"code\":-101,\"msg\":\"抽奖数据存在问题，请稍后再试！\"}";
                return jsonStr;
            }
            else
            {
                seqnum = String.Join(",", seqpidArray);
            }

            //产品html
            string sql =
                @"select * from Products where productid in ({0}) order by CHARINDEX(RTRIM(CAST(productid as varchar)),'{0}')";
            sql = string.Format(sql, seqnum);

            DataTable product_dt = await _db.Ado.GetDataTableAsync(sql);

            //获奖的产品信息
            //SqlParameter[] sp = new SqlParameter[10];
            //sp[0] = new SqlParameter("@Prizevalue", seqnum);
            List<SugarParameter> list = new List<SugarParameter>(){
                          new SugarParameter("@Prizevalue",seqnum) };

            string winproductsql = @"SELECT er.prizelevel, 
                                       er.prizevalue, 
                                       er.prizedesc, 
                                       p.productname 
                                FROM   elevenrewardinfo er 
                                       JOIN products p 
                                       ON er.winproductid = p.productid 
                                       JOIN elevenrewardwin win 
                                       ON er.id = win.prizeInfoId 
                                 WHERE  win.pidsquence = @Prizevalue; ";

            DataTable winproduct_dt = await _db.Ado.GetDataTableAsync(winproductsql, list);


            if (product_dt != null && product_dt.Rows.Count == 4 && winproduct_dt != null && winproduct_dt.Rows.Count > 0)
            {
                for (int i = 0; i < product_dt.Rows.Count; i++)
                {
                    sbProductlist.Append("<li>");
                    sbProductlist.Append("   <img src=\"" + SecurityHelper.ToStr(product_dt.Rows[i]["imgurltwo"]) + "\"/>");
                    sbProductlist.Append("   <p>" + SecurityHelper.ToStr(product_dt.Rows[i]["productname"]) + "</p>");
                    sbProductlist.Append("</li>");
                }

                jsonStr = "{\"code\":6,\"htmlstr\":\"" + HtmlEncoder.Default.Encode(sbProductlist.ToString()) +
                          "\",\"prizedesc\":\"" + SecurityHelper.ToStr(winproduct_dt.Rows[0]["prizedesc"]) +
                          "\",\"prizename\":\"" + SecurityHelper.ToStr(winproduct_dt.Rows[0]["productname"]) + "\",\"msg\":\"\"}";
            }
            else
            {
                jsonStr = "{\"code\":-108,\"msg\":\"找不到相关商品，请稍后再试！\"}";
            }

            return jsonStr;
            //return View();
        }

    }
}
