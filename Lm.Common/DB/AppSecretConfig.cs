﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Lm.Common.Helper;

namespace Lm.Common.DB
{
    public class AppSecretConfig
    {
        private static string Audience_Secret = Appsettings.app(new string[] { "Appsettings", "Audience", "Secret" });
        private static string Audience_Secret_File = Appsettings.app(new string[] { "Appsettings", "Audience", "SecretFile" });


        public static string Audience_Secret_String => InitAudience_Secret();


        private static string InitAudience_Secret()
        {
            var securityString = DifDBConnOfSecurity(Audience_Secret_File);
            if (!string.IsNullOrEmpty(Audience_Secret_File) && !string.IsNullOrEmpty(securityString))
            {
                return securityString;
            }
            else
            {
                return Audience_Secret;
            }

        }

        private static string DifDBConnOfSecurity(params string[] conn)
        {
            foreach (var item in conn)
            {
                try
                {
                    if (File.Exists(item))
                    {
                        return File.ReadAllText(item).Trim();
                    }
                }
                catch (System.Exception) { }
            }

            return conn[conn.Length - 1];
        }

    }
}
