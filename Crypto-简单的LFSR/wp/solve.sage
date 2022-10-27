import hashlib
# your flag is flag{md5(secret).hexdigest()}

def string2bits(s):
    return [int(b) for b in s]

if __name__ == '__main__':
    initState = [0, 1, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 0, 1, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 0, 1, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0]
    outputState = [31, 66, 128, 222, 385, 664, 1143, 2000, 3458, 6003, 10379, 17942, 31047, 53687, 92924, 160797, 278304, 481638, 833479, 1442422, 2496163, 4319845, 7475835, 12937561, 22389578, 38746915, 67054735, 116043520, 200822710, 347539886, 601445745, 1040850538, 1801275628, 3117252874, 5394657302, 9335889442, 16156509611, 27960142496, 48387281659, 83738092531, 144915522009, 250787996657, 434008851435, 751087316130, 1299817167363, 2249438425629, 3892834588915, 6736864173067, 11658686709797, 20176297502410, 34916709837729, 60426182042628, 104572380769600, 180970937597032, 313184800936842, 541991553121913, 937960088661442, 1623215570164618, 2809105439634215, 4861383488449105, 8413016146818879, 14559402864389777, 25196220721365800, 43604091771673155, 75460397027739861, 130590302153314191, 225997048627046433, 391106116962451401, 676840674047358730, 1171327366605398299, 2027076463289970382, 3508019282374090135, 6070910253447116278, 10506199749411485204, 18181825882182859769, 31465115864423937634, 54452920337985370536, 94235169707018163674, 163081560265112209496, 282225790871820528073, 488414489680745790033, 845240659945376349091, 1462757121910708796880, 2531419155626961478438, 4380824981460105751921, 7581370898424646092677, 13120173698498971899800, 22705518590912550882405, 39293730885686099313323, 68000969928723717268434, 117681162033195064953557, 203656740661184789826464, 352444412513853856490154, 609933476834387348179796, 1055539066458205919344242, 1826695472762162772755920, 3161243819621244340994611, 5470787351316040252901913, 9467638673598260118507327, 16384512191330329194463349, 28354719587732695891973236, 49070128760035595469947547, 84919814815174884654495265, 146960587438213290271803310, 254327147405947343219170013, 440133637427387650641676733, 761686751771954639615932308, 1318160346062225166536927204, 2281182774793880566386854202, 3947770745464875128215489476, 6831935621711193478803584270, 11823215517979626989252654459, 20461027873324936552011726278, 35409458704049766870463574070, 61278923692217093991616774374, 106048118957748860598268928024, 183524821535095103500935105397, 317604503036094959823791626415, 549640204006492782256703506357, 951196695803666227643791343005, 1646122586216645151673646795131, 2848747878127492747395146497119, 4929987925010971381846789176787, 8531741656523753626888968333475, 14764866932914585711739993009471, 25551792860485990447357753377411, 44219438031623458174827090101591, 76525303351860239321171606062486, 132433208420836012247860425341878, 229186346534231007543300455047052, 396625454174562824696341867974807, 686392332170111774628387415187708, 1187857281228776953526538661167132, 2055682813511567389589959681437591, 3557524878237416677051445431119245, 6156583679200434562674367324375645, 10654464521349051207718915685250792, 18438410026033851006551039004948926, 31909155416202798852780253976608864, 55221366589513932226781115179478434, 95565027912492621164419094117570641, 165382987128929746587819720020389833, 286208595645816231325692474821432127, 495307054513959920117280296979778603, 857168799202977606481906830566592959, 1483399728776458203402121501599814357, 2567142851419860475561591348189292465, 4442647717774532025797522076302827645, 7688360128977964468508623330874749520, 13305327189541069887965447505836108943, 23025941637865784521234444191415083701, 39848248807227476288131461546822173104, 68960607908058729168472941626927516912, 119341892941264496254850267375680858596, 206530769418287872448439164819365157712, 357418151038572249261836365381689027787, 618540932431735991718001801386896334770, 1070434962471260463170389697079661487176, 1852474022011964581139009223827365513544, 3205855677870125101423860144920010424249, 5547991769498476629256700835469967207037, 9601247144996961660705018593534913225922, 16615732425220501988109900409620796156745, 28754864847988594478375696246052761203187, 49762612400465240380187427652132912229336, 86118213596547492163397334421181607606370, 149034513167786192667574788821667110253623, 257916243121530494722068502259305736264048, 446344856986474817826595353109273441918350, 772435768089263602359077702861161388353409, 1336762385595787378549468975393213339116484, 2313375104267880490155624917599100889633507, 4003482167596451918353914186255524345816532, 6928348730257112541629154203810355027525535, 11990066177033590775605142065871666200189459, 20749776393589512464840020374644649655647874, 35909161302935015278730531942138798319507636, 62143699335409560081369603141161471393159562, 107544682943462043814216772302622710407400704, 186114746194704481727730115452186541297539854, 322086576510057527551600558671512063007190557, 557396793585831655018738502556644467159583633, 964620099559052960425720416252526682882655111, 1669352868873354804885622348664567494237803783, 2888949755545809136243688064556192446919868175, 4999560515746991945989073252770067125902428535, 8652142635098861248148452777057412533362877977, 14973230535426489152060521332311783517581989420, 25912382876992006096351135796067625851883928825, 44843468133024591960270046213401958144446811548, 77605237763877474989955856305494246316739147127, 134302122006319171731632762048131880552676359659, 232420652202367984596938247872208285088912788686, 402222680946414142984184322215356821073359953948, 696078784456971603910909918744734815016448573082, 1204620468022900362280402553035290601874308600586, 2084692860035604927076197374205039877760447754956, 3607729103106034863624554004184342562208475089341, 6243466138784576918107250594832177417637788944304, 10804821623826866941723224844111388709787418308073, 18698615116609470739339911758664365362637188157227, 32359461308280335893458609544003265039362932173740, 56000657248244594858300036379967633467510318826268, 96913653239119041752111865895809664169241405330164, 167716892009274048794745102986623447430717183044189, 290247606246426020117292750048691625438809474898504, 502296888062545512718475829352732508523042936581530, 869265269816240261877029457458234318249621243667628, 1504333646627354107869007496936781479204707239575364, 2603370684363759081777877568090078592049534352669947, 4505342904082185194291963661562434728467247085801567, 7796859204598587173314308958000104480418858953375158, 13493093589225451977147040588861591346827624626553088, 23350886533928418622148518003626067086836308029229306, 40410592153292809121198774051487713973447271440824879, 69933788415571610361075397290260005189363125951186151, 121026060286409890014591649872661507384922097295622585, 209445356819655999941471437498154462693217873859873519, 362462079567824464738504374835340908769751488853277318, 627269857492024846036766185061792395514128412691597750, 1085541071185182881358902065797900004206275433304525877, 1878616361292087979017649753948129817575491489985996469, 3251097104102362704835900720328806405351210311448488910, 5626285705844227224482132571164442587287950705132698177, 9736741115435595736854097976874400909429981720207988487, 16850215667245180941552990697851306753178430167486844006, 29160657006948951882262364132481449161390275730087294685, 50464868454466647556267645846637274956572498586114427735, 87333524327649631040132103644841977096784627243509857937, 151137706390139040826448707126591974417399010694640174718, 261555988593488478677610370284679511774525269175612894617, 452643730033345117036459086235348615186246366652477694168, 783336475835524143955537154153262203019092265959952337070, 1355626939379487620769121922144227585175531097052439217983, 2346021735820790423533561047507688175516954900918138334291, 4059979796110323903393797058491537625611005518946149411026, 7026122432346967683382009847205881024752630926437218981740, 12159271452933065576710291263470354882115951853620136774055, 21042599768180623908382939506716338579508214228553692875423, 36415915765826987773364669427220163018133640081486671468436, 63020678797925209300085103082659626905494796721119527734083, 109062366622625198169859916735972641477602693706580750774247, 188741220186912829686057249397861922209555075583934877024777, 326631901551406455092777938653826814900794821912935940782874, 565262845103114204256414747869081614169923740442179762058936, 978232936025018959853100287323851115023773163216042197843195, 1692910980111501346802672231436092377546116455476214539222026, 2929718966760270262844895994547637314231078419236801672684198, 5070114923366815738216357619638190602226980891746062079428250, 8774242726964718704518978915749604855301897112378619823447909, 15184534590503864395968205111669668293209355696392197598100449, 26278061583779512058870924747917968681797893736357134971437061, 45476304623307832769415233578427592641287934525440233150419102, 78700412341998941621862709864667467345902574612843786168968091, 136197409928206718914848388530217366761295027423898231594892758, 235700600786468895717413188934153824796333855958950958366797470]
    states = initState + outputState

    mv = []
    for i in range(128):
        mv.append(states[i : i + 128])
    m = Matrix(mv)

    vv = outputState[0:128]
    v = vector(vv)

    secret = m.inverse() * v
    flag = ''
    for i in range(128):
        flag += str(secret[i][0])
    print(flag)

    h = hashlib.md5()
    h.update(flag.encode())
    flag = 'flag{' + h.hexdigest() + '}'
    print(flag)


