using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OutwardProcessor
{
    public class AppVariable
    {
        public static string ServerLogin = "server=" + ConfigurationManager.AppSettings["DBServer"] + ";database=ACH;uid=floraweb;pwd=platinumfloor967";
        public static string LogPath = ConfigurationManager.AppSettings["LogPath"];
        public static string CBSURI = ConfigurationManager.AppSettings["CBSURI"];

        //Outward 
        public static string OCREATETRANSACTION_IOPK_REQ = ConfigurationManager.AppSettings["OCREATETRANSACTION_IOPK_REQ"];
        public static string OSOURCE = ConfigurationManager.AppSettings["OSOURCE"];
        public static string OUBSCOMP = ConfigurationManager.AppSettings["OUBSCOMP"];
        public static string OUSERID = ConfigurationManager.AppSettings["OUSERID"];
        public static string OMODULEID = ConfigurationManager.AppSettings["OMODULEID"];
        public static string OSERVICE = ConfigurationManager.AppSettings["OSERVICE"];
        public static string OOPERATION = ConfigurationManager.AppSettings["OOPERATION"];
        public static string OSOURCE_OPERATION = ConfigurationManager.AppSettings["OSOURCE_OPERATION"];
        public static string OBRANCH = ConfigurationManager.AppSettings["OBRANCH"];
        public static string OROUTINGNO = ConfigurationManager.AppSettings["OROUTINGNO"];

        //IRE 
        public static string IRESOURCE = ConfigurationManager.AppSettings["IRESOURCE"];
        public static string IREUBSCOMP = ConfigurationManager.AppSettings["IREUBSCOMP"];
        public static string IREUSERID = ConfigurationManager.AppSettings["IREUSERID"];
        public static string IREBRANCH = ConfigurationManager.AppSettings["IREBRANCH"];
        public static string IREMODULEID = ConfigurationManager.AppSettings["IREMODULEID"];
        public static string IRESERVICE = ConfigurationManager.AppSettings["IRESERVICE"];
        public static string IREOPERATION = ConfigurationManager.AppSettings["IREOPERATION"];
        public static string IRESOURCE_OPERATION = ConfigurationManager.AppSettings["IRESOURCE_OPERATION"];
        public static string IREROUTINGNO = ConfigurationManager.AppSettings["IREROUTINGNO"];

        //Common
        public static string SOURCE = ConfigurationManager.AppSettings["SOURCE"];
        public static string UBSCOMP = ConfigurationManager.AppSettings["UBSCOMP"];
        public static string USERID = ConfigurationManager.AppSettings["USERID"];
        public static string BRANCH = ConfigurationManager.AppSettings["BRANCH"];
        public static string MODULEID = ConfigurationManager.AppSettings["MODULEID"];
        public static string SERVICE = ConfigurationManager.AppSettings["SERVICE"];
        public static string OPERATION = ConfigurationManager.AppSettings["OPERATION"];
        public static string SOURCE_OPERATION = ConfigurationManager.AppSettings["SOURCE_OPERATION"];
    }
}