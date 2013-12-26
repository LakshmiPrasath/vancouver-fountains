# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.14)
# Database: fountains
# Generation Time: 2013-12-26 11:39:03 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table fountains
# ------------------------------------------------------------

DROP TABLE IF EXISTS `fountains`;

CREATE TABLE `fountains` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `lat` double DEFAULT NULL,
  `lng` double DEFAULT NULL,
  `name` char(225) NOT NULL DEFAULT '',
  `maintainer` char(225) DEFAULT '',
  `geom` geometry DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `fountains` WRITE;
/*!40000 ALTER TABLE `fountains` DISABLE KEYS */;

INSERT INTO `fountains` (`id`, `lat`, `lng`, `name`, `maintainer`, `geom`)
VALUES
	(1276,49.234947,-123.027254,'Aberdeen','Parks',X'0000000001010000008BA548BE129E4840DAAB8F87BEC15EC0'),
	(1277,49.275858,-123.024141,'Adanac','Parks',X'000000000101000000842BA0504FA34840895FB1868BC15EC0'),
	(1278,49.285554,-123.142392,'Alexandria','Parks',X'000000000101000000F99E91088DA4484092CD55F31CC95EC0'),
	(1279,49.26098,-123.184759,'Almond','Parks',X'0000000001010000007E74EACA67A1484011A96917D3CB5EC0'),
	(1280,49.278811,-123.106194,'Andy Livingstone','Parks',X'000000000101000000ED612F14B0A348400342EBE1CBC65EC0'),
	(1281,49.277951,-123.103575,'Andy Livingstone','Parks',X'000000000101000000FC71FBE593A34840BA6B09F9A0C65EC0'),
	(1282,49.262128,-123.155318,'Arbutus Greenway','Parks',X'000000000101000000D5AE09698DA14840BA9EE8BAF0C95EC0'),
	(1283,49.248679,-123.157991,'Arbutus Village','Parks',X'000000000101000000DB19A6B6D49F4840FD8348861CCA5EC0'),
	(1284,49.285919,-123.120939,'Art Phillips Park','Parks',X'0000000001010000000B2769FE98A44840E773EE76BDC75EC0'),
	(1285,49.245614,-123.175342,'Balaclava','Parks',X'0000000001010000004AB89047709F484060E7A6CD38CB5EC0'),
	(1286,49.255191,-123.050071,'Beaconsfield','Parks',X'000000000101000000E59D4319AAA0484098DEFE5C34C35EC0'),
	(1287,49.215521,-123.056107,'Bobolink','Parks',X'000000000101000000F54C2F31969B4840E884D04197C35EC0'),
	(1288,49.24745,-123.066226,'Brewers','Parks',X'00000000010100000096B20C71AC9F48404609FA0B3DC45EC0'),
	(1289,49.275112,-123.139769,'Burrard Civic Centre','Parks',X'0000000001010000005B5EB9DE36A34840A8FFACF9F1C85EC0'),
	(1290,49.290415,-123.050483,'Burrard View','Parks',X'00000000010100000049A297512CA5484041800C1D3BC35EC0'),
	(1291,49.256926,-123.172514,'Carnarvon','Parks',X'000000000101000000FDBE7FF3E2A048408A0629780ACB5EC0'),
	(1292,49.237223,-123.097143,'Cartier','Parks',X'000000000101000000F46DC1525D9E48404302469737C65EC0'),
	(1293,49.249585,-123.191688,'Chaldecott','Parks',X'0000000001010000003D49BA66F29F484048C2BE9D44CC5EC0'),
	(1294,49.268012,-123.125901,'Charleson','Parks',X'000000000101000000C0779B374EA24840286211C30EC85EC0'),
	(1295,49.264372,-123.083134,'China Creek North','Parks',X'00000000010100000033FD12F1D6A14840E2CB441152C55EC0'),
	(1296,49.261644,-123.079061,'China Creek South','Parks',X'000000000101000000E998F38C7DA14840E658DE550FC55EC0'),
	(1297,49.256746,-123.073107,'Clark','Parks',X'0000000001010000007DB08C0DDDA04840F486FBC8ADC45EC0'),
	(1298,49.270699,-123.050137,'Clinton','Parks',X'000000000101000000AB07CC43A6A2484074D4D17135C35EC0'),
	(1299,49.271281,-123.051686,'Clinton','Parks',X'0000000001010000005A83F755B9A248404FEACBD24EC35EC0'),
	(1300,49.289871,-123.125385,'Coal Harbour','Parks',X'0000000001010000008787307E1AA548402C9ACE4E06C85EC0'),
	(1301,49.2901697,-123.104505,'Coal Harbour','Parks',X'00000000010100000023E5DD4724A548402F51BD35B0C65EC0'),
	(1302,49.236946,-123.03638,'Collingwood','Parks',X'00000000010100000082751C3F549E48409F8EC70C54C25EC0'),
	(1303,49.231825,-123.113005,'Columbia','Parks',X'00000000010100000096B20C71AC9D484035D252793BC75EC0'),
	(1304,49.2617676,-123.16143,'Connaught','Parks',X'0000000001010000008293C89981A14840F8A57EDE54CA5EC0'),
	(1305,49.262869,-123.159336,'Connaught','Parks',X'000000000101000000ED10FFB0A5A14840D4449F8F32CA5EC0'),
	(1306,49.2738086,-123.113057,'Coopers\'','Parks',X'000000000101000000892E03290CA348405E656D533CC75EC0'),
	(1307,49.272798,-123.114649,'Coopers\'','Parks',X'00000000010100000005357C0BEBA248403961C26856C75EC0'),
	(1308,49.271632,-123.12572,'David Lam','Parks',X'00000000010100000006465ED6C4A24840001DE6CB0BC85EC0'),
	(1309,49.272394,-123.123289,'David Lam','Parks',X'00000000010100000035D07CCEDDA2484038BD8BF7E3C75EC0'),
	(1310,49.294985,-123.136001,'Devonian Harbour','Parks',X'000000000101000000C0E78711C2A548404ACE893DB4C85EC0'),
	(1311,49.253089,-123.122317,'Douglas','Parks',X'0000000001010000001AFD683865A04840ABAFAE0AD4C75EC0'),
	(1312,49.251936,-123.122502,'Douglas','Parks',X'000000000101000000B05758703FA0484074ECA012D7C75EC0'),
	(1313,49.205406,-123.132849,'Ebisu','Parks',X'0000000001010000007B336ABE4A9A48409A93179980C85EC0'),
	(1314,49.233484,-123.163401,'Elm','Parks',X'000000000101000000D311C0CDE29D48408EC8772975CA5EC0'),
	(1315,49.276991,-123.123796,'Emery Barnes Dog Park','Parks',X'000000000101000000A724EB7074A348400AD80E46ECC75EC0'),
	(1316,49.2765359,-123.124282,'Emery Barnes Park','Parks',X'000000000101000000C055438765A34840D05E7D3CF4C75EC0'),
	(1317,49.287419,-123.142573,'English Bay','Parks',X'000000000101000000E09F5225CAA44840BA1281EA1FC95EC0'),
	(1318,49.286027,-123.143035,'English Bay','Parks',X'000000000101000000F16261889CA44840BCCB457C27C95EC0'),
	(1319,49.278896,-123.13802,'English Bay','Parks',X'0000000001010000001C7E37DDB2A34840698CD651D5C85EC0'),
	(1320,49.2410466,-123.125112,'Eric Hamber','Parks',X'000000000101000000EFE76F9DDA9E48409415C3D501C85EC0'),
	(1321,49.254842,-123.029979,'Falaise','Parks',X'000000000101000000D8D2A3A99EA0484046240A2DEBC15EC0'),
	(1322,49.20713,-123.149337,'Fraser River','Parks',X'0000000001010000009F02603C839A48404CC5C6BC8EC95EC0'),
	(1323,49.20642,-123.150808,'Fraser River','Parks',X'000000000101000000C39E76F86B9A484069FE98D6A6C95EC0'),
	(1324,49.2112962,-123.042283,'Fraserview Golf','Parks',X'0000000001010000007162FEC00B9B4840508BC1C3B4C25EC0'),
	(1325,49.2139347,-123.051533,'Fraserview Golf','Parks',X'00000000010100000063FD5536629B48408C6A11514CC35EC0'),
	(1326,49.2082106,-123.045695,'Fraserview Golf','Parks',X'0000000001010000001CD71AA5A69A4840CEA5B8AAECC25EC0'),
	(1327,49.2123921,-123.051395,'Fraserview Golf','Parks',X'000000000101000000E2B611AA2F9B4840630B410E4AC35EC0'),
	(1328,49.268389,-123.058428,'Garden','Parks',X'00000000010100000096CD1C925AA24840ED4ACB48BDC35EC0'),
	(1329,49.236498,-123.031411,'Gaston','Parks',X'000000000101000000E2C80391459E4840056F48A302C25EC0'),
	(1330,49.212417,-123.093602,'George','Parks',X'000000000101000000A60EF27A309B4840C6353E93FDC55EC0'),
	(1331,49.271802,-123.129793,'George Wainborn','Parks',X'000000000101000000637E6E68CAA24840FC8F4C874EC85EC0'),
	(1332,49.273736,-123.070126,'Grandview','Parks',X'00000000010100000072DEFFC709A348405B26C3F17CC45EC0'),
	(1333,49.2671275,-123.137756,'Granville Loop Park','Parks',X'0000000001010000005E2EE23B31A24840FAB48AFED0C85EC0'),
	(1334,49.240977,-123.084994,'Grays','Parks',X'0000000001010000004A0B9755D89E4840CC96AC8A70C55EC0'),
	(1335,49.26422,-123.095575,'Guelph Park','Parks',X'0000000001010000007D7901F6D1A148402CD49AE61DC65EC0'),
	(1336,49.291228,-123.12327,'Harbour Green','Parks',X'000000000101000000F9D687F546A54840FDA4DAA7E3C75EC0'),
	(1337,49.290539,-123.12318,'Harbour Green','Parks',X'000000000101000000359BC76130A548405DE15D2EE2C75EC0'),
	(1338,49.290001,-123.121694,'Harbour Green','Parks',X'0000000001010000005567B5C01EA54840A587A1D5C9C75EC0'),
	(1339,49.28519,-123.128045,'Haro & Bute mini-park','Parks',X'000000000101000000B8921D1B81A44840A5DAA7E331C85EC0'),
	(1340,49.282563,-123.034264,'Hastings','Parks',X'000000000101000000A3073E062BA4484087DBA16131C25EC0'),
	(1341,49.283438,-123.034108,'Hastings','Parks',X'000000000101000000C93846B247A448400C2252D32EC25EC0'),
	(1342,49.283144,-123.042959,'Hastings','Parks',X'000000000101000000810706103EA4484068041BD7BFC25EC0'),
	(1343,49.280369,-123.040624,'Hastings Community','Parks',X'000000000101000000F7E7A221E3A34840B1DB679599C25EC0'),
	(1344,49.280379,-123.038221,'Hastings Community','Parks',X'0000000001010000001BBE8575E3A348404E417E3672C25EC0'),
	(1345,49.2456626,-123.106969,'Hillcrest','Parks',X'000000000101000000D86C40DF719F4840E52B8194D8C65EC0'),
	(1346,49.244776,-123.107665,'Hillcrest','Parks',X'000000000101000000406CE9D1549F4840207BBDFBE3C65EC0'),
	(1347,49.2710507,-123.110206,'Hinge Park','Parks',X'0000000001010000006A0712CAB1A24840AC74779D0DC75EC0'),
	(1348,49.2719084,-123.191736,'Jericho Beach','Parks',X'000000000101000000FCC0FAE4CDA24840D15D126745CC5EC0'),
	(1349,49.281987,-123.136052,'Jervis and Burnaby','Parks',X'000000000101000000D672672618A448408CA37213B5C85EC0'),
	(1350,49.253929,-123.061986,'John Hendry','Parks',X'000000000101000000C440D7BE80A04840D5B32094F7C35EC0'),
	(1351,49.264164,-123.107514,'Jonathan Rogers','Parks',X'000000000101000000E9633E20D0A148402D776682E1C65EC0'),
	(1352,49.263954,-123.045152,'Kaslo','Parks',X'000000000101000000FED2A23EC9A1484056D636C5E3C25EC0'),
	(1353,49.238138,-123.07429,'Kensington','Parks',X'000000000101000000A9F7544E7B9E4840DF1AD82AC1C45EC0'),
	(1354,49.233331,-123.1572,'Kerrisdale Centennial','Parks',X'0000000001010000004D124BCADD9D484099BB96900FCA5EC0'),
	(1355,49.227059,-123.041882,'Killarney','Parks',X'00000000010100000098A1F144109D4840A112D731AEC25EC0'),
	(1356,49.229195,-123.045343,'Killarney','Parks',X'0000000001010000000FB40243569D4840908653E6E6C25EC0'),
	(1357,49.247325,-123.074579,'Kingcrest','Parks',X'000000000101000000D93D7958A89F4840FA7DFFE6C5C45EC0'),
	(1358,49.274387,-123.153826,'Kisilano','Parks',X'00000000010100000049B9FB1C1FA3484091D10149D8C95EC0'),
	(1359,49.275753,-123.152287,'Kitsilano','Parks',X'0000000001010000000F63D2DF4BA34840C826F911BFC95EC0'),
	(1360,49.276739,-123.151743,'Kitsilano','Parks',X'0000000001010000008D43FD2E6CA3484067994528B6C95EC0'),
	(1361,49.2194057,-123.106335,'Langara Golf Course','Parks',X'0000000001010000002B07697C159C4840E4DA5031CEC65EC0'),
	(1362,49.2237851,-123.112543,'Langara Golf Course','Parks',X'00000000010100000082EA7AFDA49C484033198EE733C75EC0'),
	(1363,49.2230752,-123.116336,'Langara Golf Course','Parks',X'0000000001010000003A4668BA8D9C48403DD68C0C72C75EC0'),
	(1364,49.274969,-123.207164,'Locarno','Parks',X'000000000101000000F834272F32A34840263ACB2C42CD5EC0'),
	(1365,49.22997,-123.098511,'MacDonald','Parks',X'000000000101000000D3872EA86F9D4840F6D214014EC65EC0'),
	(1366,49.2615753,-123.107009,'Major Mathews','Parks',X'0000000001010000007F78A74C7BA148402CD8463CD9C65EC0'),
	(1367,49.22318,-123.159702,'Maple Grove','Parks',X'000000000101000000868F8829919C4840C5C6BC8E38CA5EC0'),
	(1368,49.223507,-123.160831,'Maple Grove','Parks',X'000000000101000000AAB69BE09B9C4840B64B1B0E4BCA5EC0'),
	(1369,49.205624,-123.138958,'Marpole','Parks',X'000000000101000000E8A221E3519A4840206118B0E4C85EC0'),
	(1370,49.267923,-123.180134,'McBride','Parks',X'000000000101000000516C054D4BA2484073B9C15087CB5EC0'),
	(1371,49.2788422,-123.089442,'McLean Park','Parks',X'00000000010100000052DFE819B1A34840E338F06AB9C55EC0'),
	(1372,49.2205907,-123.169628,'McLeery Golf Course','Parks',X'000000000101000000A026E9503C9C4840191F662FDBCA5EC0'),
	(1373,49.2209551,-123.167863,'McLeery Golf Course','Parks',X'0000000001010000003431B841489C484057CD7344BECA5EC0'),
	(1374,49.2203778,-123.170895,'McLeery Golf Course','Parks',X'000000000101000000D9E1F956359C4840320395F1EFCA5EC0'),
	(1375,49.236424,-123.029107,'Melbourne','Parks',X'000000000101000000A8FE4124439E48406B459BE3DCC15EC0'),
	(1376,49.231241,-123.086739,'Memorial South','Parks',X'000000000101000000463F1A4E999D48406A12BC218DC55EC0'),
	(1377,49.2314231,-123.084589,'Memorial South','Parks',X'000000000101000000FC04AB459F9D48407C26FBE769C55EC0'),
	(1378,49.243358,-123.187296,'Memorial West','Parks',X'000000000101000000289CDD5A269F4840FCAA5CA8FCCB5EC0'),
	(1379,49.214828,-123.084599,'Moberly','Parks',X'000000000101000000EE21E17B7F9B48408E91EC116AC55EC0'),
	(1380,49.2153386,-123.0872,'Moberly','Parks',X'00000000010100000081481A37909B4840840D4FAF94C55EC0'),
	(1381,49.287429,-123.142264,'Morton','Parks',X'00000000010100000004763579CAA448407BD976DA1AC95EC0'),
	(1382,49.273192,-123.074217,'Mosaic Creek','Parks',X'000000000101000000B1C398F4F7A24840AAF3A8F8BFC45EC0'),
	(1383,49.256865,-123.106446,'Mount Pleasant','Parks',X'000000000101000000573ECBF3E0A048409032E202D0C65EC0'),
	(1384,49.228277,-123.05692,'Nanaimo','Parks',X'000000000101000000E9B6442E389D4840419FC893A4C35EC0'),
	(1385,49.282838,-123.129981,'Nelson','Parks',X'00000000010100000074081C0934A448407D06D49B51C85EC0'),
	(1386,49.289431,-123.038691,'New Brighton','Parks',X'0000000001010000006BB933130CA5484092E9D0E979C25EC0'),
	(1387,49.289268,-123.036666,'New Brighton','Parks',X'000000000101000000C1E3DBBB06A5484002B859BC58C25EC0'),
	(1388,49.28959,-123.035531,'New Brighton','Parks',X'000000000101000000D39FFD4811A54840A1BFD02346C25EC0'),
	(1389,49.238173,-123.050828,'Norquay','Parks',X'00000000010100000026E5EE737C9E4840266E15C440C35EC0'),
	(1390,49.216585,-123.127387,'Oak','Parks',X'000000000101000000EFE6A90EB99B4840E0BBCD1B27C85EC0'),
	(1391,49.216607,-123.129122,'Oak','Parks',X'000000000101000000D78A36C7B99B48406CCCEB8843C85EC0'),
	(1392,49.216882,-123.128155,'Oak','Parks',X'000000000101000000A88B14CAC29B4840697407B133C85EC0'),
	(1393,49.282901,-123.094057,'Oppenheimer','Parks',X'000000000101000000BB80971936A448406FBDA60705C65EC0'),
	(1394,49.28287,-123.057199,'Pandora Park','Parks',X'00000000010100000080828B1535A448404A97FE25A9C35EC0'),
	(1395,49.2816629,-123.104505,'Pioneer Square','Parks',X'0000000001010000008EFFA7870DA448402F51BD35B0C65EC0'),
	(1396,49.2846537,-123.101821,'Portside','Parks',X'000000000101000000BB174E886FA44840F2423A3C84C65EC0'),
	(1397,49.242275,-123.113543,'Queen Elizabeth','Parks',X'000000000101000000B7D100DE029F484025ECDB4944C75EC0'),
	(1398,49.239167,-123.111542,'Queen Elizabeth','Parks',X'00000000010100000027A435069D9E484059880E8123C75EC0'),
	(1399,49.23742,-123.105621,'Queen Elizabeth','Parks',X'0000000001010000004AB54FC7639E48405531957EC2C65EC0'),
	(1400,49.24462,-123.148828,'Quilchena','Parks',X'00000000010100000048F949B54F9F4840A92EE06586C95EC0'),
	(1401,49.25211,-123.042086,'Renfrew','Parks',X'0000000001010000004E7FF62345A04840A5677A89B1C25EC0'),
	(1402,49.205739,-123.050981,'Riverfront','Parks',X'0000000001010000008141D2A7559A4840E9EDCF4543C35EC0'),
	(1403,49.205755,-123.051817,'Riverfront','Parks',X'00000000010100000087FE092E569A48401E1840F850C35EC0'),
	(1404,49.257792,-123.091912,'Robson','Parks',X'000000000101000000D1950854FFA048400987DEE2E1C55EC0'),
	(1405,49.216811,-123.082434,'Ross','Parks',X'000000000101000000DF347D76C09B48400685419946C55EC0'),
	(1406,49.216947,-123.082635,'Ross','Parks',X'0000000001010000008FFB56EBC49B484051A04FE449C55EC0'),
	(1407,49.270148,-123.030627,'Rupert','Parks',X'000000000101000000378AAC3594A24840F9D7F2CAF5C15EC0'),
	(1408,49.273071,-123.030636,'Rupert','Parks',X'000000000101000000363E93FDF3A248402385B2F0F5C15EC0'),
	(1409,49.27112,-123.033079,'Rupert','Parks',X'00000000010100000051A5660FB4A24840CDCB61F71DC25EC0'),
	(1410,49.2751248,-123.103111,'SE False Creek','Parks',X'000000000101000000C628194A37A34840E736E15E99C65EC0'),
	(1411,49.27099,-123.146205,'Seaforth','Parks',X'00000000010100000082C5E1CCAFA24840BF60376C5BC95EC0'),
	(1412,49.244294,-123.048373,'Slocan','Parks',X'000000000101000000F44D9A06459F48409A40118B18C35EC0'),
	(1413,49.2582608,-123.049711,'Slocan Greenway','Parks',X'0000000001010000005EEB9CB00EA1484018D00B772EC35EC0'),
	(1414,49.277484,-123.222396,'Spanish Banks','Parks',X'000000000101000000E694809884A34840B8B06EBC3BCE5EC0'),
	(1415,49.313033,-123.142625,'Stanley','Parks',X'000000000101000000CDC8207711A84840E3A59BC420C95EC0'),
	(1416,49.303,-123.130695,'Stanley Park - Lumbermen\'s Arch','Parks',X'000000000101000000105839B4C8A648400CB08F4E5DC85EC0'),
	(1417,49.292196,-123.146059,'Stanley Park - Tennis Courts','Parks',X'000000000101000000D102B4AD66A548405512D90759C95EC0'),
	(1418,49.298105,-123.129746,'Stanley Park- A  Frame Washrooms','Parks',X'00000000010100000015E3FC4D28A648405BB22AC24DC85EC0'),
	(1419,49.29988,-123.130947,'Stanley Park- Aquarium','Parks',X'000000000101000000BC5CC47762A6484099A0866F61C85EC0'),
	(1420,49.306095,-123.137497,'Stanley Park- Aviary','Parks',X'0000000001010000000C3CF71E2EA74840149337C0CCC85EC0'),
	(1421,49.3050743,-123.146132,'Stanley Park- Bridle Path','Parks',X'000000000101000000D0ACB6AC0CA748408A39083A5AC95EC0'),
	(1422,49.299111,-123.134117,'Stanley Park- Brockton Oval','Parks',X'000000000101000000DB6FED4449A648409C35785F95C85EC0'),
	(1423,49.306616,-123.142741,'Stanley Park- Brockton Point Lighthouse','Parks',X'00000000010100000015376E313FA7484018B325AB22C95EC0'),
	(1424,49.2936001,-123.148596,'Stanley Park- Ceperley Washrooms','Parks',X'00000000010100000019CD25B094A548404014CC9882C95EC0'),
	(1425,49.2937891,-123.149652,'Stanley Park- Cerperley Seawall','Parks',X'000000000101000000EC3598E19AA54840FC71FBE593C95EC0'),
	(1426,49.307347,-123.155447,'Stanley Park- Cricket Pavillion','Parks',X'00000000010100000009C3802557A74840B950F9D7F2C95EC0'),
	(1427,49.292239,-123.147,'Stanley Park- Lawn Bowling','Parks',X'000000000101000000D1CE691668A54840C520B07268C95EC0'),
	(1428,49.312421,-123.1427549999,'Stanley Park- Pavillion','Parks',X'000000000101000000B4CA4C69FDA748404EFADDE522C95EC0'),
	(1429,49.3015616,-123.134529,'Stanley Park- Pavillion Playground','Parks',X'0000000001010000005EDD0C9299A6484045D7851F9CC85EC0'),
	(1430,49.309337,-123.146245,'Stanley Park- Prospect Point','Parks',X'000000000101000000AC38D55A98A74840060DFD135CC95EC0'),
	(1431,49.3126584,-123.142367,'Stanley Park- Prospect Point Washrooms','Parks',X'000000000101000000EB68C13005A84840E5417A8A1CC95EC0'),
	(1432,49.293007,-123.146487,'Stanley Park- Putting Green','Parks',X'000000000101000000E23FDD4081A548408192020B60C95EC0'),
	(1433,49.298994,-123.120676,'Stanley Park- Rose Garden Playground','Parks',X'000000000101000000A1D9756F45A64840605AD427B9C75EC0'),
	(1434,49.2984252,-123.150394,'Stanley Park- Second Beach','Parks',X'000000000101000000B02605CC32A64840F0E0270EA0C95EC0'),
	(1435,49.294943,-123.150223,'Stanley Park- Second Beach','Parks',X'000000000101000000929735B1C0A54840D906EE409DC95EC0'),
	(1436,49.2954672,-123.151056,'Stanley Park- Second Beach Pool','Parks',X'000000000101000000358584DED1A5484055F7C8E6AAC95EC0'),
	(1437,49.312552,-123.141011,'Stanley Park- Shuffleboard','Parks',X'000000000101000000522635B401A848401558005306C95EC0'),
	(1438,49.303156,-123.156335,'Stanley Park- Third Beach','Parks',X'00000000010100000008CBD8D0CDA64840170E846401CA5EC0'),
	(1439,49.3031665,-123.156283,'Stanley Park- Third Beach Seawall','Parks',X'000000000101000000145FED28CEA64840EE7A698A00CA5EC0'),
	(1440,49.299417,-123.121263,'Stanley Park- Totem Poles','Parks',X'000000000101000000E76ED74B53A64840C0CDE2C5C2C75EC0'),
	(1441,49.299691,-123.126188,'Stanley Park- Upper Rose Garden','Parks',X'000000000101000000E9F351465CA648407349D57613C85EC0'),
	(1442,49.2944973,-123.146113,'Stanley Park-Pitch and Putt Course','Parks',X'00000000010100000052216816B2A548404F2157EA59C95EC0'),
	(1443,49.310653,-123.148332,'Stanley Park-Prospect Point','Parks',X'000000000101000000C0B33D7AC3A74840D13C80457EC95EC0'),
	(1444,49.275873,-123.085478,'Strathcona','Parks',X'000000000101000000B96C74CE4FA34840C2A1B77878C55EC0'),
	(1445,49.274827,-123.086689,'Strathcona','Parks',X'0000000001010000006687F8872DA3484012FB04508CC55EC0'),
	(1446,49.266893,-123.035669,'Sunrise','Parks',X'0000000001010000000344C18C29A24840C91EA16648C25EC0'),
	(1447,49.222862,-123.096496,'Sunset','Parks',X'000000000101000000B5C2F4BD869C4840780C8FFD2CC65EC0'),
	(1448,49.2789007,-123.137935,'Sunset Beach','Parks',X'0000000001010000006FAAA404B3A34840527E52EDD3C85EC0'),
	(1449,49.269121,-123.134031,'Sutcliffe','Parks',X'0000000001010000005AD5928E72A248409C69C2F693C85EC0'),
	(1450,49.257356,-123.09859,'Teaswamp','Parks',X'000000000101000000F6B6990AF1A048409C6D6E4C4FC65EC0'),
	(1451,49.2296077,-123.070191,'Tecumseh','Parks',X'0000000001010000007434FDC8639D48404E5E64027EC45EC0'),
	(1452,49.228371,-123.118266,'Tisdall','Parks',X'0000000001010000006B2DCC423B9D4840A48E8EAB91C75EC0'),
	(1453,49.251273,-123.163837,'Trafalgar','Parks',X'00000000010100000014AFB2B629A04840FC372F4E7CCA5EC0'),
	(1454,49.2749603,-123.093122,'Trillium','Parks',X'00000000010100000063192CE631A348407022FAB5F5C55EC0'),
	(1455,49.2386154,-123.129939,'VanDusen Gardens','Parks',X'00000000010100000036A90DF38A9E484065DEAAEB50C85EC0'),
	(1456,49.2394013,-123.129439,'VanDusen Gardens','Parks',X'000000000101000000580FA9B3A49E4840EDF483BA48C85EC0'),
	(1457,49.271811,-123.066732,'Victoria','Parks',X'000000000101000000B6D8EDB3CAA2484030664B5645C45EC0'),
	(1458,49.281845,-123.110066,'Victory Square','Parks',X'00000000010100000043C5387F13A44840B39943520BC75EC0'),
	(1459,49.263048,-123.073108,'W.C. Shelly','Parks',X'0000000001010000009CA38E8EABA14840DD442DCDADC45EC0'),
	(1460,49.266021,-123.205262,'West Point Grey','Parks',X'0000000001010000004D86E3F90CA2484024473A0323CD5EC0'),
	(1461,49.266937,-123.205107,'West Point Grey','Parks',X'000000000101000000D28BDAFD2AA24840904B1C7920CD5EC0'),
	(1462,49.215839,-123.113059,'Winona','Parks',X'000000000101000000C619C39CA09B48402FE1D05B3CC75EC0'),
	(1463,49.278442,-123.073424,'Woodland','Parks',X'0000000001010000009AEAC9FCA3A3484075AF93FAB2C45EC0'),
	(1464,49.2663411,-123.125914,' Charleson Park Pumping Station','Engineering',X'000000000101000000530A157717A24840F20698F90EC85EC0'),
	(1465,49.257924,-123.041381,' Grandview Hwy Pumping Station','Engineering',X'000000000101000000406D54A703A14840406B7EFCA5C25EC0'),
	(1466,49.269566,-123.136177,' Granville Island Pumping Station','Engineering',X'000000000101000000880E812381A24840EA5DBC1FB7C85EC0'),
	(1467,49.2733345,-123.131579,' Granville St Pumping Station','Engineering',X'0000000001010000002B2FF99FFCA24840C97553CA6BC85EC0'),
	(1468,49.2737142,-123.1527806,' Kitsilano Pumping Station','Engineering',X'000000000101000000B4B9201109A34840A61D4828C7C95EC0'),
	(1469,49.2730368,-123.098886,' Thornton Park Pumping Station','Engineering',X'000000000101000000604DAFDEF2A248401002F22554C65EC0'),
	(1470,49.265329,-123.142081,'1650 W 7th','Engineering',X'00000000010100000017D7F84CF6A148408318E8DA17C95EC0'),
	(1471,49.245762,-123.10102,'28th & Main','Engineering',X'000000000101000000BE4C1421759F48407C0F971C77C65EC0'),
	(1472,49.237587,-123.127384,'37th & Oak','Engineering',X'000000000101000000357A3540699E48402882380F27C85EC0'),
	(1473,49.237446,-123.105647,'37th & Ontario','Engineering',X'00000000010100000073486AA1649E4840EA7AA2EBC2C65EC0'),
	(1474,49.2371952,-123.09728295,'37th & Prince Edward','Engineering',X'00000000010100000054628D695C9E4840562D44E239C65EC0'),
	(1475,49.234752,-123.058912,'39th & Nanaimo','Engineering',X'000000000101000000D655815A0C9E4840E355D636C5C35EC0'),
	(1476,49.26822777,-123.152706,'4th & Arbutus','Engineering',X'000000000101000000B7039E4955A24840CAF962EFC5C95EC0'),
	(1477,49.219505,-123.106415,'56th & Ontario','Engineering',X'0000000001010000007C2766BD189C48407233DC80CFC65EC0'),
	(1478,49.2646599,-123.112967,'7th & Yukon','Engineering',X'00000000010100000004882760E0A14840BEA1F0D93AC75EC0'),
	(1479,49.2187548,-123.055044,'Ashburn & Elliot','Engineering',X'000000000101000000E8EB4328009C4840D3F544D785C35EC0'),
	(1480,49.262875,-123.105026,'Broadway & Ontario','Engineering',X'000000000101000000CFF753E3A5A14840B3CEF8BEB8C65EC0'),
	(1481,49.26423514,-123.1666474,'Broadway & Stephens','Engineering',X'00000000010100000082600275D2A14840A93DDB59AACA5EC0'),
	(1482,49.262066,-123.065619,'Broadway & Victoria','Engineering',X'0000000001010000005FB2F1608BA14840C2BF081A33C45EC0'),
	(1483,49.2792475453812,-123.12923210062,'Burrard & Davie','Engineering',X'00000000010100000045733162BEA348406770B75645C85EC0'),
	(1484,49.28451988,-123.13955439,'Cardero & Burnaby','Engineering',X'000000000101000000B7D4BD256BA448400C448975EEC85EC0'),
	(1485,49.2678194,-123.06939067,'Commercial & 3rd','Engineering',X'000000000101000000FF1DF6E747A248400B9390E570C45EC0'),
	(1486,49.2867384,-123.136516,'Comox & Cardero','Engineering',X'000000000101000000F14009D8B3A448405ED89AADBCC85EC0'),
	(1487,49.29067407,-123.14264686,'Comox & Chilco','Engineering',X'000000000101000000FD38D4CE34A54840EFA44B2021C95EC0'),
	(1488,49.2887857,-123.13969,'Comox & Denman','Engineering',X'000000000101000000B78608EEF6A44840026553AEF0C85EC0'),
	(1489,49.28922483,-123.13854854,'Denman & Nelson','Engineering',X'0000000001010000004505B95105A54840590DB2FADDC85EC0'),
	(1490,49.2365274,-123.084037,'Elgin & 37th','Engineering',X'000000000101000000D0CDA387469E4840DAA9B9DC60C55EC0'),
	(1491,49.28977703,-123.14128655,'Gilford & Comox','Engineering',X'000000000101000000B37DE96917A5484057E7BDD60AC95EC0'),
	(1492,49.29049866,-123.14022516,'Gilford & Nelson','Engineering',X'000000000101000000AC1D620F2FA54840B011F372F9C85EC0'),
	(1493,49.2173117,-123.139586,'Granville & 59th','Engineering',X'000000000101000000E344AADED09B4840AF3E1EFAEEC85EC0'),
	(1494,49.281542,-123.119937,'Granville & Robson','Engineering',X'000000000101000000A839799109A4484024253D0CADC75EC0'),
	(1495,49.281386,-123.097231,'Hastings & Gore','Engineering',X'000000000101000000B0C6D97404A44840124A5F0839C65EC0'),
	(1496,49.280998,-123.054448,'Hastings & Kamloops','Engineering',X'000000000101000000E61E12BEF7A3484049D576137CC35EC0'),
	(1497,49.2485804,-123.10123907,'King Edward & Main','Engineering',X'0000000001010000009B36887BD19F48408FAE6FB37AC65EC0'),
	(1498,49.2610594,-123.100784,'Main & 11th','Engineering',X'0000000001010000001DA8F8646AA1484072FDBB3E73C65EC0'),
	(1499,49.28571023,-123.13333675,'Nelson & Broughton','Engineering',X'000000000101000000C7FD1E2792A44840B726DD9688C85EC0'),
	(1500,49.282385,-123.140508,'Nicola & Beach','Engineering',X'000000000101000000C3F0113125A44840E3344415FEC85EC0'),
	(1501,49.28306599,-123.12229054,'Robson & Burrard','Engineering',X'00000000010100000076D4A0813BA44840407AB39BD3C75EC0'),
	(1502,49.29345716,-123.13827002,'Robson & Chilco','Engineering',X'000000000101000000107D140190A54840B47A7F6AD9C85EC0'),
	(1503,49.2775724,-123.087389,'Union & Hawks','Engineering',X'000000000101000000D8220E7E87A34840EE4108C897C55EC0'),
	(1504,49.2086961922722,-123.140276526865,'(Temporary) Northeast corner of 70th and Granville','Engineering',X'000000000101000000EE4D8C8EB69A484006D2654AFAC85EC0'),
	(1505,49.2624327440817,-123.069552373584,'(Temporary) Northeast corner of Commercial and Broadway','Engineering',X'0000000001010000007F9D6A6597A14840C279CC8B73C45EC0'),
	(1506,49.2798072,-123.110301,'(Temporary) Northeast corner of Dunsmuir and Beatty','Engineering',X'000000000101000000B997EAB8D0A34840D5EDEC2B0FC75EC0'),
	(1507,49.2304335,-123.133399,'(Temporary) Northeast corner of Selkirk and 45th','Engineering',X'0000000001010000008F334DD87E9D48406C94F59B89C85EC0'),
	(1508,49.2701294,-123.104467,'(Temporary) Southeast corner of Ontario and 1st','Engineering',X'0000000001010000001458A59993A24840B8205B96AFC65EC0');

/*!40000 ALTER TABLE `fountains` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
