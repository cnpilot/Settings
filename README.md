```
// ==UserScript==
// @name         auto_feed
// @author       tomorrow505
// @thanks       感谢宝大、86大佬、贝壳等大佬提供邀请码;感谢宝大、86大佬提供友情赞助;感谢86大佬、手大、kmeng、黑白、甘蔗等大佬赠予PTP积分.（ID：tomorrow505, 感谢支持）
// @contributor  daoshuailx/hollips/kmeng/wyyqyl/shmt86/sauterne
// @description  PT一键转种脚本
// @match        https://blutopia.cc/torrents?imdb=tt*
// @namespace    https://greasyfork.org/zh-CN/scripts/424132-auto-feed
// @updateURL    https://greasyfork.org/zh-CN/scripts/424132-auto-feed
// @match        http*://*/*detail*.php*
// @match        https://nzbs.in/*
// @match        http*://*/detail*.php*
// @match        http*://*/upload*php*
// @match        https://pixhost.to*
// @match        https://*/upload/*
// @match        https://*.open.cd/plugin_upload.php*
// @match        https://www.myanonamouse.net/t/*
// @match        https://img.hdbits.org/
// @match        http*://*/offer*php*
// @match        http*://*.tieba.baidu.com/*
// @match        https://xthor.tk/*
// @match        https://house-of-usenet.com/threads/*
// @match        https://omgwtfnzbs.org/details*
// @match        https://speedapp.io/browse/*
// @match        https://desitorrents.tv/torrents*
// @match        https://www.imdb.com/title/tt*
// @match        https://hdf.world/*
// @match        https://kp.m-team.cc/detail/*
// @match        https://kp.m-team.cc/upload*
// @match        https://blutopia.cc/torrents/create*
// @match        https://secret-cinema.pw/torrents.php?id=*
// @match        https://filelist.io/*
// @match        https://bluebird-hd.org/*
// @match        https://iptorrents.com/torrent.php?id=*
// @match        http*://hd-space.org/index.php?page=torrent-details*
// @match        https://digitalcore.club/torrent/*
// @match        http*://ptpimg.me*
// @match        https://imgbox.com*
// @match        https://www.imagebam.com/*
// @match        https://bangumi.tv/subject/*
// @match        https://totheglory.im/*
// @match        https://hd-space.org/index.php?page=upload
// @match        https://hdcity.city/upload*
// @match        https://hdbits.org/upload*
// @match        https://hdbits.org/browse*
// @match        https://nebulance.io/torrents.php?id=*
// @match        https://hd-only.org/*
// @match        https://jpopsuki.eu/torrents.php*
// @match        https://passthepopcorn.me/*
// @match        https://hd-torrents.org/torrents.php*
// @match        https://greatposterwall.com/torrents.php*
// @match        https://broadcasthe.net/*.php*
// @match        https://backup.landof.tv/*.php*
// @match        https://beyond-hd.me/upload*
// @match        http*://beyond-hd.me/library/*
// @match        https://*/usercp.php?action=personal*
// @match        https://uhdbits.org/torrents.php*
// @match        https://blutopia.cc/torrents/create/*
// @match        https://pt.hdpost.top/upload/*
// @match        https://asiancinema.me/upload/*
// @match        http*://totheglory.im/t/*
// @match        http*://privatehd.to/torrent/*
// @match        http*://avistaz.to/torrent/*
// @match        http*://cinemaz.to/torrent/*
// @match        https://zhuque.in/torrent/*
// @match        https://beyond-hd.me/download_check/*
// @match        http*://passthepopcorn.me/torrents.php?id*
// @match        http*://*php?id=*&torrentid=*
// @match        http*://*/*php?id=*&torrentid=*
// @match        http*://www.morethantv.me/torrents.php?id=*
// @match        https://*php?torrentid=*&id=*
// @match        https://hdbits.org/details.php?id=*
// @match        https://hdf.world/torrents.php*
// @match        http*://beyond-hd.me/torrents/*
// @match        https://*.douban.com/subject/*
// @match        https://filelist.io/browse.php*
// @match        http*://www.torrentleech.org/torrent/*
// @match        http*://*/torrents/*
// @match        https://*/torrents?imdb*
// @match        https://broadcasthe.net/friends.php
// @exclude      http*bitpt.cn*
// @match        http*://*redacted.ch/upload.php*
// @match        http*://*redacted.ch/requests.php*
// @match        http*://*redacted.ch/torrents.php*
// @match        https://c.pc.qq.com/middlem.html?pfurl=*
// @require      https://greasyfork.org/scripts/453166-jquery/code/jquery.js?version=1105525
// @require      https://greasyfork.org/scripts/28502-jquery-ui-v1-11-4/code/jQuery%20UI%20-%20v1114.js?version=187735
// @require      https://unpkg.com/@popperjs/core@2/dist/umd/popper.min.js
// @require      https://unpkg.com/tippy.js@6/dist/tippy-bundle.umd.js
// @require      https://greasyfork.org/scripts/430180-imgcheckbox2/code/imgCheckbox2.js?version=956211
// @require      https://greasyfork.org/scripts/444988-music-helper/code/music-helper.js?version=1268106
// @icon         https://kp.m-team.cc//favicon.ico
// @run-at       document-end
// @version      2.0.6.7
// @grant        GM_xmlhttpRequest
// @grant        GM_setClipboard
// @grant        GM_setValue
// @grant        GM_getValue
// @grant        GM_deleteValue
// @grant        GM_download
// @grant        GM_getResourceText
// @license      GPL-3.0 License
// @grant        GM_addStyle
// ==/UserScript==

/*
日志：

    2022年6月以前的日志请参看："https://github.com/tomorrow505/auto_feed_js/wiki/更新日志"
    20220604：修复海豹部分bug，修复piggo部分bug。优化禁转判断后跳转逻辑。
    20220605：新增图片提取功能：https://github.com/tomorrow505/auto_feed_js/wiki/图片处理
    20220606：适配BTN另一个网址：https://backup.landof.tv/
    20220608：适配PTChina。
    20220612：ptgen若无豆瓣词条，可以获取imdb信息。
    20220629：适配hdvideo，修复部分bug。
    20220705：清洗种子部分内容并且适配外站转种直接发布。
    20220706：适配多站发布完之后自动下载种子……(该部分还需要测试)
    20220707：修复种子加载之后无效文件名的bug，修复BLU改版引起的bug. 优化洗种逻辑，适配WT-Sakura,冬樱。
    20220708：适配支持TVV转出。
    20220710：优化皮转入，修复GPW部分bug，简单支持一键签到(测试中)。
    20220716：继续完善一键签到。修复部分bug。
    20220726：支持MP4/MKV视频文件获取mediainfo+截图。功能待测试(已取消)...https://unpkg.com/auto-feed-media@1.0.1/index.js
    20220730：适配MV类型转发，修复部分bug。
    20220802：支持转入ITZMX、HDPt(明教)，修复1PTBA、3Wmg部分bug。(by shmt86)
    20220807：一键签到取消天空和北洋，增加支持妞的转入。具体见教程：https://github.com/tomorrow505/auto_feed_js/wiki/%E8%BD%AC%E8%BD%BD%E5%88%B0BTN
    20220808：适配海豚从gz音乐站转入。
    20220816：适配OPS/RED从GZ音乐站转入。修复部分bug。
    20220820：适配sugoimusic转出，修复部分bug。
    20220920：支持HDT备用域名，支持CG转入，待测试。修复部分bug。
    20221013：适配monika，修复部分bug。
    20221021：适配织梦PT，修复部分bug。
    20221103：适配红叶PT。
    20221117：修复部分bug，去掉mediainfo和截图功能，鸡肋而且占用体积大。修复没有猫不能进入设置页面的bug。第一次NP站点应该都可以设置。
    20221119：适配ICC2022。
    20221128：适配DTR/HONE转出。

    20230103：修复部分bug。
    20230208：稍加完整适配朱雀。
    20230413：修复部分bug，去掉一些关闭了的站。
    20230511：适配转入 RS (西电睿思)。
    20230708：修复部分bug。适配RouSi(by shmt86)。
*/

var site_url = decodeURI(location.href);
const TIMEOUT = 6000;
const N = "\n";
var evt = document.createEvent("HTMLEvents");
evt.initEvent("change", false, true);
this.$ = this.jQuery = jQuery.noConflict(true);

jQuery.fn.wait = function (func, times, interval) {
    var _times = times || 100, //100次
        _interval = interval || 20, //20毫秒每次
        _self = this,
        _selector = this.selector, //选择器
        _iIntervalID; //定时器id
    if( this.length ){ //如果已经获取到了，就直接执行函数
        func && func.call(this);
    } else {
        _iIntervalID = setInterval(function() {
            if(!_times) { //是0就退出
                clearInterval(_iIntervalID);
            }
            _times <= 0 || _times--; //如果是正数就 --
            _self = $(_selector); //再次选择
            if( _self.length ) { //判断是否取到
                func && func.call(_self);
                clearInterval(_iIntervalID);
            }
        }, _interval);
    }
    return this;
}

function mutation_observer(target, func) {
    const MutationObserver = window.MutationObserver || window.WebKitMutationObserver;
    const observer = new MutationObserver(mutationList =>  
        mutationList.filter(m => m.type === 'childList').forEach(m => {
            m.addedNodes.forEach(func());
        }
    ));
    observer.observe(target,{childList: true, subtree: true});
}

var hdb_color = 'black';

if (site_url.match(/^https?:\/\/hdbits.org\/details.php\?id=.*/)) {
    hdb_color =  GM_getValue('HDB_Color');
    if (hdb_color === undefined) {
        getDoc('https://hdbits.org/my.php', null, function(doc){
            const css = $('input[name="custom_css"]', doc).val();
            if (/berlin.css/.test(css)) {
                GM_setValue('HDB_Color', 'white');
            } else {
                GM_setValue('HDB_Color', 'black');
            }
        });
    }
}

GM_addStyle(
    `.content th {
        font-weight:bold;
        color: ${hdb_color};
        background-color:transparent;
        padding:4px 10px 4px 0;
        border:0;
        vertical-align:top
    }
    .content td {
        padding:4px 20px 4px 1px
    }
    .contentlayout {
        width:100%
    }
    .contentlayout td {
        border:0;
        vertical-align:top
    }
    .contentlayout h1 {
        margin:0 0 14px 15px
    }
    .contentlayout h3 {
        margin:-14px 0 5px 15px;
        color:gray
    }`
);

/*******************************************************************************************************************
*                                          part 0 简单页面逻辑                                                       *
********************************************************************************************************************/


/*******************************************************************************************************************
*                                          part 1 变量初始化层                                                       *
********************************************************************************************************************/

//提供可用的获取豆瓣信息两个api，从0-1选择。主要应用于外站，另一个是自动爬取豆瓣页面
const apis = ['https://api.iyuu.cn/App.Movie.Ptgen', 'https://ptgen.tju.pt/infogen'];
var api_chosen = GM_getValue('api_chosen') === undefined ? 3: GM_getValue('api_chosen');
var imdb2db_chosen = GM_getValue('imdb2db_chosen') === undefined ? 0: GM_getValue('imdb2db_chosen');

//用来转存海报使用的ptpimg的key,打开首页即可获取
var used_ptp_img_key = GM_getValue('used_ptp_img_key') === undefined ? '': GM_getValue('used_ptp_img_key');

//用来获取TMDB的key，需要使用请自行申请
var used_tmdb_key = GM_getValue('used_tmdb_key') === undefined ? '0f79586eb9d92afa2b7266f7928b055c': GM_getValue('used_tmdb_key');

//是否匿名，默认开启匿名选项
var if_uplver = GM_getValue('if_uplver') === undefined ? 1: GM_getValue('if_uplver');

var if_douban_jump = GM_getValue('if_douban_jump') === undefined ? 1: GM_getValue('if_douban_jump');
var if_imdb_jump = GM_getValue('if_imdb_jump') === undefined ? 1: GM_getValue('if_imdb_jump');



//支持转发的站点列表，可以自行取消注释
const default_site_info = {
    'ZMPT': {'url': 'https://zmpt.cc/', 'enable': 1},
    '红叶': {'url': 'https://leaves.red/', 'enable': 1},
    'ICC': {'url': 'https://www.icc2022.com/', 'enable': 1},
};

var chd_use_backup_url = GM_getValue('chd_use_backup_url') === undefined ? 0: GM_getValue('chd_use_backup_url');
if (chd_use_backup_url) {
    var region_code = GM_getValue('region_code');
    if (region_code) {
        default_site_info.CHDBits.url = `https://${region_code}.chddiy.xyz/`;
    } else {
        fetch('https://ipapi.co/json/') // 发送GET请求到ipapi
            .then(response => response.json()) // 解析响应的JSON数据
            .then(data => {
                region_code = data.region_code.toLowerCase();
                GM_setValue('region_code', region_code);
            })
            .catch(error => {
                console.log("发生错误: " + error);
            }
        );
    }
}

//初始化数据site_order/used_site_info等等
var site_order = GM_getValue('site_order') === undefined ? Object.keys(default_site_info).sort(): JSON.parse(GM_getValue('site_order')).split(',');

var used_site_info = GM_getValue('used_site_info');
var if_new_site_added = false;
if (used_site_info === undefined) {
    used_site_info = default_site_info;
    GM_setValue('used_site_info', JSON.stringify(used_site_info));
} else {
    //预防有新加的站点没有加上的。
    used_site_info = JSON.parse(used_site_info);
    for (key in default_site_info) {
        if (!used_site_info.hasOwnProperty(key)) {
            used_site_info[key] = default_site_info[key];
            if_new_site_added = true;
        } else if (default_site_info[key].url != used_site_info[key].url && key != 'AGSV') {
            used_site_info[key].url = default_site_info[key].url
        }
        if (site_order.indexOf(key) < 0) {
            site_order.push(key);
        }
    }
    for (key in used_site_info) {
        if (!default_site_info.hasOwnProperty(key)) {
            delete used_site_info[key];
            if (site_order.indexOf(key) >= 0) {
                site_order = site_order.filter(function(item) {
                    return item != key;
                });
            }
            if_new_site_added = true;
        }
    }
    site_order = site_order.filter(function(item){
        if (!default_site_info.hasOwnProperty(item)) {
            return false;
        } else {
            return true;
        }
    });
}
if (if_new_site_added) {
    GM_setValue('used_site_info', JSON.stringify(used_site_info));
    GM_setValue('site_order', JSON.stringify(site_order.join(',')));
}


//常用站点列表，这里只是举例说明，可以替换成自己想要的站点名称即可
const default_common_sites = ['HDPost', 'TTG', 'CMCT', 'HUDBT', 'PTer'];
var used_common_sites = GM_getValue('used_common_sites') === undefined ? default_common_sites: JSON.parse(GM_getValue('used_common_sites')).split(',');
//签到站点列表
const default_signin_sites = ['HDPost', 'TTG', 'CMCT', 'HUDBT', 'PTer'];
var used_signin_sites = GM_getValue('used_signin_sites') === undefined ? default_common_sites: JSON.parse(GM_getValue('used_signin_sites')).split(',');

//欧美国家列表，可以酌情添加
const us_ue = ['阿尔巴尼亚|安道尔|奥地利|俄罗斯|比利时|波黑|保加利亚|克罗地亚|塞浦路斯|捷克|丹麦|爱沙尼亚|法罗群岛[丹]|冰岛|芬兰|法国|德国|希腊|匈牙利|爱尔兰|意大利|拉脱维亚|列支敦士登|立陶宛|卢森堡|马其顿|马耳他|摩尔多瓦|摩纳哥|荷兰|挪威|波兰|葡萄牙|罗马尼亚|俄罗斯|圣马力诺|塞黑|斯洛伐克|斯洛文尼亚|西班牙|瑞典|瑞士|乌克兰|英国|梵蒂冈|美国|加拿大|澳大利亚|新西兰|西德|苏联'];

//是否在PTP/HDB/HDT/UHD种子列表显示搜索跳转功能，1表示显示，0表示隐藏
const default_show_search_urls = {
    'PTP': 1,
    'HDB': 0,
    'HDT': 0,
    'UHD': 0,
};
var show_search_urls = GM_getValue('show_search_urls') === undefined ? default_show_search_urls : JSON.parse(GM_getValue('show_search_urls'));

function set_host_link() {
    var host_link = prompt(`-------------Auto-feed依托NP架构站进行部分功能布局-------------\n请在输入框输入托管站点的个人设置链接，步骤如下：
    1.进入任意NexusPHP架构PT站点主页;
    2.打开控制面板;
    3.选择个人设定;
    4.复制网页地址输入到下方输入框;
    格式形如：https://(站点域名)/usercp.php?action=personal
    注意：后期可通过>重置托管<按钮进行重置。`,"");
    if (host_link.match(/https?:\/\/.*?\/usercp\.php\?action=personal/)) {
        GM_setValue("host_link", host_link);
        location.reload();
    } else {
        alert('链接格式不对！！');
    }
}

if (GM_getValue("host_link") === undefined && judge_if_the_site_as_source(site_url) !== undefined) {
    set_host_link();
} else {
    host_link = GM_getValue("host_link");
}

if (site_url.match(/^https:\/\/bangumi.tv\/subject/)) {
    var bgm_id = site_url.match(/subject\/(\d+)/)[1];
    $('ul[class="navTabs clearit"]').append(`<li><a href="${host_link}#ptgen?bgmid=${bgm_id}" pcked="1" target="_blank">PtGen</a></li>`);
    return;
}

const default_rehost_img_info = {
    'freeimage': {
        'url': 'https://freeimage.host/page/api',
        'api-url': 'https://freeimage.host/api/1/upload',
        'api-key': ''
    },
    'gifyu': {
        'url': 'https://gifyu.com/',
        'api-url': 'https://gifyu.com/api/1/upload',
        'api-key': ''
    },
    'pstorage': {
        'url': 'https://pstorage.space/pages/api',
        'api-url': 'https://pstorage.space/api/1/upload',
        'api-key': ''
    },
    'imgbb': {
        'url': 'https://api.imgbb.com/',
        'api-url': 'https://api.imgbb.com/1/upload',
        'api-key': ''
    },
    'catbox':{
        'url': 'https://catbox.moe/user/api.php',
        'api-url': 'https://catbox.moe/user/api.php',
        'api-key': ''
    },
};

var used_rehost_img_info = GM_getValue('used_rehost_img_info') === undefined ? default_rehost_img_info: JSON.parse(GM_getValue('used_rehost_img_info'));
for (key in default_rehost_img_info) {
    if (!used_rehost_img_info.hasOwnProperty(key)){
        used_rehost_img_info[key] = default_rehost_img_info[key];
    }
}

/*******************************************************************************************************************
*                                          part 2 常量、变量及函数定义封装层                                          *
********************************************************************************************************************/
//用于作为源站点但是不是转发站点的字典，大部分都外站，用作判断是否是外站的标准
const o_site_info = {
    'FRDS': 'https://pt.keepfrds.com/',
    'BYR': 'https://byr.pt/',
    'avz': 'https://avistaz.to/',
    'PHD': 'https://privatehd.to/',
    'PTP': 'https://passthepopcorn.me/',
    'HDT': used_site_info.HDT.url,
    'MTV': 'https://www.morethantv.me/',
    'BHD': 'https://beyond-hd.me/',
    'UHD': 'https://uhdbits.org/',
    'BLU': 'https://blutopia.cc/',
    'Aither': 'https://aither.cc/',
    'HDPost': 'https://pt.hdpost.top/',
    'FNP': 'https://fearnopeer.com/',
    'OnlyEncodes': 'https://onlyencodes.cc/',
    'KIMOJI': 'https://kimoji.club/',
    'TorrentLeech': 'https://www.torrentleech.org/',
    'xthor': 'https://xthor.tk/',
    'FileList': 'https://filelist.io/',
    'HDF': 'https://hdf.world/',
    'HDB': 'https://hdbits.org/',
    'BTN': used_site_info.BTN.url,
    'RED': 'https://redacted.ch/',
    'OpenCD': 'https://open.cd/',
    'U2': 'https://u2.dmhy.org/',
    'jpop': 'https://jpopsuki.eu/',
    'CG': 'http://cinemageddon.net/',
    'KG': 'https://karagarga.in/',
    'SC': 'https://secret-cinema.pw/',
    'iTS': 'https://shadowthein.net/',
    'HDRoute': 'http://hdroute.org/',
    'HDSpace': 'https://hd-space.org/',
    'ACM': 'https://asiancinema.me/',
    'HDOli': 'https://hd-olimpo.club/',
    'Tik': 'https://cinematik.net/',
    'CNZ': 'https://cinemaz.to/',
    'GPW': 'https://greatposterwall.com/',
    'HD-Only': 'https://hd-only.org/',
    'NBL': 'https://nebulance.io/',
    'ANT': 'https://anthelion.me/',
    'IPT': 'https://iptorrents.com/',
    'torrentseeds': 'https://torrentseeds.org/',
    'IN': 'https://nzbs.in/',
    'HOU': 'https://house-of-usenet.com/',
    'OMG': 'https://omgwtfnzbs.org/',
    'digitalcore': 'https://digitalcore.club/',
    'BlueBird': 'https://bluebird-hd.org/',
    'bwtorrents': 'https://bwtorrents.tv/',
    'lztr': 'https://lztr.me/',
    'DICMusic': 'https://dicmusic.com/',
    'OPS': 'https://orpheus.network/',
    'bib': 'https://bibliotik.me/',
    'mam': 'https://www.myanonamouse.net',
    'bit-hdtv': 'https://www.bit-hdtv.com/',
    'JPTV': 'https://jptv.club/',
    'TVV': 'http://tv-vault.me/',
    'SugoiMusic': 'https://sugoimusic.me/',
    'Monika': 'https://monikadesign.uk/',
    'DTR': 'https://desitorrents.tv/',
    'HONE': 'https://hawke.uno/',
    'ZHUQUE': 'https://zhuque.in/',
    '影': 'https://star-space.net/',
    'SpeedApp': 'https://speedapp.io/',
    'MTeam': 'https://kp.m-team.cc/'
};

//部分站点加载图标会有问题，可以将图标下载下来上传到公网图床提供网址即可
const site_img_info = {
    'HDHome': 'https://img.pterclub.com/images/2020/04/21/hdhfavicon.png',
    'TJUPT': 'https://img.pterclub.com/images/2020/04/21/hdhfavicon.png',
    'HDChina': 'https://img.pterclub.com/images/2020/04/21/hdcfavicon.png',
    'HDArea': 'https://img.pterclub.com/images/2020/04/21/hdafavicon.png',
    'BTSchool': 'https://img.pterclub.com/images/2020/05/05/bts.png',
    'HDDolby': 'https://s1.ax1x.com/2020/09/27/0A8NNV.png',
    'HDRoute': 'https://s1.ax1x.com/2020/09/27/0A8UhT.png',
    'HUDBT': 'https://img.pterclub.com/images/2020/07/15/favicon.png',
    'MTeam': 'https://i.endpot.com/image/4BLSA/favicon.jpg',
    'HDMaYi': 'http://hdmayi.com/pic/logo.png',
    'OurBits': 'https://img.pterclub.com/images/2022/02/19/favicon.png',
    'BYR': 'https://img.pterclub.com/images/2021/09/07/byr.jpg',
    'avz': 'https://img.pterclub.com/images/2022/04/24/favicon.png',
    'PHD': 'https://img.pterclub.com/images/2022/04/24/phd.png',
    'CNZ': 'https://img.pterclub.com/images/2022/04/24/cnz.png',
    'HDMaYi': 'https://s3.gifyu.com/images/favicon003f5c5008ff0409.png',
    'HDT': 'https://s3.gifyu.com/images/favicon-1f27eb036f84ab3b7.png',
    'ZHUQUE': 'https://s3.gifyu.com/images/512.png',
    'Panda': 'https://i.ibb.co/K9bkd8M/favicon.png',
    'PTLSP':'https://img.picgo.net/2023/08/22/lspd78c10dbe9344162.png',
    'HaiDan':'https://www.haidan.video/public/pic/favicon.ico',
    '象岛':'https://img.picgo.net/2023/10/04/ptvicomo0b533c8e4626fe8f.png',
    'DaJiao': 'https://www.z4a.net/images/2023/11/20/35c0bb255890b394e4ce76f5718ef1a4.png'
};

//用来拼接发布站点的url和字符串,也可用于识别发布页和源页面
const seperator = '#seperator#';
//获取源站点简称
const origin_site = find_origin_site(site_url);

const douban_prex = 'https://movie.douban.com/subject/';
const imdb_prex = 'https://www.imdb.com/title/';

//iTS的简介模板，用于获取数据替换后填充
const its_base_content = `
[center]

[img]{poster}[/img]

[url={imdb_url}][img]https://i.ibb.co/KD855ZM/IMDb-Logo-2016.png[/img][/url]  [size=3]{imdb_score}[/size]  [*] [size=3][url={rt_url}][img]https://i.ibb.co/cDSgzxm/rt-logo.png[/img][/url] {rt_score}%[/size]  [*] [url={tmdb_url}][img]https://i.ibb.co/VWMtVnN/0fa9aceda3e5.png[/img][/url] [size=3]{tmdb_score}%[/size]


[color=DarkOrange][size=2]◢ SYNOPSIS ◣[/size][/color]
    {en_descr}


[color=DarkOrange][size=2]◢ TRAILER ◣[/size][/color]
[youtube]{youtube_url}[/youtube]


[color=DarkOrange][size=2]◢ SCREENSHOTS ◣[/size][/color]
{screenshots}

[/center]
`;

const kg_intro_base_content = `[img]{poster}[/img]

Title: {title}
Genres: {genres}
Date Published: {date}
IMDB Rating: {score}
IMDB Link: {imdb_url}
Directors: {director}
Creators: {creator}
Actors: {cast}

Introduction
  {en_descr}

Screenshots here:
{screenshots}

-------------------------------------------------------------------------------------------------------------

Not my rip. Many thanks to the original uploader.

-------------------------------------------------------------------------------------------------------------
`;

const kg_dvd_base_content = `DVD label: {label}
DVD5 / DVD9: {size}
DVD Format: {source}
DVD Audio: Codec {audio}, Channels {channels}
Program(s): Not my rip.
Menus: Untouched
Video: Untouched
Audio: Untouched
DVD extras: Untouched
Extras contain: {extras}
DVD runtime(s): {runtime}
`;

const kg_bluray_base_content = `Blu-Ray label: {label}
BD25 / BD50: {size}
Blu-Ray Audio: Codec {audio}, Channels {channels}
Program(s): Not my rip.
Menus: Untouched
Video: Untouched
Audio: Untouched
DVD extras: Untouched
Extras contain: {extras}
Blu-Ray runtime(s): {runtime}
`;

//tik的简介模板，用于获取数据替换后填充
const tik_base_content = `
[center][img]{poster}[/img]
{screenshots}
[/center]

[b][color=blue]SYNOPSIS:[/color][/b]
{en_descr}

[code]
IMDb...............: [url]http://www.imdb.com/title/{imdbid}/[/url]

Year...............: {year}
Country............: {country}
Runtime............: {runtime} Minutes
Audio..............: {audio}
Subtitles..........: {subtitles}
Video Format.......: {format}
Film Aspect Ratio..: {aspect_ratio}{dvdformat}
Source.............: {source}
Film Distributor...: [url=addlink]To be specified.[/url]
Ripping Program....: Not my rip
Total  Bitrate.....: {bitrate}

Menus......: [x] Untouched
Video......: [x] Untouched
Extras.....: [x] Untouched
Audio......: [x] Untouched
[/code]

[b][color=blue]Extras:[/color][/b]
[*]
[*]
[*]

[b][color=blue]Uploader Comments:[/color][/b]
- All credit goes to the original uploader.
`;

//需要从源网页获取的信息，有些可能没有
var raw_info = {
    //填充类信息
    'name': '', //主标题
    'small_descr': '', //副标题
    'url': '', //imdb链接
    'dburl': '', //豆瓣链接
    'descr': '', //简介
    'log_info': '',  //音乐特有
    'tracklist': '', //音乐特有
    'music_type': '', //音乐特有
    'music_media': '', //音乐特有
    'edition_info': '',//音乐特有
    'music_name': '', //音乐特有
    'music_author': '', //音乐特有
    'log_info': '', //音乐特有
    'animate_info': '', //动漫特有|针对北邮人北洋U2的命名方式
    'anidb': '', //动漫特有
    'torrentName': '', //动漫辅助
    'images': [], // 截图

    'torrent_name': '', // 用于转发内站
    'torrent_url': '',  // 用于转发内站

    //选择类信息
    'type': '',  //type:可取值——电影/纪录/体育/剧集/动画/综艺……
    'source_sel': '', //来源(地区)：可取值——欧美/大陆/港台/日本/韩国/印度……
    'standard_sel': '',  //分辨率：可取值——4K/1080p/1080i/720p/SD
    'audiocodec_sel': '',  //音频：可取值——AAC/AC3/DTS…………
    'codec_sel': '', //编码：可取值——H264/H265……
    'medium_sel': '', //媒介：可取值——web-dl/remux/encode……

    //其他
    'origin_site': '', //记录源站点用于跳转后识别
    'origin_url': '', //记录源站点用于跳转后识别
    'golden_torrent': false, //主要用于皮转柠檬, 转过去之后会变成字符串
    'mediainfo_cmct': '', //适用于春天的info
    'imgs_cmct': '', //适用于春天的截图
    'full_mediainfo': '', //完整的mediainfo有的站点有长短两种，如：铂金家、猫、春天
    'subtitles': [], //针对皮转海豹，字幕

    'youtube_url': '', //用于发布iTS
    'ptp_poster': '',  //用于发布iTS
    'comparisons': '', //用于海豹
    'version_info': '', //用于海豹
    'multi_mediainfo': '', //用于海豹
    'labels': 0
};

var no_need_douban_button_sites = ['RED', 'OpenCD', 'lztr', 'DICMusic', 'OPS', 'jpop', 'bib', 'mam', 'SugoiMusic', 'MTeam', 'HHClub'];

Array.prototype.remove = function(val) {
    var index = this.indexOf(val);
    if (index > -1) {
        this.splice(index, 1);
    }
};

function ptp_send_images(urls, api_key) {
    return new Promise(function(resolve, reject) {
        var boundary = "--NN-GGn-PTPIMG";
        var data = "";
        data += boundary + "\n";
        data += "Content-Disposition: form-data; name=\"link-upload\"\n\n";
        data += urls.join("\n") + "\n";
        data += boundary + "\n";
        data += "Content-Disposition: form-data; name=\"api_key\"\n\n";
        data += api_key + "\n";
        data += boundary + "--";
        GM_xmlhttpRequest({
            "method": "POST",
            "url": "https://ptpimg.me/upload.php",
            "responseType": "json",
            "headers": {
               "Content-type": "multipart/form-data; boundary=NN-GGn-PTPIMG"
            },
            "data": data,
            "onload": function(response) {
                if (response.status != 200) reject("Response error " + response.status);
                resolve(response.response.map(function (item) {
                    return "[img]https://ptpimg.me/" + item.code + "." + item.ext + '[/img]';
                }));
           }
        });
    });
};

function pix_send_images(urls) {
    return new Promise(function(resolve, reject) {
        GM_xmlhttpRequest({
            "method": "POST",
            "url": "https://pixhost.to/remote/",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded",
                "Accept": "application/json",
                "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36"
            },
            "data": encodeURI(`imgs=${urls.join('\r\n')}&content_type=0&max_th_size=350`),
            "onload": function(response) {
                if (response.status != 200) {
                    reject(response.status);
                } else {
                    const data = response.responseText.match(/(upload_results = )({.*})(;)/);
                    if (data && data.length) {
                    var imgResultList = JSON.parse(data[2]).images;
                    resolve(imgResultList.map(function(item){
                        return `[url=${item.show_url}][img]${item.th_url}[/img][/url]`;
                    }));
                    } else {
                        console.log(response);
                        reject('上传失败，请重试');
                    }
                }
            }
        });
    });
};

//添加搜索框架，可以自行添加或者注释站点
function add_search_urls(container, imdbid, imdbno, search_name, mode) {
    var div_style = 'align="center" style="border: 1px solid blue;"';
    var text = '快速搜索：';
    var brs = '</br></br>';
    var font_color = 'red';
    var font_size = '';

    if (mode == 1) {
        div_style = '';  font_color = 'green'; text = ''; brs = '</br>';
        if (site_url.match(/^https:\/\/www.imdb.com\/title\/tt\d+\/$/)) {
            font_size = 'size = 2px';
        }
    } else if (mode == 2) {
        div_style = ''; brs = '</br>';
        font_size = 'size = 2px';
    } else if (mode == 3) {
        div_style = ''; font_color = 'green'; text = ''; brs = '';
    }
    if (raw_info.url) {
        tmp_search_list = used_search_list.map((e)=> {
            if (e.match(/avistaz|privatehd|cinemaz/)) {
                var domain = e.match(/avistaz|privatehd|cinemaz/)[0];
                if (raw_info.type == "剧集" || raw_info.name.match(/S\d+|E\d+/i)) {
                    var o = $(e).attr('href');
                    var d = $(e).attr('href').replace(/torrents\?in=1&.*/, 'tv-shows?search=&imdb={imdbid}');
                    return e.replace(o, d);
                } else {
                    var o = $(e).attr('href');
                    var d = $(e).attr('href').replace(/torrents\?in=1&.*/, 'movies?search=&imdb={imdbid}');
                    return e.replace(o, d);
                }
            } else {
                return e;
            }
        })
    } else {
        if (imdbid == '') {
            tmp_search_list = used_search_list.map((e)=> {
                if (e.match(/imdbid|imdbno/)) {
                    e = e.replace(/<a/, '<a class="disabled"');
                }
                return e;
            });
        } else {
            tmp_search_list = used_search_list;
        }
    }
    tmp_search_list = tmp_search_list.map(item => {
        if (item.includes('ZHUQUE')) {
            const zhuquejson = JSON.parse('{"page":1,"size":20,"type":"title","sorter":"id","order":"desc","keyword":"PTer","tags":[],"category":[],"medium":[],"videoCoding":[],"audioCoding":[],"resolution":[],"group":[],"more":false}');
            try{
                zhuquejson.keyword = search_name.trim();
            } catch(err) {}
            const b64 = btoa(encodeURIComponent(JSON.stringify(zhuquejson)));
            return `<a href="https://zhuque.in/torrent/search/${b64}" target="_blank">ZHUQUE</a>`;
        }
        return item;
    });
    var site_search_lists = tmp_search_list.join(' | ');
    if ($('.search_urls').length == 1) {
        $('.search_urls').hide();
        brs = '';
    } else if ($('.search_urls').length > 2) {
        $('.search_urls').show();
    }
    if (site_url.match(/^https?:\/\/movie.douban.com/)) {
        if (site_search_lists.match(/https:\/\/www.imdb.com.*?imdbid/)) {
            site_search_lists = site_search_lists.replace(/www.imdb.com.*?imdbid}/, 'click_new');
        }
    }
    site_search_lists = site_search_lists.format({'imdbid': imdbid, 'imdbno': imdbno, 'search_name': search_name});
    container.append(`${brs}<div ${div_style} class="search_urls"><font ${font_size} color=${font_color}>${text}${site_search_lists}</font></div>`);
    container.find('.disabled').attr("disabled",true).click(e=>{
        e.preventDefault();
        alert('当前影视没有IMDB信息！！');
        return;
    });
    $('.hdb-task').click((e)=>{
        GM_setValue('task_info', JSON.stringify(raw_info));
    });
    if (mode == 1) {
        $('.search_urls').find('a').css("color", "darkblue");
    }
    try {
        var imdbid = $('#info').html().match(/tt\d+/i)[0];
        var imdb_url = 'https://www.imdb.com/title/' + imdbid;
        $('a[href*="click_new"').click(e=>{
            e.preventDefault();
            window.open(imdb_url, target="_blank");
        });
    } catch (err) {}
}

//函数用来豆瓣信息搜索时候进行处理, 后期准备作废
const numToChn = function(num) {
    var chnNumChar = ["零", "一", "二", "三", "四", "五", "六", "七", "八", "九"];
    var index = num.toString().indexOf(".");
    if (index != -1) {
        var str = num.toString().slice(index);
        var a = "点";
        for (var i = 1; i < str.length; i++) {
            a += chnNumChar[parseInt(str[i])];
        }
        return a;
    } else {
        return;
    }
};

function numToChinese(num) { //定义在每个小节的内部进行转化的方法，其他部分则与小节内部转化方法相同
    var chnNumChar = ["零", "一", "二", "三", "四", "五", "六", "七", "八", "九"];
    var chnUnitChar = ["", "十", "百", "千"];
    var str = '',
        chnstr = '',
        zero = false,
        count = 0; //zero为是否进行补零， 第一次进行取余由于为个位数，默认不补零
    if (num > 0 && num < 100) {
        var v = num % 10;
        var q = Math.floor(num / 10);

        if (num < 10) { //如果数字为零，则对字符串进行补零
            chnstr = chnNumChar[v] + chnstr;

        } else if (num == 10) chnstr = chnUnitChar[1];
        else if (num > 10 && num < 20) chnstr = "十" + chnNumChar[v];
        else {
            if (v == 0) chnstr = chnNumChar[q] + "十";
            else chnstr = chnNumChar[q] + "十" + chnNumChar[v];
        }
    }
    return chnstr;
}

//用来判断地址属于哪个站点（国内发布站点，国外源站点，或其他）
function find_origin_site(url){

    var domain; //域名
    var reg;    //正则匹配表达式
    var key;
    //先从发布站点找
    for (key in used_site_info){
        //获取域名
        domain = used_site_info[key].url.split('//')[1].replace('/', '');
        reg = new RegExp(domain, 'i');
        if (url.match(reg)){
            if (key == 'HDB' && url.match(/uhdbits\.org/)){
                return 'UHD';
            }
            return key;
        }
    }
    //再从特殊源站点找
    for (key in o_site_info){
        //获取域名
        domain = o_site_info[key].split('//')[1].replace('/', '');
        reg = new RegExp(domain, 'i');
        if (url.match(reg)){
            return key;
        }
    }
    return 'other';
}

function add_thanks(descr) {
    //这部分是属于官种名称匹配，用于声明感谢，可自定义匹配正则以及感谢bbcode
    const reg_team_name = {
        'MTeam': /-(.*mteam|mpad|tnp|BMDru)/i,
        'CMCT': /-(CMCT|cmctv)/i,
        'HDSky': /-(hds|.*@HDSky)/i,
        'CHDBits': /-(CHD|.*@CHDBits)/i,
        'OurBits': /(-Ao|-.*OurBits|-FLTTH|-IloveTV|OurTV|-IloveHD|OurPad|-MGs)$/i,
        'TTG': /-(WiKi|DoA|.*TTG|NGB|ARiN)/i,
        'HDChina': /-(HDC)/i,
        'PTer': /-(Pter|.*Pter)/i,
        'HDHome': /(-hdh|.*@HDHome)/i,
        'PThome': /(-pthome|-pth|.*@pth)/i,
        'Audiences': /(-Audies|.*@Audies|-ADE|-ADWeb|.*@ADWeb)/i,
        'PuTao': /-putao/i,
        'NanYang': /-nytv/i,
        'TLFbits': /-tlf/i,
        'HDDolby': /-DBTV|-QHstudIo|Dream$|.*@dream/i,
        'FRDS': /-FRDS|@FRDS/i,
        'PigGo': /PigoHD|PigoWeb|PiGoNF/i,
        'CarPt': /CarPT/i,
        'HDVideo': /(-HDVWEB|-HDVMV)/i,
        'HDfans': /HDFans/i,
        'WT-Sakura': /SakuraWEB|SakuraSUB|WScode/i,
        'HHClub': /HHWEB/i,
        'HaresClub': /Hares?WEB|HaresTV|DIY@Hares|-hares/i,
        'HDPt': /hdptweb/i,
        'UBits': /-UBits/i,
        'Panda': /AilMWeb|-PANDA|@Panda/i,
        'UBits': /@UBits|-UBits/,
        'SharkPT': /-Shark/,
        'PTCafe': /CafeWEB|CafeTV|DIY@PTCafe/i,
        '影': /Ying(WEB|DIY|TV|MV|MUSIC)?$/i,
        'DaJiao': /DJWEB|DJTV/i,
        'PTLSP': /PTLSP|LSP(WEB|DIY|MUSIC)?$/i,
        '象岛': /Eleph(WEB|REMUX|Rip|TV|DIY|MUSIC)?$/i,
        'OKPT': /OK(WEB|Web)?$/i,
        'AGSV': /AGSV(PT|E|WEB|REMUX|Rip|TV|DIY|MUS)?$/i,
        'TJUPT': /TJUPT$/,
        'FileList': /Play(HD|SD|WEB|TV)?$/i,
        'CrabPt': /XHBWeb$/i,
        '红叶': /(RLWEB|RLeaves|RLTV|-R²)$/i,
        'QingWa': /(FROG|FROGE|FROGWeb)$/i,
    };
    const thanks_str = "[quote][b][color=blue]{site}官组作品，感谢原制作者发布。[/color][/b][/quote]\n\n{descr}";
    for (var key in reg_team_name) {
        if (raw_info.name.match(reg_team_name[key]) && !raw_info.name.match(/PandaMoon|HDSpace|HDClub|LCHD/i)) {
            descr = thanks_str.format({'site': key, 'descr': descr});
        }
    }
    return descr;
}

//标签及其字标签转换为字符串，主要用于获取简介等等, 根据网页树的结构，采用前序遍历递归呈现。
function walkDOM(n) {
    do {
        if (n.nodeName == 'FONT') {
            if (n.color != '') {
                n.innerHTML = '[color=' + n.color + ']' + n.innerHTML + '[/color]';
            }
            if (n.size != '') {
                n.innerHTML = '[size=' + n.size + ']' + n.innerHTML + '[/size]';
            }
            if (n.face != '') {
                n.innerHTML = '[font=' + n.face + ']' + n.innerHTML + '[/font]';
            }
        } else if (n.nodeName == 'SCRIPT'){
            n.innerHTML = '';
        } else if (n.nodeName == 'SPAN') {
            if (n.style.color != '') {
                n.innerHTML = '[color=' + rgb_2_hex(n.style.color) + ']' + n.innerHTML + '[/color]';
            }
        } else if (n.nodeName == 'U'){
            n.innerHTML = '[u]' + n.innerHTML + '[/u]';
        } else if (n.nodeName == 'A') {
            if (n.innerHTML != "" && n.href) {
                if (site_url.match(/http(s*):\/\/ptchdbits.co\/details.php.*/i)) {
                    if (!n.innerHTML.match(/pic\/hdl\.gif/g)) {
                        n.innerHTML = '[url=' + n.href + ']' + n.innerHTML + '[/url]';
                    }
                } else {
                    n.innerHTML = '[url=' + n.href + ']' + n.innerHTML + '[/url]';
                }
            }
        } else if (n.nodeName == 'TABLE') {
            if (n.innerHTML != "") {
                if (site_url.match(/http(s*):\/\/totheglory.im.*|bwtorrents.tv/i)) {
                    n.innerHTML = '[quote]' + n.innerHTML + '[/quote]';
                } else if (site_url.match(/u2.dmhy/)) {
                    n.innerHTML = '';
                }
            }
        } else if (n.nodeName == 'P') {
            if (n.innerHTML != "") {
                if (site_url.match(/http(s*):\/\/totheglory.im.*/i)) {
                    n.innerHTML = '';
                } else if (site_url.match(/hdroute/i) && n.className == 'quoted') {
                    n.innerHTML = '[quote]' + n.innerHTML + '[/quote]';
                }
            }
            if (site_url.match(/hhanclub.top/)) {
                n.innerHTML = n.innerHTML + '\n';
            }
        } else if (n.nodeName == 'FIELDSET' || n.nodeName == 'BLOCKQUOTE') {
            if (!site_url.match(/hudbt/i) || n.nodeName != 'BLOCKQUOTE'){
                n.innerHTML = '[quote]' + n.innerHTML.trim() + '[/quote]';
            }
            if (n.nodeName == 'FIELDSET' && n.textContent.match(/(温馨提示|郑重声明|您的保种|商业盈利|相关推荐|自动发布|仅供测试宽带|不用保种|本站仅负责连接|感谢发布者|转载请注意礼节)/g)) {
                n.innerHTML = '';
            }
            if (n.nodeName == 'BLOCKQUOTE' && n.textContent.match(/勿作商用/)) {
                n.innerHTML = '';
            }
        } else if (n.nodeName == 'DIV' && n.innerHTML == '代码') {
            n.innerHTML = '';
            n.nextSibling.innerHTML = '[quote]' + n.nextSibling.innerHTML + '[/quote]';
        } else if (n.nodeName == 'DIV' && n.className == 'quoted' && site_url.match(/digitalcore/)) {
            n.innerHTML = '[quote]' + n.innerHTML + '[/quote]';
        } else if (n.nodeName == 'B') {
            n.innerHTML = '[b]' + n.innerHTML + '[/b]';
        } else if (n.nodeName == 'DIV' && site_url.match(/npupt/) && n.className == 'well small') {
            n.innerHTML = '';
        } else if (n.nodeName == '#text' && site_url.match(/npupt/)) {
            n.data = n.data.replace(/^ +| +$/g, '');
        } else if (n.nodeName == 'BR') {
            if (site_url.match(/u2.dmhy.org|ourbits.club|hd-space.org|totheglory.im|blutopia.cc|sharkpt.net|desitorrents.tv|hudbt|fearnopeer.com|onlyencodes.cc|cinemageddon|hdpost.top|asiancinema.me|hd-olimpo.club|digitalcore.club|bwtorrents.tv|myanonamouse|greatposterwall.com|kp.m-team.cc/i)) {
                n.innerHTML = '\r\n';
            }
        } else if (n.nodeName == 'LEGEND') {
            n.innerHTML = '';
        } else if (n.nodeName == 'IMG') {
            if (site_url.match(/http(s*):\/\/ptchdbits.co\/details.php.*/i)) {
                if (!n.src.match(/pic\/hdl\.gif/g)) {
                    raw_info.descr = raw_info.descr + '[img]' + n.src + '[/img]';
                }
            } else if (site_url.match(/http(s*):\/\/club.hares.top\/details.php.*/i)) {
                if ($(n).attr('lay-src') !== undefined) {
                    raw_info.descr = raw_info.descr + '[img]' + $(n).attr('lay-src') + '[/img]';
                } else {
                    raw_info.descr = raw_info.descr + '[img]' + n.src + '[/img]';
                }
            } else if (site_url.match(/http(s*):\/\/.*tjupt.org\/details.php.*/i)) {
                if ($(n).attr('data-src') !== undefined) {
                    raw_info.descr = raw_info.descr + '[img]' + $(n).attr('data-src') + '[/img]';
                } else {
                    raw_info.descr = raw_info.descr + '[img]' + n.src + '[/img]';
                }
            } else {
                raw_info.descr = raw_info.descr + '[img]' + n.src + '[/img]';
            }
        } else if (n.nodeName=='DIV' && site_url.match(/pthome|audiences/i) && n.className == 'codemain') {
            if (raw_info.name.match(/-ADE|-ADWeb/) && raw_info.descr.match(/General/)) {
                n.innerHTML = '';
            } else if (n.parentNode.className == 'hide' || site_url.match(/pthome/i)) {
                if (!n.innerHTML.match(/^\[quote\]/)) {
                    n.innerHTML = '[quote]' + n.innerHTML + '[/quote]';
                }
            } else {
                n.innerHTML = '';
            }
        } else if (n.nodeName == 'TD' && n.innerHTML.match(/此处包含部分隐藏内容/)) {
            n.innerHTML = '';
        } else if (n.nodeName == 'TD' && site_url.match(/tjupt/i) && n.innerHTML.match(/General/)) {
            n.innerHTML = '[quote]' + n.innerHTML + '[/quote]';
        }
        if (n.hasChildNodes()) {
            walkDOM(n.firstChild);
        } else {
            raw_info.descr = raw_info.descr + n.textContent;
        }
        n = n.nextSibling;
    } while (n);
    return raw_info.descr;
}

//为了春天获取简介而写的定制节点转文本
function walk_cmct(n) {
    do {
        if (n.nodeName == 'SPAN') {
            if (n.style.color != '') {
                n.innerHTML = '[color=' + n.style.color + ']' + n.innerHTML + '[/color]';
            }
        } else if (n.nodeName == 'A') {
            if (n.innerHTML != "") {
                n.innerHTML = n.innerHTML;
            }
        } else if (n.nodeName == 'BR') {
            n.innerHTML = '\r\n';
        }

        if (n.hasChildNodes()) {
            walk_cmct(n.firstChild);
        } else {
            if (n.nodeType !=1){
                raw_info.descr = raw_info.descr + n.textContent;
            }
        }
        n = n.nextSibling;
    } while (n);
    return raw_info.descr;
}

function walk_ptp(n) {
    do {
        if (n.nodeName == 'A' && n.getAttribute('onclick')){
            if (n.getAttribute('onclick').match(/MediaInfoToggleShow|BBCode.spoiler/)) {
                n.innerHTML = '';
            } else if (n.getAttribute('onclick').match(/BBCode.ScreenshotComparisonToggleShow/)) {
                var info = n.getAttribute('onclick').match(/\[.*?\]/g);
                var item = info[0].replace(/\[|\]|"/g, '');
                var pics_text = '';
                info[1].replace(/\[|\]|"|\\/g, '').split(',').forEach((e)=>{
                    pics_text += `[img]${e.trim()}[/img]`;
                });
                n.innerHTML = `[comparison=${item}]\n\n${pics_text}\n\n[/comparison]`;
            }
        } else if (n.nodeName == 'A') {
            n.innerHTML = '[url=' + n.href + ']' + n.innerHTML + '[/url]';
        } else if (n.nodeName == 'TABLE') {
            n.nextSibling.innerHTML = n.nextSibling.textContent;
            n.innerHTML = '';
        } else if (n.nodeName == 'LI') {
            n.innerHTML = '　　* ' + n.textContent + '\n';
        } else if (n.nodeName == 'STRONG') {
            try{
                if (n.nextSibling.nextSibling.nextSibling.nodeName == 'BLOCKQUOTE') {
                    n.nextSibling.nextSibling.nextSibling.innerHTML = `[hide=${n.textContent}]${n.nextSibling.nextSibling.nextSibling.innerHTML}[/hide]`;
                    n.innerHTML = '';
                    n.nextSibling.textContent = '';
                    n.nextSibling.nextSibling.textContent = '';
                } else if (n.nextSibling.nextSibling.textContent == 'Show comparison') {
                    n.textContent = '';
                    n.nextSibling.textContent = '';
                } else {
                    n.innerHTML = `[b]${n.innerHTML}[/b]`;
                }
            } catch (err) {
                n.innerHTML = `[b]${n.innerHTML}[/b]`;
            }
        } else if (n.nodeName == 'SPAN') {
            if (n.style.cssText.match(/underline/i)) {
                n.innerHTML = '[u]' + n.innerHTML + '[/u]';
            } else {
                n.innerHTML = n.innerHTML;
            }
        } else if (n.nodeName == 'IMG') {
            n.innerHTML = '[img]' + n.src + '[/img]';
        } else if (n.nodeName == 'BLOCKQUOTE' && n.textContent.match(/general|Disc Title|DISC INFO|mpls/i)) {
            n.innerHTML = `[quote]${n.innerHTML}[/quote]`;
        }

        if (n.hasChildNodes()) {
            walk_ptp(n.firstChild);
        } else {
            if (n.nodeType !=1){
                raw_info.descr = raw_info.descr + n.textContent;
            }
        }
        n = n.nextSibling;
    } while (n);
    return raw_info.descr;
}

function deal_img_350(pic_info) {
    var imgs = pic_info.match(/\[img\].*?(jpg|png).*?\[\/img\]/g);
    if (imgs) {
        imgs.map((item)=>{
            var img_url = item.match(/http.*?(png|jpg)/)[0];
            if (img_url.match(/ptpimg/)) {
                var new_imgs = `[url=${img_url}]${item.replace('[img]', '[img=350x350]')}[/url]`;
                pic_info = pic_info.replace(item, new_imgs);
            }
        })
    }
    return pic_info;
}

function deal_img_350_ptpimg(pic_info) {
    var imgs = pic_info.match(/\[img\].*?(jpg|png).*?\[\/img\]/g);
    if (imgs) {
        imgs.map((item)=>{
            var img_url = item.match(/http.*?(png|jpg)/)[0];
            if (img_url.match(/ptpimg.me/)) {
                var new_imgs = `[url=${img_url}]${item.replace('[img]', '[img=350]')}[/url]`;
                pic_info = pic_info.replace(item, new_imgs);
            }
        })
    }
    return pic_info;
}

//标签节点连带转换成字符串
function domToString (node) {
    var tmpNode = document.createElement('div');
    tmpNode.appendChild(node);
    var str = tmpNode.innerHTML;
    tmpNode = node = null; // 解除引用，以便于垃圾回收
    return str;
}

//方便进行判断是否是源站点，不然太长了,属于源站点进入逻辑业务层
function judge_if_the_site_as_source() {
    if (site_url.match(/^https:\/\/karagarga.in\/upload\.php.*/)) {
        return 4;
    }
    if (site_url.match(/^https:\/\/(broadcasthe.net|backup.landof.tv)\/upload.php.*/)) {
        return 5;
    }
    if (site_url.match(/^https?:\/\/\d+.\d+.\d+.\d+:5678/)) {
        return 7;
    }
    if (site_url.match(/^https?:\/\/.*\/(upload|create|offer|viewoffers).*?(php)?#seperator#/i)) {
        return 0;
    }
    if (site_url.match(/^https:\/\/.*open.cd\/plugin_upload.php#seperator#/i)) {
        return 0;
    }
    if (site_url.match(/^https?:\/\/(avistaz|privatehd|cinemaz).to\/upload\/torrent\/\d+/i)) {
        return 6;
    }
    if (site_url.match(/^https?:\/\/www.hd.ai\/Torrents.upload/i)) {
        return 0;
    }
    if (site_url.match(/^https:\/\/hd-space\.org\/index.php\?page=upload/)){
        return 0;
    }
    if (site_url.match(/^https:\/\/hdcity.city\/upload/)){
        return 2;
    }
    if (site_url.match(/^https:\/\/(www.)?(pt.hdpost.top|kimoji.club|asiancinema.me|hd-olimpo.club|jptv.club|fearnopeer.com|onlyencodes.cc|blutopia.cc|aither.cc|desitorrents.tv|monikadesign.uk|hawke.uno|cinematik.net)\/torrents\/\d+$/)){
        return 1;
    }
    if (site_url.match(/^https:\/\/(www.)?torrentseeds.org\/torrents\/\d+/)){
        return 1;
    }
    if (site_url.match(/^https:\/\/zhuque.in\/torrent\/(info|list)\/\d+/)){
        return 1;
    }
    if (site_url.match(/^https:\/\/bibliotik.me\/torrents\/\d+/)) {
        return 1;
    }
    if (site_url.match(/^https:\/\/www.myanonamouse.net\/t\/\d+/)) {
        return 1;
    }
    if (site_url.match(/^https:\/\/speedapp.io\/browse\/\d+\/t/)) {
        return 1;
    }
    if (site_url.match(/^https:\/\/hd-space.org\/index.php\?page=torrent-details/)) {
        return 1;
    }
    if (site_url.match(/^https:\/\/digitalcore.club\/torrent\/\d+/)){
        return 1;
    }
    if (site_url.match(/^https:\/\/nzbs.in\/.*|^https:\/\/house-of-usenet.*|https:\/\/omgwtfnzbs.org.*/)){
        return 1;
    }
    if (site_url.match(/^https:\/\/nebulance.io\/torrents.php\?id=\d+/i)) {
        return 1;
    }
    if (site_url.match(/^http(s*):\/\/.*\/.*details.*php.*/i)) {
        return 1;
    }
    if (site_url.match(/^http(s*):\/\/.*\/.*detail\/\d+/i)) {
        return 1;
    }
    if (site_url.match(/^http(s*):\/\/totheglory.im\/t\/.*/i)) {
        return 1;
    }
    if (site_url.match(/^http(s*):\/\/(passthepopcorn.me|tv-vault.me|broadcasthe.net|backup.landof.tv|greatposterwall.com|sugoimusic.me).*torrentid.*/i)) {
        return 1;
    }
    if (site_url.match(/^http(s*):\/\/iptorrents.com\/torrent.php\?id=*/i)) {
        return 1;
    }
    if (site_url.match(/^http(s*):\/\/anthelion.me.*torrentid.*/i)) {
        return 1;
    }
    if (site_url.match(/^http(s*):\/\/secret-cinema.pw.*torrentid.*/i)) {
        return 1;
    }
    if (site_url.match(/^http(s*):\/\/www.morethantv.me.*torrentid.*/i)) {
        return 1;
    }
    if (site_url.match(/^http(s*):\/\/hd-only.org.*torrentid.*/i)) {
        return 1;
    }
    if (site_url.match(/^https:\/\/hdbits\.org\/details\.php\?id=.*/i)) {
        return 1;
    }
    if (site_url.match(/^http(s*):\/\/(privatehd|cinemaz|avistaz).to\/torrent/i)) {
        return 1;
    }
    if (site_url.match(/^http(s*):\/\/www.morethan.tv\/torrents.php\?id/i)) {
        return 1;
    }
    if (site_url.match(/^http(s*):\/\/beyond-hd.me\/torrents/i)) {
        return 1;
    }
    if (site_url.match(/^http(s*):\/\/uhdbits.org\/torrents.php\?id=\d+&torrentid=\d+/i)) {
        return 1;
    }
    if (site_url.match(/^http(s*):\/\/hdf.world\/torrents.php\?id=\d+&torrentid=\d+/i)) {
        return 1;
    }
    if (site_url.match(/^http(s*):\/\/jpopsuki.eu\/torrents.php\?id=\d+&torrentid=\d+/i)) {
        return 1;
    }
    if (site_url.match(/^http(s*):\/\/(redacted.ch|lztr.me|dicmusic.com|orpheus.network)\/torrents.php\?id=\d+&torrentid=\d+/i)) {
        return 1;
    }
    if (site_url.match(/^http(s*):\/\/www\.torrentleech\.org\/torrent\/*/i)) {
        return 1;
    }
    if (site_url.match(/^http(s*):\/\/xthor.tk\/details.php/i)) {
        return 1;
    }
}

//判断是否是国内的站点，国内站点架构基本一致且不需要额外获取豆瓣信息
function judge_if_the_site_in_domestic() {

    var domain, reg, key;
    for (key in o_site_info){
        if (key != 'FRDS' && key != 'BYR' && key != 'U2' && key != '影'){
            domain = o_site_info[key].split('//')[1].replace('/', '');
            reg = new RegExp(domain, 'i');
            if (site_url.split('#seperator#')[0].match(reg)){
                return 0;
            }
        }
    }
    return 1;
}

//处理标题业务封装进函数
function deal_with_title(title){
    title = title.replace(/\./g, ' ').replace(/torrent$/g, '').trim() + ' ';
    if (title.match(/[^\d](2 0|5 1|7 1|1 0|6 1|2 1)[^\d]/)) {
        title = title.replace(/[^\d](2 0|5 1|7 1|1 0|6 1|2 1)[^\d]/, function(data){
            return data.slice(0,2) + '.'+ data.slice(3,data.length);
        }).trim();
    }
    title = title.replace(/H ?(26[45])/i, "H.$1").replace(/x265[.-]10bit/i, 'x265 10bit');
    title = title.replace(/\s+\[2?x?(免费|free)\].*$|\(限时.*\)|\(限時.*\)|\(已审\)/ig, '').replace(/\[.*?\]/ig, '').replace(/剩余时间.*/i, '');
    title = title.replace(/\(|\)/ig, '').replace(/ - /, '-').trim();
    title = title.replace('_10_', '(_10_)');
    title = title.replace('V2.1080p', 'V2 1080p').replace(/mkv$|mp4$/i, '');
    return title;
}

//处理副标题逻辑业务封装进函数
function deal_with_subtitle(subtitle){
    subtitle = subtitle.replace(/\[checked by.*?\]/i, '').replace(/autoup/i, '').replace(/ +/, ' ').trim();
    return subtitle;
}

//字典转成字符串传达到跳转页面
function dictToString(my_dict){
    my_dict = fill_raw_info(my_dict, null);
    var tmp_string = '', link_str = '#linkstr#', key;
    for (key in my_dict){
        tmp_string += key + link_str + my_dict[key] + link_str;
    }
    return tmp_string.slice(0, tmp_string.length-9);
}

//字符串转换成字典回来填充发布页面
function stringToDict(my_string){
    var link_str = '#linkstr#';
    var tmp_array = my_string.split(link_str);
    var tmp_dict = {};
    for (i = 0; i < tmp_array.length; i++) {
        if (i % 2 == 0) {
            tmp_dict[tmp_array[i]] = tmp_array[i + 1];
        }
    }
    return tmp_dict;
}

//下面两个函数用来为字符串赋予format方法：例如——'thank you {site}'.format({'site':'ttg'}) => 'thank you ttg'
String.prototype.replaceAll = function (exp, newStr) {
    return this.replace(new RegExp(exp, "gm"), newStr);
};

String.prototype.format = function(args) {
    var result = this;
    if (arguments.length < 1) {
        return result;
    }
    var data = arguments;
    if (arguments.length == 1 && typeof (args) == "object") {
        data = args;
    }
    for ( var key in data) {
        var value = data[key];
        if (undefined != value) {
            result = result.replaceAll("\\{" + key + "\\}", value);
        }
    }
    return result;
};

//下面几个函数为字符串赋予获取各种编码信息的方法——适用于页面基本信息和字符串
String.prototype.medium_sel = function() { //媒介
    var result = this.toString();
    if (result.match(/(Webdl|Web-dl|WEB[\. ])/i)) {
        result = 'WEB-DL';
    } else if (result.match(/(UHDTV)/i)) {
        result = 'UHDTV';
    } else if (result.match(/(HDTV)/i)) {
        result = 'HDTV';
    } else if (result.match(/(Remux)/i) && ! result.match(/Encode/)) {
        result = 'Remux';
    } else if (result.match(/(Blu-ray|.MPLS|Bluray原盘)/i) && !result.match(/Encode/i)) {
        result = 'Blu-ray';
    } else if (result.match(/(UHD|UltraHD)/i) && !result.match(/Encode/i)) {
        result = 'UHD';
    } else if (result.match(/(Encode|BDRIP|webrip|BluRay)/i) || result.match(/(x|H).?(264|265)/i)) {
        result = 'Encode';
    } else if (result.match(/(DVDRip|DVD)/i)) {
        result = 'DVD';
    } else if (result.match(/TV/)) {
        result = 'TV';
    } else if (result.match(/VHS/)) {
        result = 'VHS';
    } else if (result.match(/格式: CD|媒介: CD/)) {
        result = 'CD';
    } else {
        result = '';
    }
    return result;
};

String.prototype.codec_sel = function() { //编码

    var result = this;
    if (result.match(/(H264|H\.264|AVC)/i)) {
        result = 'H264';
    } else if (result.match(/(HEVC|H265|H\.265)/i)) {
        result = 'H265';
    } else if (result.match(/(VVC|H266|H\.266)/i)) {
        result = 'H266';
    } else if (result.match(/(X265)/i)) {
        result = 'X265';
    } else if (result.match(/(X264)/i)) {
        result = 'X264';
    } else if (result.match(/(VC-1)/i)) {
        result = 'VC-1';
    } else if (result.match(/(MPEG-2)/i)) {
        result = 'MPEG-2';
    } else if (result.match(/(MPEG-4)/i)) {
        result = 'MPEG-4';
    } else if (result.match(/(XVID)/i)) {
        result = 'XVID';
    } else if (result.match(/(VP9)/i)) {
        result = 'VP9';
    } else if (result.match(/DIVX/i)) {
        result = 'DIVX';
    } else {
        result = '';
    }

    return result;
};

String.prototype.audiocodec_sel = function() { //音频编码
    var result = this.toString();
    if (result.match(/(DTS-HDMA:X 7\.1|DTS.?X.?7\.1)/i)){
        result = 'DTS-HDMA:X 7.1';
    } else if (result.match(/(DTS-HD.?MA)/i)) {
        result = 'DTS-HDMA';
    } else if (result.match(/(DTS-HD.?HR)/i)) {
        result = 'DTS-HDHR';
    } else if (result.match(/(DTS-HD)/i)) {
        result = 'DTS-HD';
    } else if (result.match(/(DTS-X)/i)) {
        result = 'DTS-X';
    } else if (result.match(/(LPCM)/i)) {
        result = 'LPCM';
    } else if (result.match(/([ \.]DD|AC3|AC-3|Dolby Digital)/i)) {
        result = 'AC3';
    } else if (result.match(/(Atmos)/i)) {
        result = 'Atmos';
    } else if (result.match(/(AAC)/i)) {
        result = 'AAC';
    } else if (result.match(/(TrueHD)/i)) {
        result = 'TrueHD';
    } else if (result.match(/(DTS)/i)) {
        result = 'DTS';
    } else if (result.match(/(Flac)/i)) {
        result = 'Flac';
    } else if (result.match(/(APE)/i)) {
        result = 'APE';
    } else if (result.match(/(MP3)/i)) {
        result = 'MP3';
    } else if (result.match(/(WAV)/i)) {
        result = 'WAV';
    } else if (result.match(/(OPUS)/i)) {
        result = 'OPUS';
    } else if (result.match(/(OGG)/i)) {
        result = 'OGG';
    } else {
        result = '';
    }
    if (this.toString().match(/AUDiO CODEC/i) && this.toString().match(/-WiKi/)) {
        result = this.match(/AUDiO CODEC.*/i)[0];
        result = result.audiocodec_sel();
    }
    return result;
};

String.prototype.standard_sel = function() {

    var result = this;
    if (result.match(/(4320p|8k)/i)){
        result = '8K';
    } else if (result.match(/(1080p|2K)/i)){
        result = '1080p';
    } else if (result.match(/(720p)/i)){
        result = '720p';
    } else if (result.match(/(1080i)/i)){
        result = '1080i';
    } else if (result.match(/(576[pi]|480[pi])/i)){
        result = 'SD';
    } else if (result.match(/(1440p)/i)){
        result = '144Op';
    } else if (result.match(/(2160p|4k)/i)){
        result = '4K';
    } else {
        result = '';
    }
    return result;
};

//获取类型
String.prototype.get_type = function() {
    var result = this.toString();
    if (result.match(/(Movie|电影|UHD原盘|films|電影)/i)) {
        result = '电影';
    } else if (result.match(/(Animation|动漫|動畫|动画|Anime|Cartoons)/i)) {
        result = '动漫';
    } else if (result.match(/(TV.*Show|综艺)/i)) {
        result = '综艺';
    } else if (result.match(/(Docu|纪录|Documentary)/i)) {
        result = '纪录';
    } else if (result.match(/(TV.*Series|剧|TV-PACK|TV-Episode|TV)/i)) {
        result = '剧集';
    } else if (result.match(/(Music Videos|音乐短片|MV\(演唱\)|MV.演唱会|MV\(音乐视频\)|Music Video|Musics MV|Music-Video|音乐视频|演唱会\/MV|MV\/演唱会)/i)) {
        result = 'MV';
    } else if (result.match(/(Music|音乐)/i)) {
        result = '音乐';
    } else if (result.match(/(Sport|体育)/i)) {
        result = '体育';
    } else if (result.match(/(学习|资料|Study)/i)) {
        result = '学习';
    } else if (result.match(/(Software|软件)/i)) {
        result = '软件';
    } else if (result.match(/(Game|游戏)/i)) {
        result = '游戏';
    } else if (result.match(/(eBook|電子書|电子书|有声书|书籍|book)/i)) {
        result = '书籍';
    } else {
        result = '';
    }
    return result;
};

String.prototype.source_sel = function() {
    var info_text = this;
    //来源就在这里获取
    if (info_text.match(/(大陆|China|中国|CN|chinese)/i)) {
        source_sel = '大陆';
    } else if (info_text.match(/(HK&TW|港台|thai)/i)) {
        source_sel = '港台';
    } else if (info_text.match(/(EU&US|欧美|US\/EU|英美)/i)) {
        source_sel = '欧美';
    } else if (info_text.match(/(JP&KR|日韩|japanese|korean)/i)) {
        source_sel = '日韩';
    } else if (info_text.match(/(香港)/i)) {
        source_sel = '香港';
    } else if (info_text.match(/(台湾)/i)) {
        source_sel = '台湾';
    } else if (info_text.match(/(日本|JP)/i)) {
        source_sel = '日本';
    } else if (info_text.match(/(韩国|KR)/i)) {
        source_sel = '韩国';
    } else if (info_text.match(/(印度)/i)) {
        source_sel = '印度';
    } else {
        source_sel = '';
    }
    return source_sel;
};

//获取副标题或是否中字、国语、粤语以及DIY
String.prototype.get_label = function(){
    var my_string = this.toString();
    var name = my_string.split('#seperator#')[0];
    var labels = {'gy': false, 'yy': false, 'zz': false, 'diy': false, 'hdr10': false, 'db': false, 'hdr10plus': false, 'yz': false};

    if (my_string.match(/([简繁].{0,12}字幕|[简繁中].{0,3}字|简中|DIY.{1,5}字|内封.{0,3}[繁中字])|(Text.*?[\s\S]*?Chinese|Text.*?[\s\S]*?Mandarin|subtitles.*chs|subtitles.*mandarin|subtitle.*chinese|Presentation Graphics.*?Chinese)/i)){
        labels.zz = true;
    }
    if (my_string.match(/(英.{0,12}字幕|英.{0,3}字|内封.{0,3}英.{0,3}字)|(Text.*?[\s\S]*?English|subtitles.*eng|subtitle.*english)/i)){
        labels.yz = true;
    }

    if (my_string.match(/([^多]国.{0,3}语|国.{0,3}配|台.{0,3}语|台.{0,3}配)|(Audio.*Chinese|Audio.*mandarin)/i)){
        var sub_str = my_string.match(/([^多]国.{0,3}语|国.{0,3}配|台.{0,3}语|台.{0,3}配)|(Audio.*Chinese|Audio.*mandarin)/i)[0];
        if (!sub_str.match(/国家|Subtitles/)) {
            labels.gy = true;
        }
    }
    if (name.match(/(粤.{0,3}语|粤.{0,3}配|Audio.*cantonese)/i)){
        labels.yy = true;
    }
    if (name.match(/DIY|-.*?@(MTeam|CHDBits|HDHome|OurBits|HDChina|Language|TTG|Pter|HDSky|Audies|CMCT|Dream|Audies)/i) && my_string.match(/mpls/i)){
        labels.diy = true;
    }
    if (my_string.match(/HDR10\+/)) {
        labels.hdr10plus = true;
    } else if (my_string.match(/HDR10/)) {
        labels.hdr10 = true;
    }
    if (my_string.match(/Dolby Vision|杜比视界/i)){
        labels.db = true;
    }
    return labels;
};

function set_selected_option_by_value(my_id, value){

    var box = document.getElementById(my_id);
    for (i=0; i < box.options.length; i++){
        if ( box.options[i].value == value){
            box.options[i].selected = true;
        }
    }
}

//副标题增加原盘版本信息
function blurayVersion(name){

    var small_descr;
    const ver = ['AUS','CAN','CEE','CZE','ESP','EUR','FRA','GBR','GER','HKG','ITA','JPN','KOR','NOR','NLD','RUS','TWN','USA'];
    const ver_chinese=['澳版','加拿大','CEE','捷克','西班牙版','欧版','法版','英版','德版','港版','意大利版','日版','韩版','北欧版','荷兰版','俄版','台版','美版'];
    for (i=0; i<ver.length; i++) {
        var reg = new RegExp('(\\.| )'+ ver[i] + '(\\.| )', 'i');
            if (name.match(reg)) {
                small_descr ='【'+ver_chinese[i]+'原盘】';
                break;
        }
    }
    return small_descr;
}

function judge_forward_site_in_domestic(site){
    if ( Object.keys(o_site_info).indexOf(site) < 0 && site != "HDSpace") {
        return true;
    } else {
        return false;
    }
}

//从简介和名称获取副标题
function get_small_descr_from_descr(descr, name){
    var small_descr = '', videoname = '', sub_str = '', type_str = '';
    if (descr.match(/译.{0,5}名[^\r\n]+/)) {
        videoname = descr.match(/译.*?名([^\r\n]+)/)[1];
        if (!/.*[\u4e00-\u9fa5]+.*/.test(videoname) || videoname.trim() == '') {
            try{videoname = descr.match(/片.*?名([^\r\n]+)/)[1];} catch (err) {}
        }
        videoname = videoname.trim(); //去除首尾空格
        if (name.match(/S\d{2}E\d{2}/i)) { //电视剧单集
            sub_str = name.match(/S(\d{2})E(\d{2})/i);
            sub_str = ' *第' + numToChinese(parseInt(sub_str[1])) + '季 第' + parseInt(sub_str[2]) +'集*';
        } else if (name.match(/S\d{2}/)) {
            sub_str = name.match(/S(\d{2})/i);
            sub_str = ' *第' + numToChinese(parseInt(sub_str[1])) + '季';
            if (descr.match(/◎集.{1,10}数.*?(\d+)/)) {
                sub_str += ' 全' + parseInt(descr.match(/◎集.{1,10}数.*?(\d+)/)[1]) + '集*'
            } else {
                sub_str += '*';
            }
        }
        small_descr = videoname + sub_str;
    } if (descr.match(/类.{0,5}别[^\r\n]+/)) {
        type_str = descr.match(/类.*别([^\r\n]+)/)[1];
        type_str = type_str.trim(); //去除首尾空格
        type_str = type_str.replace(/\//g, ''); //去除/
        small_descr = small_descr + ' | 类别：' + type_str;
    }
    return small_descr.trim();
}

//根据简介获取来源，也就是地区国家产地之类的——尤其分类是日韩或者港台的，有的站点需要明确一下
function get_source_sel_from_descr(descr){
    var region = '';
    var reg_region = descr.match(/(地.{0,10}?区|国.{0,10}?家|产.{0,10}?地)([^\r\n]+)/);
    if (reg_region) {
        region = reg_region[2].split('/')[0].trim(); //去除首尾空格
        reg_region = RegExp(us_ue, 'i');
        if (region.match(/香港/)){
            region = '香港';
        } else if (region.match(/台湾|臺灣/)){
            region = '台湾';
        } else if (region.match(/日本/)){
            region = '日本';
        } else if (region.match(/韩国/)){
            region = '韩国';
        } else if (region.match(/印度/) && !region.match(/印度尼西亚/)){
            region = '印度';
        } else if (region.match(/中国|大陆/)){
            region = '大陆';
        } else if (region.match(reg_region)){
            region = '欧美';
        } else {
            region = '';
        }
    }
    return region;
}

//为获取豆瓣信息提供链接简化 promise
function create_site_url_for_douban_info(raw_info, is_douban_search_needed){
    if (imdb2db_chosen == 0) {
        var p = new Promise(function(resolve, reject){
            if (is_douban_search_needed){
                url = raw_info.url.match(/tt\d+/)[0];
                req = 'https://movie.douban.com/j/subject_suggest?q={url}'.format({ 'url': url });
                GM_xmlhttpRequest({
                    method: 'GET',
                    url: req,
                    onload: function(res) {
                        var response = JSON.parse(res.responseText);
                        if (response.length > 0) {
                            raw_info.dburl = douban_prex + response[0].id;
                            resolve(raw_info);
                        } else {
                            reject();
                        }
                    }
                });
            } else {
                 resolve(raw_info);
            }
        });
    }
    else {
        var p = new Promise(function(resolve, reject){
            if (is_douban_search_needed){
                url = raw_info.url.match(/tt\d+/)[0];
                var search_url = 'https://m.douban.com/search/?query=' + url + '&type=movie';
                getDoc(search_url, null, function(doc) {
                    if ($('ul.search_results_subjects', doc).length) {
                        var douban_url = 'https://movie.douban.com/subject/' + $('ul.search_results_subjects', doc).find('a').attr('href').match(/subject\/(\d+)/)[1];
                        if (douban_url.search('35580200') > -1) {
                            reject();
                        }
                        raw_info.dburl = douban_url;
                        resolve(raw_info);
                    } else {
                        reject();
                    }
                });
            } else {
                resolve(raw_info);
            }
        });
    }
    return p;
}

//颜色转换rgb转16进制
function rgb_2_hex(data) {
    if (data.match(/rgb\((.*)\)/)){
        data = data.match(/rgb\((.*)\)/)[1];
        data = data.split(',');
        color = '#';
        for (iii=0; iii<data.length; iii++){
            var color_tmp = parseInt(data[iii]).toString(16);
            if (color_tmp.length < 2) {
                color_tmp = '0' + color_tmp;
            }
            color += color_tmp;
        }
        return color;
    } else {
        return data;
    }
}

//判断是否是原盘
function check_descr(descr){
    flag = false;
    if (descr.match(/mpls/i)){
        flag = true;
    }
    return flag;
}

function get_full_size_picture_urls(raw_info, imgs, container, need_img_label, callback) {
    var img_urls = null;
    if (raw_info !== null) {
        img_urls = raw_info.descr.match(/(\[url=.*?\])?\[img\].*?\[\/img\](\[\/url\])?/ig);
    } else if (imgs) {
        img_urls = imgs.match(/(\[url=.*?\])?\[img\].*?\[\/img\](\[\/url\])?/ig);
    }
    var img_info = '';
    try {
        for (i=0; i<img_urls.length; i++){
            if (raw_info && raw_info.descr.indexOf(img_urls[i])<80){
            } else{
                if (raw_info) {
                    raw_info.descr = raw_info.descr.replace(img_urls[i], '');
                }
                var item = img_urls[i].match(/\[img\](.*?)\[\/img\]/)[1];
                if (item.match(/imgbox/)) {
                    item = item.replace('thumbs2', 'images2').replace('t.png', 'o.png');
                } else if (item.match(/pixhost/)) {
                    item = item.replace('//t', '//img').replace('thumbs', 'images');
                } else if (item.match(/shewang.net|pterclub.com|img4k.net|img.hdhome.org|img.hdchina.org/)) {
                    item = item.replace(/th.png/, 'png').replace(/md.png/, 'png');
                } else if (item.match(/beyondhd.co\/(images|cache)/)) {
                    item = item.replace(/th.png/, 'png').replace(/md.png/, 'png').replace('/t/', '/i/');
                } else if (item.match(/tu.totheglory.im/)) {
                    item = item.replace(/_thumb.png/, '.png');
                }
                if (need_img_label) {
                    img_info += '\n' + `[img]${item}[/img]`;
                } else {
                    img_info += '\n' + item;
                }
            }
        }
        container.val(img_info.trim());
        if (callback) {
            callback(img_info);
        }
    } catch(err) {}
}

function get_bluray_name_from_descr(descr, name) {

    var temp_title="";
    //分辨率
    if(descr.match(/(2160)(P|I)/i)) {
        temp_title = temp_title+"2160p.Blu-ray ";
    } else if(descr.match(/(1080)(P)/i)) {
        temp_title = temp_title+"1080p.Blu-ray.";
    } else if(descr.match(/(1080)(i)/i)) {
        temp_title = temp_title+"1080i.Blu-ray.";
    }

    if(descr.match(/Ultra HD|UHD/i)) {
        temp_title = "UHD ";
    }

    //视频编码
    if(descr.match(/(AVC Video)/i)) {
        temp_title = temp_title+"AVC.";
    } else if(descr.match(/(HEVC)/i)){
        temp_title = temp_title+"HEVC.";
    } else if(descr.match(/MPEG-2 Video/i)){
        temp_title = temp_title + "MPEG-2.";
    }

    //音频编码
    if(descr.match(/DTS:X[\s\S]{0,200}?7.1/i)) {
        temp_title = temp_title+"DTS-HD.MA.7.1";
    } else if(descr.match(/TrueHD[\s\S]{0,200}?(7\.1|5\.1|2\.0|1\.0)/i)){
        temp_title = temp_title+"TrueHD." + descr.match(/TrueHD[\s\S]{0,200}?(7\.1|5\.1|2\.0|1\.0)/i)[1];
    } else if(descr.match(/DTS-HD[\s\S]{0,200}?(7\.1|5\.1|2\.0|1\.0)/i)){
        temp_title = temp_title+"DTS-HD.MA." + descr.match(/DTS-HD[\s\S]{0,200}?(7\.1|5\.1|2\.0|1\.0)/i)[1];
    } else if(descr.match(/LPCM[\s\S]{0,200}?(7\.1|5\.1|2\.0|1\.0)/i)){
        temp_title = temp_title+"LPCM." + descr.match(/LPCM[\s\S]{0,200}?(7\.1|5\.1|2\.0|1\.0)/i)[1];
    } else if(descr.match(/Dolby Digital[\s\S]{0,200}?(7\.1|5\.1|2\.0|1\.0)/i)){
        temp_title = temp_title+"DD." + descr.match(/Dolby Digital[\s\S]{0,200}?(7\.1|5\.1|2\.0|1\.0)/i)[1];
    }

    if (raw_info.name.match(/Blu-ray|DTS-HD|TrueHD|LPCM|HEVC|Bluray/)){
       name = raw_info.name;
    } else if (name.match(/BLURAY|UHD.BLURAY/)){
        name = name.replace(/MULTi.|DUAL.|SWEDiSH|DOCU/i,"");
        name = name.replace(/GERMAN/i,"GER");
        name = name.replace(/REMASTERED/i,"Remastered");
        name = name.replace(/UNCUT/i,"Uncut");
        name = name.replace(/COMPLETE[\s\S]{0,20}BLURAY/,temp_title);
    }  else {
        name = name + '.' + temp_title + "-NoGroup";
    }

    return name;
}

var skip_img = [
    '[img]https://pic.imgdb.cn/item/6170004c2ab3f51d91c77825.png[/img]',
    '[img]https://pic.imgdb.cn/item/6170004c2ab3f51d91c7782a.png[/img]',
    '[img]https://images2.imgbox.com/04/6b/Ggp5ReQb_o.png[/img]',
    '[img]https://www.z4a.net/images/2019/09/13/info.png[/img]',
    '[img]https://www.z4a.net/images/2019/09/13/screens.png[/img]',
    '[img]https://i.loli.net/2019/03/28/5c9cb8f8216d7.png[/img]',
    '[img]https://hdsky.me/attachments/201410/20141003100205b81803ac0903724ad88de90649c5a36e.jpg[/img]',
    '[img]https://hdsky.me/adv/hds_logo.png[/img]',
    '[img]https://iili.io/XF9HEQ.png[/img]',
    '[img]https://img.pterclub.com/images/2022/03/24/58ef34eb1c04aa6f87442e439d103b29.png[/img]',
    '[img]https://img.pterclub.com/images/2021/07/14/78c58ee6b3e092d0c5a7fa02f3a1905e.png[/img]',
    '[img]https://pterclub.com/pic/CS.png[/img]',
    '[img]https://pterclub.com/pic/GDJT.png[/img]',
    '[img]http://img.pterclub.com/images/CS.png[/img]',
    '[img]https://img.pterclub.com/images/GDJT.png[/img]',
    '[img]https://kp.m-team.cc/logo.png[/img]',
    '[img]http://tpimg.ccache.org/images/2015/03/08/c736743e65f95c4b68a8acd3f3e2d599.png[/img]',
    '[img]https://ourbits.club/pic/Ourbits_info.png[/img]',
    '[img]https://ourbits.club/pic/Ourbits_MoreScreens.png[/img]',
    '[img]https://images2.imgbox.com/ce/e7/KCmGFMOB_o.png[/img]',
    '[img]https://img.m-team.cc/images/2016/12/05/d3be0d6f0cf8738edfa3b8074744c8e8.png[/img]',
    '[img]https://pic.imgdb.cn/item/6170004c2ab3f51d91c77825.png[/img]',
    '[img]https://pic.imgdb.cn/item/6170004c2ab3f51d91c7782a.png[/img]',
    '[img]https://img.pterclub.com/images/CS.png[/img]',
    '[img]https://img.pterclub.com/images/2022/10/19/1.gif[/img]',
    '[img]https://img93.pixhost.to/images/86/435614074_c5134549f13c2c087d67c9fa4089c49e-removebg-preview.png[/img]'
];

//从简介拆分出来mediainfo和截图
function get_mediainfo_picture_from_descr(descr){
    var info = {'mediainfo': '', 'pic_info': '', 'multi_mediainfos': ''};
    var img_info = '';
    var mediainfo = '';
    var img_urls = descr.match(/(\[url=.*?\])?\[img\].*?\[\/img\](\[\/url\])?/ig);
    var index_of_info = 0;
    if (descr.match(/◎译.{2,10}名|◎片.{2,10}名/)) {
        index_of_info = descr.match(/◎译.{2,10}名|◎片.{2,10}名/).index;
    }
    try {
        for (i=0; i<img_urls.length; i++){
            if (descr.indexOf(img_urls[i])<10 || descr.indexOf(img_urls[i]) < index_of_info){
            } else{
                descr = descr.replace(img_urls[i], '');
                img_info += img_urls[i].match(/(\[url=.*?\])?\[img\].*?\[\/img\](\[\/url\])?/)[0];
            }
        }
    } catch(err) { img_info = ''; }
    descr = descr + '\n\n' + img_info;

    try {
        //获取mediainfo,这里可以扩展匹配不同情形
        if (descr.match(/DISC INFO:|.MPLS|Video Codec|Disc Label/i) && (raw_info.medium_sel == 'UHD' || raw_info.medium_sel == 'BluRay')){
            mediainfo = descr.match(/\[quote.*?\][\s\S]*?(DISC INFO|.MPLS|Video Codec|Disc Label)[\s\S]*?\[\/quote\]/i)[0];
        } else if (descr.match(/General|RELEASE.NAME|RELEASE DATE|Unique ID|RESOLUTiON|Bitrate|帧　率|音频码率|视频码率/i)){
            mediainfo = descr.match(/\[quote.*?\][\s\S]*?(General|RELEASE.NAME|RELEASE DATE|Unique ID|RESOLUTiON|Bitrate|帧　率|音频码率|视频码率)[\s\S]*?\[\/quote\]/ig);
            mediainfo = mediainfo.join('\n\n');
            if (mediainfo.match(/\.VOB|\.IFO/i)) {
                info.multi_mediainfos = mediainfo.replace(/\[\/?quote\]/g, '');
            }
        }
    } catch (err) {
        if (descr.match(/\n.*DISC INFO:[\s\S]*kbps.*/)) {
            mediainfo = descr.match(/\n.*DISC INFO:[\s\S]*kbps.*/)[0].trim();
        }
    }

    mediainfo = mediainfo.replace(/\[quote.*?\]/ig, '[quote]');
    while (mediainfo.match(/\[quote\]/i)) {
        mediainfo = mediainfo.slice(mediainfo.search(/\[quote\]/)+7);
    }
    mediainfo = mediainfo.replace(/\[\/quote\]/i, '');
    mediainfo = mediainfo.replace(/\[\/?(font|size|quote|color).{0,80}?\]/ig, '');
    //获取图片
    var imgs = descr.split(/\[\/quote\]/).pop();
    imgs = imgs.match(/(\[url=.*?\])?\[img\].*?\[\/img\](\[\/url\])?/g);
    try {
        if (imgs){
            imgs = imgs.filter((item)=>{
                if (skip_img.indexOf(item) < 0) {
                    return item;
                }
            }).join(' ');
        } else {
            imgs = '';
        }
    } catch(err) {
        imgs = '';
    }
    info.mediainfo = mediainfo.trim();
    info.pic_info = imgs.trim();
    return info;
}
function fill_raw_info(raw_info, forward_site){

    raw_info.descr = raw_info.descr.replace(/%3A/g, ':').replace(/%2F/g, "/");
    raw_info.descr = raw_info.descr.replace('[quote][/quote]', '').replace('[b][/b]', '').replace(/\n\n+/, '\n\n');
    raw_info.descr = raw_info.descr.replace('https://pic.imgdb.cn/item/6170004c2ab3f51d91c77825.png', 'https://img93.pixhost.to/images/86/435614074_c5134549f13c2c087d67c9fa4089c49e-removebg-preview.png');
    //标题肯定都有，副标题可能没有，从简介获取
    if (raw_info.small_descr == ''){
        raw_info.small_descr = get_small_descr_from_descr(raw_info.descr, raw_info.name);
    }

    if (raw_info.type == '电影'){
        if (raw_info.descr.match(/类[\s\S]{0,5}别[\s\S]{0,30}纪录片/i)) {
            raw_info.type = '纪录';
        }
        if (raw_info.descr.match(/类[\s\S]{0,5}别[\s\S]{0,30}动画/i)) {
            raw_info.type = '动漫';
        }
    }

    //补充豆瓣和imdb链接
    if (raw_info.url == ''){
        var url = raw_info.descr.match(/http(s*):\/\/www.imdb.com\/title\/tt(\d+)/i);
        if (url){
            raw_info.url = url[0] + '/';
        }
    }
    if (raw_info.dburl == ''){
        var dburl = raw_info.descr.match(/http(s*):\/\/.*?douban.com\/subject\/(\d+)/i);
        if (dburl){
            raw_info.dburl = dburl[0] + '/';
        }
    }

    raw_info.url = raw_info.url.split('?').pop();
    //没有来源或者指向不明
    if (raw_info.source_sel == '' || raw_info.source_sel.match(/(港台|日韩)/)){
        var region = get_source_sel_from_descr(raw_info.descr);
        if (raw_info.source_sel.match(/(港台|日韩)/)) {
            if (raw_info.source_sel == '港台') {
                if (region == '台湾') {
                    raw_info.source_sel = '台湾';
                }else {
                    raw_info.source_sel = '香港';
                }
            } else if (raw_info.source_sel == '日韩') {
                if (region == '日本') {
                    raw_info.source_sel = '日本';
                }  else {
                    raw_info.source_sel = '韩国';
                }
            }
        }
        if (region != '' && raw_info.source_sel == ''){
            raw_info.source_sel = region;
        }
    }

    //如果没有媒介, 从标题获取
    if (raw_info.medium_sel == ''){
        raw_info.medium_sel = raw_info.name.medium_sel();
        if (!raw_info.medium_sel && raw_info.descr.match(/mpls/i)) {
            raw_info.medium_sel = 'Blu-ray';
        }
    }
    if (raw_info.medium_sel == 'Blu-ray' && (raw_info.name.match(/UHD|2160P/i) || raw_info.descr.match(/2160p/)) ){
        raw_info.medium_sel = 'UHD';
    }

    //如果没有编码信息
    if (raw_info.codec_sel == ''){
        raw_info.codec_sel = raw_info.name.codec_sel();
    }

    //没有音频编码, 从标题获取，最后从简介获取
    if (raw_info.audiocodec_sel == ''){
        raw_info.audiocodec_sel = raw_info.name.audiocodec_sel();
        if (raw_info.audiocodec_sel == ''){
            raw_info.audiocodec_sel = raw_info.descr.audiocodec_sel();
        }
    }

    //没有分辨率
    if (raw_info.standard_sel == ''){
        raw_info.standard_sel = raw_info.name.standard_sel();
    }

    if (raw_info.standard_sel == '') {
        try {
            var height = raw_info.descr.match(/Height.*?:(.*?)pixels/i)[1].trim();
            if (height == '480' || height == '576') {
                raw_info.standard_sel = 'SD';
            } else if (height == '720') {
                raw_info.standard_sel = '720p';
            } else if (height == '1 080') {
                raw_info.standard_sel = '1080p';
                if (raw_info.descr.match(/Scan.*?type.*?(Interleaved|Interlaced)/i)) {
                    raw_info.standard_sel = '1080i';
                }
            } else if (height == '2 160') {
                raw_info.standard_sel = '4K';
            }
        } catch(err) {
            if (raw_info.descr.match(/(1080|2160)p/)) {
                raw_info.standard_sel = raw_info.descr.match(/(1080|2160)p/)[0].replace('2160p', '4K');
            }
        }
    }

    if (raw_info.standard_sel == '1080p') {
        if (raw_info.name.standard_sel() == '1080i') {
            raw_info.standard_sel = '1080i';
        } else {
            try {
                var mi = get_mediainfo_picture_from_descr(raw_info.descr).mediainfo;
                if (mi.match(/1080i|Scan.*?type.*?(Interleaved|Interlaced)/)) {
                    raw_info.standard_sel = '1080i';
                }
            } catch (err) {}
        }
    }

    if (raw_info.name.match(/Remux/i)){
        raw_info.medium_sel = 'Remux';
    }

    if (raw_info.name.match(/webrip/i)) {
        raw_info.medium_sel = 'WEB-DL';
    }
    if (raw_info.edition_info.medium_sel()) {
        if (raw_info.edition_info.medium_sel() != 'Blu-ray' || raw_info.descr.match(/mpls/i)) {
            raw_info.medium_sel = raw_info.edition_info.medium_sel();
        } else if (raw_info.edition_info.medium_sel() == 'Blu-ray' && raw_info.edition_info.match(/mkv/i)) {
            raw_info.medium_sel = 'Encode';
        }
    }

    if (raw_info.codec_sel == 'H265' && raw_info.name.match(/x265/i)) {
        raw_info.codec_sel = 'X265';
    }

    if (raw_info.audiocodec_sel == 'TrueHD') {
        if (raw_info.descr.match(/Atmos/)) {
            raw_info.audiocodec_sel = 'Atmos';
        }
    }

    raw_info.descr = raw_info.descr.replace(/\n\n+/g, '\n\n').replace('https://dbimg.audiences.me/?', '').replace('https://imgproxy.pterclub.com/douban/?t=', '');
    raw_info.descr = raw_info.descr.replace('https://imgproxy.tju.pt/?url=', '');

    if (raw_info.edition_info.codec_sel()) {
        raw_info.codec_sel = raw_info.edition_info.codec_sel();
    }
    if (!raw_info.codec_sel || forward_site == 'PTer') {
        if (raw_info.descr.match(/Writing library.*(x264|x265)/)) {
            raw_info.codec_sel = raw_info.descr.match(/Writing library.*(x264|x265)/)[1].toUpperCase();
            if (raw_info.name.match(/H.?26[45]/)) {
                raw_info.name = raw_info.name.replace(/H.?26[45]/i, raw_info.codec_sel.toLowerCase())
            }
        } else if (raw_info.descr.match(/Video[\s\S]*?Format.*?HEVC/i)){
            raw_info.codec_sel = 'H265';
        } else if (raw_info.descr.match(/Video[\s\S]*?Format.*?AVC/i)){
            raw_info.codec_sel = 'H264';
        } else if (raw_info.descr.match(/XviD/i)){
            raw_info.codec_sel = 'XVID';
        } else if (raw_info.descr.match(/DivX/i)){
            raw_info.codec_sel = 'DIVX';
        } else if (raw_info.descr.match(/Video[\s\S]*?Format.*?MPEG Video[\s\S]{1,10}Format Version.*?Version 4/i)) {
            raw_info.codec_sel = 'MPEG-4';
        } else if (raw_info.descr.match(/Video[\s\S]*?Format.*?MPEG Video[\s\S]{1,10}Format Version.*?Version 2/i)) {
            raw_info.codec_sel = 'MPEG-2';
        }
    }

    if (raw_info.name.match(/dvdrip/i)) {
        raw_info.medium_sel = 'DVD';
    }
    if (raw_info.origin_site == 'OurBits') {
        raw_info.descr = raw_info.descr.replace(/\[quote\]\n/g, '[quote]')
    }
    try {
        if (raw_info.descr.match(/\[quote\].*?官组作品.*?\[\/quote\]/g).length >= 2) {
            raw_info.descr = raw_info.descr.split(/\[quote\].*?官组作品.*?\[\/quote\]/g).pop();
            raw_info.descr = add_thanks(raw_info.descr);
        }
    } catch(err) {}
    raw_info.descr = raw_info.descr.trim();
    return raw_info;
}

//PTHome、HDHome、杜比标签勾选
function check_label(nodes, value) {
    for (i=0; i<nodes.length; i++){
        if (nodes[i].value == value){
            nodes[i].checked = true;
            break;
        }
    }
}

function init_buttons_for_transfer(container, site, mode, raw_info) {

    //imdb框
    var input_box = document.createElement('input');
    input_box.type="text";
    input_box.className="input";
    input_box.id="input_box";
    input_box.value = raw_info.url;
    if (!raw_info.url && raw_info.dburl) {
        input_box.value = raw_info.dburl;
    }

    if (site == 'PTP') {
        input_box.style.width = '320px';
    }else if (site == 'PHD' || site == 'avz' || site == 'BHD' || site == 'CNZ') {
        input_box.style.width = '270px';
    } else {
        input_box.style.width = '280px';
    }
    if (site == 'TorrentLeech') {
        input_box.style.border = '1px solid green';
    }
    container.appendChild(input_box);

    var search_button = document.createElement("input");
    search_button.type = "button";
    search_button.style.marginLeft = '12px';
    search_button.style.marginRight = '4px';
    search_button.value = "检索名称";
    search_button.id = 'search_button';
    container.appendChild(search_button);

    var checkBox=document.createElement("input");
    checkBox.setAttribute("type","checkbox");
    checkBox.setAttribute("id",'douban_api');
    var douban_text = document.createTextNode('API');
    container.append(checkBox);
    container.append(douban_text);

    var ptgen_button = document.createElement("input");
    ptgen_button.type = "button";
    ptgen_button.style.marginLeft = '12px';
    ptgen_button.value = "ptgen跳转";
    ptgen_button.id = 'ptgen_button';
    container.appendChild(ptgen_button);

    var douban_button = document.createElement("input");
    douban_button.type = "button";
    douban_button.value = "点击获取";
    douban_button.id = 'douban_button';
    douban_button.style.marginLeft = '12px';
    container.appendChild(douban_button);

    if (site == 'ZHUQUE') {
        var brDiv = document.createElement('br');
        container.appendChild(brDiv);
    }

    if (['PHD','avz', 'CNZ', 'FileList', 'HDChina', 'TTG', 'PTP'].indexOf(site) > -1) {
        var download_button = document.createElement('input');

        var select_img=document.createElement("input");
        select_img.setAttribute("type","checkbox");
        select_img.setAttribute("id",'select_img');
        container.append(select_img);
        select_img.style.marginLeft = '8px';
        select_img.style.marginRight = '-1px';
        select_img.checked = true;

        select_img.addEventListener('click', function(e){
            if (e.target.checked) {
                location.reload();
            } else {
                $('span.imgCheckbox0').map((index, e)=>{
                    $(e).replaceWith(e.innerHTML)
                });
            }
        }, false);

        download_button.type = "button";
        download_button.id = 'download_pngs';
        download_button.value = '转存截图';
        download_button.style.marginLeft = '0px';
        download_button.style.paddingLeft = '2px';
        download_button.onclick = function() {

            if (textarea.value.match(/ilikeshots/)) {
                raw_info.images = textarea.value.match(/https?:\/\/yes\.ilikeshots\.club\/images\/.*?png/g);
            }
            if (raw_info.images.length > 0) {
                download_button.value = '处理中…';
                if (raw_info.images[0].match(/ilikeshots/) && !raw_info.images[0].match(/.png|.jpg/)) {
                    raw_info.images.map((e) => {
                        getDoc(e, null, function(doc) {
                            textarea.value += $('#image-viewer-container', doc).find('img').attr('src').replace(/\.md/, '') + '\n';
                        })
                    });
                }
                pix_send_images(raw_info.images)
                .then(function(new_urls) {
                    new_urls = new_urls.toString().split(',');
                    var urls_append = '';
                    if (new_urls.length > 1) {
                        for (var i=0; i<=new_urls.length-2; i+=2) {
                            urls_append += `${new_urls[i]} ${new_urls[i+1]}\n`
                        }
                        if (new_urls.length % 2 == 1) {
                            urls_append += new_urls[new_urls.length-1] + '\n';
                        }
                    } else {
                        urls_append = new_urls;
                    }
                    $('#textarea').val($('#textarea').val() + '\n' + urls_append);
                    if (site == 'PTP') {
                        raw_info.descr = raw_info.descr.replace(/\[img\].*?(ptpimg|pixhost).*?\[\/img\]/g, '');
                    }
                    raw_info.descr = raw_info.descr + '\n' + urls_append;
                    set_jump_href(raw_info, 1);
                    download_button.value = '处理成功';
                    download_button.disable = true;
                })
                .catch(function(message){
                    alert(message);
                    download_button.disable = true;
                    download_button.value = '转存失败';
                });
            }
        };
        container.appendChild(download_button);

        if (site != 'PTP') {
            var hdb_transfer = document.createElement('input');
            hdb_transfer.type = "button";
            hdb_transfer.id = 'transfer_hdb';
            hdb_transfer.value = '转存HDB';
            hdb_transfer.style.marginLeft = '5px';
            hdb_transfer.style.paddingLeft = '2px';
            container.appendChild(hdb_transfer);
            hdb_transfer.onclick = function() {
                if (raw_info.images.length > 0) {
                    raw_info.images.push(raw_info.name.replace(/ /g, '.'));
                    GM_setValue('HDB_images', raw_info.images.join(', '));
                    window.open('https://img.hdbits.org/', '_blank');
                } else {
                    alert('请选择要转存的图片！！！')
                }
            }
        }
    }

    if (site == 'HDB') {

        var send_pixhost = document.createElement('input');
        send_pixhost.type = "button";
        send_pixhost.id = 'send_pixhost';
        send_pixhost.value = 'PIXHOST';
        send_pixhost.style.marginLeft = '12px';
        send_pixhost.onclick = function() {
            if (raw_info.images.length > 0) {
                raw_info.images.push(raw_info.name.replace(/ /g, '.'));
                GM_setValue('HDB_images', raw_info.images.join(', '));
                window.open('https://pixhost.to/', '_blank');
            } else {
                alert('请选择要转存的图片！！！')
            }
        };
        container.appendChild(send_pixhost);

        var send_ptpimg = document.createElement('input');
        send_ptpimg.type = "button";
        send_ptpimg.id = 'send_ptpimg';
        send_ptpimg.value = 'PTPIMG';
        send_ptpimg.style.marginLeft = '12px';
        send_ptpimg.onclick = function() {
            if (raw_info.images.length > 0) {
                GM_setValue('HDB_images', raw_info.images.join(', '));
                window.open('https://ptpimg.me/', '_blank');
            } else {
                alert('请选择要转存的图片！！！')
            }
        };
        container.appendChild(send_ptpimg);

        var send_imgbox = document.createElement('input');
        send_imgbox.type = "button";
        send_imgbox.id = 'send_ptpimg';
        send_imgbox.value = 'IMGBOX';
        send_imgbox.style.marginLeft = '12px';
        send_imgbox.onclick = function() {
            if (raw_info.images.length > 0) {
                raw_info.images.push(raw_info.name.replace(/ /g, '.'));
                GM_setValue('HDB_images', raw_info.images.join(', '));
                window.open('https://imgbox.com/', '_blank');
            } else {
                alert('请选择要转存的图片！！！')
            }
        };
        container.appendChild(send_imgbox);
    }

    if (site != 'IN') {
        var textarea = document.createElement('textarea');
        textarea.style.marginTop = '12px';
        textarea.style.height = '120px';
        textarea.style.width = '580px';
        textarea.id = 'textarea';
        container.appendChild(textarea);
        textarea.style.display = 'none';
        checkBox.addEventListener('click', function(e){
            if (e.target.checked) {
                $('#textarea').slideDown();
            } else {
                $('#textarea').slideUp();
            }
        }, false);
    } else {
        checkBox.disabled = true;
    }

    // 上下结构
    if (mode == 1) {
        container.align = 'center';
         //匹配站点样式，为了美观
        if (site == 'MTV'){
             $('#douban_button,#ptgen_button,#search_button,#download_pngs').css({"backgroundColor": "#262626"});
        } else if (site != 'BTN'){
            $('#douban_button,#ptgen_button,#search_button,#download_pngs').css({"border": "1px solid #2F3546", "color": "#FFFFFF", "backgroundColor": "#2F3546"});
            if (site == 'PTP') {
                textarea.style.width = '675px';
            } else if (site == 'GPW') {
                input_box.style.width = '330px';
                textarea.style.width = '650px';
            } else if (site == 'HD-Only') {
                input_box.style.width = '260px';
                textarea.style.width = '540px';
            }
        } else if (site == 'BTN') {
            textarea.style.width = '530px';
        }
    } else {
        if (['BHD', 'BLU', 'Tik','HDPost', 'ACM', 'HDOli', 'JPTV', 'Monika', 'DTR', 'HONE', 'KIMOJI', 'Aither', 'FNP', 'OnlyEncodes'].indexOf(site) > -1){
            $('#douban_button,#ptgen_button,#search_button,#download_pngs').css({"border": "1px solid #0D8ED9", "color": "#FFFFFF", "backgroundColor": "#292929"});
            if (site == 'HONE') {
                $('#douban_button,#ptgen_button,#search_button,#download_pngs').css({"width": "80px"})
            }
        } else if (site == 'TorrentLeech') {
            $('#douban_button,#ptgen_button,#search_button,#download_pngs').css({"border": "1px solid green", "color": "#FFFFFF", "backgroundColor": "#292929"});
        }
        if (site == 'BHD') {
            textarea.style.width = '550px';
        } else if (site == 'BLU' || site == 'Tik', 'Aither') {
            textarea.style.width = '585px';
        }
    }

    if (['HDB','PHD','avz', 'CNZ', 'FileList', 'HDChina', 'TTG'].indexOf(site) > -1) {
        var width = textarea.style.width.match(/\d+/)[0];
        if (site == 'PHD' || site == 'avz' || site == 'CNZ') {
            textarea.style.width = `${parseInt(width) + 90}px`;
        } else if (site == 'FileList'){
            textarea.style.width = `${parseInt(width) + 35}px`;
        } else {
            textarea.style.width = `${parseInt(width) + 55}px`;
        }
    }

    //把白框换个颜色
    if (['PTP', 'xthor', 'HDF', 'BHD', 'BLU', 'Tik', 'Aither', 'TorrentLeech', 'HDPost', 'ACM', 'HDOli', 'JPTV', 'Monika', 'DTR', 'HONE', 'KIMOJI', 'FNP', 'OnlyEncodes'].indexOf(site) > -1) {
        textarea.style.backgroundColor = '#4d5656';
        textarea.style.color = 'white';
        input_box.style.backgroundColor = '#4d5656';
        input_box.style.color = 'white';
    }

    if (site == 'TorrentLeech' &&  $('#off').css('display') == 'none') {
        input_box.style.color = 'black';
        textarea.style.color = 'black';
        douban_button.style.color = 'black';
        ptgen_button.style.color = 'black';
        search_button.style.color = 'black';
    }
}

function get_size_from_descr(descr){
   size_ = 0;
    try{
        if (descr.match(/disc.{1,10}size.*?([\d, ]+).*?bytes/i)){
            var size = descr.match(/disc.{1,10}size.*?([\d,\. ]+).*?bytes/i)[1];
            size = size.replace(/,|\.| /g, '');
            size_ = parseInt(size)/1024/1024/1024;
        } else if (descr.match(/size[^\d]{0,20}(\d+\.\d+).+GiB/i)) {
            size_ = parseInt(descr.match(/size[^\d]{0,20}(\d+\.\d+).+GiB/i)[1]);
        }
    } catch (err) {}
    return size_;
}

function match_link(site, data) {
    var link = '';
    if (site == 'imdb' && data.match(/http(s*):\/\/.*?imdb.com\/title\/tt\d+/i)){
        link = imdb_prex + data.match(/tt\d{5,13}/i)[0] + '/';
    } else if (site == 'douban' && data.match(/http(s*):\/\/.*?douban.com\/subject\/(\d+)/i)){
        link = douban_prex + data.match(/subject\/(\d+)/i)[1] + '/';
    } else if (site == 'anidb' && data.match(/https:\/\/anidb\.net\/a\d+/i)){
        link = data.match(/https:\/\/anidb\.net\/a\d+/i)[0] + '/';
    } else if(site == 'tmdb' && data.match(/http(s*):\/\/www.themoviedb.org\//i)){
        link = data.match(/http(s*):\/\/www.themoviedb.org\/(tv|movie)\/\d+/i)[0] + '/';
    } else if(site == 'tvdb' && data.match(/http(s*):\/\/www.thetvdb.com\//i)){
        link = 'https://www.thetvdb.com/?tab=series&id=' + data.match(/https?:\/\/www.thetvdb.com\/.*?id=(\d+)/i)[1];
    } else if(site == 'bangumi' && data.match(/https:\/\/bangumi.tv\/subject/i)){
        link = 'https://bangumi.tv/subject/' + data.match(/https:\/\/bangumi.tv\/subject\/(\d+)/)[1];
    }
    return link;
}

function set_jump_href(raw_info, mode) {

    if (mode == 1) {
        for (key in used_site_info) {
            if (used_site_info[key].enable) {
                if ((key == 'ACM' || key == 'JPTV') && (raw_info.type == '剧集' || raw_info.type == '纪录' || raw_info.type == '综艺')) {
                    forward_url = used_site_info[key].url + 'upload/2';
                    if (raw_info.type == '纪录' && !raw_info.descr.match(/集.*?数/)) {
                        forward_url = used_site_info[key].url + 'upload/1';
                    }
                } else if (key == 'ACM'|| key == 'JPTV' || key == 'Monika') {
                    forward_url = used_site_info[key].url + 'upload/1';
                } else if (key == 'HDCity' || key == 'BHD' || key == 'HDB') {
                    forward_url = used_site_info[key].url + 'upload';
                } else if (key == 'BYR' && (raw_info.type == '电影')) {
                    forward_url = used_site_info[key].url + 'upload.php?type=408';
                } else if (key == 'BYR' && (raw_info.type == '剧集')) {
                    forward_url = used_site_info[key].url + 'upload.php?type=401';
                } else if (key == 'BYR' && (raw_info.type == '综艺')) {
                    forward_url = used_site_info[key].url + 'upload.php?type=405';
                } else if (key == 'BYR' && (raw_info.type == '音乐')) {
                    forward_url = used_site_info[key].url + 'upload.php?type=402';
                } else if (key == 'BYR' && (raw_info.type == '动漫')) {
                    forward_url = used_site_info[key].url + 'upload.php?type=404';
                } else if (key == 'BYR' && (raw_info.type == '纪录')) {
                    forward_url = used_site_info[key].url + 'upload.php?type=410';
                } else if (key == 'BLU' && (raw_info.type == '剧集' || raw_info.type == '纪录' || raw_info.type == '综艺')) {
                    forward_url = used_site_info[key].url + 'torrents/create?category_id=2';
                    if (raw_info.type == '纪录' && !raw_info.name.match(/[^T]S\d+|E\d+/)) {
                        forward_url = used_site_info[key].url + 'torrents/create?category_id=1';
                    }
                } else if (key == 'BLU') {
                    forward_url = used_site_info[key].url + 'torrents/create?category_id=1';
                } else if (key == 'Tik' && (raw_info.type == '剧集' || raw_info.type == '纪录' || raw_info.type == '综艺')) {
                    forward_url = used_site_info[key].url + 'torrents/create?category_id=2';
                    if (raw_info.type == '纪录' && !raw_info.name.match(/[^T]S\d+|E\d+/)) {
                        forward_url = used_site_info[key].url + 'torrents/create?category_id=1';
                    }
                } else if (key == 'Tik') {
                    forward_url = used_site_info[key].url + 'torrents/create?category_id=1';
                } else if ((key == 'avz' || key == 'CNZ' || key == 'PHD') && (raw_info.type == '电影' || raw_info.type == '纪录')) {
                    forward_url = used_site_info[key].url + 'upload/movie';
                } else if (key == 'avz' || key == 'CNZ' || key == 'PHD') {
                    forward_url = used_site_info[key].url + 'upload/tv';
                } else if (key == 'HDSpace') {
                    forward_url = used_site_info[key].url + 'index.php?page=upload';
                } else if (key == 'ZHUQUE') {
                    forward_url = used_site_info[key].url + 'torrent/upload';
                } else if (key == 'MTeam') {
                    forward_url = used_site_info[key].url + 'upload';
                } else if (key == 'KIMOJI' || key == 'HDPost' || key == 'Aither' || key == 'FNP' || key == 'OnlyEncodes') {
                    var type_dict = {'电影': 1, '剧集': 2, '动漫': 2, '综艺': 2, '纪录': 2, '音乐': 3, '体育': 2, 'MV': 3};
                    if (raw_info.type == '纪录' && !raw_info.name.match(/S\d+|E\d+/)) {
                        type_dict.纪录 = 1;
                    }
                    if (raw_info.type == '动漫' && !raw_info.name.match(/[^T]S\d+|E\d+/)) {
                        type_dict.动漫 = 1;
                    }
                    if (raw_info.type == '综艺' && !raw_info.name.match(/[^T]S\d+|E\d+/)) {
                        type_dict.综艺 = 1;
                    }
                    if (type_dict.hasOwnProperty(raw_info.type)) {
                        forward_url = used_site_info[key].url + `torrents/create?category_id=${type_dict[raw_info.type]}`;
                    } else {
                        forward_url = used_site_info[key].url + 'torrents/create?category_id=1';
                    }
                } else {
                    forward_url = used_site_info[key].url + 'upload.php';
                    if (key == 'MTV' && raw_info.url) {
                        forward_url += '?' + raw_info.url.match(/tt\d+/)[0];
                    }
                }
                jump_str = dictToString(raw_info);
                document.getElementById(key).href = forward_url + seperator + encodeURI(jump_str);
            }
        }
    } else {
        var search_name = get_search_name(raw_info.name);
        if (raw_info.url){
            var url = raw_info.url.match(/tt\d+/)[0];
            for (key in used_site_info) {
                if (used_site_info[key].enable) {
                    if (key == 'TTG') {
                        forward_url = used_site_info[key].url + 'browse.php?search_field=imdb{name}&c=M'.format({'name': raw_info.url.match(/tt(\d+)/)[1]});
                    } else if (key == 'HDRoute') {
                        forward_url = used_site_info[key].url + 'browse.php?s={name}&dp=0&add=0&action=s&or=1&imdb={url}'.format({'name': search_name, 'url': url});
                    } else if (key == 'PTP' || key == 'GPW') {
                        forward_url = used_site_info[key].url + 'torrents.php?searchstr={url}'.format({'url': url});
                    } else if (key == 'SC') {
                        forward_url = used_site_info[key].url + 'torrents.php?action=advanced&searchsubmit=1&filter_cat=1&cataloguenumber={url}'.format({'url': url});
                    } else if (key == 'HDB') {
                        forward_url = used_site_info[key].url + 'browse.php?search={url}'.format({'url': url});
                    } else if (key == 'MTV') {
                        forward_url = used_site_info[key].url + 'torrents/browse?searchtext={url}'.format({'url': search_name});
                    } else if (key == 'BHD') {
                        forward_url = used_site_info[key].url + 'torrents?imdb={url}'.format({'url': url});
                    } else if (key == 'NBL') {
                        forward_url = used_site_info[key].url + 'torrents.php?order_by=time&order_way=desc&searchtext={url}&search_type=0&taglist=&tags_type=0'.format({'url': search_name});
                    } else if (key == 'ANT') {
                        forward_url = used_site_info[key].url + 'torrents.php?order_by=time&order_way=desc&searchstr={url}&search_type=0&taglist=&tags_type=0'.format({'url': search_name});
                    } else if (key == 'UHD') {
                        forward_url = used_site_info[key].url + 'torrents.php?searchstr={url}'.format({'url': url});
                    } else if (key == 'HDSpace') {
                        forward_url = used_site_info[key].url + 'index.php?page=torrents&search={url}&active=1&options=2'.format({'url': url.substring(2)});
                    } else if ((key == 'avz' || key == 'CNZ' || key == 'PHD') && (raw_info.type == '电影' || raw_info.type == '纪录')) {
                        forward_url = used_site_info[key].url + 'movies?search=&imdb={url}&tmdb=&tvdb=&year_start=&year_end='.format({'url': url});
                    } else if (key == 'avz' || key == 'CNZ' || key == 'PHD') {
                        forward_url = used_site_info[key].url + 'tv-shows?search=&imdb={url}&tmdb=&tvdb=&year_start=&year_end='.format({'url': url});
                    } else if (key == 'iTS') {
                        forward_url = used_site_info[key].url + 'browse.php?incldead=0&search={url}'.format({'url': search_name});
                    } else if (key == 'MTeam') {
                        forward_url = used_site_info[key].url + `browse?keyword=${search_name}`;
                    } else if (key == 'TVV') {
                        forward_url = used_site_info[key].url + 'torrents.php?action=advanced&searchstr=&searchtags=&tags_type=1&groupdesc=&imdbid={url}'.format({'url': url});
                    } else if (key == 'HDPost' || key == 'ACM' || key == 'BLU' || key == 'JPTV' || key == 'Monika' || key == 'KIMOJI' || key == 'Tik' || key == 'Aither' || key == 'FNP' || key == 'OnlyEncodes') {
                        forward_url = used_site_info[key].url + 'torrents?imdbId={imdbid}#page/1'.format({'imdbid': url});
                    } else {
                        forward_url = used_site_info[key].url + 'torrents.php?incldead=0&spstate=0&inclbookmarked=0&search={url}&search_area=4&search_mode=0'.format({'url': url});
                    }
                    try { document.getElementById(key).href = forward_url; } catch(err) {}
                }
            }
        } else {
            for (key in used_site_info) {
                if (used_site_info[key].enable) {
                    if (['OpenCD', 'OPS', 'RED'].indexOf(key) >= 0 ) {
                        if (raw_info.music_name) {
                            search_name = raw_info.music_name.replace(/\(.*?\)/, '') + ' ' + raw_info.name.match(/(19|20)\d{2}/)[0];
                        } else {
                            search_name = raw_info.name.split('-')[1].replace(/\*.*?\*/g, '').trim().replace(/\d{4}$/, '') + ' ' + raw_info.name.match(/(19|20)\d{2}/)[0];
                        }
                    } else {
                        search_name = get_search_name(raw_info.name);
                    }
                    if (key == 'TTG') {
                        forward_url = used_site_info[key].url + 'browse.php?search_field={name}&c=M'.format({'name': search_name});
                    } else if (key == 'HDRoute') {
                        forward_url = used_site_info[key].url + 'browse.php?s={name}&dp=0&add=0&action=s&or=1&imdb='.format({'name': search_name});
                    } else if (key == 'PTP' || key == 'GPW' || key == 'SC') {
                        forward_url = used_site_info[key].url + 'torrents.php?searchstr={url}'.format({'url': search_name});
                    } else if (key == 'NBL') {
                        forward_url = used_site_info[key].url + 'torrents.php?order_by=time&order_way=desc&searchtext={url}&search_type=0&taglist=&tags_type=0'.format({'url': search_name});
                    } else if (key == 'ANT') {
                        forward_url = used_site_info[key].url + 'torrents.php?order_by=time&order_way=desc&searchstr={url}&search_type=0&taglist=&tags_type=0'.format({'url': search_name});
                    } else if (key == 'avz' || key == 'CNZ' || key == 'PHD') {
                        forward_url = used_site_info[key].url + 'https://avistaz.to/torrents?in=1&search={url}'.format({'url': search_name});
                    } else if (key == 'MTV') {
                        forward_url = used_site_info[key].url + 'torrents/browse?searchtext={url}'.format({'url': search_name});
                    } else if (key == 'iTS') {
                        forward_url = used_site_info[key].url + 'browse.php?incldead=0&search={url}'.format({'url': search_name});
                    } else if (key == 'TVV') {
                        forward_url = used_site_info[key].url + 'torrents.php?action=advanced&searchstr='.format({'url': search_name});
                    } else if (key == 'SC') {
                        forward_url = used_site_info[key].url + 'torrents.php?action=basic&searchsubmit=1&searchstr={url}&order_by=time&order_way=desc&tags_type=0'.format({'url': search_name});
                    } else if (key == 'HDB') {
                        forward_url = used_site_info[key].url + 'browse.php?descriptions=0&season_packs=0&from=&to=&imdbgt=0&imdblt=10&imdb=&primary_language=&country=&yeargt=&yearlt=&tagsearchtype=or&search={name}'.format({'name': search_name});
                    } else if (key == 'OpenCD') {
                        forward_url = used_site_info[key].url + 'torrents.php?incldead=0&spstate=0&inclbookmarked=0&search={name}&search_area=0&search_mode=0'.format({'name': search_name});
                    } else if (key == 'OPS') {
                        forward_url = used_site_info[key].url + 'torrents.php?searchstr={name}&tags_type=0&order=time&sort=desc&group_results=1&cleardefault=Clear+default&action=basic&searchsubmit=1'.format({'name': search_name});
                    } else if (key == 'RED') {
                        forward_url = used_site_info[key].url + 'torrents.php?searchstr={name}'.format({'name': search_name});
                    } else if (key == 'MTeam') {
                        forward_url = used_site_info[key].url + `browse?keyword=${search_name}`;
                    } else if (key == 'Tik') {
                        forward_url = used_site_info[key].url + `torrents?view=list&name=${search_name}`;
                    } else {
                        forward_url = used_site_info[key].url + 'torrents.php?incldead=0&spstate=0&inclbookmarked=0&search={name}&search_area=0&search_mode=0'.format({'name': search_name});
                    }
                    try { document.getElementById(key).href = forward_url; } catch(err) { }
                }
            }
        }
    }
}

function postData(url, meta, callback) {
    GM_xmlhttpRequest({
        'method': "POST",
        'url': url,
        'headers':{
            "Content-Type": 'application/x-www-form-urlencoded; charset=UTF-8',
            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36"
        },
        'data': meta,
        onload: function(response) {
            callback(response.responseText);
        }
    });
}

function getDoc(url, meta, callback) {
    GM_xmlhttpRequest({
        method: 'GET',
        url: url,
        onload: function (responseDetail) {
            if (responseDetail.status === 200) {
                let doc = page_parser(responseDetail.responseText);
                callback(doc, responseDetail, meta);
            } else {
                callback('error', null, null);
            }
        }
    });
}

function page_parser(responseText) {
    responseText = responseText.replace(/s+src=/ig, ' data-src=');
    responseText = responseText.replace(/<script[^>]*?>[\S\s]*?<\/script>/ig, '');
    return (new DOMParser()).parseFromString(responseText, 'text/html');
}

function get_search_name(name) {
    search_name = name;
    if (raw_info !== undefined && raw_info.type == '音乐') {
        search_name = name.split('-').pop().replace(/\d{4}.*|\*/g, '').trim();
        return search_name;
    }
    if (name.match(/S\d{1,3}/i)){
        search_name = name.split(/S\d{1,3}/i)[0];
        search_name = search_name.replace(/(19|20)\d{2}/ig, '').trim();
    } else{
        if (name.match(/(19|20)\d{2}/)){
            search_name = name.split(name.match(/(19|20)\d{2}/g).pop())[0];
        }
    }
    search_name = search_name.replace(/repack|Extended|cut/ig, '');
    search_name = search_name.split(/aka/i)[0];
    return search_name;
}

function getJson(url, meta, callback) {
    GM_xmlhttpRequest({
        method: 'GET',
        url: url,
        onload: function (responseDetail) {
            if (responseDetail.status === 200) {
                let response = JSON.parse(responseDetail.responseText);
                callback(response, responseDetail, meta);
            }
        }
    });
}

function getData(imdb_url, callback) {
    var imdb_id = imdb_url.match(/tt\d+/)[0];
    var search_url = 'https://m.douban.com/search/?query=' + imdb_id + '&type=movie';
    console.log('正在获取数据……');
    getDoc(search_url, null, function(doc) {
        if ($('ul.search_results_subjects', doc).length) {
            var douban_url = 'https://movie.douban.com/subject/' + $('ul.search_results_subjects', doc).find('a').attr('href').match(/subject\/(\d+)/)[1];
            if (douban_url.search('35580200') > -1) {
                return;
            }
            getDoc(douban_url, null, function(html) {
                var raw_data = {};
                var data = {'data': {}};
                raw_data.title = $("title", html).text().replace("(豆瓣)", "").trim();
                try {
                    raw_data.image = $('#mainpic img', html)[0].src.replace(
                        /^.+(p\d+).+$/,
                        (_, p1) => `https://img9.doubanio.com/view/photo/l_ratio_poster/public/${p1}.jpg`
                    );
                } catch(e) {raw_data.image = 'null'}

                raw_data.id = douban_url.match(/subject\/(\d+)/)[1];
                try { raw_data.year = parseInt($('#content>h1>span.year', html).text().slice(1, -1)); } catch(e) {raw_data.year = ''}
                try { raw_data.aka = $('#info span.pl:contains("又名")', html)[0].nextSibling.textContent.trim(); } catch(e) {raw_data.aka = 'null'}
                try { raw_data.average = parseFloat($('#interest_sectl', html).find('[property="v:average"]').text()); } catch(e) {raw_data.average = ''}
                try { raw_data.votes = parseInt($('#interest_sectl', html).find('[property="v:votes"]').text()); } catch(e) {raw_data.votes = ''}
                try { raw_data.genre = $('#info span[property="v:genre"]', html).toArray().map(e => e.innerText.trim()).join('/');  } catch(e) {raw_data.genre = ''}
                try { raw_data.region = $('#info span.pl:contains("制片国家/地区")', html)[0].nextSibling.textContent.trim(); } catch(e) {raw_data.region = ''}
                try { raw_data.director = $('#info span.pl:contains("导演")', html)[0].nextSibling.nextSibling.textContent.trim(); } catch(e) {raw_data.director = ''}
                try { raw_data.language = $('#info span.pl:contains("语言")', html)[0].nextSibling.textContent.trim(); } catch(e) {raw_data.language = ''}
                try { raw_data.releaseDate = $('#info span[property="v:initialReleaseDate"]', html).toArray().map(e => e.innerText.trim()).sort((a, b) => new Date(a) - new Date(b)).join('/'); } catch(e) {raw_data.releaseDate = ''}
                try { raw_data.runtime = $('span[property="v:runtime"]', html).text(); } catch(e) {raw_data.runtime = ''}
                try { raw_data.cast = $('#info span.pl:contains("主演")', html)[0].nextSibling.nextSibling.textContent.trim(); } catch(e) {raw_data.cast = ''}
                try {
                    raw_data.summary = Array.from($('#link-report-intra>[property="v:summary"],#link-report-intra>span.all.hidden', html)[0].childNodes)
                        .filter(e => e.nodeType === 3)
                        .map(e => e.textContent.trim())
                        .join('\n');
                } catch(e) {
                    raw_data.summary = '';
                }
                data.data = raw_data;
                callback(data)
            });
        }
    });
}

function getDataFromDou(douban_url, callback) {
    getDoc(douban_url, null, function(html) {
        var raw_data = {};
        var data = {'data': {}};
        raw_data.title = $("title", html).text().replace("(豆瓣)", "").trim();
        try {
            raw_data.image = $('#mainpic img', html)[0].src.replace(
                /^.+(p\d+).+$/,
                (_, p1) => `https://img9.doubanio.com/view/photo/l_ratio_poster/public/${p1}.jpg`
            );
        } catch(e) {raw_data.image = 'null'}

        raw_data.id = douban_url.match(/subject\/(\d+)/)[1];
        try { raw_data.year = parseInt($('#content>h1>span.year', html).text().slice(1, -1)); } catch(e) {raw_data.year = ''}
        try { raw_data.aka = $('#info span.pl:contains("又名")', html)[0].nextSibling.textContent.trim(); } catch(e) {raw_data.aka = 'null'}
        try { raw_data.imdb = $('#info span.pl:contains("IMDb")', html)[0].nextSibling.textContent.trim(); } catch(e) {raw_data.imdb = ''}
        try { raw_data.average = parseFloat($('#interest_sectl', html).find('[property="v:average"]').text()); } catch(e) {raw_data.average = ''}
        try { raw_data.votes = parseInt($('#interest_sectl', html).find('[property="v:votes"]').text()); } catch(e) {raw_data.votes = ''}
        try { raw_data.genre = $('#info span[property="v:genre"]', html).toArray().map(e => e.innerText.trim()).join('/');  } catch(e) {raw_data.genre = ''}
        try { raw_data.region = $('#info span.pl:contains("制片国家/地区")', html)[0].nextSibling.textContent.trim(); } catch(e) {raw_data.region = ''}
        try { raw_data.director = $('#info span.pl:contains("导演")', html)[0].nextSibling.nextSibling.textContent.trim(); } catch(e) {raw_data.director = ''}
        try { raw_data.language = $('#info span.pl:contains("语言")', html)[0].nextSibling.textContent.trim(); } catch(e) {raw_data.language = ''}
        try { raw_data.releaseDate = $('#info span[property="v:initialReleaseDate"]', html).toArray().map(e => e.innerText.trim()).sort((a, b) => new Date(a) - new Date(b)).join('/'); } catch(e) {raw_data.releaseDate = ''}
        try { raw_data.runtime = $('span[property="v:runtime"]', html).text(); } catch(e) {raw_data.runtime = ''}
        try { raw_data.cast = $('#info span.pl:contains("主演")', html)[0].nextSibling.nextSibling.textContent.trim(); } catch(e) {raw_data.cast = ''}
        try {
            raw_data.summary = Array.from($('#link-report-intra>[property="v:summary"],#link-report-intra>span.all.hidden', html)[0].childNodes)
                .filter(e => e.nodeType === 3)
                .map(e => e.textContent.trim())
                .join('\n');
        } catch(e) {
            raw_data.summary = '';
        }
        data.data = raw_data;
        callback(data)
    });
}

function rehost_single_img(site, img_url) {
    if (site == 'catbox'){
        return new Promise(function(resolve, reject) {
            GM_xmlhttpRequest({
                "method": "POST",
                "url": "https://catbox.moe/user/api.php",
                "headers": {
                    "Accept": "application/json",
                    "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
                    "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36"
                },
                "data": encodeURI(`url=${img_url}&userhash=&reqtype=urlupload`),
                "onload": function(response) {
                    if (response.status != 200) {
                        reject("Response error " + response.status);
                    } else {
                        resolve(`[img]${response.responseText}[/img]`);
                    }
                }
            });
        });
    } else {
        return new Promise(function(resolve, reject) {
            var raw_str = site == 'imgbb' ? 'image': 'source';
            var data = encodeURI(`${raw_str}=${img_url}&key=${used_rehost_img_info[site]['api-key']}`);
            const show_temple = ['展示：{url_viewer}', '原图: [img]{origin_url}[/img]', '缩略图：[img]{thumb_url}[/img]', 'bbcode中等: [url={url_viewer}][img]{medium_url}[/img][/url]', 'bbcode缩略: [url={url_viewer}][img]{thumb_url}[/img][/url]']
            GM_xmlhttpRequest({
                "method": "POST",
                "url": used_rehost_img_info[site]['api-url'],
                "responseType": "json",
                headers: {
                    "Accept": "application/json",
                    "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8",
                    "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36"
                },
                "data": data,
                "onload": function(response) {
                    console.log(response);
                    if (response.status != 200) { reject("Response error " + response.status);}
                    else {
                        if (site == 'imgbb') {
                            data = JSON.parse(response.responseText).data;
                            var bbcode_medium_url = data.url;
                        } else if (site == 'gifyu'){
                            data = JSON.parse(response.responseText).image;
                            var bbcode_medium_url = data.url;
                        } else if (site == 'freeimage') {
                            data = JSON.parse(response.responseText).image;
                            var bbcode_medium_url = data.url;
                        } else if (site == 'pstorage') {
                            data = JSON.parse(response.responseText);
                            var bbcode_medium_url = data.medium.url;
                        }
                        var show_result = show_temple.join('\n').format({'url_viewer': data.url_viewer, 'thumb_url': data.thumb.url, 'origin_url': data.url, 'medium_url': bbcode_medium_url});
                        resolve(show_result);
                    }
               }
            });
        });
    }
}

function rebuild_href(raw_info) {
    jump_str = dictToString(raw_info);
    tag_aa = forward_r.getElementsByClassName('forward_a');
    for (i = 0; i < tag_aa.length; i++) {
        if (['常用站点', 'PTgen', '简化MI', '脚本设置', '重置托管', '单图转存', '转存PTP', '提取图片'].indexOf(tag_aa[i].textContent) < 0){
            tag_aa[i].href = decodeURI(tag_aa[i]).split(seperator)[0] + seperator + encodeURI(jump_str);
        }
    }
}

function build_blob_from_torrent(r, forward_announce, forward_site, filetype, callback) {
    var name = '';
    if (forward_site !== null && forward_site != 'hdb-task') {
        if (r.match(/value="firsttime"/)) {
            alert("加载种子失败，请先在源站进行一次种子下载操作！！！");
            return;
        }
        if (r.match(/Request frequency limit/)) {
            alert("频率太快，600秒后再来！");
            return;
        }
        if (r.match(/8:announce\d+:.*(please.passthepopcorn.me|blutopia.cc|beyond-hd.me|asiancinema.me|jptv.club|hd-olimpo.club|secret-cinema.pw|monikadesign.uk)/)) {
            if (r.match(/4:name\d+:/)) {
                var length = parseInt(r.match(/4:name(\d+):/)[1]);
                var index = parseInt(r.search('4:name'));
                name = r.substring(index, index + length + 7 + length.toString().length).split(':').pop();
            }
            if ($('input[name="name"]').length && !$('input[name="name"]').val()) {
                $('input[name="name"]').val(deal_with_title(name));
            }
        }
        var new_torrent = 'd';
        var announce = 'https://hudbt.hust.edu.cn/announce.php';
        if (forward_announce !== null) {
            announce = forward_announce;
        }
        if (r.match(/8:announce\d+:/)) {
            var new_announce = `8:announce${announce.length}:${announce}`;
            new_torrent += new_announce;
        } else {
            alert('种子文件加载失败！！！');
            return;
        }
        if (r.match(/13:creation date/)) {
            try {
                var date_str = r.match(/13:creation datei(\d+)e/)[0];
                var date = r.match(/13:creation datei(\d+)e/)[1];
                var new_date = parseInt(date) + 600 + parseInt(Math.random()*(600),10);
                var new_date_str = `13:creation datei${new_date.toString()}e`
                new_torrent += new_date_str;
            } catch (err) {}
        }
        new_torrent += '8:encoding5:UTF-8';
        var info = r.match(/4:info[\s\S]*?privatei\de/)[0].replace('privatei0e', 'privatei1e');
        new_torrent += info;
        var new_source = `6:source${forward_site.length}:${forward_site.toUpperCase()}`;
        new_torrent += new_source;
        new_torrent += 'ee';
        r = new_torrent;
    }
    var data = new Uint8Array(r.length)
    var i = 0;
    while (i < r.length) {
        data[i] = r.charCodeAt(i);
        i++
    }
    var blob = new Blob([data], {type: filetype});
    var data = {
        'data': blob,
        'name': name
    }
    callback(data);
}

function getBlob(url, forward_announce, forward_site, filetype, callback) {
    GM_xmlhttpRequest({
        method: "GET",
        url: url,
        overrideMimeType: "text/plain; charset=x-user-defined",
        onload: (xhr) => {
            var r = xhr.responseText;
            build_blob_from_torrent(r, forward_announce, forward_site, filetype, callback);
        }
    });
}

function fill_torrent(forward_site, container, name) {
    if (['HDPost', 'BHD', 'BLU', 'Tik', 'ACM', 'HDSpace', 'xthor', 'JPTV', 'Monika', 'KIMOJI', 'Aither', 'FNP', 'OnlyEncodes'].indexOf(forward_site) > -1) {
        $('#torrent')[0].files = container.files;
    } else if (['GPW', 'UHD', 'PTP', 'SC', 'MTV', 'NBL', 'ANT', 'TVV', 'HDF', 'BTN', 'OPS', 'RED', 'SugoiMusic'].indexOf(forward_site) > -1) {
        $('input[name=file_input]')[0].files = container.files;
        setTimeout(function(){$('#file')[0].dispatchEvent(evt);}, 1000);
    } else if (forward_site == 'CHDBits') {
        $('input[name=torrentfile]')[0].files = container.files;
    } else if (forward_site == 'avz' || forward_site == 'PHD' || forward_site == 'CNZ') {
        $('input[name=torrent_file]')[0].files = container.files;
    } else if (forward_site == 'HDT') {
        $('input[name=torrent]')[0].files = container.files;
    } else if (forward_site == 'MTeam') {
        var i_evt = new Event("change", { bubbles: true, cancelable: false });
        i_evt.simulated = true;
        function setValue(input, value) {
            let lastValue = input.value;
            input.files = container.files;
            let tracker = input._valueTracker;
            if (tracker) {
                tracker.setValue(lastValue);
            }
            input.dispatchEvent(i_evt);
        }
        $('#torrent-input').wait(function(){
            document.getElementById('torrent-input').files = container.files;
            setValue(document.getElementById('torrent-input'), "torrent")
            $('button:contains("選擇種子")').next().next().text(name);
        }, 30000, 20);
    } else if (forward_site == 'ZHUQUE') {
        $('#form_item_torrent').wait(function(){
            $('input[id=form_item_torrent]')[0].files = container.files;
            $('#form_item_torrent')[0].dispatchEvent(evt);
            $('#form_item_title').val(raw_info.name);
            $('#form_item_title')[0].dispatchEvent(evt);
        });
    } else {
        $('input[name=file]')[0].files = container.files;
        if (forward_site == 'HHClub') {
            $('#torrentName').text(name);
        }
    }
}

function addTorrent(url, name, forward_site, forward_announce) {
    if (forward_site == 'OpenCD') {
        name = name.replace(/\*/g, '');
    }
    name = name.replace(/^\[.*?\](\.| )?/, '').replace(/ /g, '.').replace(/\.-\./, '-').trim();
    if (url.match(/d8:announce/)) {
        build_blob_from_torrent(url, forward_announce, forward_site, "application/x-bittorrent", function(data){
            const blob = data.data;
            if (data.name) {
                name = data.name + '.torrent';
            }
            const files = new window.File([blob], name, { type: blob.type });
            let container = new DataTransfer();
            container.items.add(files);
            fill_torrent(forward_site, container, name);
        });
    } else if (url.match(/https:\/\/kp.m-team.cc\/detail\/\d+/)) {
        var torrent_id = url.match(/detail\/(\d+)/)[1];
        postData('https://kp.m-team.cc/api/torrent/genDlToken', encodeURI(`id=${torrent_id}`), function(data) {
            data = JSON.parse(data);
            url = data.data;
            getBlob(url, forward_announce, forward_site, "application/x-bittorrent", function(data){
                const blob = data.data;
                if (data.name) {
                    name = data.name + '.torrent';
                }
                const files = new window.File([blob], name, { type: blob.type });
                let container = new DataTransfer();
                container.items.add(files);
                fill_torrent(forward_site, container, name);
            });
        });
    } else {
        getBlob(url, forward_announce, forward_site, "application/x-bittorrent", function(data){
            const blob = data.data;
            if (data.name) {
                name = data.name + '.torrent';
            }
            const files = new window.File([blob], name, { type: blob.type });
            let container = new DataTransfer();
            container.items.add(files);
            fill_torrent(forward_site, container, name);
        });
    }
}

function addPoster(url, forward_site) {
    try{
        var extension = url.match(/\.(jpg|jpeg|webp|png)$/)[1];
        if (extension == 'jpg') {
            extension = 'jpeg';
        }
        getBlob(url, null, null, extension, function(data){
            const blob = data.data;
            const files = new window.File([blob], `cover.${url.match(/\.(jpg|jpeg|webp|png)$/)[1]}`, { type: blob.type });
            let container = new DataTransfer();
            container.items.add(files);
            if (forward_site == 'OpenCD') {
                $('iframe[src*="target=cover"]').contents().find('#file')[0].files = container.files;
            }
        });
    } catch (err) {alert('封面图加载错误，很有可能是后缀不对')}
};

function reBuildHref(raw_info, forward_r) {
    $('#input_box').val(raw_info.url);
    try{
        var imdbid = raw_info.url.match(/tt\d+/i)[0];
        var imdbno = imdbid.substring(2);
    } catch(err) {
        imdbid = '';
        imdbno = '';
    }
    var container = $('#forward_r');
    if ($('.search_urls').length) {
        $('.search_urls').hide();
    }
    add_search_urls(container, imdbid, imdbno, search_name, 0);
    rebuild_href(raw_info);
}

function check_team(raw_info, s_name, forward_site) {
    if (raw_info.name.match(/MTeam/) && forward_site == 'HDHome') {
        $(`select[name="team_sel"]>option:eq(11)`).attr('selected', true);
        return;
    }
    $(`select[name="${s_name}"]>option`).map(function(index,e){
        var name = raw_info.name.split(/(19}20)\d{2}/).pop();
        if (name.match(e.innerText)) {
            if ((name.match(/LCHD/) && e.innerText == 'CHD') || (name.match(/PandaMoon/) && e.innerText == 'Panda') || e.innerText == 'DIY' || e.innerText == 'REMUX') {
                console.log('小组名貌似会产生误判');
                return;
            } else if (name.match(/HDSpace/i) && e.innerText.match(/HDS/i)) {
                return;
            } else if (name.match(/HDClub/i) && e.innerText.match(/HDC/i)) {
                return;
            } else {
                $(`select[name="${s_name}"]>option:eq(${index})`).attr('selected', true);
            }
        }
    });
}

if (site_url.match(/(broadcasthe.net|backup.landof.tv)\/.*.php.*/)) {
    $('#searchbars').find('li').each(function(){
        $(this).find('form').find('input').prop('size', 16);
    });
    $('table.torrent_table').find('tr.torrent').each(function(){
        var index = $(this).index();
        var $td = $(this).find('td:eq(2)');
        var title = $td.find('div.nobr:contains("Release Name")').find('span').prop('title');
        var group = title.match(/.*-(.*)/);
        var font = document.createElement('font');
        var season_info = $td.find('a:eq(3)').text();
        if (!season_info.match('Season')) {
            font.style.color = '#1e90ff';
        } else {
            font.style.color = '#db7093';
        }
        var unknown_group = false;
        if (group && group.length) {
            if (!group[1].match(/\[.*\]/)) {
                if ($td[0].childNodes[10].textContent.match(/\]/)) {
                    $td[0].childNodes[9].textContent += ' / ' + group[1];
                    if (extra_settings.btn_dark_color.enable) {
                        font.innerHTML = ($td[0].childNodes[8].textContent + $td[0].childNodes[9].textContent + $td[0].childNodes[10].textContent).replace(group[1], `<b><font color="#20B2AA">${group[1]}</font></b>`);
                        $td[0].childNodes[10].parentNode.removeChild($td[0].childNodes[10]);
                        $td[0].childNodes[9].parentNode.removeChild($td[0].childNodes[9]);
                        $td[0].childNodes[8].parentNode.replaceChild(font, $td[0].childNodes[8]);
                    }
                } else {
                    var ori_text = $td[0].childNodes[8].textContent;
                    $td[0].childNodes[8].textContent = ori_text.replace(/\[(.*?)\]/, `$1 / ${group[1]}`);
                    if (extra_settings.btn_dark_color.enable) {
                        font.innerHTML = $td[0].childNodes[8].textContent.replace(group[1], `<b><font color="#20B2AA">${group[1]}</font></b>`);
                        $td[0].childNodes[8].parentNode.replaceChild(font, $td[0].childNodes[8]);
                    }
                }
            } else {
                unknown_group = true;
            }
        } else {
            unknown_group = true;
        }
        if (unknown_group) {
            font.style.color = '#1e90ff';
            var ori_text = $td[0].childNodes[8].textContent;
            $td[0].childNodes[8].textContent = ori_text.replace(/\[(.*?)\]/, `$1 / Unknown`);
            if (extra_settings.btn_dark_color.enable) {
                font.innerHTML = $td[0].childNodes[8].textContent.replace('Unknown', `<b><font color="#20B2AA">Unknown</font></b>`);
                $td[0].childNodes[8].parentNode.replaceChild(font, $td[0].childNodes[8]);
            }
        }
        if (extra_settings.btn_dark_color.enable) {
            $(this).find('td:gt(2)').css({'color': 'grey'});
            $td.find('a:lt(4)').css({'font-size': 'small', 'font-weight': 'bold'});
            $td.find('div.nobr:contains("Release Name")').css({'color': 'grey'});
            $td.find('div.nobr:contains("Up:")').css({'color': 'grey'});
        }

        var name = $td.find('a:eq(2)').text();
        $td.find('br').replaceWith($(`<div><a name="douban_${index}" href=https://search.douban.com/movie/subject_search?search_text=${name.replace(/ /g, '%20')}&cat=1002 target="_blank">[Douban]</a>
            <a name="imdb_${index}" href=https://www.imdb.com/find?q=${name.replace(/ /g, '%20')}&ref_=nv_sr_sm target="_blank">[IMDB]</a>
            <a href=https://www.themoviedb.org/search?language=zh-CN&query=${name.replace(/ /g, '%20')} target="_blank">[TMDB]</a>
            <a name="show_${index}" style="display: none"></a>
            </div><span name="imdb_${index}" style="display: none"><a name="get_${index}">GET</a></span>`
        ));
    });
}

if (site_url.match(/^https?:\/\/(broadcasthe.net|backup.landof.tv)\/series.php\?id=\d+/)) {
    var name = $('title').text().split(':')[0].trim();
    var imdb_url = $('img[src*="tvicon/imdb.png"]:eq(0)').parent().attr('href');
    if (imdb_url == '') {
        imdb_url = `https://www.imdb.com/find?q=${name.replace(/ /g, '%20')}&ref_=nv_sr_sm`;
    }
    $('#content').find('div.linkbox:eq(0)').prepend(`<font size="5px" color="red">${name}</font><br>
        <div><a href=https://search.douban.com/movie/subject_search?search_text=${name.replace(/ /g, '%20')}&cat=1002 target="_blank">[Douban]</a>
        <a href=${imdb_url} target="_blank">[IMDB]</a>
        <a href=https://www.themoviedb.org/search?language=zh-CN&query=${name.replace(/ /g, '%20')} target="_blank">[TMDB]</a>
        </div>
    `);
}

if (site_url.match(/^https:\/\/hd-only.org\//)) {

    $('#userinfo_major').append(`
        <li id="classes" class="brackets">
            <a href="wiki.php?action=article&id=6">Classes</a>
        </li>
    `);

    var info_dict = {
        'requests': 'Requests',
        'forums': 'Forums',
        'rules': 'Rules',
        'irc': 'IRC',
        'wiki': 'Wiki',
        'inbox': 'Inbox',
        'uploaded': 'Uploaded',
        'bookmarks': 'Bookmarks',
        'subscriptions': 'Subscriptions',
        'comments': 'Comments',
        'friends': 'Friends',
        'invite': 'Upload',
        'useredit': 'Profile',
        'logout': 'Log Out'
    }
    for (var key in info_dict) {
        $(`#nav_${key}>a`).text(info_dict[key]);
    }
    $('a[href*="action=invite"]').text('Invite');
    $('#stats_seeding>a').text('Uploaded');
    $('#stats_leeching>a').text('Downloaded');
    $('a[href*="p=seedtime"]').text('Seedtime');

    $('#requestssearch').val('Requests').attr('onfocus', "if (this.value == 'Requests') { this.value = ''; }").attr('onblur', "if (this.value == '') { this.value = 'Requests'; }").attr('placeholder', "Requests");
    $('#userssearch').val('Users').attr('onfocus', "if (this.value == 'Users') { this.value = ''; }").attr('onblur', "if (this.value == '') { this.value = 'Users'; }").attr('placeholder', "Users");

    $('#userinfo_minor').prepend(`<li id="nav_free">
        <a href="https://hd-only.org/torrents.php?freetorrent=1&order_by=time&order_way=desc&group_results=1&action=advanced&searchsubmit=1">FreeLeech</a>
        </li>
    `);

    // 种子列表
    if (site_url.match(/torrents.php/) && !site_url.match(/torrentid/)) {
        // 标记正在做种的种子
        var hdo_torrents = GM_getValue('hdo_torrents') === undefined ? []: GM_getValue('hdo_torrents').split(',');
        if (!site_url.match(/id=\d/)) {
            hdo_torrents.map(e=>{
                if ($(`a[href*="torrentid=${e}"]`).length) {
                    $(`a[href*="torrentid=${e}"]`).css('color', 'yellow');
                }
            });
        } else {
            hdo_torrents.map(e=>{
                if ($(`a[onclick*="torrent_${e}"]`).length) {
                    $(`a[onclick*="torrent_${e}"]`).css('color', 'yellow');
                }
            });
        }

        var replace_info = {
            "Date d'ajout": 'Time',
            "Année": "Year",
            "Taille": "Size",
            "Complétés": "Snatched",
            "Aléatoire": "Random",
            "Décroissant": "Desc",
            "Ascendant": "Asc",
            "Dessin animé": "Cartoon",
            "Série": "Series",
            "Série Animée": "Animated Series",
            "Film d'animation": "Animation Film",
            "Documentaire": "Documentary",
            "Court-métrage": "Short film",
            "Autre": "Other",
            "Démonstration": "Demonstration",
            "Scène ?": "Scene",
            "Oui": "Yes",
            "Non": "No",
            "Neutre": "Neutral",
            "Les deux": "Double Upload",
            "Fichiers": "Files",
            "Depuis": "Time",
            "mois": "month",
            "1 an": "1 year",
            "ans": "years",
            "heure": "hour",
            "jour": "day",
            "semaine": "week",
        }

        var filter_box = $('div.filter_torrents');
        filter_box.find('div.head>strong')[0].childNodes[0].textContent = 'Search ';
        $('#ft_toggle').click();
        $('a[onclick*="advanced"]').text('Advanced');
        $('#ft_advanced_text').text('Advanced');

        $('select[id="bitrate"]').find('option:eq(0)').text('Resolution');
        $('#search_terms').find('td:eq(0)').text('Key Word :');
        $('#order').find('td:eq(0)').text('Order By :');
        $('#search_group_results').find('label:eq(0)').text('Group Results :');
        $('#rip_specifics').find('td:eq(0)').text('Filters :');

        $('select[name="order_by"]').find('option').map((index, e)=>{
            var category = $(e).text();
            for (key in replace_info) {
                category = category.replace(key, replace_info[key]);
            }
            $(e).text(category);
        });
        $('select[name="order_way"]').find('option').map((index, e)=>{
            var category = $(e).text();
            for (key in replace_info) {
                category = category.replace(key, replace_info[key]);
            }
            $(e).text(category);
        });
        $('select[name="releasetype"]').find('option').map((index, e)=>{
            var category = $(e).text();
            for (key in replace_info) {
                category = category.replace(key, replace_info[key]);
            }
            $(e).text(category);
        });
        $('select[name="scene"]').find('option').map((index, e)=>{
            var category = $(e).text();
            for (key in replace_info) {
                category = category.replace(key, replace_info[key]);
            }
            $(e).text(category);
        });
        $('select[name="freetorrent"]').find('option').map((index, e)=>{
            var category = $(e).text();
            for (key in replace_info) {
                category = category.replace(key, replace_info[key]);
            }
            $(e).text(category);
        });

        $('#torrent_table').find('span').map((index,e)=>{
            if ($(e).has('a').length) {
                return;
            }
            var infomation = $(e).text();
            for (key in replace_info) {
                infomation = infomation.replace(key, replace_info[key]);
            }
            $(e).text(infomation);
        });

        $('input[value="Rechercher"]').val("Search");
        $('input[value="Annuler"]').val("Quit");
        $('input[name="setdefault"]').val("Set Default");

        var timer;

        function show_data(e) {
            var attr_flg = $(e).parent().parent().find('div.group_image>img').attr('aria-describedby');
            if (attr_flg !== undefined) {
                return;
            }
            var torrent_id = $(e).parent().parent().find('div.group_info>a').attr('href').match(/id=(\d+)/)[1];
            var torrent_url = 'https://hd-only.org/torrents.php?id=' + torrent_id;
            getDoc(torrent_url, null, function(data) {
                if ($('a.tmdb',data).length) {
                    var tmdb_url = $('div.torrent_description', data).find('a[href*="themovieDB"]').attr('href').replace(/\n/, '');
                    var label = {
                        'tv': {
                            'name': 'name',
                            'runtime': 'episode_run_time',
                            'country': 'origin_country'
                        },
                        'movie': {
                            'name': 'title',
                            'runtime': 'runtime',
                            'country': 'production_countries'
                        }
                    }
                    var tmdb_id = tmdb_url.match(/\d{1,12}/)[0];
                    if (tmdb_url.match(/\/movie\//)) {
                        var en_url = 'http://api.tmdb.org/3/movie/{tmdb_id}?api_key={key}&language=en-US';
                        var zh_url = 'http://api.tmdb.org/3/movie/{tmdb_id}?api_key={key}&language=zh-CN';
                        label = label.movie;
                    } else if (tmdb_url.match(/\/tv\//)) {
                        var en_url = 'http://api.tmdb.org/3/tv/{tmdb_id}?api_key={key}&language=en-US';
                        var zh_url = 'http://api.tmdb.org/3/tv/{tmdb_id}?api_key={key}&language=zh-CN';
                        label = label.tv;
                    }
                    en_url = en_url.format({'key': used_tmdb_key, 'tmdb_id': tmdb_id});
                    zh_url = zh_url.format({'key': used_tmdb_key, 'tmdb_id': tmdb_id});

                    getJson(en_url, null, function(data){
                        var en_name = data[label.name];
                        getJson(zh_url, null, function(data_1){
                            console.log(data_1)
                            var zh_name = data_1[label.name];
                            var imdb_link = '';
                            if (data_1.imdb_id) {
                                var imdb_url = 'https://www.imdb.com/title/' + data_1.imdb_id;
                                imdb_link = ` | <a href=${imdb_url} target="_blank">IMDB</a>`;
                            }
                            tippy(e, {
                                content: `<div class="box">
                                    <div class="head">
                                        <strong>影视介绍</strong>
                                    </div>
                                    <div id="infomation" class="pad">
                                        <div><strong>英名:</strong> ${data[label.name]}</div>
                                        <div><strong>中名:</strong> ${data_1[label.name]}</div>
                                        <div><strong>类型:</strong> ${data_1.genres.map((e)=> {return e.name}).join('/')}</div>
                                        <div><strong>制片国家/地区:</strong> ${data_1[label.country].map((e)=> {return e.name}).join('/')}</div>
                                        <div><strong>语言:</strong> ${data_1.original_language}</div>
                                        <div><strong>时长:</strong> ${label.runtime == "episode_run_time" ? data_1[label.runtime][0]: data_1[label.runtime]}</div>
                                        <div><strong>评分:</strong> ${data_1.vote_average} / 10 From ${data_1.vote_count} Users</div>
                                        <div><strong>链接:</strong> <a href=${tmdb_url.replace('language=fr', 'language=en')} target="_blank">TMDB-en</a> | <a href=${tmdb_url.replace('language=fr', 'language=zh')} target="_blank">TMDB-zh</a>${imdb_link}</div>
                                        <div><strong>简介:</strong> <span>${data_1.overview ? data_1.overview.trim(): data.overview.trim()}</span></div>
                                    </div>
                                </div>`,
                                allowHTML: true,
                                arrow: true,
                                placement: 'right',
                                showOnCreate: true,
                                interactive: true,
                                delay: 500,
                            });
                        });
                    });
                }
            });
        }

        $('div.group_image').mouseover((e)=>{
            timer = setTimeout(show_data, 2500, e.target);
        });
        $('div.group_image').mouseout((e)=>{
            clearTimeout(timer);
        });

        return;
    }

    var change_dict = {
        'Statistiques': 'Statistics',
        'Communauté': 'Community',
        'Inscrit depuis': 'Registered since',
        'Dernière visite': 'Last seen',
        'Envoyé': 'Uploaded',
        'Téléchargé': 'Downloaded',
        'Ratio requis': 'Required ratio',
        'Requêtes comblées': 'Completed requests',
        'Récompense donnée': 'Award given',
        'Niveau de paranoïa': 'Paranoia level',
        'Sujets des forums': 'Forum topics',
        'Commentaires sur torrents': 'Comments on torrents',
        'Commentaires sur collections': 'Comments on collections',
        'Commentaires sur requêtes': 'Comments on requests',
        'Collections créées': 'Collections created',
        'Requêtes complétées': 'Completed requests',
        'Requêtes créées': 'Requests created',
        'Requêtes votées': 'Requests voted',
        'Uploadés': 'Uploaded',
        'Rang': 'Class',
        'pour': 'for',
        'En seed': 'Seeding',
        'En leech': 'Leeching',
        'Complétés': 'Snatched',
        'Invités': 'Invited',
        'mois': 'month',
        '1 an': '1 year',
        'ans': 'years',
        'heure': 'hour',
        'jour': 'day',
        'semaine': 'week',
        'Personnels': 'Personal',
        'Paranoïa': 'Paranoia',
        'Accès': 'Access',
        'Toutes': 'Total',
        'Recherche': 'Search',
        'Avancée': 'Advanced',
        'Grouper les torrents': 'Group torrents',
        'Déroulés': 'Unfolding',
        'Réduits': 'Folding',
        'Montrer les torrents complétés': 'Show completed torrents',
        'Affiches des torrents': 'Torrent posters',
        "Voir l'affiche": 'Show the poster',
        'Voir les affiches annexes': 'Show the accompanying posters',
        'Affiches des collections': 'Collection posters',
        'Nombre par pages': 'Number per pages',
        'Recommandations': 'Recomendations',
        'Ne pas voir les recommandations': 'Do not show recommendations',
        'Télécharger les .torrent en fichiers .txt': 'Download .torrent files as .txt files',
        'Messages par page': 'Messages per page',
        'Messages privés': 'Private messages',
        'Désactiver': 'Deactivate',
        'Lister en premier les messages non lus': 'List unread messages first',
        'URL de votre avatar': 'URL of your avatar',
        'Titre 1': 'Title',
        'Informations 1': 'Information',
        'Sélectionnez ce que vous souhaitez dévoiler aux autres membres.': 'Select what you want to reveal to other members.',
        'Activité récente': 'Recent activity',
        'Autoriser à connaître la date de mon dernier passage': 'Allow to know the date of my last visit',
        'Icône': 'Icon',
        'Règles': 'Rules',
        'Suivi automatique': 'Automatic tracking',
        'Activer': 'Activate',
        'Torrent non seedé': 'Torrent not seeded',
        'Partagé': 'Uploaded',
        'Voir le nombre': 'Show number',
        'Voir la liste': 'Show the list',
        'Nombre': 'Number',
        'Liste': 'List',
        'Suivre vos partages': 'Track your uploads',
        'Recréer': 'Recreate',
        'Clé IRC': 'IRC Key',
        'Changement de mot de passe': 'Password change',
        'Actuel': 'Current',
        'Nouveau': 'New',
        "À l'instant": 'Just now'
    }

    // 个人页面
    if (site_url.match(/user.php\?id=\d+/)) {
        $('#recent_snatches').find('td:eq(0)').text('Recent Snatched');
        $('div.colhead_dark').map((index,d)=>{
            var text = $(d).text();
            for (key in change_dict) {
                text = text.replace(key, change_dict[key]);
            }
            $(d).text(text);
        });

        $('div.box_info').find('a.brackets').text('View');

        $('div.box_info').find('li').map((index,e)=>{
            var text = $(e)[0].childNodes[0].textContent;
            for (key in change_dict) {
                text = text.replace(key, change_dict[key]);
            }
            $(e)[0].childNodes[0].textContent = text;
        });

        $('div.box_info').find('li').find('span').map((index,e)=>{
            var text = $(e).text();
            for (key in change_dict) {
                text = text.replace(key, change_dict[key]);
            }
            $(e).text(text);
        });

        if ($('a[href*="action=edit"]').length>1) {
            $('a[href*="action=edit"]').last()[0].childNodes[0].textContent = 'Settings';
            $('#content .linkbox').append(`<a href="#" id="refresh_torrents" class="brackets">Refresh Torrents</a>`);
            $('#refresh_torrents').click((e)=>{
                var seeding_url = 'https://hd-only.org/' + $("#comm_seeding").find('a').last().attr('href');
                getDoc(seeding_url,null,function(data){
                    var hdo_torrents = Array.from($('table.torrent_table', data).find('tr:gt(0)')).map((e)=>{
                        return $(e).find('.big_info').find('a.tooltip').attr('href').match(/id=(\d+)/)[1];
                    });
                    GM_setValue('hdo_torrents', hdo_torrents.join(','));
                    alert('数据刷新成功！！！');
                });
            });
        }
    }

    if (site_url.match(/user.php\?action=edit&userid=\d+/)) {
        $('#site_style_tr').find('td:eq(0)').text('Theme');
        $('#site_extstyle_tr').find('td:eq(0)').find('strong').text('External CSS (in test)');
        $('div.header>h2')[0].childNodes[3].textContent = ' > Settings';
        $('table.user_options').find('strong').map((index,d)=>{
            var text = $(d).text();
            for (key in change_dict) {
                text = text.replace(key, change_dict[key]);
            }
            $(d).text(text);
        });
        $('#settings_search').attr('placeholder', 'Search');
        $('input#submit').val('Save');
        $('table.user_options').find('label').map((index,d)=>{
            if ($(d).has('input').length == 0) {
                var text = $(d).text();
                for (key in change_dict) {
                    text = text.replace(key, change_dict[key]);
                }
                $(d).text(text);
            } else {
                var text = $(d)[0].childNodes[1].textContent;
                for (key in change_dict) {
                    text = text.replace(key, change_dict[key]);
                }
                $(d)[0].childNodes[1].textContent = text;
            }
        });
        $('input.button_preview_0').val('Preview');
        $('.min_padding:eq(0)').text('Any active torrent will then need to be downloaded and reloaded in your BitTorrent client.');
        $('.min_padding:eq(2)').text('If you wish to change your email you will then have to validate the action by entering your password in the "Current" field below.');
        $('.setting_description').html(`
            <div class="setting_description">
                        Conditions for creating a password :
                        <ul>
                            <li>at least 8 characters,</li>
                            <li>at least 1 lowercase and 1 uppercase,</li>
                            <li>at least one number or symbol.</li>
                        </ul>
                    </div>
        `);
        $('#acc_password_tr').find('label').map((index,e)=>{
            var text = $(e)[0].childNodes[0].textContent;
            for (key in change_dict) {
                text = text.replace(key, change_dict[key]);
            }
            $(e)[0].childNodes[0].textContent = text;
        });
        $('#settings_sections>div').find('strong').text('Categories');
        $('#settings_sections').find('a').map((index,e)=>{
            var text = $(e).text();
            for (key in change_dict) {
                text = text.replace(key, change_dict[key]);
            }
            $(e).text(text);
        });
    }
}

if (site_url.match(/^https:\/\/hdbits\.org\/browse.*/) && show_search_urls['HDB']) {
    setTimeout(function(){
        $('#torrent-list').find('tr').each(function(){
            try{
                var imdbid = $(this).html().match(/https:\/\/www\.imdb\.com\/title\/(tt\d+)/i)[1];
                var imdbno = imdbid.substring(2);
                var name = $(this).find('td:eq(2)').find('a').first().text();

                var search_name = get_search_name(name)
                if (name.match(/S\d+/i)){
                    var number = parseInt(name.match(/S(\d+)/i)[1]);
                    search_name = search_name + ' Season ' + number;
                }
                var $container = $(this).find('td:eq(2)');
                add_search_urls($container, imdbid, imdbno, search_name, 1);
            } catch(err){}
        });
    }, 500);
}

if (site_url.match(/^https:\/\/nzbs.in\/movies/)) {
    setTimeout(function(){
        $('#coverstable').find('tr:gt(0)').each(function(){
            try{
                var imdbid = $(this).html().match(/www\.imdb\.com\/title\/(tt\d+)/i)[1];
                var imdbno = imdbid.substring(2);
                var name = $(this).find('td:eq(1)').find('a').first().text();

                var search_name = get_search_name(name)
                if (name.match(/S\d+/i)){
                    var number = parseInt(name.match(/S(\d+)/i)[1]);
                    search_name = search_name + ' Season ' + number;
                }
                var $container = $(this).find('td:eq(1)');
                add_search_urls($container, imdbid, imdbno, search_name, 3);
            } catch(err){}
        });
    }, 500);
}

if (site_url.match(/^https?:\/\/hdbits.org\/browse.php*/)) {
    var css = [
        ".tablesorter-default .header,",
        ".tablesorter-default .tablesorter-header {",
        "    padding: 4px 20px 4px 4px;",
        "    cursor: pointer;",
        "    background-image: url(data:image/gif;base64,R0lGODlhFQAJAIAAAP///////yH5BAEAAAEALAAAAAAVAAkAAAIXjI+AywnaYnhUMoqt3gZXPmVg94yJVQAAOw==);",
        "    background-position: center right;",
        "    background-repeat: no-repeat;",
        "}",
        ".tablesorter-default thead .headerSortUp,",
        ".tablesorter-default thead .tablesorter-headerSortUp,",
        ".tablesorter-default thead .tablesorter-headerAsc {",
        "    background-image: url(data:image/gif;base64,R0lGODlhFQAEAIAAAP///////yH5BAEAAAEALAAAAAAVAAQAAAINjI8Bya2wnINUMopZAQA7);",
        "    border-bottom: #888 1px solid;",
        "}",
        ".tablesorter-default thead .headerSortDown,",
        ".tablesorter-default thead .tablesorter-headerSortDown,",
        ".tablesorter-default thead .tablesorter-headerDesc {",
        "    background-image: url(data:image/gif;base64,R0lGODlhFQAEAIAAAP///////yH5BAEAAAEALAAAAAAVAAQAAAINjB+gC+jP2ptn0WskLQA7);",
        "    border-bottom: #888 1px solid;",
        "}",
        ".tablesorter-default thead .sorter-false {",
        "    background-image: none;",
        "    cursor: default;",
        "    padding: 4px;",
        "}",
        ".disc-100, .disc-50, .disc-25, .disc-neu {",
        "    font-weight: bold;",
        "}",
        ".disc-100 {",
        "    color: #009;",
        "}",
        ".disc-50 {",
        "    color: darkgreen;",
        "}",
        ".disc-25 {",
        "    color: darkred;    ",
        "}",
        ".disc-neu {",
        "    color: #666;       ",
        "}"
    ].join("\n");


    if (typeof GM_addStyle != 'undefined') {
        GM_addStyle(css);
    } else if (typeof PRO_addStyle != 'undefined') {
        PRO_addStyle(css);
    } else if (typeof addStyle != 'undefined') {
        addStyle(css);
    } else {
        var node = document.createElement('style');
        node.type = 'text/css';
        node.appendChild(document.createTextNode(css));
        var heads = document.getElementsByTagName('head');
        if (heads.length > 0) {
            heads[0].appendChild(node);
        } else {
            document.documentElement.appendChild(node);
        }
    }


    this.$ = this.jQuery = jQuery.noConflict(true);

    $('#torrent-list > thead > tr > th:eq(1)').after('<th class="center">FL</th>');

    $('#torrent-list > tbody > tr > td:nth-child(3)').each(function(){
        var discount = $(this).find('a').attr('title').split(' ')[0];
        switch(discount) {
            case '100%':
                $(this).after('<td class="disc-100 center">100%</td>');
                if (extra_settings.hdb_show_discount_color.enable) {
                    $(this).parent().css('background','linear-gradient(rgba(0,0,153,0.2), rgba(188,202,214,0.5), rgba(0,0,153,0.2))');
                }
                break;
            case '50%':
                $(this).after('<td class="disc-50 center">50%</td>');
                if (extra_settings.hdb_show_discount_color.enable) {
                    $(this).parent().css('background','linear-gradient(rgba(0,153,0,0.2), rgba(188,202,214,0.5), rgba(0,153,0,0.2))');
                }
                break;
            case '25%':
                $(this).after('<td class="disc-25 center">25%</td>');
                if (extra_settings.hdb_show_discount_color.enable) {
                    $(this).parent().css('background','linear-gradient(rgba(153,0,0,0.2), rgba(188,202,214,0.5), rgba(153,0,0,0.2))');
                }
                break;
            case 'Neutral':
                $(this).after('<td class="disc-neu center">NEU</td>');
                if (extra_settings.hdb_show_discount_color.enable) {
                    $(this).parent().css('background','linear-gradient(rgba(102,102,102,0.4), rgba(188,202,214,0.5), rgba(102,102,102,0.4))');
                }
                break;
            case 'All':
                $(this).after('<td class="center">—</td>');
                break;
        }
    });
}

if (site_url.match(/^https:\/\/passthepopcorn\.me\/torrents\.php.*/i) && show_search_urls['PTP']) {
    $(`tbody tr.basic-movie-list__details-row`).each(function(){
        try{
            var $container = $(this).find('td:eq(1)');
            var search_name = $container.find('span.basic-movie-list__movie__title-row:eq(0)').find('a').first().text();
            var imdbid = $(this).html().match(/https?:\/\/www\.imdb\.com\/title\/(tt\d+)/i)[1];
            var imdbno = imdbid.substring(2);
            add_search_urls($container, imdbid, imdbno, search_name, 3);
        } catch(Err) {console.log(Err)}
    });
}

if (site_url.match(/^https?:\/\/passthepopcorn.me\/torrents.php.*/) && extra_settings.ptp_show_group_name.enable) {
    const boldfont = true;
    const coloredfont = true;
    const groupnamecolor = '#20B2AA';

    const showblankgroups = true;
    const placeholder = 'Null';

    const delimiter = ' / ';
    const blockedgroup = 'TBB';
    const moviesearchtitle = 'Browse Torrents ::';
    const douban_prex = host_link + '#ptgen?tt';

    function formatText(str, color){
        var style = [];
        if(boldfont) style.push('font-weight:bold');
        if(coloredfont && color) style.push(`color:${groupnamecolor}`);
        return `<span style="${style.join(';')}">${str}</span>`;
    }

    function setGroupName(groupname, target){
        var color = true;
        if ($(target).parent().find('.golden-popcorn-character').length) {
            color = false;
        }
        if ($(target).parent().find('.torrent-info__download-modifier--free').length) {
            color = false;
        }
        if ($(target).parent().find('.torrent-info-link--user-leeching').length) {
            color = false;
        }
        if ($(target).parent().find('.torrent-info-link--user-seeding').length) {
            color = false;
        }
        if ($(target).parent().find('.torrent-info-link--user-downloaded').length) {
            color = false;
        }

        if(isEmptyOrBlockedGroup(groupname)){
            if($(target).text().split(delimiter).includes(blockedgroup)){
                $(target).html(function(i, htmlsource){
                    return htmlsource.replace(delimiter + blockedgroup, '');
                });
                groupname = blockedgroup;
            }
            else if(showblankgroups){
                groupname = placeholder;
            }
        }
        if(!isEmpty(groupname)){
            var location = 1;
            try{ location = ptp_name_location; } catch(err) {console.log(err)}
            if (location == 1) {
                return $(target).append(delimiter).append(formatText(groupname, color));
            } else {
                return $(target).prepend(delimiter).prepend(formatText(groupname, color));
            }
        }
    }

    function setDoubanLink(imdb_id, target){
        if(!isEmpty(imdb_id)){
            try{
                var td = target.parentNode.parentNode.getElementsByTagName('td')[1];
                var div = td.getElementsByClassName('basic-movie-list__movie__ratings-and-tags')[0];
                var new_div = document.createElement('div');
                new_div.setAttribute('class', 'basic-movie-list__movie__rating-container');
                new_div.style.fontweight = 'bold';
                var span = document.createElement('span');
                span.setAttribute('class', 'basic-movie-list__movie__rating__title');
                var a = document.createElement('a');
                a.href = douban_prex + imdb_id;
                a.text = 'PtGen';
                a.target = "_blank";
                span.appendChild(a);
                new_div.appendChild(span);
                div.insertBefore(new_div, div.firstElementChild);
                a.onclick = function(e){
                    e.preventDefault();
                    var url = 'tt' + imdb_id;
                    var req = 'https://movie.douban.com/j/subject_suggest?q={url}'.format({ 'url': url });
                    GM_xmlhttpRequest({
                        method: 'GET',
                        url: req,
                        onload: function(res) {
                            var response = JSON.parse(res.responseText);
                            console.log(response)
                            if (response.length > 0) {
                                a.href = host_link + '#ptgen?' + response[0].id;
                            } else {
                                a.href = douban_prex + imdb_id;
                            }
                            window.open(a.href, target="_blank")
                        }
                    });
                }
            } catch(err){}
        }
    }

    function isEmpty(str){
        return (!str || String(str).trim().length === 0);
    }
    function isEmptyOrBlockedGroup(str){
        return (isEmpty(str) || str === blockedgroup);
    }

    if (document.title.indexOf(moviesearchtitle) !== -1){
        var movies = PageData.Movies;
        var releases = [];
        var imdb_urls = [];
        movies.forEach(function(movie){
            imdb_urls[movie.GroupId] = movie.ImdbId;
            movie.GroupingQualities.forEach(function(torrentgroup){
                torrentgroup.Torrents.forEach(function(torrent){
                    if (torrent.ReleaseGroup) {
                        releases[torrent.TorrentId] = torrent.ReleaseGroup;
                    } else {
                        var groupname = get_group_name(torrent.ReleaseName, '');
                        releases[torrent.TorrentId] = groupname;
                    }
                });
            });
        });
        if(PageData.ClosedGroups != 1){
            releases.forEach(function(groupname, index){
                $(`tbody a.torrent-info-link[href$="torrentid=${index}"]`).each(function(){
                    setGroupName(groupname, this);
                });
            });
            imdb_urls.forEach(function(imdbid, groupid){
                $(`tbody a.basic-movie-list__movie__cover-link[href$="id=${groupid}"]`).each(function(){
                    setDoubanLink(imdbid, this);
                });
            })
        }
        else{
            var targetNodes = $('tbody');
            var MutationObserver = window.MutationObserver || window.WebKitMutationObserver;
            var myObserver = new MutationObserver(mutationHandler);
            var obsConfig = {childList: true, characterData: false, attributes: false, subtree: false};

            targetNodes.each(function (){
                myObserver.observe(this, obsConfig);
            });

            function mutationHandler (mutationRecords) {
                mutationRecords.forEach ( function (mutation) {
                    if (mutation.addedNodes.length > 0) {
                        $(mutation.addedNodes).find('a.torrent-info-link').each(function(){
                            var mutatedtorrentid = this.href.match(/\btorrentid=(\d+)\b/)[1];
                            var groupname = releases[mutatedtorrentid];
                            setGroupName(groupname, this);
                        });
                    }
                });
            }

        }
    } else if (document.title.indexOf('upload') !== -1) {
        try {
            $('.torrent-info-link').map((index,e)=>{
                var groupname = $(e).attr('title');
                groupname = get_group_name(groupname, '');
                setGroupName(groupname, e);
            })
        } catch (err) {}
    } else{
        $('table#torrent-table a.torrent-info-link').each(function(){
            var groupname = $(this).parent().parent().data('releasegroup');
            if (groupname) {
                setGroupName(groupname, this);
            } else {
                var release_name = $(this).parent().parent().data('releasename');
                if (release_name !== undefined) {
                    groupname = get_group_name(release_name, '');
                } else {
                    groupname = 'Null';
                }
                setGroupName(groupname, this);
            }
        });
    }

    $('.torrent-info__reported').each(function(){
        $(this).css('color', '#FFAD86');
    });

    $('.torrent-info__download-modifier--free').each(function(){
        $(this).parent().css('color', '#4DFFFF');
    });

    $('.golden-popcorn-character').each(function(){
        var val=$(this).next().attr("class");
        if (val && !val.match(/torrent-info-link--user-leeching|torrent-info-link--user-seeding|torrent-info-link--user-downloaded/i)){
            $(this).parent().css('color', '#FFD700');
            $(this).next().css('color', '#FFD700');
        }else {
             $(this).attr('class', val)
        }
    });

    $('.torrent-info__trumpable').each(function(){
        $(this).css('color', '#E8FFC4');
    });

    $('.torrent-info-link--user-seeding').each(function(){
        $(this).css('color', 'red');
    });

    $('.torrent-info-link--user-downloaded').each(function(){
        $(this).css('color', 'green');
    });

    $('.torrent-info-link--user-leeching').each(function(){
        $(this).css('color', 'MediumSpringGreen');
    });

    if (location.href.match(/id=\d+/)){
        $('.group_torrent_header').each(function(){
            var $img = $(this).find('a').eq(3).find('img');
            var $old_url = $img.prop('src');
            $img.prop('src', $old_url)
        })
    }
}

if (site_url.match(/^https?:\/\/passthepopcorn.me\/torrents.php\?id.*/) && extra_settings.ptp_show_douban.enable){
    const addInfoToPage = (data) => {
        if (isChinese(data.title)) {
            $('.page__title').prepend(`<a  target='_blank' href="https://movie.douban.com/subject/${data.id}">[${data.title.split(' ')[0]}] </a>`);
        }
        if (data.summary) {
            var tmp = data.summary.split('   ');
            data.summary = '';
            for (var i=0; i<tmp.length; i++){
                var tmp_str = tmp[i].trim();
                if (tmp_str){
                    data.summary += '\t' + tmp_str + '\n';
                }
            }
            $('#movieinfo').before(`<div class="panel">
            <div class="panel__heading"><span class="panel__heading__title">简介</span></div>
            <div class="panel__body"  id="intro">&nbsp&nbsp&nbsp&nbsp${data.summary.trim()}</div></div>`);
        }
        $('#torrent-table').parent().prepend($('#movie-ratings-table').parent())
        try{
            $('#movieinfo').before(`
                <div class="panel">
                <div class="panel__heading"><span class="panel__heading__title">电影信息</span></div>
                <div class="panel__body">
                <div><strong>导演:</strong> ${data.director}</div>
                <div><strong>演员:</strong> ${data.cast}</div>
                <div><strong>类型:</strong> ${data.genre}</div>
                <div><strong>制片国家/地区:</strong> ${data.region}</div>
                <div><strong>语言:</strong> ${data.language}</div>
                <div><strong>时长:</strong> ${data.runtime}</div>
                <div><strong>又名:</strong>  ${data.aka}</div>
                </div>
            `)
        } catch(err){}

        var total = 10;
        var split = '/';
        if (!data.average) {
            data.average = '暂无评分';
            total = '';
            data.votes = 0;
            split = '';
        }

        $('#movie-ratings-table tr').prepend(
            `<td colspan="1" style="width: 152px;">
            <center>
            <a target="_blank" class="rating" href="https://movie.douban.com/subject/${data.id}" rel="noreferrer">
            <div style="font-size: 0;min-width: 105px;">
                <span class="icon-pt1" style="font-size: 14px;
                display: inline-block;
                text-align: center;
                border: 1px solid #41be57;
                background-color: #41be57;
                color: white;
                border-top-left-radius: 4px;
                border-bottom-left-radius: 4px;
                width: 24px;
                height: 24px;
                line-height: 24px;">豆</span>
                <span class="icon-pt2" style="font-size: 14px;
                display: inline-block;
                text-align: center;
                border: 1px solid #41be57;
                color: #3ba94d;
                background: #ffffff;
                border-top-right-radius: 4px;
                border-bottom-right-radius: 4px;
                width: 69px;
                height: 24px;
                line-height: 24px;">豆瓣评分</span>
            </div>
            </a>
            </center>
            </td>
            <td style="width: 153px;">
            <span class="rating">${data.average}</span>
            <span class="mid">${split}</span>
            <span class="outof"> ${total} </span>
            <br>(${data.votes} votes)</td>`
        )
    }
    const isChinese = (title) => {
        return /[\u4e00-\u9fa5]+/.test(title)
    }
    const imdbLink = $('#imdb-title-link').attr('href');
    if (!imdbLink) {
        return;
    }
    getData(imdbLink, function(data){
        console.log(data);
        if (data.data) {
            addInfoToPage(data['data']);
        } else {
            return;
        }
    });
}

if (site_url.match(/^https?:\/\/secret-cinema.pw\/torrents.php\?id.*/) && all_sites_show_douban){
    $(function () {
        const imdbLink = $('a:contains("IMDB")').attr('href');
        if (!imdbLink) {
            return;
        }
        getData(imdbLink, function(data){
            console.log(data);
            if (data.data) {
                addInfoToPage(data['data']);
            } else {
                return;
            }
        });
    })

    const addInfoToPage = (data) => {
        var total = 10;
        var split = '/';
        if (!data.average) {
            data.average = '暂无评分';
            total = '';
            data.votes = 0;
            split = '';
        }
        if (isChinese(data.title)) {
            $('h2').first().prepend(`<a  target='_blank' href="https://movie.douban.com/subject/${data.id}">[${data.title.split(' ')[0]}] </a>`);
        }
        if (data.summary) {
            var tmp = data.summary.split('   ');
            data.summary = '';
            for (var i=0; i<tmp.length; i++){
                var tmp_str = tmp[i].trim();
                if (tmp_str){
                    data.summary += '\t' + tmp_str + '\n';
                }
            }
            $('div.box_artists').before(`<div>
            <div class="head"><span><strong>简介</strong></span></div>
            <div>&nbsp&nbsp&nbsp&nbsp${data.summary}</div></div><br>`);
        }
        try{
            $('div.box_artists').before(`
                <div>
                <div class="head"><span><strong>电影信息</strong></span></div>
                <div>
                <div><strong>&nbsp&nbsp&nbsp&nbsp导演:</strong> ${data.director}</div>
                <div><strong>&nbsp&nbsp&nbsp&nbsp演员:</strong> ${data.cast}</div>
                <div><strong>&nbsp&nbsp&nbsp&nbsp类型:</strong> ${data.genre}</div>
                <div><strong>&nbsp&nbsp&nbsp&nbsp制片国家/地区:</strong> ${data.region}</div>
                <div><strong>&nbsp&nbsp&nbsp&nbsp语言:</strong> ${data.language}</div>
                <div><strong>&nbsp&nbsp&nbsp&nbsp时长:</strong> ${data.runtime}</div>
                <div><strong>&nbsp&nbsp&nbsp&nbsp又名:</strong> ${data.aka}</div>
                <div><span><strong>&nbsp&nbsp&nbsp&nbsp评分:</strong> ${data.average}</span>
                <span class="mid">${split}</span>
                <span class="outof"> ${total} </span> from ${data.votes} votes</div>
                </div>
                <br>
            `)
        } catch(err){}
    }
    const isChinese = (title) => {
        return /[\u4e00-\u9fa5]+/.test(title)
    }
}

if (site_url.match(/^https?:\/\/www.morethantv.me\/torrents.php\?id.*/)) {
    $(function () {
        const imdbLink = match_link('imdb', $('div.main_column').html());
        if (!imdbLink) {
            return;
        }
        getData(imdbLink, function(data){
            console.log(data);
            if (data.data) {
                addInfoToPage(data['data']);
            } else {
                return;
            }
        });
    })

    const addInfoToPage = (data) => {
        var total = 10;
        var split = '/';
        if (!data.average) {
            data.average = '暂无评分';
            total = '';
            data.votes = 0;
            split = '';
        }
        if (isChinese(data.title)) {
            $('h2').first().find('a:eq(1)').prepend(`<a  target='_blank' href="https://movie.douban.com/subject/${data.id}">[${data.title.split(' ')[0]}] </a>`);
        }
        if (data.summary) {
            var tmp = data.summary.split('   ');
            data.summary = '';
            for (var i=0; i<tmp.length; i++){
                var tmp_str = tmp[i].trim();
                if (tmp_str){
                    data.summary += '\t' + tmp_str + '\n';
                }
            }
            $('div.sidebar').prepend(`<div id="introduction">
            <div class="head"><span><strong>简介</strong></span></div>
            <div>&nbsp&nbsp&nbsp&nbsp${data.summary}</div></div><br>`);
        }
        try{
            $('#introduction').after(`
                <div>
                <div class="head"><span><strong>电影信息</strong></span></div>
                <div>
                <div><strong>&nbsp&nbsp&nbsp&nbsp导演:</strong> ${data.director}</div>
                <div><strong>&nbsp&nbsp&nbsp&nbsp演员:</strong> ${data.cast}</div>
                <div><strong>&nbsp&nbsp&nbsp&nbsp类型:</strong> ${data.genre}</div>
                <div><strong>&nbsp&nbsp&nbsp&nbsp制片国家/地区:</strong> ${data.region}</div>
                <div><strong>&nbsp&nbsp&nbsp&nbsp语言:</strong> ${data.language}</div>
                <div><strong>&nbsp&nbsp&nbsp&nbsp时长:</strong> ${data.runtime}</div>
                <div><strong>&nbsp&nbsp&nbsp&nbsp又名:</strong> ${data.aka}</div>
                <div><span><strong>&nbsp&nbsp&nbsp&nbsp评分:</strong> ${data.average}</span>
                <span class="mid">${split}</span>
                <span class="outof"> ${total} </span> from ${data.votes} votes</div>
                </div>
            `)
        } catch(err){}
    }
    const isChinese = (title) => {
        return /[\u4e00-\u9fa5]+/.test(title)
    }
}

if (site_url.match(/^https?:\/\/hdbits.org\/details.php\?id=.*/) && extra_settings.hdb_show_douban.enable){
    try{
        var links = $('table.contentlayout').find('a[href^="https://www.imdb.com/title/"]');
        if (links.length == 0) {
            links = $('.showlinks').find('a[href^="https://www.imdb.com/title/"]');
            if (links.length == 0) {
                return;
            }
        }
        getData(links[0].href, function(data){
            console.log(data['data'])
            addInfoToPage(data['data']);
        });
        const addInfoToPage = (data) => {
            if (data.cast.split('/').length > 8) {
                data.cast = data.cast.split('/').slice(0,8).join('/');
            }
            if (data.director.split('/').length > 8) {
                data.director = data.director.split('/').slice(0,8).join('/');
            }

            var label = '- ';
            var status = 'block';
            if (hdb_hide_douban) {
                label = '+ ';
                status = 'none';
            }

            $('#details > tbody > tr').eq(1).after(`
                <tr><td>
                <div id="l20201117" class="label collapsable" onclick="showHideEl(20201117)"><span class="plusminus">${label}</span>关于本片 (豆瓣信息)</div>
                <div id="c20201117" class="hideablecontent" style="display: ${status};">
                    <table class="contentlayout" cellspacing="0"><tbody>
                        <tr>
                            <td rowspan="3" width="2"><img src="${data.image}" style="max-width:250px;border:0px;" alt></td>
                            <td colspan="2"><h1><a href="https://movie.douban.com/subject/${data.id}" target="_blank">${data.title}</a> (${data.year})</h1><h3>${data.aka}</h3></td>
                        </tr>
                        <tr>
                            <td><table class="content" cellspacing="0" id="imdbinfo" style="white-space: nowrap;"><tbody>
                                <tr><th>评分</th><td>${data.average} (${data.votes}人评价)</td></tr>
                                <tr><th>类型</th><td>${data.genre}</td></tr>
                                <tr><th>国家/地区</th><td>${data.region}</td></tr>
                                <tr><th>导演</th><td>${data.director.replace(/\//g, '<br>    ')}</td></tr>
                                <tr><th>语言</th><td>${data.language}</td></tr>
                                <tr><th>上映日期</th><td>${data.releaseDate.replace(/\//g, '<br>    ')}</td></tr>
                                <tr><th>片长</th><td>${data.runtime}</td></tr>
                                <tr><th>演员</th><td>${data.cast.replace(/\//g, '<br>    ')}</td></tr>
                            </tbody></table></td>
                            <td id="plotcell"><table class="content" cellspacing="0"><tbody>
                                <tr><th>简介</th></tr><tr><td>${data.summary == "" ? '本片暂无简介' : '　　' + data.summary.replace(/ 　　/g, '<br>　　')}</td></tr>
                            </tbody></table></td>
                        </tr>
                        <tr>
                            <td colspan="2" id="actors"></td>
                        </tr>
                    </tbody></table>
                </div>
                </td></tr>
            `);
            $('div.collapsable:contains("About this film (from IMDB)")').parent().find('img').first().css({"width": "250px", "max-height": "660px"});
            if (!hdb_hide_douban) {
                $('div.collapsable:contains("About this film (from IMDB)")').click();
            }
        }
    } catch(err){ alert(err) }
}

if (site_url.match(/^https:\/\/uhdbits\.org\/torrents\.php.*/i) && show_search_urls['UHD']) {
    $('#torrent_table td.big_info').each(function(){
        try {
            var $container = $(this).find('div:eq(0)');
            var search_name = $container.find('a').first().text();
            var imdbid = $(this).html().match(/http:\/\/www\.imdb\.com\/title\/(tt\d+)/i)[1];
            var imdbno = imdbid.substring(2);
            add_search_urls($container, imdbid, imdbno, search_name, 1);
        } catch(Err) {console.log(Err)}
    });
}

if (site_url.match(/^https:\/\/hd-torrents\.org\/torrents.*/) && show_search_urls['HDT']) {
    $('.mainblockcontenttt tr').each(function(){
        var $td = $(this).find('td:eq(2)');
        var name = $td.find('a').first().text();
        if (name) {
            try{
                var imdbid = $td.html().match(/imdb\.com\/title\/(tt\d+)/i)[1];
                var imdbno = imdbid.substring(2);

                var search_name = get_search_name(name);
                if (name.match(/S\d+/i)){
                    var number = parseInt(name.match(/S(\d+)/i)[1]);
                    search_name = search_name + ' Season ' + number;
                }
                var $container = $td;
                add_search_urls($container, imdbid, imdbno, search_name, 1);
            } catch(err){}
        }

    });

    $('.hdblock:eq(1) tr').each(function(){
        var $td = $(this).find('td:eq(1)');
        var name = $td.find('a').first().text();
        if (name) {
            try{
                var imdbid = $td.html().match(/imdb\.com\/title\/(tt\d+)/i)[1];
                var imdbno = imdbid.substring(2);

                var search_name = get_search_name(name);
                if (name.match(/S\d+/i)){
                    var number = parseInt(name.match(/S(\d+)/i)[1]);
                    search_name = search_name + ' Season ' + number;
                }
                var $container = $td;
                add_search_urls($container, imdbid, imdbno, search_name, 1);
            } catch(err){}
        }

    });
}

if (site_url.match(/^https:\/\/xthor.tk\/.*/)) {

    try{
        var navbar_html = $('#navbar').html();
        navbar_html = navbar_html.replace(/Recherche/g, 'Research');
        navbar_html = navbar_html.replace('Parcourir', 'Browse');
        navbar_html = navbar_html.replace('Nouveautés/Catégorie', 'New Arrivals/Category');
        navbar_html = navbar_html.replace('Nouveautés', 'News');
        navbar_html = navbar_html.replace('Requêtes', 'Requests');
        navbar_html = navbar_html.replace('Besoin de Seed', 'Need Seed');
        navbar_html = navbar_html.replace('Communauté', 'Community');

        navbar_html = navbar_html.replace('Médiathèque', 'Media Library');
        navbar_html = navbar_html.replace(/Séries/g, 'Series');
        navbar_html = navbar_html.replace(/Auteurs/g, 'Authors');
        navbar_html = navbar_html.replace(/Livres/g, 'Books');
        navbar_html = navbar_html.replace(/Jeux Vidéo/g, 'Video games');
        navbar_html = navbar_html.replace(/Acteurs/g, 'Actors');
        navbar_html = navbar_html.replace(/Porno/g, 'Porn');
        navbar_html = navbar_html.replace(/Séries/g, 'Series');
        navbar_html = navbar_html.replace(`Ce que j'aime`, 'What I like');
        navbar_html = navbar_html.replace(/Mes séries/g, 'My series');
        navbar_html = navbar_html.replace(/Ce que j'aime/g, 'What I like');
        navbar_html = navbar_html.replace('Sagas', 'My series');

        navbar_html = navbar_html.replace(/Mon Profil/g, 'My profile');
        navbar_html = navbar_html.replace(/Activité/g, 'Activity');
        navbar_html = navbar_html.replace(/Réglages/g, 'Settings');
        navbar_html = navbar_html.replace(/Amis/g, 'Friends');
        navbar_html = navbar_html.replace(/Favoris/g, 'Favorites');
        navbar_html = navbar_html.replace(/Mes Flux RSS/g, 'My RSS Feeds');
        navbar_html = navbar_html.replace('Mes messages Privés', 'My private messages');

        navbar_html = navbar_html.replace(/Outils/g, 'Tools');
        navbar_html = navbar_html.replace(/Hebergeur d'images/g, 'Image Host');
        navbar_html = navbar_html.replace(/Teams Bannies/g, 'Banned Teams');
        navbar_html = navbar_html.replace(/Règles/g, 'Rules');
        navbar_html = navbar_html.replace(/Aide/g, 'Aid');
        navbar_html = navbar_html.replace('Contacter le staff', 'Contact staff');
        navbar_html = navbar_html.replace('Signaler un bug', 'Report a bug');
        $('#navbar').html(navbar_html);
    } catch (err) {}

    if (site_url.match(/upload.php/)) {
        $(`p:contains(Votre URL d'annonce )`).html(`Your announce URL <b><input type="text" size="80" readonly="readonly" value="http://xbt.xthor.tk/0000fa1adfad1abd4fabe5c3617cbd9f/announce" onclick="select()"></b>`);
        var origin_html = $('td:contains(Fichier Torrent)').parent().parent().html();
        origin_html = origin_html.replace('Fichier Torrent', 'Torrent File');
        origin_html = origin_html.replace('Nom du Torrent', 'Torrent Name');
        origin_html = origin_html.replace('Fichier NFO', 'NFO File');
        origin_html = origin_html.replace('Pris du nom du fichier torrent si non spécifié.', '如果未指定，则取种子文件的名称。');
        origin_html = origin_html.replace(`Affiche`, '海报');
        origin_html = origin_html.replace(`Doit être hebergée sur`, '必须托管在');
        origin_html = origin_html.replace(`ou sur Xthor`, '或者xthor上');
        origin_html = origin_html.replace(` l'extension doit être jpg, png ou gif`, '扩展必须是JPG，PNG或GIF)');
        origin_html = origin_html.replace('La largeur du poster doit être de 500 Px maximum', '宽度最大限制为为500px');
        origin_html = origin_html.replace('ou', 'or');
        origin_html = origin_html.replace('pour les livres', 'for books');
        origin_html = origin_html.replace('pour les films, séries et anime', 'for movies, series and anime');
        origin_html = origin_html.replace('pour la musique', 'for music');
        origin_html = origin_html.replace('pour les jeux', 'for games');
        origin_html = origin_html.replace(`Le fait de mettre un lien vers une API permet de lier le torrent à la médiàthèque et de générer une prez si vous la laissez vide pour les torrents films, séries et jeux`,
            '对于电影、影视和动画，填写对应IMDB或TMDB的链接使您可以将种子绑定到对应库，并生成描述文本');
        origin_html = origin_html.replace(`Pour la musique et les livres la médiathèque récupère l'image que vous uploadez avec le torrent, veuillez choisir une image convenable`,
            '对于书籍和音乐，请上传合适的图片，我们将使用您上传的图片作为海报');
        origin_html = origin_html.replace(`inutile d'ajouter le lien imdb si il est déjà présent dans le nfo`, '如果NFO中已经存在，则无需添加IMDB链接');
        origin_html = origin_html.replace(`Ajouter l'url`, '添加');
        origin_html = origin_html.replace(`pour afficher le lien vers la vidéo dans les détails du Torrent`, '链接将在种子详细信息中心显示指向视频的链接');
        origin_html = origin_html.replace(`URL Affiche (facultatif)`, '海报链接(可选)');
        origin_html = origin_html.replace(`Catégorie`, 'Category');
        origin_html = origin_html.replace(`Si vous remplissez une requête, sélectionner la ici.`, '如果填充请求，请选择此处。');
        origin_html = origin_html.replace(`Autres`, 'Other');
        origin_html = origin_html.replace(`Type de Release`, 'Release Type');
        origin_html = origin_html.replace(`Inserez le lien d'une fiche Allociné afin de pouvoir générer une prez`, '不是很必须的链接，可以不填');
        origin_html = origin_html.replace(`Voix`, 'Voice(应该是音频，猜吧就~)');
        origin_html = origin_html.replace(`Voix`, 'Voice');
        $('td:contains(Fichier Torrent)').parent().parent().html(origin_html);
        $('.btn[value*="Générer une prez Allociné"]').val("生成描述文本");

        $('input[name=nfo]').parent().append(`<br><textarea id="pasteNfo" rows="15" style="width:600px"></textarea><br><input type="button" id="genNfo" value="生成nfo并上传">`);
        $('#genNfo').click((e)=>{
            e.preventDefault();
            var r = $('#pasteNfo').val();
            if (!r) {
                return;
            }
            var data = new Uint8Array(r.length)
            var i = 0
            while (i < r.length) {
                data[i] = r.charCodeAt(i);
                i++
            }
            var blob = new Blob([data], {type: "text/x-nfo"});
            const files = new window.File([blob], 'movie.nfo', { type: blob.type });
            let container = new DataTransfer();
            container.items.add(files);
            $('input[name=nfo]')[0].files = container.files;
        })
    } else if (site_url.match(/rules.php/)) {
        getDoc('https://raw.githubusercontent.com/tomorrow505/auto_feed_js/master/xthor_rules.html', null, function(doc){
            $('table.main').html($('table', doc).html());
            $("#firstpanel p.menu_head").click(function()
            {
                $(this).css({backgroundImage:"url(pic/down2.png)"}).next("div.menu_body").slideToggle(300).siblings("div.menu_body").slideUp("slow");
            });
        });
        return;
    } else if (site_url.match(/faq.php/)) {
        getDoc('https://raw.githubusercontent.com/tomorrow505/auto_feed_js/master/xthor_faq.html', null, function(doc){
            $('div.container:eq(1)').html($('div.container:eq(0)', doc).html());
        });
    }
}

if (site_url.match(/^https:\/\/hdf.world\/.*/)) {
    if (site_url.match(/upload.php/)) {
        var origin_html = $('p:contains(Votre annonce URL)').html();
        origin_html = origin_html.replace(`Votre annonce URL personnelle pour créer votre .torrent (activez l'option "Torrent Privé") :`, '您的个人Announce URL用于创建种子文件，请重新制作种子！');
        $('p:contains(Votre annonce URL)').html(origin_html);
        function replace_text(dom, o, d) {
            var o_html = dom.html();
            var d_html = o_html.replace(o, d);
            dom.html(d_html);
        }

        replace_text($('td:contains(.Torrent)'), '.Torrent', 'Torrent File');
        replace_text($('td:contains(Catégorie)'), 'Catégorie', 'Category');
        replace_text($('td:contains(AlloCiné URL)'), 'AlloCiné URL', 'AlloCine URL');
        replace_text($(`p:contains(Coller l'URL)`), `Coller l'URL`, 'Copy URL');
        replace_text($(`p:contains(pour le film)`), `pour le film`, 'for movies');
        setTimeout(function(){$('#btnAllocineFetch').text("Send");}, 1000);
        replace_text($(`p:contains(Cliquez sur envoyer pour valider votre lien)`), `Cliquez sur envoyer pour valider votre lien`, '点击Send以验证您的链接');
        replace_text($('td:contains(Acteur(s))'), 'Acteur(s)', 'Actor(s)');
        replace_text($('td:contains(Titre)'), 'Titre', 'Title');
        replace_text($(`p:contains(Ne pas modifier)`), `Ne pas modifier le titre mis à disposition par Allociné`, '请勿修改Allocine站点提供的标题');
        replace_text($('td:contains(Année)').first(), 'Année', 'Year');
        replace_text($(`td:contains(Année de réalisation ou de sortie en salles, et non l'année de sortie sur support ou de réédition.)`).last(),`Année de réalisation ou de sortie en salles, et non l'année de sortie sur support ou de réédition.`, '影院上映的年份，而不是重制或重发行的年份。');
        replace_text($(`td:contains(Restriction d'age)`).last(), `Restriction d'age`, '限制年龄');
        replace_text($(`p:contains(automatiquement remplis avec)`), `automatiquement remplis avec le lien Allociné`, '由Allocine链接自动填充');
        replace_text($(`label:contains(Cochez s'il s'agit)`), `Cochez s'il s'agit d'une release issue de la scène, si vous n'en êtes pas sûr ne pas cocher la case.`, '是否Scene?');
        replace_text($(`td:contains(Encodage)`).last(), `Encodage`, 'Encode');
        replace_text($(`td:contains(Résolution)`).last(), `Résolution`, 'Resolution');
        replace_text($(`td:contains(Type de fichier)`).last(), `Type de fichier`, 'Type of File');
        replace_text($(`td:contains(URL de l'affiche (Obligatoire))`).last(), `URL de l'affiche (Obligatoire)`, '海报(强制性的)');
        $('input[value=Previsualiser]').val('Preview');
        replace_text($(`p:contains(Contient des informations de)`), `Contient des informations de base telles que l'histoire du film.`, '包含基本信息，例如电影的历史。');
        replace_text($(`p:contains(Contient des informations)`), `Contient des informations d'encodage. (Respectez le travail des releasers en respectant le tag.)`, '包含编码信息。（尊重发布标签的作品。）');
        replace_text($(`span:contains(VFF)`).last(), `(Doublage Français (France))`, '(French Dubbing (France))');
        replace_text($(`span:contains(VFQ)`).last(), `(Doublage Français (Québec)`, '(French Dubbing (Quebec))');
        replace_text($(`span:contains(Version Originale, non française)`).last(), `(Version Originale, non française)`, '(Original Version, not French)');
        replace_text($(`span:contains(Version Originale Française(France et Belgique))`).last(), `(Version Originale Française(France et Belgique))`, '(Original French Version (France and Belgium))');
        replace_text($(`span:contains(Version Originale Québecoise)`).last(), `(Version Originale Québecoise)`, '(Original Quebec version)');
        replace_text($(`span:contains(Version Française, origine du doublage non précisée)`).last(), `(Version Française, origine du doublage non précisée)`, '(French version, origin of dubbing not specified)');
        replace_text($(`span:contains(Version Française Internationale = 1 seul doublage français existant)`).last(), `(Version Française Internationale = 1 seul doublage français existant)`, '(French International Version = only 1 existing French dubbing)');
        replace_text($(`span:contains(Cochez cette case si la release dispose des sous-titres français complets)`).last(), `Cochez cette case si la release dispose des sous-titres français complets`, 'Check this box if the release has full French subtitles');
        replace_text($(`span:contains(Ne cochez que s'il y a la VO+VF+ d'autres langues sinon ne cochez que VO+VF*)`).last(), `Ne cochez que s'il y a la VO+VF+ d'autres langues sinon ne cochez que VO+VF*`, 'Only check if there is the VO+VF+ of other languages ​​otherwise only check VO+VF*</br>(Check which VF version is included in addition to multi(vff,vfq)');
        replace_text($(`span:contains((Cochez quelle version VF est incluse en plus de multi(vff,vfq))`), `(Cochez quelle version VF est incluse en plus de multi(vff,vfq)`, '');
        replace_text($(`span:contains(Cochez Sous-titres pour)`), `Cochez Sous-titres pour les parties texte du film si elles sont en français et rien si elles sont dans une autres langue`, 'Check Subtitles for the text parts of the film if they are in French and nothing if they are in another language');
    } else if (site_url.match(/rules.php/)) {
        getDoc('https://raw.githubusercontent.com/tomorrow505/auto_feed_js/master/hdf_rules.html', null, function(doc){
            if (site_url.match(/rules.php$/)) {
                $('#content').html($('#main', doc).html());
            }
            else if (site_url.match(/golden_rules/)) {
                $('#content').html($('#golden_rules', doc).find('#content').html()+'<br><br><br><br><br>');
                $('#content').find('div.thin').append($('#main', doc).html());
            }
            else if (site_url.match(/inactivity/)) {
                $('#content').html($('#inactivity', doc).find('#content').html()+'<br><br><br><br><br>');
                $('#content').find('div.thin').append($('#main', doc).html());
            }
            else if (site_url.match(/bonus/)) {
                $('#content').html($('#bonus', doc).find('#content').html()+'<br><br><br><br><br>');
                $('#content').find('div.thin').append($('#main', doc).html());
            }
            else if (site_url.match(/ratio$/)) {
                $('#content').html($('#ratio', doc).find('#content').html()+'<br><br><br><br><br>');
                $('#content').find('div.thin').append($('#main', doc).html());
            }
            else if (site_url.match(/requests$/)) {
                $('#content').html($('#requests', doc).find('#content').html()+'<br><br><br><br><br>');
                $('#content').find('div.thin').append($('#main', doc).html());
            }
            else if (site_url.match(/collages$/)) {
                $('#content').html($('#collection', doc).find('#content').html()+'<br><br><br><br><br>');
                $('#content').find('div.thin').append($('#main', doc).html());
            }
            else if (site_url.match(/clients$/)) {
                $('#content').html($('#clients', doc).find('#content').html()+'<br><br><br><br><br>');
                $('#content').find('div.thin').append($('#main', doc).html());
            }
            else if (site_url.match(/upload$|series$/)) {
                if (site_url.match(/upload$/)){
                    $('#content').html($('#upload', doc).find('#content').html()+'<br><br><br><br>');
                    $('.rule_table').html($('#main', doc).html());
                } else {
                    $('#content').html($('#series', doc).find('#content').html());
                    $('#content').find('div.thin').append($('#main', doc).html());
                    $('div:contains("HD-Forever General Rules")').last().hide();
                }
                $('.rule_table').html($('#main', doc).html());
                function findRule() {
                    var query_string = $('#search_string').val();
                    var q = query_string.replace(/\s+/gm, '').split('+');
                    var regex = new Array();
                    for (var i = 0; i < q.length; i++) {
                        regex[i] = new RegExp(q[i], 'mi');
                    }
                    $('#actual_rules li').each(function() {
                        var show = true;
                        for (var i = 0; i < regex.length; i++) {
                            if (!regex[i].test($(this).html())) {
                                show = false;
                                break;
                            }
                        }
                        $(this).toggle(show);
                    });
                    $('.before_rules').toggle(query_string.length == 0);
                }

                var original_value = $('#search_string').val();
                $('#search_string').keyup(findRule);
                $('#search_string').focus(function() {
                    if ($(this).val() == original_value) {
                        $(this).val('');
                    }
                });
                $('#search_string').blur(function() {
                    if ($(this).val() == '') {
                        $(this).val(original_value);
                        $('.before_rules').show();
                    }
                })
            }
            else if (site_url.match(/chat$/)) {
                $('#content').html($('#chat', doc).find('#content').html()+'<br><br><br><br><br>');
                $('#content').find('div.thin').last().append($('#main', doc).html());
            }
            else if (site_url.match(/tag$/)) {
                $('#content').html($('#tags', doc).find('#content').html()+'<br><br><br><br><br>');
                $('#content').find('div.thin').last().append($('#main', doc).html());
            }
        });
    } else if (site_url.match(/wiki.php/)) {
        getDoc('https://raw.githubusercontent.com/tomorrow505/auto_feed_js/master/hdf_faq.html', null, function(doc){
            if (site_url.match(/wiki.php$/)) {
                $('#content').html($('#content',doc).html());
            } else if (site_url.match(/action=article&id=\d+/)) {
                var aid = site_url.match(/id=(\d+)/)[1];
                $('div.header').html($(`#${aid}`,doc).find('div.header').html());
                $('div.main_column').html($(`#${aid}`,doc).find('div.main_column').html());
                $('div.sidebar').html($(`#sidebar`,doc).html());
            }
        });
    }
}

if (site_url.match(/^https:\/\/bluebird-hd.org\/.*/)) {
    if ($('a:contains(Главная)').length) {
        $('a[title="English"]').find('img').click();
    }

    var table_html = $('table.fblock').first().html();
    table_html = table_html.replace(/Поиск \/ Search/, 'Search');
    table_html = table_html.replace(/Что искать/g, 'What to search');
    table_html = table_html.replace(/По торрентам/g, 'By torrents');
    table_html = table_html.replace(/По запросам/g, 'On request');
    table_html = table_html.replace(/По предложениям/g, 'Suggestions');
    table_html = table_html.replace(/По описаниям/g, 'According descriptions');
    $('table.fblock').first().html(table_html);

    table_html = $('table.fblock:eq(6)').html();
    table_html = table_html.replace(/Используй ключ!/g, `Use the key!`);
    $('table.fblock:eq(6)').html(table_html);

    function repTxt(e, o, d) {
        var el = $(`${e}:contains(${o})`).last();
        var em = el.html();
        try{
            el.html(em.replace(o,d));
        } catch (err) {}
    }
    var dict_info = {
        'Фильмы': `Films`,
        'Мультфильмы': `Cartoons`,
        'Документалистика': `Documentary`,
        'Шоу/Музыка':`Show/Music`,
        'Спорт':`Sport`,
        'Сериалы':`TV series`,
        'Эротика':`Erotica`,
        'Дэмо/Misc':`Demo/Misc`,
    }
    if (site_url.match(/browse.php/)) {
        table = $('#highlighted').prev();
        table_html = table.html();
        table_html = table_html.replace(/Список торрентов/g, `List of torrents`);
        table_html = table_html.replace(/Фильмы/g, `Films`);
        table_html = table_html.replace(/Мультфильмы/g, `Cartoons`);
        table_html = table_html.replace(/Документалистика/g, `Documentary`);
        table_html = table_html.replace(/Шоу\/Музыка/g, `Show/Music`);
        table_html = table_html.replace(/Спорт/g, `Sport`);
        table_html = table_html.replace(/Сериалы/g, `TV series`);
        table_html = table_html.replace(/Эротика/g, `Erotica`);
        table_html = table_html.replace(/Дэмо\/Misc/g, `Demo/Misc`);
        table_html = table_html.replace(/Поиск/g, `Search`);
        table_html = table_html.replace(/Активные/g, `Active`);
        table_html = table_html.replace(/Включая мертвые/g, `Including the dead`);
        table_html = table_html.replace(/Только мертвые/g, `Only the dead`);
        table_html = table_html.replace(/Золотые торренты/g, `Golden torrents`);
        table_html = table_html.replace(/Бриллиантовые торренты/g, `Diamond torrents`);
        table_html = table_html.replace(/Без сидов/g, `No seeds`);
        table_html = table_html.replace(/Все типы/g, `All types`);
        table_html = table_html.replace(/Описание/g, `Description`);
        table_html = table_html.replace(/ИЛИ/g, `OR`);
        table_html = table_html.replace(/И/g, `And`);
        table_html = table_html.replace(/Страницы/g, `Pages`);
        table_html = table_html.replace(/Тип/g, `Type`);
        table_html = table_html.replace(/Носитель/g, `Carrier`);
        table_html = table_html.replace(/Название/g, `Name`);
        table.html(table_html);
    } else if (site_url.match(/userdetails.php/)) {
        repTxt('td', 'Зарегистрирован', 'Registered');
        repTxt('td', 'Последний раз был на трекере', 'Last seen');
        repTxt('td', 'Монет', 'Coins');
        $('td:contains(Пригласил)')[2].textContent = 'Invited by';
        $('td:contains(Раздал)')[2].textContent = 'Uploaded';
        $('td:contains(Скачал)')[2].textContent = 'Downloaded';
        $('td:contains(Пол)')[2].textContent = 'Gender';
        repTxt('td', 'Награды', 'Awards');
        repTxt('td', 'Класс', 'Class');
        repTxt('td', 'Предупреждения', 'Warnings');
        repTxt('td', 'Возраст', 'Age');
        repTxt('td', 'Дата Рождения', 'Date of Birth');
        repTxt('td', 'Знак зодиака', 'Zodiac sign');
        repTxt('td', 'Комментариев', 'Comments');
        try{
            $('td:contains(Скачаные)')[2].textContent = $('td:contains(Скачаные)')[2].textContent.replace('Скачаные торренты', 'Downloaded torrents');
        } catch (err) {}
        repTxt('td', 'Приглашенные', 'Invited');
        repTxt('td', 'Пользователь', 'User');
        try{
            $('td:contains(Пригласил)')[3].textContent = 'Invited by';
        } catch (err) {}
        $('input[value="Послать ЛС"]').val('Send PM');
        repTxt('a', 'Добавить в друзья', 'Add to friends');
        repTxt('a', 'Добавить в блокированные', 'Add to blocked');
        return;
    } else if (site_url.match(/details.php/)) {
        $('nobr').map((index, e)=>{
            if (dict_info.hasOwnProperty($(e).text())){
                repTxt('nobr', $(e).text(), dict_info[$(e).text()])
            }
        });
        repTxt('b', 'Оригинальное название', 'Original name');
        repTxt('b', 'Название', 'Name');
        repTxt('b', 'Год выхода', 'Released');
        repTxt('b', 'Жанр', 'Genre');
        repTxt('b', 'Режиссер', 'Director');
        repTxt('b', 'В ролях', 'Casts');
        repTxt('b', 'О фильме', 'About the movie');
        repTxt('b', 'Выпущено', 'Released');
        repTxt('b', 'Продолжительность', 'Productivity');
        repTxt('b', 'Контейнер', 'Container');
        repTxt('b', 'Видео', 'Video');
        repTxt('b', 'Перевод', 'Translation');
        repTxt('b', 'Звук', 'Sound');
        repTxt('b', 'Субтитры', 'Subtitles');
        repTxt('b', 'Звук', 'Sound');
        while ($('b:contains(Аудио)').length){
            repTxt('b', 'Аудио', 'Audio');
        }
        repTxt('b', 'Релиз для', 'Release for');
        $('td[align=left]').map((index, e)=>{
            if (dict_info.hasOwnProperty($(e).text())){
                repTxt('td[align=left]', $(e).text(), dict_info[$(e).text()])
            }
        });
    } else if (site_url.match(/getrss.php/)) {
        var td_html = $('td:contains(Категории)').last().next().html();
        for (var key in dict_info) {
            td_html = td_html.replace(key, dict_info[key]);
        }
        td_html = td_html.replace('Если вы не выберете категории для просмотра,', 'If you do not select categories to view,');
        td_html = td_html.replace('вам будет выдана ссылка на все категории.', 'you will be given a link to all categories.');
        $('td:contains(Категории)').last().next().html(td_html);
        repTxt('td', 'Категории', 'Categories');

        td_html = $('td:contains(Тип ссылки в RSS)').last().html();
        td_html = td_html.replace('Ссылка на страницу', 'Link to the page');
        td_html = td_html.replace('Ссылка на скачивание', 'Link to download');
        $('td:contains(Тип ссылки в RSS)').last().html(td_html);
        repTxt('td', 'Тип ссылки в RSS', 'RSS link type');

         td_html = $('td:contains(Тип логина)').last().next().html();
        td_html = td_html.replace('Стандарт (cookies)', 'Standard (cookies)');
        td_html = td_html.replace('Альтернативный (passkey)', 'Alternate (passkey)');
        $('td:contains(Тип логина)').last().next().html(td_html);
        repTxt('td', 'Тип логина', 'Login type');
        repTxt('button', 'Сгенерировать RSS ссылку', 'Generate RSS link');
    } else if (site_url.match(/invite.php/)) {
        repTxt('b', 'Статус приглашенных вами', 'Status of your invitees');
        repTxt('b', 'Статус созданых приглашений', 'Status of created invitations');
        repTxt('b', 'Пользователь', 'User');
        repTxt('b', 'Раздал', 'Uploaded');
        repTxt('b', 'Скачал', 'Downloaded');
        repTxt('b', 'Рейтинг', 'Ratio');
        repTxt('b', 'Статус', 'Status');
        while ($('td:contains(Не подтвержден)').length) {
            repTxt('td', 'Не подтвержден', 'Not confirmed');
        }
        repTxt('b', 'Подтвердить', 'Confirm');
        repTxt('td', 'На данный момент вами не создано ниодного приглашения.', 'You have not created any invitation yet.');
        repTxt('td', 'Еще никто вами не приглашен.', 'No one has been invited by you yet.')
        $('input[value="Подтвердить пользователей"]').val('Verify Users');
        repTxt('b', 'Код приглашения', 'Invitation code');
        repTxt('b', 'Дата создания', 'Date of creation');
        repTxt('a', 'Удалить приглашение', 'Delete invitation');
        $('input[value="Создать приглашение"]').val('Create an invitation');
        repTxt('b', 'Создать пригласительный код', 'Create invitation code');
        repTxt('b', 'осталось', 'Left');
        repTxt('b', 'приглашений', 'invitations');
        $('input[value="Создать"]').val('Create');
    } else if (site_url.match('rules.php')) {
        repTxt('b', 'Напоминание о правилах', 'Rule Reminder');
        $('#sb10').html(`<p align="jsutify"></p><center>Dear User!</center><br>
            <br>Welcome to our project for connoisseurs of quality audio and video content. Please read these rules carefully and <a class="altlink" href="faq.php">FAQ</a>.<br>
            <br>And remember, the implementation of these rules guarantees you a cloudless dwelling on our tracker, be respectable and we will always be glad to see you.<p></p>`);
        getDoc('https://raw.githubusercontent.com/tomorrow505/auto_feed_js/master/bluebird_rules.html', null, function(doc){
            $('td.outer').find('table:eq(1)').html($('tbody', doc).html());
        });
    } else if (site_url.match(/faq.php/)) {
        getDoc('https://raw.githubusercontent.com/tomorrow505/auto_feed_js/master/bluebird_faq.html', null, function(doc){
            $('td.outer').find('table:eq(0)').html($('tbody', doc).html());
        });
    } else if (site_url.match(/mybonus.php/)) {
        function send() {
            var frm = document.mybonus;
            var bonus_type = '';
            try { bonus_type = $('input[name="bonus_id"]:checked').val() } catch(err) {}
            var ajax = new tbdev_ajax();
            ajax.onShow ('');
            var varsString = "";
            ajax.requestFile = "mybonus.php";
            ajax.setVar("id", bonus_type);
            ajax.method = 'POST';
            ajax.element = 'ajax';
            ajax.sendAJAX(varsString);
        }
        getDoc('https://raw.githubusercontent.com/tomorrow505/auto_feed_js/master/bluebird_bonus.html', null, function(doc){
            var current_coin = $('#ajax').html().match(/Мои монетки \((.*?) монет .* наличии \/ (.*?) единиц в час\)/)[1];
            var hourly_bonus = $('#ajax').html().match(/Мои монетки \((.*?) монет .* наличии \/ (.*?) единиц в час\)/)[2];
            const searchRegExp = /current_coin/g;
            $('#ajax').find('table').first().html($('#transfer', doc).html().replace(searchRegExp, current_coin).replace('hourly_coin', hourly_bonus));
            $('#ajax').next().html($('#calculator', doc).html());
            $('input[value=Exchange]').click(send);
        });
    }
}

if (site_url.match(/^https:\/\/filelist.io\/.*/)) {
    if (site_url.match(/rules.php/)) {
        getDoc('https://raw.githubusercontent.com/tomorrow505/auto_feed_js/master/fl_rules.html', null, function(doc){
            $('div.cblock-content').html($('div.cblock-content', doc).html());
        });
    } else if (site_url.match(/faq.php/)) {
        getDoc('https://raw.githubusercontent.com/tomorrow505/auto_feed_js/master/fl_faq.html', null, function(doc){
            $('#maincolumn').html($('#maincolumn', doc).html());
        });
    }
}

if (site_url.match(/^https:\/\/blutopia.cc\/torrents\/similar/)) {
    var ids = $('ul.meta__ids').html()
    raw_info.url = match_link('imdb', ids);
    if (raw_info.url && all_sites_show_douban) {
        getData(raw_info.url, function(data){
            if (data.data) {
                var score = data.data.average + '分';
                if (!score.replace('分', '')) score = '暂无评分';
                if (data.data.votes) score += `|${data.data.votes}人`;
                $('h1.meta__title').append(`<span> | </span><a href="${douban_prex}${data.data.id}" target="_blank" style="display: inline; width: auto; border-bottom: 0px !important; text-decoration: none; color: #d3d3d3; font-weight: bold;">${data.data.title.split(' ')[0]}[${score}]</a>`);
                if (data.data.summary && data.data.summary.length < 700 && data.data.summary.match(/[\u4e00-\u9fa5]/)) {
                    $('p.meta__description').text(data.data.summary.replace(/ 　　/g, ''));
                }
            }
        });
    }
    return;
}

if (site_url.match(/^https:\/\/beyond-hd.me\/library\/title/)) {
    var imdb_box = document.getElementsByTagName('body')[0];
    try {
        raw_info.url = match_link('imdb', imdb_box.innerHTML);
        if (raw_info.url && all_sites_show_douban) {
            getData(raw_info.url, function(data){
                console.log(data);
                if (data.data) {
                    var score = data.data.average + '分';
                    if (!score.replace('分', '')) score = '暂无评分';
                    if (data.data.votes) score += `|${data.data.votes}人`;
                    $('h1.bhd-title-h1').append(`<span> | </span><a href="${douban_prex}${data.data.id}" target="_blank" style="display: inline; width: auto; border-bottom: 0px !important; text-decoration: none; color: #d3d3d3; font-weight: bold;">${data.data.title.split(' ')[0]}[${score}]</a>`);
                    if (data.data.summary.trim() && data.data.summary.match(/[\u4e00-\u9fa5]/)) {
                        $('div.movie-overview').text(data.data.summary.replace(/ 　　/g, ''));
                    }
                }
            });
        }
    } catch(err) {}
    return;
}

//脚本设置简单页面，使用猫/杜比等站点的个人设置页面来做的，涵盖转图床的部分操作
if (site_url.match(/^https:\/\/.*?usercp.php\?action=personal(#setting|#ptgen|#mediainfo|#dealimg|#signin)/)) {
    setTimeout(function() {
        var style = `
        #sortable { list-style-type: none; margin: 0; padding: 0; width: 750px; display: inline-block}
        #sortable div { margin: 3px 3px 3px 0; padding: 1px; float: left; width: 100px; height: 20px; font-size: 1em; text-align: left; }
        #ksortable { list-style-type: none; margin: 0; padding: 0; width: 750px; display: inline-block}
        #ksortable div { margin: 3px 3px 3px 0; padding: 1px; float: left; width: 100px; height: 20px; font-size: 1em; text-align: left; }
        `;
        GM_addStyle(style);

        var $table = $('#outer table').last();
        $table.find('tr').css({"display": "none"});
        $('#usercpnav').hide();
        //********************************************** 0 **********************************************************************************
        $table.append(`<tr style="display:none;"><td width="1%" class="rowhead nowrap" valign="top" align="right">一键签到</td><td width="99%" class="rowfollow" valign="top" align="left" id="signin"></td></tr>`);
        $('#signin').append(`<b>签到站点设置</b>`);
        $('#signin').append(`&nbsp;&nbsp;&nbsp;<a href="#" id="s_all" style="color:red">全选</a>&nbsp;&nbsp;&nbsp;<a href="#" id="u_all" style="color:red">全不选</a>
                            &nbsp;&nbsp;&nbsp;<a href="#" id="s_fail" style="color:red">保留失败站点</a>
                            &nbsp;&nbsp;&nbsp;<a href="#" id="u_fail" style="color:red">去掉失败站点</a>
                            &nbsp;&nbsp;&nbsp;<a href="#" id="hide_unselected" style="color:red">隐藏未选择(默认)</a>
                            &nbsp;&nbsp;&nbsp;<a href="#" id="show_all" style="color:red">全部显示</a>`);
        $('#signin').append(`<b>&nbsp;&nbsp;&nbsp;</b><a href="#", target="_blank" id="begin_sign"><font color="red"><b>→开始签到←</b></font></a>`);
        $('#signin').append(`<br><div id="ksortable"></div>`);

        var unsupported_sites = ['digitalcore', 'HD-Only', 'WT-Sakura', 'HOU', 'OMG', 'TorrentLeech', 'MTeam'];

        for (index=0; index < site_order.length; index++) {
            var key = site_order[index];
            if (unsupported_sites.indexOf(key) <0) {
                $('#ksortable').append(`<div class="ui-state-default ui-sortable-handle"><input type="checkbox" kname=${key} value="yes" class="s_all">
                    <a href="${used_site_info[key].url}" target="_blank"><b>${key}</b></a></div>`);
            }
        }
        for (key in o_site_info) {
            if (site_order.indexOf(key) < 0 && unsupported_sites.indexOf(key) <0) {
                $('#ksortable').append(`<div class="ui-state-default ui-sortable-handle"><input type="checkbox" kname=${key} value="yes" class="s_all">
                    <a href="${o_site_info[key]}" target="_blank"><b>${key}</b></a></div>`);
            }
        }
        $( "#ksortable" ).sortable();
        $( "#ksortable" ).disableSelection();

        for (index=0; index < site_order.length; index++) {
            var key = site_order[index];
            if (used_signin_sites.indexOf(key) > -1) {
                $(`input[kname=${key}]`).prop('checked', true);
            }
        }
        for (key in o_site_info) {
            if (used_signin_sites.indexOf(key) > -1) {
                $(`input[kname=${key}]`).prop('checked', true);
            }
        }
        $('#signin').append(`<br><br><font color="red">暂不支持的站点列表：</font><div id="unsupported_sites" style="display:inline-block; margin-left:3px"></div>`);
        unsupported_sites.forEach((e)=>{
            $('#unsupported_sites').append(` | <div style="display:inline-block; margin-left:5px; margin-right:5px"><a href="${o_site_info[e]? o_site_info[e]: used_site_info[e].url}" target="_blank"><b>${e}</b></a></div>`);
        });
        $('#signin').append(`<br><font color="red">手动获取魔力的站点：</font>`);
        $('#signin').append(` | <div style="display:inline-block; margin-left:5px; margin-right:5px"><a href="${used_site_info['CHDBits'].url + 'bakatest.php'}" target="_blank"><b>CHDBits</b></a></div>`);
        $('#signin').append(` | <div style="display:inline-block; margin-left:5px; margin-right:5px"><a href="${o_site_info['U2'] + 'showup.php'}" target="_blank"><b>U2</b></a></div>`);
        $('#signin').append(` | <div style="display:inline-block; margin-left:5px; margin-right:5px"><a href="${used_site_info['HDSky'].url}" target="_blank"><b>HDSky</b></a></div>`);
        $('#signin').append(` | <div style="display:inline-block; margin-left:5px; margin-right:5px"><a href="${used_site_info['TJUPT'].url + 'attendance.php'}" target="_blank"><b>TJUPT</b></a></div>`);
        $('#signin').append(` | <div style="display:inline-block; margin-left:5px; margin-right:5px"><a href="${used_site_info['52PT'].url + 'bakatest.php'}" target="_blank"><b>52PT</b></a></div>`);
        $('#signin').append(` | <div style="display:inline-block; margin-left:5px; margin-right:5px"><a href="${used_site_info['WT-Sakura'].url + 'attendance.php'}" target="_blank"><b>WT-Sakura</b></a></div>`);
        $('#signin').append(` | <div style="display:inline-block; margin-left:5px; margin-right:5px"><a href="${used_site_info['OurBits'].url + 'attendance.php'}" target="_blank"><b>OurBits</b></a></div>`);
        $('#signin').append(` | <div style="display:inline-block; margin-left:5px; margin-right:5px"><a href="${used_site_info['PigGo'].url + 'attendance.php'}" target="_blank"><b>PigGo</b></a></div>`);
        $('#signin').append(` | <div style="display:inline-block; margin-left:5px; margin-right:5px"><a href="${used_site_info['红叶'].url + 'attendance_new.php'}" target="_blank"><b>红叶</b></a></div>`);
        $('#signin').append(` | <div style="display:inline-block; margin-left:5px; margin-right:5px"><a href="${used_site_info['OpenCD'].url}" target="_blank"><b>OpenCD</b></a></div>`);

        $('#signin').append(`<br><br><br>`);
        $('#signin').append(`<input type="button" id="ksave_setting" value="保存脚本设置！&nbsp;(只需点击一次)">`);
        $('#signin').append(`&nbsp;&nbsp;<font color="green">说明：红色表示获取到魔力，橙色表示登录成功，蓝色表示登录失败，黑色表示暂不支持或无响应。</font>`);
        if (site_url.match(/springsunday/)) {
            $('#ksave_setting').css({'color': 'white', 'background' :'url(https://springsunday.net/styles/Maya/images/btn_submit_bg.gif) repeat left top', 'border': '1px black'});
        }
        $('#ksave_setting').click((e)=>{
            used_signin_sites = [];
            for (key in default_site_info) {
                if ($(`input[kname=${key}]`).prop('checked')) {
                    used_signin_sites.push(key);
                }
            }
            for (key in o_site_info) {
                if ($(`input[kname=${key}]`).prop('checked')) {
                    used_signin_sites.push(key);
                }
            }
            GM_setValue('used_signin_sites', JSON.stringify(used_signin_sites.join(',')));
            alert('保存成功！！！');
        });

        $('#s_all').click(e=>{
            e.preventDefault();
            $('#signin').find('.s_all').prop('checked', true);
        });
        $('#u_all').click(e=>{
            e.preventDefault();
            $('#signin').find('.s_all').prop('checked', false);
        });
        $('#s_fail').click(e=>{
            e.preventDefault();
            $('#signin').find('.s_all').map((index,e)=>{
                if ($(e).prop('checked')) {
                    if ($(e).parent().find('a').css('color') !== 'rgb(17, 17, 17)' && $(e).parent().find('a').css('color') !== 'rgb(0, 0, 255)') {
                        $(e).prop('checked', false);
                    }
                }
            });
        });
        $('#u_fail').click(e=>{
            e.preventDefault();
            $('#signin').find('.s_all').map((index,e)=>{
                if ($(e).prop('checked')) {
                    if ($(e).parent().find('a').css('color') === 'rgb(17, 17, 17)' || $(e).parent().find('a').css('color') === 'rgb(0, 0, 255)') {
                        $(e).prop('checked', false);
                    }
                }
            });
        });
        $('#hide_unselected').click(e=>{
            e.preventDefault();
            $('#signin').find('.s_all').map((index,e)=>{
                if (!$(e).prop('checked')) {
                    $(e).parent().hide();
                }
            });
        });
        $('#show_all').click(e=>{
            e.preventDefault();
            $('#signin').find('.s_all').parent().show();
        });

        $('#signin').find('.s_all').map((index,e)=>{
            if (!$(e).prop('checked')) {
                $(e).parent().hide();
            }
        });

        $('#begin_sign').click((e)=>{
            e.preventDefault();
            var attendance_sites = ['PThome', 'HDHome', 'HDDolby', 'Audiences', 'SoulVoice','OKPT', 'UltraHD', 'CarPt', 'UBits', 'DaJiao', 'ECUST', 'iloli', 'PTChina',
            'HDVideo', 'HDAtmos', 'HDZone', 'HDTime', '3Wmg', 'FreeFarm', 'HDfans', 'PTT', 'HDMaYi', 'HDPt', 'ZMPT', 'OKPT', '悟空', 'CrabPt', 'QingWa', 'ICC',
            'CyanBug', 'SharkPT','2xFree', '杏林', '海棠', 'Panda', 'KuFei', 'RouSi', 'PTCafe', '影','PTLSP', 'GTK', 'HHClub', '象岛', '麒麟','AGSV', 'Oshen'];

            attendance_sites.forEach((e)=>{
                if (used_signin_sites.indexOf(e) > -1) {
                    try {
                        var signin_url = used_site_info[e].url + 'attendance.php';
                    } catch (Err) {
                        signin_url = o_site_info[e] + 'attendance.php';
                    }
                    getDoc(signin_url, null, function(doc) {
                        if ($('#outer', doc).find('table.main').find('table').length) {
                            console.log(`开始签到${e}：`, $('#outer', doc).find('table.main').find('table').text().trim());
                            $(`input[kname=${e}]`).parent().find('a').css({"color": "red"});
                        } else if ($('table.mainouter', doc).find('table.main').find('table').length) {
                            console.log(`开始签到${e}：`, $('table.mainouter', doc).find('table.main').find('table').text().trim());
                            $(`input[kname=${e}]`).parent().find('a').css({"color": "red"});
                        } else if ($('div.mainouter', doc).find('div.main').find('table').length) {
                            console.log(`开始签到${e}：`, $('div.mainouter', doc).find('div.main').find('table').text().trim());
                            $(`input[kname=${e}]`).parent().find('a').css({"color": "red"});
                        } else if ($('#content', doc).length) {
                            console.log(`开始签到${e}：`, $('#content', doc).find('p[class="register-now-info register-info"]').text().trim());
                            $(`input[kname=${e}]`).parent().find('a').css({"color": "red"});
                        } else if (e == "PTT" && $("table.main").length) {
                            console.log(`开始签到${e}：`, $("table.main").text().trim());
                            $(`input[kname=${e}]`).parent().find('a').css({"color": "red"});
                        } else {
                            console.log(`开始签到${e}：`, '失败！！！');
                            $(`input[kname=${e}]`).parent().find('a').css({"color": "blue"});
                        }
                    });
                }
            });

            if (used_signin_sites.indexOf('HDArea') > -1) {
                postData('https://hdarea.club/sign_in.php', encodeURI('action=sign_in'), function(data){
                    if (data.match(/该页面必须在登录后才能访问/)) {
                        console.log(`开始签到HDArea：`, '失败，请重新登录！！！');
                        $(`input[kname=HDArea]`).parent().find('a').css({"color": "blue"});
                    } else {
                        console.log(`开始签到HDArea：`, data);
                        $(`input[kname=HDArea]`).parent().find('a').css({"color": "red"});
                    }
                });
            }
            if (used_signin_sites.indexOf('HaresClub') > -1) {
                var data_url = 'https://club.hares.top/attendance.php?action=sign';
                GM_xmlhttpRequest({
                    method : "GET",
                    url: data_url,
                    headers: {"Accept": "application/json"},
                    onload : function (response) {
                        var data = response.responseText;
                        if (data.match(/该页面必须在登录后才能访问/)) {
                            console.log(`开始签到HaresClub：`, '失败，请重新登录！！！');
                            $(`input[kname=HaresClub]`).parent().find('a').css({"color": "blue"});
                        } else {
                            console.log(`开始签到HaresClub：`, JSON.parse(response.responseText));
                            $(`input[kname=HaresClub]`).parent().find('a').css({"color": "red"});
                        }
                    }
                });
            }
            if (used_signin_sites.indexOf('HDChina') > -1) {
                getDoc('https://hdchina.org/', null, function(doc){
                    var data = encodeURI('csrf=' + $('head', doc).find('meta[name="x-csrf"]').attr("content"));
                    if ($('head', doc).find('meta[name="x-csrf"]').attr("content") === undefined) {
                        $(`input[kname=HDChina]`).parent().find('a').css({"color": "blue"});
                    } else {
                        postData('https://hdchina.org/plugin_sign-in.php?cmd=signin', data, function(docc) {
                            if (docc.match(/该页面必须在登录后才能访问|Contact your hosting provider letting them know your web server is not responding|522: Connection timed out/)) {
                                console.log(`开始签到瓷器：`, '失败，请重新登录！！！');
                                $(`input[kname=HDChina]`).parent().find('a').css({"color": "blue"});
                            } else {
                                $(`input[kname=HDChina]`).parent().find('a').css({"color": "red"});
                                console.log(`开始签到瓷器：`, docc);
                            }
                        });
                    }
                });
            }
            if (used_signin_sites.indexOf('PTer') > -1) {
                getJson('https://pterclub.com/attendance-ajax.php', null, function(data){
                    if (typeof data == 'object') {
                        console.log(`开始签到猫站：`, data);
                        $(`input[kname=PTer]`).parent().find('a').css({"color": "red"});
                    } else if (data.match(/该页面必须在登录后才能访问/)) {
                        console.log(`开始签到猫站：`, '失败，请重新登录！！！');
                        $(`input[kname=PTer]`).parent().find('a').css({"color": "blue"});
                    }
                });
            }
            if (used_signin_sites.indexOf('HDU') > -1) {
                GM_xmlhttpRequest({
                    method : "POST",
                    url: `https://pt.hdupt.com/added.php`,
                    data: encodeURI("action=qiandao"),
                    headers: {
                        "Accept": '*/*',
                        "Accept-Encoding": 'gzip, deflate, br',
                        "Accept-Language": 'zh-CN,zh;q=0.9,tr;q=0.8,en-US;q=0.7,en;q=0.6',
                        "Cache-Control": 'no-cache',
                        "Connection": 'keep-alive',
                        "Content-Length": '14',
                        "Content-type": 'application/x-www-form-urlencoded',
                        "Host": 'pt.hdupt.com',
                        "Origin": 'https://pt.hdupt.com',
                        "Pragma": 'no-cache',
                        "Referer": 'https://pt.hdupt.com/index.php',
                        "sec-ch-ua": '".Not/A)Brand";v="99", "Google Chrome";v="103", "Chromium";v="103"',
                        "sec-ch-ua-mobile": '?0',
                        "sec-ch-ua-platform": '"Windows"',
                        "Sec-Fetch-Dest": 'empty',
                        "Sec-Fetch-Mode": 'cors',
                        "Sec-Fetch-Site": 'same-origin',
                        "User-Agent": 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'
                    },
                    onload : function (response) {
                        var data = response.responseText;
                        console.log(data)
                    }
                });
                setTimeout(function(){
                    getDoc('https://pt.hdupt.com/', null, function(doc) {
                        if ($('span:contains(已签到)', doc).length) {
                            $(`input[kname=HDU]`).parent().find('a').css({"color": "red"});
                            console.log(`开始签到HDU：`, '成功！！！');
                        } else if ($('#nav_block',doc).length) {
                            $(`input[kname=HDU]`).parent().find('a').css({"color": "DarkOrange"});
                            console.log(`开始登录HDU：`, '成功！！！');
                        } else {
                            $(`input[kname=HDU]`).parent().find('a').css({"color": "blue"});
                            console.log(`开始登录HDU：`, '失败！！！');
                        }
                    });
                }, 2000);
            }
            if (used_signin_sites.indexOf('HD4FANS') > -1) {
                GM_xmlhttpRequest({
                    method : "POST",
                    url: `https://pt.hd4fans.org/checkin.php`,
                    data: encodeURI("action=checkin"),
                    headers: {
                        "Accept": '*/*',
                        "Accept-Encoding": 'gzip, deflate, br',
                        "Accept-Language": 'zh-CN,zh;q=0.9,tr;q=0.8,en-US;q=0.7,en;q=0.6',
                        "Cache-Control": 'no-cache',
                        "Connection": 'keep-alive',
                        "Content-Length": '14',
                        "Content-type": 'application/x-www-form-urlencoded',
                        "Host": 'pt.hd4fans.org',
                        "Origin": 'https://pt.hd4fans.org/',
                        "Pragma": 'no-cache',
                        "Referer": 'https://pt.hd4fans.org/torrent.php',
                        "sec-ch-ua": '".Not/A)Brand";v="99", "Google Chrome";v="103", "Chromium";v="103"',
                        "sec-ch-ua-mobile": '?0',
                        "sec-ch-ua-platform": '"Windows"',
                        "Sec-Fetch-Dest": 'empty',
                        "Sec-Fetch-Mode": 'cors',
                        "Sec-Fetch-Site": 'same-origin',
                        "User-Agent": 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'
                    },
                    onload : function (response) {
                        var data = response.responseText;
                    }
                });
                setTimeout(function(){
                    getDoc('https://pt.hd4fans.org/', null, function(doc) {
                        if ($('span:contains(签到成功)', doc).length) {
                            $(`input[kname=HD4FANS]`).parent().find('a').css({"color": "red"});
                            console.log(`开始签到HD4FANS：`, '成功！！！');
                        } else if ($('#info_block',doc).length) {
                            $(`input[kname=HD4FANS]`).parent().find('a').css({"color": "DarkOrange"});
                            console.log(`开始登录HD4FANS：`, '成功！！！');
                        } else {
                            $(`input[kname=HD4FANS]`).parent().find('a').css({"color": "blue"});
                            console.log(`开始登录HD4FANS：`, '失败！！！');
                        }
                    });
                }, 2000);
            }
            if (used_signin_sites.indexOf('TTG') > -1) {
                GM_xmlhttpRequest({
                    method : "GET",
                    url: `https://totheglory.im/`,
                    headers: {
                        "Accept": 'text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9',
                        "Accept-Language": 'zh-CN,zh;q=0.9,tr;q=0.8,en-US;q=0.7,en;q=0.6',
                        "sec-ch-ua": '".Not/A)Brand";v="99", "Google Chrome";v="103", "Chromium";v="103"',
                        "sec-ch-ua-mobile": '?0',
                        "sec-ch-ua-platform": '"Windows"',
                        "sec-fetch-dest": "document",
                        "sec-fetch-mode": "navigate",
                        "sec-fetch-site": "none",
                        "sec-fetch-user": "?1",
                        "upgrade-insecure-requests": "1",
                        "User-Agent": 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36',
                    },
                    onload : function (response) {
                        var resp = response.responseText;
                        if (resp.match(/次失败登录会导致你的 IP 被禁止。/)) {
                            $(`input[kname=TTG]`).parent().find('a').css({"color": "blue"});
                            console.log(`开始登录TTG：`, '失败！！！');
                        } else {
                            var data = resp.match(/signed_timestamp: "\d+", signed_token: ".*?"/)[0];
                            setTimeout(function(){
                                var timestamp = data.match(/signed_timestamp: "(\d+)"/)[1];
                                var token = data.match(/signed_token: "(.*?)"/)[1];
                                postData('https://totheglory.im/signed.php', encodeURI(`signed_timestamp=${timestamp}&signed_token=${token}`), function(rep){
                                    if (rep === undefined) {
                                        $(`input[kname=TTG]`).parent().find('a').css({"color": "DarkOrange"});
                                        console.log(`开始登录TTG：`, '成功！！！');
                                    } else {
                                        $(`input[kname=TTG]`).parent().find('a').css({"color": "red"});
                                        console.log(`开始签到TTG：`, rep);
                                    }
                                })
                            }, 1000);
                        }
                    }
                });
            }
            if (used_signin_sites.indexOf('BTSchool') > -1) {
                var signin_url = used_site_info['BTSchool'].url + 'index.php?action=addbonus';
                getDoc(signin_url, null, function(doc){
                    if ($('#nav_block', doc).length) {
                        if ($('font:contains("今天签到您获得"):last', doc).length) {
                            console.log(`开始签到BTSchool：`, $('font:contains("今天签到您获得"):last', doc).text().trim());
                        } else {
                            console.log(`开始签到BTSchool：`, '重复签到！！');
                        }
                        $(`input[kname=BTSchool]`).parent().find('a').css({"color": "red"});
                    } else {
                        console.log(`开始签到BTSchool：`, '失败！！！');
                        $(`input[kname=BTSchool]`).parent().find('a').css({"color": "blue"});
                    }
                })
            }
            if (used_signin_sites.indexOf('HDCity') >-1) {
                var signin_url = used_site_info['HDCity'].url + 'sign';
                getDoc(signin_url, null, function(doc){
                    if ($('#bottomnav',doc).length) {
                        if ($('p:contains("本次签到获得魅力")', doc).length || $('p:contains("Bonus earned today")', doc).length) {
                            console.log(`开始签到HDCity：`, $('p:contains("本次签到获得魅力")', doc).length ? $('p:contains("本次签到获得魅力")', doc).text(): $('p:contains("Bonus earned today")', doc).text());
                            $(`input[kname=HDCity]`).parent().find('a').css({"color": "red"});
                        }
                    } else {
                        console.log(`开始签到HDCity：`, '失败！！！');
                        $(`input[kname=HDCity]`).parent().find('a').css({"color": "blue"});
                    }
                });
            }

            function log_in(sites, judge_str) {
                sites.forEach((e)=>{
                    if (used_signin_sites.indexOf(e) > -1) {
                        var url = used_site_info.hasOwnProperty(e) ? used_site_info[e].url: o_site_info[e];
                        if (e == '1PTBA') {
                            url = 'https://1ptba.com/index.php';
                        }
                        getDoc(url, null, function(doc) {
                            if (e == 'DTR') {
                                if ($('#username', doc).length) {
                                    $(`input[kname=${e}]`).parent().find('a').css({"color": "blue"});
                                    console.log(`开始登陆${e}：`, '登陆失败！！！！！！！');
                                } else {
                                    $(`input[kname=${e}]`).parent().find('a').css({"color": "DarkOrange"});
                                    console.log(`开始登陆${e}：`, '成功登陆！！');
                                }
                                return;
                            }
                            if (e == 'ZHUQUE') {
                                if ($('#form_item_username', doc).length) {
                                    $(`input[kname=${e}]`).parent().find('a').css({"color": "blue"});
                                    console.log(`开始登陆${e}：`, '登陆失败！！！！！！！');
                                } else {
                                    $(`input[kname=${e}]`).parent().find('a').css({"color": "DarkOrange"});
                                    console.log(`开始登陆${e}：`, '成功登陆！！');
                                }
                                return;
                            }
                            if ($(judge_str, doc).length) {
                                $(`input[kname=${e}]`).parent().find('a').css({"color": "DarkOrange"});
                                console.log(`开始登陆${e}：`, '成功登陆！！');
                            } else {
                                $(`input[kname=${e}]`).parent().find('a').css({"color": "blue"});
                                console.log(`开始登陆${e}：`, '登陆失败！！！！！！！');
                            }
                        });
                    }
                });
            }

            var np_sites = ['CHDBits', 'CMCT', 'FRDS', 'TLFbits', 'TCCF', 'PTsbao', 'OpenCD', 'HUDBT', '1PTBA', 'HDSky', 'ITZMX',
                            'NanYang', 'DiscFan', 'Dragon', 'U2', 'YDY', 'JoyHD', 'HITPT', 'ITZMX', 'OurBits', '红叶'];
            log_in(np_sites, '#mainmenu');

            log_in(['PuTao'], '#userbar');
            log_in(['HDRoute'], '#nav');
            log_in(['BYR'], '#pagemenu');
            log_in(['TJUPT'], '#info_block');
            log_in(['ANT'], '#nav_home');
            log_in(['NBL'], '#mainnav');
            log_in(['PigGo'], '#info_block');
            log_in(['BTN', 'SC', 'MTV', 'UHD', 'HDSpace', 'TVV', 'HDF', 'RED', 'jpop', 'lztr', 'DICMusic', 'OPS', 'bit-hdtv', 'SugoiMusic'], '#menu');
            log_in(['HDB'], '#menusides');
            log_in(['BHD'], 'div[class="beta-table"]');
            log_in(['PTP'], 'div[class="main-menu"]');
            log_in(['GPW'], 'div[class="HeaderNav"]');
            log_in(['KG'], 'a[class="customtab1"]');
            log_in(['HDT'], 'img[class="torrents"]');
            log_in(['xthor'], '#navbar');
            log_in(['HONE'], '#hoeapp-container');
            log_in(['FileList'], '#navigation');
            log_in(['bib'], '#header_nav');
            log_in(['IN'], '#nav');

            log_in(['HDPost', 'BLU', 'HDOli', 'Monika', 'KIMOJI', 'Tik', 'Aither', 'FNP', 'OnlyEncodes'], 'nav[class="top-nav"]');
            log_in(['DTR', 'ZHUQUE'], 'nav[class="container mx-auto"]');
            log_in(['ACM'], 'ul[class="left-navbar"]');

            log_in(['BlueBird'], 'a[href*="browse.php"]');
            log_in(['CG'], 'a[href*="userdetails.php"]');
            log_in(['IPT'], 'div[class="stats"]');
            log_in(['HaiDan'], 'div[class="navbar special-border"]');
            log_in(['bwtorrents'], '#menu-aeon');
            log_in(['TorrentLeech'], 'span[class="div-menu-item logout-menu-item"]');
            log_in(['HD-Only'], '#nav_userinfo');
            log_in(['iTS'], 'table[class="menubar"');

            // avz系列
            var avz_list = ['avz', 'PHD', 'CNZ', 'JPTV', 'torrentseeds'];
            log_in(avz_list, 'div[class="ratio-bar"]');
        });

        //***********************************************************************************************************************************

        $table.append(`<tr style="display:none;"><td width="1%" class="rowhead nowrap" valign="top" align="right">脚本设置</td><td width="99%" class="rowfollow" valign="top" align="left" id="setting"></td></tr>`);
        $('#setting').append(`<b>使用教程：</b><a href="https://github.com/tomorrow505/auto_feed_js/wiki", target="_blank"><font color="red">→跳转←</font></a>`);
        $('#setting').append(`<b>&nbsp;&nbsp;&nbsp;更新地址：</b><a href="https://greasyfork.org/zh-CN/scripts/424132-auto-feed/", target="_blank"><font color="red">→跳转←</font></a>`);
        $('#setting').append(`<b>&nbsp;&nbsp;&nbsp;TG群聊：</b><a href="https://t.me/+rGUOUYZ3Ey43OWY9/", target="_blank"><font color="red">→跳转←</font></a>`);
        $('#setting').append(`<b>&nbsp;&nbsp;&nbsp;项目托管：</b><a href="https://github.com/tomorrow505/auto_feed_js/", target="_blank"><font color="red">→GitHub←</font></a>`);
        $('#setting').append(`<br><br>`);

        //************************************************** 1 ***************************************************************************
        $('#setting').append(`<b>转发站点设置</b>`);
        $('#setting').append(`<br><div id="sortable"></div>`);
        for (index=0; index < site_order.length; index++) {
            var key = site_order[index];
            $('#sortable').append(`<div class="ui-state-default ui-sortable-handle"><input type="checkbox" class="support_site" name=${key} value="yes"><a href="${default_site_info[key].url}" target="_blank">${key}</a></div>`);
        }
        $( "#sortable" ).sortable();
        $( "#sortable" ).disableSelection();


        $('#setting').append(`<br><input type="button" id="select_all" value="全部选中" style="margin-top: 10px">`);
        $('#setting').append(`<input type="button" id="unselect_all" value="取消选中" style="margin-left: 25px"></br>`);
        $('#setting').append(`<br>`);

        $('#select_all').click(function(){
            $('.support_site').map(function(){
                $(this).prop('checked', true);
            });
        });
        $('#unselect_all').click(function(){
            $('.support_site').map(function(){
                $(this).prop('checked', false);
            });
        });

        for (index=0; index < site_order.length; index++) {
            var key = site_order[index];
            if (used_site_info[key].enable) {
                $(`input[name=${key}]`).prop('checked', true);
            }
        }

        //**************************************************** 2 **************************************************************************
        count = 0;
        $('#setting').append(`<b>常用站点设置</b></br>`);
        for (index=0; index < site_order.length; index++) {
            var key = site_order[index];
            if (used_site_info[key].enable) {
                $('#setting').append(`<div class="container"><input type="checkbox" title=${key} value="yes">${key}</div>`);
                if ( (count+1) % 8 == 0){
                    $('#setting').append(`<br>`);
                }
                count += 1;
            }
        }
        $('#setting').append(`<br><br>`);
        $('.container').css({'display': 'inline-block', 'width': '90px'});

        for (key in used_common_sites) {
            if (used_site_info[used_common_sites[key]] !== undefined && used_site_info[used_common_sites[key]].enable) {
                $(`input[title=${used_common_sites[key]}]`).prop('checked', true);
            }
        }

        //**************************************************** 3 *************************************************************************
        $('#setting').append(`<b>是否在种子页面开启快捷搜索功能：</b>`);
        for (key in show_search_urls) {
            if (show_search_urls[key]) {
                $('#setting').append(`<div class="show_url"><input type="checkbox" show=${key} value="yes" checked="">${key}</div>`);
            } else {
                $('#setting').append(`<div class="show_url"><input type="checkbox" show=${key} value="yes">${key}</div>`);
            }
        }
        $('#setting').append(`<br><br>`);

        //**************************************************** 3.1 *************************************************************************

        $('#setting').append(`<b>是否开启脚本额外显示功能：</b>`);
        for (key in extra_settings) {
            if (extra_settings[key].enable) {
                $('#setting').append(`<div class="extra"><input type="checkbox" name=${key} value="yes" checked="">${extra_settings[key].title}</div>`);
            } else {
                $('#setting').append(`<div class="extra"><input type="checkbox" name=${key} value="yes">${extra_settings[key].title}</div>`);
            }
            if (key == 'ptp_show_group_name') {
                $(`input[name="ptp_show_group_name"]`).parent().append(`<input type="radio" name="name_location" value="0">前
                    <input type="radio" name="name_location" value="1">后`);
                $(`input:radio[name="name_location"][value="${ptp_name_location}"]`).prop('checked', true);
            }
        }
        $('.show_url').css({'display': 'inline-block', 'width': '70px'});
        $('.extra').css({'display': 'inline-block', 'width': '90px'});
        $(`input[name="ptp_show_group_name"]`).parent().css({'width': '170px'});
        $('#setting').append(`<br><br>`);

        //**************************************************** 3.2 *************************************************************************
        $('#setting').append(`<b>选择IMDb到豆瓣ID的获取方式(适用于外站)：</b>`);
        $('#setting').append(`<input type="radio" name="imdb2db" value="0">豆瓣API`);
        $('#setting').append(`<input type="radio" name="imdb2db" value="1">豆瓣爬取`);
        $(`input:radio[name="imdb2db"][value="${imdb2db_chosen}"]`).prop('checked', true);
        $('#setting').append(`<br><br>`);

        //**************************************************** 4 ***************************************************************************
        $('#setting').append(`<b>选择PTGen的API节点(适用于外站)：</b>`);
        $('#setting').append(`<input type="radio" name="ptgen" value="0">api.iyuu.cn`);
        $('#setting').append(`<input type="radio" name="ptgen" value="1">ptgen`);
        $('#setting').append(`<input type="radio" name="ptgen" value="3">豆瓣页面爬取`);
        $(`input:radio[name="ptgen"][value="${api_chosen}"]`).prop('checked', true);
        $('#setting').append(`<br><br>`);

        //**************************************************** 4 ***************************************************************************
        $('#setting').append(`<b>快速搜索站点设置(每个一行,可自行添加)
            <a href="https://gitee.com/tomorrow505/auto-feed-helper/raw/master/temple_search_urls" target=_blank>
            <font color="red">范例</font></a></b></br>`);

        getDoc('https://gitee.com/tomorrow505/auto-feed-helper/raw/master/temple_search_urls', null, function(doc){
            $(`<font>从范例页面获取：</font><input id="url_input" type="text" list="options_jump_href" style="border-radius:2px;">
                <datalist name="options_jump_href" id="options_jump_href" style="width:100px; margin-bottom:3px; margin-right:5px"><option value="---">---</option></datalist><a type="button" id="append_url" href="#" style="color:blue">↓ 新增</a><br>`).insertBefore($('textarea[name="set_jump_href"]'));
            $(`<div style="display:none; margin-bottom:5px"><span id="show_selected"></span><br></div>`).insertBefore($('textarea[name="set_jump_href"]'));
            var urls_to_append = $('body', doc).find('a');
            var urls_appended = $('textarea[name="set_jump_href"]').val();
            urls_to_append.map((index,e)=>{
                var url_to_append = $(`a:contains(${$(e).text()})`, doc).attr('href').replace(/\/|\?/g, '.');
                var reg = new RegExp(url_to_append, 'i');
                if ( !urls_appended.match(reg)) {
                    $('datalist[name="options_jump_href"]').append(`<option value=${$(e).text()}>${$(e).text()}</option>`);
                }
            });
            $('#append_url').click((e)=>{
                e.preventDefault();
                var origin_str = $('textarea[name="set_jump_href"]').val();
                $('textarea[name="set_jump_href"]').val(origin_str + '\n' + $('#show_selected').text());
            });
            $('input[id="url_input"]').change((e)=>{
                var selected_url = $(e.target).val();
                var jump_url = $(`a:contains(${selected_url})`, doc).prop("outerHTML").replace(/&amp;/g, '&');
                if (jump_url) {
                    $('#show_selected').text(jump_url).parent().show();
                }
            });
        })
        $('#setting').append(`<textarea name="set_jump_href" style="width:700px" rows="15"></textarea><br><br>`);
        $('textarea[name="set_jump_href"]').val(used_search_list.join('\n'));

        //**************************************************** 5 ***************************************************************************
        $('#setting').append(`<div style="margin-bottom=5px"><b>脚本相关API-KEY值设置</b></div></br>`);
        $('#setting').append(`<label><b>TMDB影库对应apikey(<a href="https://www.themoviedb.org/settings/api" target="_blank"><font color="red">登录官网</font></a>自行申请):</b></label><input type="text" name="tmdb_key" style="width: 300px;  margin-left:5px" value=${used_tmdb_key}><br><br>`);
        $('#setting').append(`<label><b>PTPimg对应的apikeykey(<a href="https://ptpimg.me/" target="_blank"><font color="red">打开首页</font></a>即可获取):</b></label><input type="text" name="ptp_img_key" style="width: 300px; margin-left:5px" value=${used_ptp_img_key}><br><br>`);
        for (key in used_rehost_img_info) {
            if (key == 'catbox') {continue;}
            $('#setting').append(`<label><b>${key}对应apikeykey(<a href="${used_rehost_img_info[key].url}" target="_blank"><font color="red">登录站点</font></a>或可获取):</b></label><input type="text" name="${key}_key" style="width: 300px; margin-left:5px" value=${used_rehost_img_info[key]['api-key']}><br><br>`);
        }
        $('label').css({"width": "280px", "text-align": "right", "display": "inline-block"});

        $('#setting').append(`<input type="checkbox" name="anonymous" value="yes">是否匿名，此处勾选之后，在发布种子时，发布页面将默认预先勾选匿名发布。`);
        if (if_uplver) {
            $(`input[name="anonymous"]`).prop('checked', true);
        }


        //**************************************************** 3.2 *************************************************************************
        $('#setting').append(`<input type="checkbox" name="douban_jump" value="yes">是否显示豆瓣页面跳转选项，默认开启。`);
        if (if_douban_jump) {
            $(`input[name="douban_jump"]`).prop('checked', true);
        }
        $('#setting').append(`<input type="checkbox" name="imdb_jump" value="yes">是否显示IMDB页面跳转选项，默认开启。`);
        if (if_imdb_jump) {
            $(`input[name="imdb_jump"]`).prop('checked', true);
        }

        $('#setting').append(`<input type="checkbox" name="hdb_hide_douban" value="yes">是否折叠HDB中文豆瓣信息，默认展开。`);
        if (hdb_hide_douban) {
            $(`input[name="hdb_hide_douban"]`).prop('checked', true);
        }

        $('#setting').append(`<input type="checkbox" name="chd_use_backup_url" value="yes">是否使用CHD备份网址，如果勾选将采用类似hb.chddiy.xyz的域名。<br><br>`);
        if (chd_use_backup_url) {
            $(`input[name="chd_use_backup_url"]`).prop('checked', true);
        }


        $('#setting').append(`<input type="button" id="save_setting" value="保存脚本设置！&nbsp;(只需点击一次)">`);
        if (site_url.match(/springsunday/)) {
            $('#save_setting, #select_all, #unselect_all').css({'color': 'white', 'background' :'url(https://springsunday.net/styles/Maya/images/btn_submit_bg.gif) repeat left top', 'border': '1px black'});
        }

        //点击保存
        $('#save_setting').click(function(){
            // 更新site order
            site_order = [];
            $('#sortable').find('input').each(function(){
                site_order.push($(this).parent().text());
            });
            GM_setValue('site_order', JSON.stringify(site_order.join(',')));

            //处理支持站点
            for (key in used_site_info) {
                if ($(`input[name=${key}]`).prop('checked')) {
                    used_site_info[key].enable = 1;
                } else {
                    used_site_info[key].enable = 0;
                }
            }
            GM_setValue('used_site_info', JSON.stringify(used_site_info));

            //处理常用站点
            used_common_sites = [];
            for (key in default_site_info) {
                if ($(`input[title=${key}]`).prop('checked')) {
                    used_common_sites.push(key);
                }
            }
            GM_setValue('used_common_sites', JSON.stringify(used_common_sites.join(',')));

            GM_setValue('imdb2db_chosen', $('input[name="imdb2db"]:checked').val());

            GM_setValue('api_chosen', $('input[name="ptgen"]:checked').val());

            for (key in show_search_urls) {
                if ($(`input[show=${key}]`).prop('checked')){
                    show_search_urls[key] = 1;
                } else {
                    show_search_urls[key] = 0;
                }
            }
            GM_setValue('show_search_urls', JSON.stringify(show_search_urls));

            for (key in extra_settings) {
                if ($(`input[name=${key}]`).prop('checked')){
                    extra_settings[key].enable = 1;
                } else {
                    extra_settings[key].enable = 0;
                }
            }
            GM_setValue('extra_settings', JSON.stringify(extra_settings));

            //处理快速搜索
            used_search_list = $('textarea[name="set_jump_href"]').val().split('\n').join(',');
            if (!used_search_list[used_search_list.length-1]){
                used_search_list.pop();
            }
            GM_setValue('used_search_list', JSON.stringify(used_search_list));

            //处理ptp-tmdb的key
            GM_setValue('used_ptp_img_key', $(`input[name="ptp_img_key"]`).val());
            GM_setValue('used_tmdb_key', $(`input[name="tmdb_key"]`).val());

            //处理匿名
            if_uplver = $(`input[name="anonymous"]:last`).prop('checked') ? 1: 0;
            GM_setValue('if_uplver', if_uplver);

            if_douban_jump = $(`input[name="douban_jump"]`).prop('checked') ? 1: 0;
            GM_setValue('if_douban_jump', if_douban_jump);

            if_imdb_jump = $(`input[name="imdb_jump"]`).prop('checked') ? 1: 0;
            GM_setValue('if_imdb_jump', if_imdb_jump);

            hdb_hide_douban = $(`input[name="hdb_hide_douban"]`).prop('checked') ? 1: 0;
            GM_setValue('hdb_hide_douban', hdb_hide_douban);

            chd_use_backup_url = $(`input[name="chd_use_backup_url"]`).prop('checked') ? 1: 0;
            GM_setValue('chd_use_backup_url', chd_use_backup_url);

            //处理key值
            for (key in used_rehost_img_info) {
                used_rehost_img_info[key]['api-key'] = $(`input[name="${key}_key"]`).val();
            }
            GM_setValue('used_rehost_img_info', JSON.stringify(used_rehost_img_info));

            ptp_name_location = $(`input:radio[name="name_location"]:checked`).val();
            GM_setValue('ptp_name_location', ptp_name_location);

            alert('保存成功！！！')
        });

        //自制ptgen
        $table.append(`<tr style="display:none;"><td width="1%" class="rowhead nowrap" valign="top" align="right">PTGen</td><td width="99%" class="rowfollow" valign="top" align="left" id="ptgen"></td></tr>`);
        $('#ptgen').append(`<label><b>输入豆瓣/IMDB/Bangumi链接查询:</b></label><input type="text" name="url" style="width: 320px; margin-left:5px">`);
        $('#ptgen').append(`<input type="button" id="go_ptgen" value="获取信息" style="margin-left:15px"><input type="button" id="douban2ptp" value="海报转存PTPimg" style="margin-left:15px"><br><br>`);
        $('#ptgen').append(`<textarea name="douban_info" style="width:720px" rows="30"></textarea><br>`);

        $('#go_ptgen').click(function(){
            var raw_info = {'url': '', 'dburl': '', 'descr': '', 'bgmurl': ''};
            var url = $('input[name="url"]').val();
            $('#go_ptgen').prop('value', '正在获取');
            var flag = true;
            if (match_link('imdb', url)) {
                falg = true;
                raw_info.url = match_link('imdb', url);
            } else if (match_link('douban', url)) {
                flag = false;
                raw_info.dburl = match_link('douban', url);
            } else if (match_link('bangumi', url)) {
                flag = false;
                raw_info.bgmurl = match_link('bangumi', url);
            } else {
                alert('请输入合适的链接！！！');
                return;
            }
            if (!raw_info.bgmurl) {
                create_site_url_for_douban_info(raw_info, flag).then(function(raw_info){
                    if (raw_info.dburl){
                        get_douban_info(raw_info);
                    }
                }, function(err) {
                    if (confirm("该资源貌似没有豆瓣词条，是否获取imdb信息？")){
                        async function formatDescr() {
                            var descr = kg_intro_base_content.split('Screenshots here')[0].trim();
                            var doc = await getimdbpage(raw_info.url);
                            var country = Array.from($('li.ipc-metadata-list__item:contains("Countr")', doc).find('a')).map(function(e){
                                return $(e).text();
                            });
                            var country_selected = false;
                            country = country.map(function(e){
                                if (e == 'United States') e = 'USA';
                                if (e == 'United Kingdom') e = 'UK';
                                return e;
                            }).join(', ');
                            var index = descr.search('Date Published');
                            descr = descr.substring(0,index) + `Country: ${country}\n` + descr.substring(index);
                            var poster_url = 'https://www.imdb.com/' + $('a[href*=tt_ov_i]', doc).first().attr('href');
                            if ($('a[href*=tt_ov_i]', doc).length == 0) {
                                poster_url = 'https://www.imdb.com/' + $('div[class*=ipc-poster] > div > a', doc).last().attr('href');
                            }

                            var poster = await getPoster(poster_url);
                            descr = descr.format({'poster': poster});
                            descr = descr.format({'title': $('h1:eq(0)', doc).text().trim()});
                            descr = descr.format({'genres': Array.from($('div[data-testid*=genres]', doc).find('a')).map(function(e){
                                return $(e).text();
                            }).join(', ').replace(/, Read all/g, '')});

                            descr = descr.format({'date': $('li.ipc-metadata-list__item:contains("Release date")', doc).find('div').find('li').text()});
                            descr = descr.format({'score': $('div[data-testid*=aggregate-rating__score]:eq(0)', doc).text()});
                            descr = descr.format({'imdb_url': raw_info.url});
                            var director = Array.from($('li.ipc-metadata-list__item:contains("Director"):eq(0)', doc).find('a')).map(function(e){
                                return $(e).text();
                            }).join(', ');
                            descr = descr.format({'director': director});

                            var creators = await getFullCredits(raw_info.url);
                            descr = descr.format({'creator': creators});

                            var actors = Array.from($('div.title-cast__grid', doc).find('a[data-testid="title-cast-item__actor"]:lt(8)')).map(function(e){
                                return $(e).text();
                            }).join(', ');
                            descr = descr.format({'cast': actors});

                            var imdb_descr = $('span[data-testid="plot-xs_to_m"]:eq(0)', doc).text().trim();
                            if (imdb_descr.match(/Read all/)){
                                var full_descr_url = 'https://www.imdb.com/title/' + raw_info.url.match(/tt\d+/)[0] + '/' + $('span[data-testid="plot-xs_to_m"]:eq(0)', doc).find('a').attr('href');
                                imdb_descr = await getFullDescr(full_descr_url);
                            } else if (imdb_descr.match(/Add a Plot/)) {
                                imdb_descr =  `No data from IMDB: ${raw_info.url}`;
                            }
                            descr = descr.format({'en_descr': imdb_descr});
                            $('#go_ptgen').prop('value', '获取成功');
                            $('textarea[name=douban_info]').val(descr);
                        }
                        formatDescr();
                    } else {
                        $('#go_ptgen').prop('value', '获取失败');
                        if (match_link('imdb', url)) {
                            window.open(`https://search.douban.com/movie/subject_search?search_text=${url.match(/tt\d+/)[0]}&cat=1002`, target="_blank");
                        } else {
                            window.open(url, target='_blank');
                        }
                    }
                });
            } else {
                get_bgmdata(raw_info.bgmurl, function(data) {
                    $('#go_ptgen').prop('value', '获取成功');
                    $('textarea[name=douban_info]').val(data.trim());
                    GM_setClipboard(data.trim());
                });
            }
            $('#douban2ptp').click(function(){
                var textarea = $('textarea[name="douban_info"]');
                if (textarea.val().match(/https:\/\/img\d.doubanio.com.*?jpg/)) {
                    var poster = textarea.val().match(/https:\/\/img\d.doubanio.com.*?jpg/)[0];
                    ptp_send_images([poster], used_ptp_img_key)
                    .then(function(new_url){
                        new_url = new_url.toString().split(',').join('\n').replace(/\[.*?\]/g, '');
                        textarea.val(textarea.val().replace(/https:\/\/img\d.doubanio.com.*?jpg/, new_url));
                    }).catch(function(err){
                        alert(err);
                    });
                }
            });
        });

        //mediainfo转换
        $table.append(`<tr style="display:none;"><td width="1%" class="rowhead nowrap" valign="top" align="right">简化MI</td><td width="99%" class="rowfollow" valign="top" align="left" id="mediainfo"></td></tr>`);
        $('#mediainfo').append(`<textarea id="media_info" style="width:700px" rows="20"></textarea><br>`);
        $('#mediainfo').append(`<input type="button" id="simplify" value="简化信息" style="margin-bottom:5px"><br>`);
        $('#mediainfo').append(`<textarea id="clarify_media_info" style="width:700px" rows="20"></textarea><br>`);

        $('#simplify').click(function(){
            var mediainfo_text = simplifyMI($('#media_info').val(), null);
            $('#clarify_media_info').val(mediainfo_text);
        });

        $table.append(`<tr style="display:none;"><td width="1%" class="rowhead nowrap" valign="top" align="right">图片处理</td><td width="99%" class="rowfollow" valign="top" align="left" id="dealimg"></td></tr>`);
        $('#dealimg').append(`<input type="button" id="preview" value="图片预览" style="margin-bottom:5px;">`);
        $('#dealimg').append(`<input type="button" id="getsource" value="获取大图" style="margin-bottom:5px;margin-left:5px">`);
        $('#dealimg').append(`<input type="button" id="send_ptpimg" value="转ptpimg" style="margin-bottom:5px;margin-left:5px">`);
        $('#dealimg').append(`<input type="button" id="send_pixhost" value="转pixhost" style="margin-bottom:5px;margin-left:5px">`);
        $('#dealimg').append(`<input type="button" id="send_imgbox" value="转imgbox" style="margin-bottom:5px;margin-left:5px">`);
        $('#dealimg').append(`<input type="button" id="send_hdbits" value="转HDBits" style="margin-bottom:5px;margin-left:5px">`);
        $('#dealimg').append(`<input type="button" id="get_imgbb" value="imgbb源图" style="margin-bottom:5px;margin-left:5px">`);
        $('#dealimg').append(`<input type="button" id="change" value="字符串替换" style="margin-bottom:5px;margin-left:5px">`);
        $('#dealimg').append(`<input type="text" style="width: 50px; text-align:center; margin-left: 5px" id="img_source" />--<input type="text" style="width: 50px; text-align:center; margin-right: 5px" id="img_dest" /><br>`);
        $('#dealimg').append(`<input type="button" id="350px" value="350px缩略" style="margin-bottom:5px;margin-right:5px">`);
        $('#dealimg').append(`<input type="button" id="enter2space" value="换行->空格" style="margin-bottom:5px;margin-right:5px">`);
        $('#dealimg').append(`<input type="button" id="get_encode" value="图片提取" style="margin-bottom:5px;margin-right:5px">`);
        $('#dealimg').append(`从第<input type="text" style="width: 30px; text-align:center; margin-left: 5px; margin-right:5px" id="start" />张开始每隔<input type="text" style="width: 30px; text-align:center; margin-left: 5px; margin-right:5px" id="step" />张获取其中第<input type="text" style="width: 30px; text-align:center; margin-left: 5px;margin-right:5px" id="number" />张。<br>`);
        $('#dealimg').append(`<font color="red">获取大图目前支持imgbox，pixhost，pter，ttg，瓷器，img4k，其余的可以尝试字符串替换。</font><a href="https://github.com/tomorrow505/auto_feed_js/wiki/%E5%9B%BE%E7%89%87%E5%A4%84%E7%90%86" target="_blank" style="color:blue">→→点我查看教程←←</a><br>`);
        $('#dealimg').append(`<textarea id="picture" style="width:700px" rows="15"></textarea>`);
        $('#dealimg').append(`<div id="imgs_to_show" style="display: none;"></div><br>`);
        $('#dealimg').append(`<div>结果展示 <a href="#" id="up_text" style="color:red;">↑将结果移入输入框</a><br><textarea id="result" style="width:700px;" rows="15"></textarea></div>`);

        var descr = GM_getValue('descr') === undefined ? '': GM_getValue('descr');
        var imgs_to_deal = descr.match(/(\[url=.*?\])?\[img\].*?(png|jpg|webp)\[\/img\](\[\/url\])?/ig);
        try {
            if (imgs_to_deal) {
                $('#picture').val(imgs_to_deal.join('\n'));
            }
        } catch (err) {}

        $('#preview').click((e)=>{
            if (!$('#imgs_to_show').is(":hidden")){
                $('#imgs_to_show').hide();
                return;
            }
            var origin_str = $('#picture').val();
            var imgs_to_show = origin_str.match(/(\[img(?:=\d+)?\])(http[^\[\]]*?(jpg|jpeg|png|gif|webp))/ig).map(item=>{ return item.replace(/\[.*?\]/g, '') });
            if (imgs_to_show.length) {
                $('#imgs_to_show').html('');
                imgs_to_show.map((item)=>{
                    $('#imgs_to_show').append(`<img src=${item} style="max-width: 700px"/><br>`);
                });
                $('#imgs_to_show').show();
            }
        });

        $('#getsource').click((e)=>{
            var origin_str = $('#picture').val();
            get_full_size_picture_urls(null, origin_str, $('#result'), true);
        });

        $('#enter2space').click((e)=>{
            var origin_str = $('#picture').val();
            origin_str = origin_str.replace(/\n/g, ' ');
            $('#picture').val(origin_str);
        })

        $('#send_ptpimg').click((e)=>{
            var origin_str = $('#picture').val();
            images = origin_str.match(/\[img\]http[^\[\]]*?(jpg|png|webp)/ig).map((item)=>{ return item.replace(/\[.*?\]/g, ''); });
            if (images.length) {
                ptp_send_images(images, used_ptp_img_key)
                .then(function(new_urls){
                    new_urls = new_urls.toString().split(',').join('\n');
                    $('#result').val(new_urls);
                }).catch(function(err){
                    alert(err);
                });
            } else {
                alert('请输入图片地址！！');
            }
        });

        $('#send_imgbox').click((e)=>{
            var origin_str = $('#picture').val();
            images = origin_str.match(/\[img\]http[^\[\]]*?(jpg|png|webp)/ig).map((item)=>{ return item.replace(/\[.*?\]/g, ''); });
            if (images.length) {
                var name = 'set your gallary name';
                try {
                    if (descr.match(/Disc Title:/)) {
                        name = descr.match(/Disc Title:(.*)/)[1].trim();
                    } else if (descr.match(/Complete name.?:/i)) {
                        name = descr.match(/Complete name.?:(.*)/)[1].trim();
                    }
                } catch(err) {}
                images.push(name);
                GM_setValue('HDB_images', images.join(', '));
                window.open('https://imgbox.com/', '_blank');
            }
        });

        $('#send_hdbits').click((e)=>{
            var origin_str = $('#picture').val();
            images = origin_str.match(/\[img\]http[^\[\]]*?(jpg|png|webp)/ig).map((item)=>{ return item.replace(/\[.*?\]/g, ''); });
            if (images.length) {
                var name = 'set your gallary name';
                try {
                    if (descr.match(/Disc Title:/)) {
                        name = descr.match(/Disc Title:(.*)/)[1].trim();
                    } else if (descr.match(/Complete name.*?:/i)) {
                        name = descr.match(/Complete name.*?:(.*)/)[1].trim();
                    }
                } catch(err) {console.log(err)}
                images.push(name);
                GM_setValue('HDB_images', images.join(', '));
                window.open('https://img.hdbits.org/', '_blank');
            }
        });

        $('#send_pixhost').click((e)=>{
            if ($('#picture').val().match(/http[^\[\]]*?(jpg|png|webp)/ig).length > 0) {
                var origin_str = $('#picture').val();
                images = origin_str.match(/\[img\]http[^\[\]]*?(jpg|png|webp)/ig).map((item)=>{ return item.replace(/\[.*?\]/g, ''); });
                if (images[0].match(/t.hdbits.org/)) {
                    var name = 'set your gallary name';
                    try {
                        if (descr.match(/Disc Title:/)) {
                            name = descr.match(/Disc Title:(.*)/)[1].trim();
                        } else if (descr.match(/Complete name.?:/i)) {
                            name = descr.match(/Complete name.?:(.*)/)[1].trim();
                        }
                    } catch(err) {}
                    images.push(name);
                    GM_setValue('HDB_images', images.join(', '));
                    window.open('https://pixhost.to/', '_blank');
                } else {
                    pix_send_images(images)
                    .then(function(new_urls) {
                        new_urls = new_urls.toString().split(',');
                        var urls_append = '';
                        if (new_urls.length > 1) {
                            for (var i=0; i<=new_urls.length-2; i+=2) {
                                urls_append += `${new_urls[i]} ${new_urls[i+1]}\n`
                            }
                            if (new_urls.length % 2 == 1) {
                                urls_append += new_urls[new_urls.length-1] + '\n';
                            }
                        } else {
                            urls_append = new_urls[0] + '\n';
                        }
                        $('#result').val(urls_append);
                        alert('转存成功！');
                    })
                    .catch(function(message){
                        alert('转存失败');
                    });
                }
            } else {
                alert('缺少截图');
            }
        });

        $('#change').click((e)=>{
            var origin_str = $('#picture').val();
            if (!$('#img_source').val()) {
                alert("请填写源字符串！")
                return;
            }
            var source_str = $('#img_source').val();
            var dest_str = $('#img_dest').val();
            images = origin_str.match(/http[^\[\]]*?(jpg|png)/ig);
            images.map(item=>{
                var new_img = item.replace(source_str, dest_str);
                origin_str = origin_str.replace(item, new_img);
            });
            $('#picture').val(origin_str);
        });

        $('#get_imgbb').click((e)=>{
            function getibbdoc(url) {
                var p = new Promise((resolve, reject)=>{
                    getDoc(url,null,function(doc){
                        if (doc == 'error') {
                            reject('error');
                        } else {
                            var source_img_url = $('#embed-code-3', doc).val();
                            resolve(source_img_url);
                        }
                    });
                })
                return p;
            }
            function getpostdoc(url) {
                var p = new Promise((resolve, reject)=>{
                    getDoc(url,null,function(doc){
                        var source_img_url = $('#download', doc).attr('href').split('?')[0];
                        resolve(source_img_url);
                    });
                })
                return p;
            }
            var origin_str = $('#picture').val();
            var imgbb_urls = origin_str.match(/\[url=.*?\]\[img\]https?:\/\/i.ibb.co[^\[\]]*?(jpg|png)\[\/img\]\[\/url\]/ig);
            if (imgbb_urls === null) {
                alert("没有监测到imgbb缩略图链接");
            } else {
                var flag = false;
                imgbb_urls.map(item=>{
                    var a = item.match(/https:\/\/ibb.co\/(.*?)\]/)[1];
                    var b = item.match(/https:\/\/i.ibb.co\/(.*?)\//)[1];
                    if (a == b) {
                        flag = true;
                    }
                });
                if (flag) {
                    var imgbb_tasks = [];
                    imgbb_urls.map(item=>{
                        var imgbb_show_url = 'https://ibb.co/' + item.match(/https:\/\/i.ibb.co\/(.*?)\//)[1];
                        var imgbb_p = getibbdoc(imgbb_show_url);
                        imgbb_tasks.push(imgbb_p);
                    })
                    Promise.all(imgbb_tasks).then((data)=>{
                        for (i=0; i<data.length; i++) {
                            origin_str = origin_str.replace(imgbb_urls[i], `${data[i]}`);
                        }
                        get_full_size_picture_urls(null, origin_str, $('#result'), true);
                    })
                } else {
                    get_full_size_picture_urls(null, origin_str, $('#result'), true);
                }
            }
            var postimg_urls = origin_str.match(/https?:\/\/i.postimg.cc[^\[\]]*?(jpg|png)/ig);
            if (postimg_urls === null) {
                // alert("没有监测到postimg链接");
            } else {
                var imgpost_tasks = [];
                postimg_urls.map(item=>{
                    var imgpost_show_url = 'https://postimg.cc/' + item.match(/https:\/\/i.postimg.cc\/(.*?)\//)[1];
                    console.log(imgpost_show_url)
                    var imgpost_p = getpostdoc(imgpost_show_url);
                    imgpost_tasks.push(imgpost_p);
                })
                Promise.all(imgpost_tasks).then((data)=>{
                    console.log(data)
                    for (i=0; i<data.length; i++) {
                        origin_str = origin_str.replace(postimg_urls[i], data[i]);
                    }
                    origin_str = origin_str.match(/\[img\]https?:.*?(jpg|png)\[\/img\]/ig).join('\n');
                    $('#result').val(origin_str);
                })
            }
        });

        $('#get_encode').click((e)=>{
            var origin_str = $('#picture').val();
            console.log(origin_str)
            var dest_str = '';
            var images = origin_str.match(/(\[url=.*?\])?\[img\].*?\[\/img\](\[\/url\])?/ig);
            var start = parseInt($('#start').val() ? $('#start').val(): 1);
            var encode_index = parseInt($('#number').val());
            var step = parseInt($('#step').val());
            for (i = start; i < images.length-step; i += step) {
                console.log(i + encode_index - 2)
                dest_str += images[i + encode_index - 2] + '\n';
            }
            $('#result').val(dest_str);
        });

        $('#350px').click((e)=>{
            var origin_str = $('#picture').val();
            images = origin_str.match(/\[img\]http[^\[\]]*?(jpg|png)\[\/img\]/ig).join('\n');
            if (images.length) {
                $('#result').val(deal_img_350(images));
            }
        });

        $('#up_text').click((e)=>{
            e.preventDefault();
            $('#picture').val($('#result').val() ? $('#result').val(): $('#picture').val());
            $('#result').val('');
        });

        var id_scroll = site_url.split('#')[1];
        if (id_scroll.match(/\?/)) {
            url = id_scroll.split('?')[1];
            id_scroll = id_scroll.split('?')[0];
            if (url.match(/tt/)) {
                url = 'https://www.imdb.com/title/' + url + '/';
            } else if (url.match(/bgmid/)) {
                url = 'https://bangumi.tv/subject/' + url.split('=').pop() +'/';
            } else {
                url = 'https://movie.douban.com/subject/' + url + '/';
            }
            $('input[name=url]').val(url);
        }
        $(`#${id_scroll}`).parent().show();
        document.querySelector(`#${id_scroll}`).scrollIntoView();
        return;
    }, 1000)
}

//长mediainfo转换简洁版mediainfo
function simplifyMI(mediainfo_text, site){
    var simplifiedMI = '';
    if (mediainfo_text.match(/QUICK SUMMARY/i)) {
        return mediainfo_text;
    }
    if (mediainfo_text.match(/Disc INFO/i)) {
        if (site == 'HDT') {
            return mediainfo_text;
        }
        simplifiedMI = full_bdinfo2summary(mediainfo_text);
        return simplifiedMI;
    }

    if (!mediainfo_text.match(/Video[\S\s]{0,5}ID/)) {
        return mediainfo_text;
    }

    var general_info = mediainfo_text.match(/(general[\s\S]*?)?video/i)[0].trim();
    general_info = get_general_info(general_info);
    if (mediainfo_text.match(/encode.{0,10}date.*?:(.*)/i)){
        var release_date = mediainfo_text.match(/encode.{0,10}date.*?:(.*)/i)[1].trim();
        general_info += `Release date.......: ${release_date}`;
    }
    general_info += `${N}${N}`;
    simplifiedMI += general_info;
    try{ var video_info = mediainfo_text.match(/(video[\s\S]*?)audio/i)[0].trim(); } catch (err) { video_info = mediainfo_text.match(/(video[\s\S]*?)Forced/i)[0].trim();}
    video_info = get_video_info(video_info);
    simplifiedMI += video_info;
    try { var audio_info = mediainfo_text.match(/(audio[\s\S]*?)(text)/i)[0].trim(); } catch (err) { audio_info = mediainfo_text.match(/(audio[\s\S]*?)(Forced)/i)[0].trim(); }
    var audio_infos = audio_info.split(/audio.*?\nid.*/i).filter(audio => audio.length > 30);
    for (i=0; i < audio_infos.length; i++){
        audio_info = get_audio_info(audio_infos[i]);
        simplifiedMI += audio_info;
    }
    try{
        var text_info = mediainfo_text.match(/(text[\s\S]*)$/i)[0].trim();
        var text_infos = text_info.split(/text.*?\nid.*/i).filter(text => text.length > 30);
        for (i=0; i < text_infos.length; i++){
            subtitle_info = get_text_info(text_infos[i]);
            simplifiedMI += subtitle_info;
        }
    } catch(err){
        var subtitle_text = `Subtitles..........: no`;
        simplifiedMI += subtitle_text;
    }
    console.log(simplifiedMI);
    return simplifiedMI;
}
function get_general_info(general_info){
    var general_text = "General\n";
    try{
        var filename = general_info.match(/Complete name.*?:(.*)/i)[1].split('/').pop().trim();
        general_text += `Release Name.......: ${filename}${N}`;
    } catch(err) {}
    try{
        var format = general_info.match(/format.*:(.*)/i)[1].trim();
        general_text += `Container..........: ${format}${N}`;
    } catch(err) {}
    try{
        var duration = general_info.match(/duration.*:(.*)/i)[1].trim();
        general_text += `Duration...........: ${duration}${N}`;
    } catch(err) {}
    try {
        var file_size = general_info.match(/file.{0,5}size.*:(.*)/i)[1].trim();
        general_text += `Size...............: ${file_size}${N}`;
    } catch(err) {}

    general_text += `Source(s)..........: ${N}`;

    return general_text;
}
function get_video_info(video_info){
    var video_text = `Video${N}`;
    try{
        var codec = video_info.match(/format.*:(.*)/i)[1].trim();
        video_text += `Codec..............: ${codec}${N}`;
    } catch(err) {}
    try {
        var type = video_info.match(/scan.{0,5}type.*:(.*)/i)[1].trim();
        video_text += `Type...............: ${type}${N}`;
    } catch(err) {}
    try{
        var width = video_info.match(/width.*:(.*)/i)[1].trim();
        var height = video_info.match(/height.*:(.*)/i)[1].trim();
        var resolution = width.replace(/ /g, '').match(/\d+/)[0] + 'x' + height.replace(/ /g, '').match(/\d+/)[0];
        video_text += `Resolution.........: ${resolution}${N}`;
    } catch(err) {}
    try{
        var aspect_ratio = video_info.match(/display.{0,5}aspect.{0,5}ratio.*?:(.*)/i)[1].trim();
        video_text += `Aspect ratio.......: ${aspect_ratio}${N}`;
    } catch(err) {}
    try{
        var bit_rate = video_info.match(/bit.{0,5}rate(?!.*mode).*:(.*)/i)[1].trim();
        video_text += `Bit rate...........: ${bit_rate}${N}`;
    } catch(err) {}
    try{
        var hdr_format = video_info.match(/HDR FORMAT.*:(.*)/i)[1].trim();
        video_text += `HDR format.........: ${hdr_format}${N}`;
    } catch(err) {}
    try{
        var frame_rate = video_info.match(/frame.{0,5}rate.*:(.*fps)/i)[1].trim();
        video_text += `Frame rate.........: ${frame_rate}${N}`;
    } catch(err) {}

    video_text += `${N}`;

    return video_text;
}
function get_audio_info(audio_info){
    var audio_text = `Audio${N}`;
    try{
        var format = audio_info.match(/format.*:(.*)/i)[1].trim();
        audio_text += `Format.............: ${format}${N}`;
    } catch(err) {}
    try{
        var channels = audio_info.match(/channel\(s\).*:(.*)/i)[1].trim();
        audio_text += `Channels...........: ${channels}${N}`;
    } catch(err) {}
    try{
        var bit_rate = audio_info.match(/bit.{0,5}rate(?!.*mode).*:(.*)/i)[1].trim();
        audio_text += `Bit rate...........: ${bit_rate}${N}`;
    } catch(err) {alert(err)}
    try{
        var language = audio_info.match(/language.*:(.*)/i)[1].trim();
        audio_text += `Language...........: ${language}`;
    } catch(err) {}
    var title = '';
    try { title = audio_info.match(/title.*:(.*)/i)[1].trim(); } catch(err){ title = '';}
    audio_text += ` ${title}${N}${N}`;

    return audio_text;
}
function get_text_info(text_info){
    var format = text_info.match(/format.*:(.*)/i)[1].trim();
    var language = text_info.match(/language.*:(.*)/i)[1].trim();
    try{ var title = text_info.match(/title.*:(.*)/i)[1].trim(); } catch(err){ title = '';}
    var subtitle_text = `Subtitles..........: ${language} ${format} ${title}${N}`;
    return subtitle_text;
}

function full_bdinfo2summary(descr) {

    if (!descr.match(/DISC INFO/)) {
        return descr.split(/\[\/quote\]/)[0].replace('[quote]', '');
    }
    var summary = {
        'Disc Title': '',
        'Disc Size': '',
        'Protection': '',
        'BD-Java': '',
        'Playlist': '',
        'Size': '',
        'Length': '',
        'Total Bitrate': '',
        'Protection': '',
        'Video': '',
        'Audio': '',
        'Subtitle': '',
    }

    if (descr.match(/Disc.*?Title:(.*)/i)) {
        summary['Disc Title'] = descr.match(/Disc.*?Title:(.*)/i)[1].trim();
    }
    if (descr.match(/Disc.*?Size:(.*)/i)) {
        summary['Disc Size'] = descr.match(/Disc.*?Size:(.*)/i)[1].trim();
    }
    if (descr.match(/Protection:(.*)/i)) {
        summary['Protection'] = descr.match(/Protection:(.*)/i)[1].trim();
    }
    if (descr.match(/Extras:.*?BD-Java/i)) {
        summary['BD-Java'] = 'Yes';
    } else {
        summary['BD-Java'] = 'No';
    }
    if (descr.match(/PLAYLIST[\s\S]{3,30}?Name:(.*)/i)) {
        summary['Playlist'] = descr.match(/PLAYLIST[\s\S]{3,30}?Name:(.*)/i)[1].trim();
    }
    if (descr.match(/PLAYLIST[\s\S]{3,90}?Length:(.*)/i)) {
        summary['Length'] = descr.match(/PLAYLIST[\s\S]{3,90}?Length:(.*)/i)[1].trim();
    }
    if (descr.match(/PLAYLIST[\s\S]{3,190}?Size:(.*)/i)) {
        summary['Size'] = descr.match(/PLAYLIST[\s\S]{3,190}?Size:(.*)/i)[1].trim();
    }
    if (descr.match(/PLAYLIST[\s\S]{3,290}?Total.*?Bitrate:(.*)/i)) {
        summary['Total Bitrate'] = descr.match(/PLAYLIST[\s\S]{3,290}?Total.*?Bitrate:(.*)/i)[1].trim();
    }

    if (descr.match(/Video:[\s\S]{0,20}Codec/i)) {
        var video_info = descr.match(/Video:[\s\S]{0,300}-----------([\s\S]*)/i)[1].split(/audio/i)[0].trim();
        summary['Video'] = video_info.split('\n').map(e=>{
            var info = e.split(/\s{5,15}/).filter(function(ee){if (ee.trim() && ee.trim() != '[/quote]') {return ee.trim();}});
            return info.join(' / ').trim();
        }).join('\nVideo: ').replace(/(\nVideo: )+$/, '');
    }

    if (descr.match(/SUBTITLES:[\s\S]{0,20}Codec/i)) {
        var subtitle_info = descr.match(/SUBTITLES:[\s\S]{0,300}-----------([\s\S]*)/i)[1].split(/FILES/i)[0].trim();
        summary['Subtitle'] = subtitle_info.split('\n').map(e=>{
            var info = e.split(/\s{5,15}/).filter(function(ee){if (ee.trim() && ee.trim() != '[/quote]') return ee.trim();});
            return info.join(' / ').trim();
        }).join('\nSubtitle: ').split('[/quote]')[0].replace(/(\nSubtitle: )+$/, '');
    }
    if (descr.match(/Audio:[\s\S]{0,20}Codec/i)) {
        var audio_info = descr.match(/Audio:[\s\S]{0,300}-----------([\s\S]*)/i)[1].split(/subtitles|\[.*?quote\]/i)[0].trim();
        summary['Audio'] = audio_info.split('\n').map(e=>{
            var info = e.split(/\s{5,15}/).filter(function(ee){if (ee.trim() && ee.trim() != '[/quote]') return ee.trim();});
            return info.join(' / ').trim();
        }).join('\nAudio: ');
    }

    var quick_summary = '';
    for (key in summary) {
        if (summary[key]) {
            quick_summary += key + ': ' + summary[key] + '\n';
        }
    }

    return quick_summary;
}

function add_douban_info_table(container, width, data) {
    data = data.data;
    if (data.cast.split('/').length > 9) {
        data.cast = data.cast.split('/').slice(0, 9).join('/');
    }
    if (data.director.split('/').length > 2) {
        data.director = data.director.split('/').slice(0, 2).join('/');
    }
    if (data.region.split('/').length > 4) {
        data.region = data.region.split('/').slice(0, 4).join('/') + '/<br>' + data.region.split('/').slice(4).join('/');
    }
    container.append(`<table class="contentlayout" cellspacing="0"><tbody>
        <tr>
            <td rowspan="3" width="2"><img src="${data.image}" style="max-width:${width}px;border:0px;" alt></td>
            <td colspan="2"><h1><a href="https://movie.douban.com/subject/${data.id}" target="_blank">${data.title}</a> (${data.year})</h1><h3>${data.aka}</h3></td>
        </tr>
        <tr>
            <td><table class="content" cellspacing="0" id="imdbinfo" style="white-space: nowrap;"><tbody>
                <tr><th>评分</th><td>${data.average} (${data.votes}人评价)</td></tr>
                <tr><th>类型</th><td>${data.genre}</td></tr>
                <tr><th>国家/地区</th><td>${data.region}</td></tr>
                <tr><th>导演</th><td>${data.director.replace(/\//g, '<br>    ')}</td></tr>
                <tr><th>语言</th><td>${data.language}</td></tr>
                <tr><th>上映日期</th><td>${data.releaseDate.split('/').join('<br>')}</td></tr>
                <tr><th>片长</th><td>${data.runtime}</td></tr>
                <tr><th>演员</th><td>${data.cast.replace(/\//g, '<br>    ')}</td></tr>
            </tbody></table></td>
            <td id="plotcell"><table class="content" cellspacing="0"><tbody>
                <tr><th>简介</th></tr><tr><td>${data.summary == "" ? '本片暂无简介' : '　　' + data.summary.replace(/ 　　/g, '<br>　　')}</td></tr>
            </tbody></table></td>
        </tr>
        <tr>
            <td colspan="2" id="actors"></td>
        </tr>
    </tbody></table>`);
}

async function getFullCredits(url) {
    return new Promise(resolve => {
        GM_xmlhttpRequest({
            method: 'GET',
            url: 'https://www.imdb.com/title/{imdbid}/fullcredits?ref_=tt_ov_wr'.format({'imdbid': url.match(/tt\d+/)[0]}),
            onload : function (responseDetail) {
                if (responseDetail.status === 200) {
                    let doc = page_parser(responseDetail.responseText);
                    var creators = Array.from($('#writer', doc).next().find('td.name').map((i,e) => {
                        return $(e).find('a').text().replace(/\n/g, '');
                    })).join(', ');
                    resolve(creators);
                }
            }
        });
    });
}

async function getFullDescr(url) {
    return new Promise(resolve => {
        getDoc(url, null, function (docx) {
            imdb_descr = $('div[data-testid="sub-section-summaries"]', docx).text().trim();
            resolve(imdb_descr);
        });
    });
}

async function getimdbpage(url) {
    return new Promise(resolve => {
        getDoc(url, null, function (docx) {
            resolve(docx);
        });
    });
}

async function getPoster(url) {
    return new Promise(resolve => {
        getDoc(url, null, function (docx) {
            var poster = '';
            try {
                poster = $('img[src*="m.media-amazon.com/images"]', docx).attr('src').split(',')[0].trim();
                poster = $('div[style*="calc(50% + 0px)"]', docx).find('img').attr('src');
            } catch(err) {
                poster = '';
            }
            resolve(poster);
        });
    });
}

async function getAKAtitle(url) {
    return new Promise(resolve => {
        var search_url = 'https://passthepopcorn.me/ajax.php?' + encodeURI(`action=torrent_info&imdb=${url}&fast=1`)
        getJson(search_url, null, function(data){
            if (data.length) {
                data = data[0];
                resolve(data.title);
            }
        })
    });
}

function getDoubanPoster(doc) {
    try {
        return $('#mainpic img', doc)[0].src.replace(
            /^.+(p\d+).+$/,
            (_, p1) => `https://img9.doubanio.com/view/photo/l_ratio_poster/public/${p1}.jpg`
        );
    } catch (e) {
        return null;
    }
}

function getTitles(doc) {
    let isChinese = false;
    const chineseTitle = doc.title.replace(/\(豆瓣\)$/, '').trim();
    const originalTitle = $('#content h1>span[property]', doc).text().replace(chineseTitle, '').trim() || ((isChinese = true), chineseTitle);
    try {
        let akaTitles = $('#info span.pl:contains("又名")', doc)[0].nextSibling.textContent.trim().split(' / ');
        const transTitle = isChinese ? akaTitles.find(e => {return e.match(/[a-z]/i);}) || chineseTitle: chineseTitle;
        const priority = e => {
            if (e === transTitle) {
                return 0;
            }
            if (e.match(/\(港.?台\)/)) {
                return 1;
            }
            if (e.match(/\([港台]\)/)) {
                return 2;
            }
            return 3;
        };
        akaTitles = akaTitles.sort((a, b) => priority(a) - priority(b)).filter(e => e !== transTitle);
        return [{
            chineseTitle: chineseTitle,
            originalTitle: originalTitle,
            translatedTitle: transTitle,
            alsoKnownAsTitles: akaTitles
            },
            isChinese
        ];
    } catch (e) {
        return [{
            chineseTitle: chineseTitle,
            originalTitle: originalTitle,
            translatedTitle: chineseTitle,
            alsoKnownAsTitles: []
            },
            isChinese
        ];
    }
}

function getYear(doc) {
    return parseInt($('#content>h1>span.year', doc).text().slice(1, -1));
}

function getRegions(doc) {
    try {
        return $('#info span.pl:contains("制片国家/地区")', doc)[0].nextSibling.textContent.trim().split(' / ');
    } catch (e) {
        return [];
    }
}

function getGenres(doc) {
    try {
        return $('#info span[property="v:genre"]', doc).toArray().map(e => e.innerText.trim());
    } catch (e) {
        return [];
    }
}

function getLanguages(doc) {
    try {
        return $('#info span.pl:contains("语言")', doc)[0].nextSibling.textContent.trim().split(' / ');
    } catch (e) {
        return [];
    }
}

function getReleaseDates(doc) {
    try {
        return $('#info span[property="v:initialReleaseDate"]', doc).toArray().map(e => e.innerText.trim()).sort((a, b) => new Date(a) - new Date(b));
    } catch (e) {
        return [];
    }
}

function getDurations(doc) {
    try {
        return $('span[property="v:runtime"]', doc).text();
    } catch (e) {
        return [];
    }
}

function getEpisodeDuration(doc) {
    try {
        return $('#info span.pl:contains("单集片长")', doc)[0].nextSibling.textContent.trim();
    } catch (e) {
        return null;
    }
}

function getEpisodeCount(doc) {
    try {
        return parseInt($('#info span.pl:contains("集数")', doc)[0].nextSibling.textContent.trim());
    } catch (e) {
        return null;
    }
}

function getTags(doc) {
    return $('div.tags-body>a', doc).toArray().map(e => e.textContent);
}

function getDoubanScore(doc) {
    const $interest = $('#interest_sectl', doc);
    const ratingAverage = parseFloat(
      $interest.find('[property="v:average"]').text()
    );
    const ratingVotes = parseInt($interest.find('[property="v:votes"]').text());
    return {
        rating: ratingAverage,
        ratingCount: ratingVotes,
        ratingHistograms: {
            'Douban Users': {
            aggregateRating: ratingAverage,
            demographic: 'Douban Users',
            totalRatings: ratingVotes
        }
      }
    };
}

function getDescription(doc) {
    try {
        return Array.from($('#link-report-intra>[property="v:summary"],#link-report-intra>span.all.hidden', doc)[0].childNodes)
            .filter(e => e.nodeType === 3)
            .map(e => e.textContent.trim())
            .join('\n');
    } catch (e) {
        return null;
    }
}

function addComma(x) {
    var parts = x.toString().split(".");
    parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    return parts.join(".");
}

function getDirector(doc) {
    try{
        return $('#info span.pl:contains("导演")', doc)[0].nextSibling.nextSibling.textContent.trim().split(' / ');
    } catch (err) {
        return [];
    }
}

function getWriters(doc) {
    try{
        return $('#info span.pl:contains("编剧")', doc)[0].nextSibling.nextSibling.textContent.trim().split(' / ');
    } catch (err) {
        return [];
    }
}

function getCasts(doc) {
    try{
        return $('#info span.pl:contains("主演")', doc)[0].nextSibling.nextSibling.textContent.trim().split(' / ');
    } catch (err) {
        return [];
    }
}

async function getIMDbScore(ID, timeout = TIMEOUT) {
    if (ID) {
        return new Promise(resolve => {
            GM_xmlhttpRequest({
                method: 'GET',
                url: `http://p.media-imdb.com/static-content/documents/v1/title/tt${ID}/ratings%3Fjsonp=imdb.rating.run:imdb.api.title.ratings/data.json`,
                headers: {
                    referrer: 'http://p.media-imdb.com/'
                },
                timout: timeout,
                onload: x => {
                    try {
                        const e = JSON.parse(x.responseText.slice(16, -1));
                        resolve(e.resource);
                    } catch (e) {
                        console.warn(e);
                        resolve(null);
                    }
                },
                ontimeout: e => {
                    console.warn(e);
                    resolve(null);
                },
                onerror: e => {
                    console.warn(e);
                    resolve(null);
                }
            });
        });
    } else {
        return null;
    }
}

async function getIMDbID(doc) {
    try {
        return $('#info span.pl:contains("IMDb:")', doc).parent().text().match(/tt(\d+)/)[1];
    } catch (e) {
      return null;
    }
}

async function getCelebrities(doubanid, timeout = TIMEOUT) {
    var awardurl = 'https://movie.douban.com/subject/{a}/celebrities/'.format({'a': doubanid});
    return new Promise(resolve => {
        getDoc(awardurl, null, function(doc){
            const entries = $('#celebrities>div.list-wrapper', doc).toArray().map(e => {
                const [positionChinese, positionForeign] = $(e).find('h2').text().match(/([^ ]*)(?:$| )(.*)/).slice(1, 3);
                const people = $(e).find('li.celebrity').toArray().map(e => {
                    let [nameChinese, nameForeign] = $(e).find('.info>.name').text().match(/([^ ]*)(?:$| )(.*)/).slice(1, 3);
                    if (!nameChinese.match(/[\u4E00-\u9FCC]/)) {
                        nameForeign = nameChinese + ' ' + nameForeign;
                        nameChinese = null;
                    }
                    const [roleChinese, roleForeign, character] = $(e).find('.info>.role').text().match(/([^ ]*)(?:$| )([^(]*)(?:$| )(.*)/).slice(1, 4);
                    return {
                        name: {
                            chs: nameChinese,
                            for: nameForeign
                        },
                        role: {
                            chs: roleChinese,
                            for: roleForeign
                        },
                        character: character.replace(/[()]/g, '')
                    };
                });
                return [
                    positionForeign.toLowerCase(),
                    {
                        position: positionChinese,
                        people: people
                    }
                ];
            });
            if (entries.length) {
                jsonCeleb = entries;
            } else {
                jsonCeleb = null;
            }
            resolve(jsonCeleb);
        });
    });
}

async function getAwards(doubanid, timeout = TIMEOUT) {
    var awardurl = 'https://movie.douban.com/subject/{a}/awards/'.format({'a': doubanid});
    return new Promise(resolve => {
        getDoc(awardurl, null, function(doc){
            resolve($('div.awards', doc).toArray().map(function(e){
                const $title = $(e).find('.hd>h2');
                const $awards = $(e).find('.award');
                return {
                    name: $title.find('a').text().trim(),
                    year: parseInt($title.find('.year').text().match(/\d+/)[0]),
                    awards: $awards.toArray().map(e => ({
                        name: $(e).find('li:first-of-type').text().trim(),
                        people: $(e).find('li:nth-of-type(2)').text().split('/').map(e => e.trim())
                    }))
                };
            }));
        });
    })
}

async function getInfo(doc, raw_info) {
    const [titles, isChinese] = getTitles(doc),
        year = getYear(doc),
        regions = getRegions(doc),
        genres = getGenres(doc),
        languages = getLanguages(doc),
        releaseDates = getReleaseDates(doc),
        durations = getDurations(doc),
        episodeDuration = getEpisodeDuration(doc),
        episodeCount = getEpisodeCount(doc),
        tags = getTags(doc),
        DoubanID = raw_info.dburl.match(/subject\/(\d+)/)[1],
        DoubanScore = getDoubanScore(doc),
        poster = getDoubanPoster(doc),
        description = getDescription(doc);
        directors = getDirector(doc);
        writers = getWriters(doc);
        casts = getCasts(doc);

    let IMDbID, IMDbScore, awards, celebrities;

    const concurrentFetches = [];

    concurrentFetches.push(
        // IMDb Fetch
        getIMDbID(doc)
        .then(e => {
            IMDbID = e;
            return getIMDbScore(IMDbID);
        })
        .then(e => {
            IMDbScore = e;
            return getAwards(DoubanID);
        })
        .then(e => {
            awards = e;
            return getCelebrities(DoubanID);
        })
        .then(e => {
            celebrities = e;
        })

    );
    await Promise.all(concurrentFetches);
    if (IMDbScore && IMDbScore.title) {
        if (isChinese) {
            if (!titles.translatedTitle.includes(IMDbScore.title)) {
                titles.alsoKnownAsTitles.push(titles.translatedTitle);
                const index = titles.alsoKnownAsTitles.indexOf(IMDbScore.title);
                if (index >= 0) {
                    titles.alsoKnownAsTitles.splice(index, 1);
                }
                titles.translatedTitle = IMDbScore.title;
            }
        } else {
            if (!titles.originalTitle.includes(IMDbScore.title) &&titles.alsoKnownAsTitles.indexOf(IMDbScore.title) === -1) {
              titles.alsoKnownAsTitles.push(IMDbScore.title);
            }
        }
    }
    return {
        poster: poster,
        titles: titles,
        year: year,
        regions: regions,
        genres: genres,
        languages: languages,
        releaseDates: releaseDates,
        durations: durations,
        episodeDuration: episodeDuration,
        episodeCount: episodeCount,
        tags: tags,
        DoubanID: DoubanID,
        DoubanScore: DoubanScore,
        IMDbID: IMDbID,
        IMDbScore: IMDbScore,
        description: description,
        directors: directors,
        writers: writers,
        casts: casts,
        awards: awards,
        celebrities: celebrities
    };
}

function formatInfo(info) {
    let temp;
    const infoText = (
        (info.poster ? `[img]${info.poster}[/img]\n\n` : '') +
        '◎译　　名　' + [info.titles.translatedTitle].concat(info.titles.alsoKnownAsTitles).join(' / ') + '\n' +
        '◎片　　名　' + info.titles.originalTitle + '\n' +
        '◎年　　代　' + info.year + '\n' +
        (info.regions.length ? '◎产　　地　' + info.regions.join(' / ') + '\n' : '') +
        (info.genres.length ? '◎类　　别　' + info.genres.join(' / ') + '\n' : '') +
        (info.languages.length ? '◎语　　言　' + info.languages.join(' / ') + '\n' : '') +
        (info.releaseDates.length ? '◎上映日期　' + info.releaseDates.join(' / ') + '\n' : '') +
        ((info.IMDbScore && info.IMDbScore.rating) ? `◎IMDb评分  ${Number(info.IMDbScore.rating).toFixed(1)}/10 from ${addComma(info.IMDbScore.ratingCount)} users\n` : '') +
        (info.IMDbID ? `◎IMDb链接  https://www.imdb.com/title/tt${info.IMDbID}/\n` : '') +
        ((info.DoubanScore && info.DoubanScore.rating) ? `◎豆瓣评分　${info.DoubanScore.rating}/10 from ${addComma(info.DoubanScore.ratingCount)} users\n` : '') +
        (info.DoubanID ? `◎豆瓣链接　https://movie.douban.com/subject/${info.DoubanID}/\n` : '') +
        ((info.durations && info.durations.length) ? '◎片　　长　' + info.durations + '\n' : '') +
        (info.episodeDuration ? '◎单集片长　' + info.episodeDuration + '\n' : '') +
        (info.episodeCount ? '◎集　　数　' + info.episodeCount + '\n' : '') +
        (info.celebrities ? info.celebrities.map(e => {
            const position = e[1].position;
            let title = '◎';
            switch (position.length) {
                case 1:
                    title += '　  ' + position + '　  　';
                    break;
                case 2:
                    title += position.split('').join('　　') + '　';
                    break;
                case 3:
                    title += position.split('').join('  ') + '　';
                    break;
                case 4:
                    title += position + '　';
                    break;
                default:
                    title += position + '\n　　　　　　';
            }
            const people = e[1].people.map((f, i) => {
                const name = f.name.chs ? (f.name.for ? f.name.chs + ' / ' + f.name.for : f.name.chs) : f.name.for;
                return (i > 0 ? '　　　　　　' : '') + name + (f.character ? ` (${f.character})` : '');
            }).join('\n');
            return title + people;
        }).join('\n') + '\n\n' : '') +
        (info.tags.length ? '◎标　　签　' + info.tags.join(' | ') + '\n\n' : '') +
        (info.description ? '◎简　　介　\n' + info.description.replace(/^|\n/g, '\n　　') + '\n\n' : '◎简　　介　\n\n　　暂无相关剧情介绍') +
        (info.awards.length ? '◎获奖情况　\n\n' + info.awards.map(e => {
            const awardName = '　　' + e.name + ' (' + e.year + ')\n';
            const awardItems = e.awards.map(e => '　　' + e.name + (e.people ? ' ' + e.people : '')).join('\n');
            return awardName + awardItems;
        }).join('\n\n') + '\n\n' : '')
        ).trim();
    return infoText;
}

function get_douban_info(raw_info) {
    getDoc(raw_info.dburl, null, function(doc) {
        const infoGenClickEvent = async e => {
            var data = formatInfo(await getInfo(doc, raw_info));
            raw_info.descr = data + '\n\n' + raw_info.descr;
            var thanks = raw_info.descr.match(/\[quote\].*?感谢原制作者发布。.*?\[\/quote\]/);
            if (thanks) {
                raw_info.descr = thanks[0] + '\n\n' + raw_info.descr.replace(thanks[0], '').trim();
            }
            if (!location.href.match(/usercp.php\?action=persona|pter.*upload.php|piggo.me.*upload.php|^https:\/\/movie.douban.com|^https?:\/\/\d+.\d+.\d+.\d+.*5678/)){
                if (raw_info.descr.match(/http(s*):\/\/www.imdb.com\/title\/tt(\d+)/i)){
                    raw_info.url = raw_info.descr.match(/http(s*):\/\/www.imdb.com\/title\/tt(\d+)/i)[0] + '/';
                }
                if (raw_info.descr.match(/类[\s\S]{0,5}别[\s\S]{0,30}纪录片/i)) {
                    raw_info.type = '纪录';
                } else if (raw_info.descr.match(/类[\s\S]{0,5}别[\s\S]{0,30}动画/i)) {
                    raw_info.type = '动漫';
                }
                set_jump_href(raw_info, 1);
                douban_button.value = '获取成功';
                $('#textarea').val(data);
                if ($('#input_box').length && !$('#input_box').val()) {
                    try{
                        raw_info.url = match_link('imdb', raw_info.descr);
                        $('#input_box').val(raw_info.url);
                        var search_name = get_search_name(raw_info.name);
                        try {
                            var imdbid = raw_info.url.match(/tt\d+/i)[0];
                            var imdbno = imdbid.substring(2);
                            var container = $('#forward_r');
                            add_search_urls(container, imdbid, imdbno, search_name, 0);
                        } catch(err) {}
                    } catch(err) {}
                }
                GM_setClipboard(data);
                rebuild_href(raw_info);
            } else if (site_url.match(/pter.*upload.php|piggo.*upload.php|^https?:\/\/\d+.\d+.\d+.\d+.*5678/)) {
                console.log(site_url.match(/pter.*upload.php|piggo.*upload.php|\d+.\d+.\d+.\d+.*5678/)[0])
                $('#descr').val(data + '\n\n' + $('#descr').val());
                $('.get_descr[value=正在获取]').val("获取成功");
                if (!$('input[name=small_descr]').val()) {
                    $('input[name=small_descr]').val(get_small_descr_from_descr(data, $('input[name=name]').val()));
                }
                if (!$('input[name=url]').val()) {
                    $('input[name=url]').val(match_link('imdb', data));
                }
                if (!$('input[name=douban]').val()) {
                    $('input[name=douban]').val(match_link('douban', data));
                }
            } else if (site_url.match(/^https:\/\/movie.douban.com/)) {
                GM_setClipboard(data);
                $('#copy').text('完成');
            } else {
                $('textarea[name="douban_info"]').val(raw_info.descr);
                $('#go_ptgen').prop('value', '获取成功');
            };
        }
        infoGenClickEvent();
    });
}

function add_picture_transfer() {
    GM_addStyle(
        `.delete_div {
        position: fixed;
        bottom: 30%;
        right: 27%;
        width: 46%;
        color:white;
    }`);
    $(`body`).append(`
        <div class="delete_div" style="align:center; color:white; display:none; border-radius: 5px">
            <div id="rehost" style="width: 100%; margin:auto;"></div>
        </div>`);
    $('#rehost').append(`<td style="width:100%; border: none; background-color:rgba(72,101,131,0.7); padding: 6px" valign="top" align="left" id="rehostimg"></td>`);

    $('#rehostimg').append(`<b>选择转存站点(catbox只有源图无缩略图)：</b>`)
    for (key in used_rehost_img_info){
        $('#rehostimg').append(`<input style="vertical-align:middle" type="radio" name="rehost_site" value="${key}">${key}`);
    }
    $('#rehostimg').append(`<input style="vertical-align:middle;margin-left:10px;color:red;" type="button" name="close_panel" value="X">`);
    $('input[name="close_panel"]').click(()=>{
        $('input[name="img_url"]').val('');
        $('textarea[name="show_result"]').val('');
        $('div.delete_div').hide();
    });

    $(`input:radio[value="freeimage"]`).prop('checked', true);
    $('#rehostimg').append(`<br><br>`);

    $('#rehostimg').append(`<label><b>输入想要转存的图片链接:</b></label><input type="text" name="img_url" style="width: 350px; margin-left:5px">`);
    $('#rehostimg').append(`<input type="button" id="go_rehost" value="开始转存" style="margin-left:5px"><br><br>`);
    if (site_url.match(/springsunday/)) {
        $('#go_rehost').css({'color': 'white', 'background' :'url(https://springsunday.net/styles/Maya/images/btn_submit_bg.gif) repeat left top', 'border': '1px black'});
    }
    $('#rehostimg').append(`<textarea name="show_result" style="width:560px" rows="6"></textarea><br>`);
    $('#go_rehost').click(function(){
        var rehost_site = $('input[name="rehost_site"]:checked').val();
        var img_url = $('input[name="img_url"]').val();
        if (used_rehost_img_info[rehost_site]['api-key'] || rehost_site == 'catbox') {
            if (!img_url.match(/https?:\/\/.*?(png|jpg|webp)/)) {
                alert('请输入图片链接！！');
                return;
            }
        } else {
            alert('没有APIKEY无法完成转存工作！！');
            return;
        }
        $('#go_rehost').prop('value', '正在转存');
        rehost_single_img(rehost_site, img_url)
        .then(function(result){
            $('textarea[name="show_result"]').val(result);
            $('#go_rehost').prop('value', '转存成功');
        })
        .catch(function(err){
            $('#go_rehost').prop('value', '转存失败');
            alert(err);
        })
    });
    $('a:contains("单图转存"),a:contains("海报转存")').click((e)=>{
        e.preventDefault();
        if ($('div.delete_div').is(":hidden")) {
            $('div.delete_div').show();
        } else {
            $('div.delete_div').hide();
        }
    });
}

if (site_url.match(/^https:\/\/pterclub.com\/upload.php/)) {
    $('input[name=url]:first').after(`<input type="button" value="获取简介" class="get_descr" data="url" />`);
    $('input[name=douban]').after(`<input type="button" value="获取简介" class="get_descr" data="douban" />`);
    $('.get_descr').click((e)=>{
        var tmp_raw_info = {'url': '', 'dburl': '', 'descr': ''};
        var link_type = $(e.target).attr('data');
        if ($(`input[name="${link_type}"]`).val()) {
            var link = $(`input[name="${link_type}"]`).val();
            $(e.target).prop('value', '正在获取');
            var flag = true;
            if (link_type == 'url') {
                falg = true;
                tmp_raw_info.url = link;
            } else {
                flag = false;
                tmp_raw_info.dburl = link;
            }
            create_site_url_for_douban_info(tmp_raw_info, flag).then(function(tmp_raw_info){
                console.log(tmp_raw_info)
                if (tmp_raw_info.dburl){
                    get_douban_info(tmp_raw_info);
                }
            }, function(err) {
                console.log(err);
                $(e.target).prop('value', '获取失败');
                if (link_type == 'url') {
                    window.open(`https://search.douban.com/movie/subject_search?search_text=${link.match(/tt\d+/)[0]}&cat=1002`, target="_blank");
                } else {
                    window.open(url, target='_blank');
                }
            });
        } else {
            alert("请输入合适的链接！！！")
        }
    })
}

if (site_url.match(/^https:\/\/piggo.me\/upload.php/)) {
    $('input[name=url]').parent().after(`<div><input type="button" value="获取豆瓣" class="get_descr" data="url" /></div>`);
    $('input[name=pt_gen]').parent().after(`<div><input type="button" value="获取豆瓣" class="get_descr" data="pt_gen" /></div>`);
    $('.btn-get-pt-gen').hide();
    $('.get_descr').click((e)=>{
        var tmp_raw_info = {'url': '', 'dburl': '', 'descr': ''};
        var link_type = $(e.target).attr('data');
        if ($(`input[name="${link_type}"]`).val()) {
            var link = $(`input[name="${link_type}"]`).val();
            $(e.target).prop('value', '正在获取');
            var flag = true;
            if (link_type == 'url') {
                falg = true;
                tmp_raw_info.url = link;
            } else {
                flag = false;
                tmp_raw_info.dburl = link;
            }
            create_site_url_for_douban_info(tmp_raw_info, flag).then(function(tmp_raw_info){
                console.log(tmp_raw_info)
                if (tmp_raw_info.dburl){
                    get_douban_info(tmp_raw_info);
                }
            }, function(err) {
                console.log(err);
                $(e.target).prop('value', '获取失败');
                if (link_type == 'url') {
                    window.open(`https://search.douban.com/movie/subject_search?search_text=${link.match(/tt\d+/)[0]}&cat=1002`, target="_blank");
                } else {
                    window.open(url, target='_blank');
                }
            });
        } else {
            alert("请输入合适的链接！！！")
        }
    })
}

if (site_url.match(/jpopsuki.eu.*torrents.php\?id=/)) {
    $('tr.group_torrent').find("a:contains(RP)").map((index,e)=>{
        $(e).after(` | <a href="https://jpopsuki.eu/torrents.php?id=${site_url.match(/id=(\d+)/)[1]}&torrentid=${$(e).attr('href').match(/id=(\d+)/)[1]}">PL</a>`);
    });
}

//添加豆瓣到ptgen跳转
if(site_url.match(/^https:\/\/movie.douban.com\/subject\/\d+/i) && if_douban_jump){
    $(document).ready(function () {
        $('#info').append(`<span class="pl">描述信息: </span><a id="copy">复制</a>`);
        $('#copy').click(e=>{
            var tmp_raw_info = {'url': '', 'dburl': match_link('douban', site_url), 'descr': ''};
            get_douban_info(tmp_raw_info);
        });

        var year = $('span.year').text().match(/\d+/)[0];
        var ch_name = $('h1').find('span:first').text().split(' ')[0];

        try {
            var imdbid = $('#info').html().match(/tt\d+/i)[0];
            var imdb_url = 'https://www.imdb.com/title/' + imdbid;
            setTimeout(function(){
                if (!$('#info').find('a[href*="www.imdb.com"]').length) {
                    $("span.pl:contains('IMDb')").get(0).nextSibling.nodeValue = '';
                    $("span.pl:contains('IMDb')").after(`<a href="${imdb_url}" target="_blank"> ${imdbid}</a>`);
                }
            },1000);
            getDoc(imdb_url, null, function(doc){
                var en_name = $('h1', doc).text();
                if ($('span.pl:contains("季数")').length) {
                    var en_name02 = $('div:contains("All episodes"):last', doc).parent().parent().prev().text();
                    en_name = en_name02 ? en_name02: en_name;
                    var number = $('#season option:selected').text();
                    if (!number) { number = $('span.pl:contains("季数")')[0].nextSibling.textContent.trim(); }
                    if (number.length < 2) { number = '0' + number; }
                    en_name = en_name + ' S' + number;
                }
                var name = `${ch_name} ${en_name} ${year} `.replace(/ +/g, ' ').replace(/ /g, '.').replace(/:\./, '.').replace('-.', '-').replace('..', '.').replace('.-', '-');
                $('#info').append(`<br><span class="pl">影视名称:</span> ${name}<br>`);
            });
        } catch (err) {
            var en_name = null;
            var aka_names = $('#info span.pl:contains("又名")')[0].nextSibling.textContent.trim();
            aka_names.split('/').forEach((e,index)=>{
                if (e.match(/^[a-zA-Z0-9 '-:]*$/)) {
                    en_name = e;
                }
            });
            var name = `${ch_name} ${en_name} ${year} `.replace(/ +/g, ' ').replace(/ /g, '.').replace(/:\./, '.').replace('-.', '-').replace('..', '.').replace('.-', '-');
            $('#info').append(`<br><span class="pl">影视名称:</span> ${name}<br>`);
        }

        $('#mainpic').append(`<br><a href="#">海报转存</a>`);
        add_picture_transfer();
        var poster = $('#mainpic img')[0].src.replace(
            /^.+(p\d+).+$/,
            (_, p1) => `https://img9.doubanio.com/view/photo/l_ratio_poster/public/${p1}.jpg`
        );
        $('input[name=img_url]').val(poster);

        try {
            if($('#info').html().match(/tt\d+/i)){
                var imdbid = $('#info').html().match(/tt\d+/i)[0];
                var imdbno = imdbid.substring(2);
                var search_name = $('h1').text().trim().match(/[a-z ]{2,200}/i)[0];
                search_name = search_name.replace(/season/i, '');
                if (!search_name.trim()) {
                    try{
                        search_name = $('#info span.pl:contains("又名")')[0]
                        .nextSibling.textContent.trim()
                        .split(" / ")[0];
                    } catch(err) {}
                }
                var $container = $('h1');
                add_search_urls($container, imdbid, imdbno, search_name, 2);
            }
        } catch(err) {console.log(err)}
    });
    return;
}

if (site_url.match(/^https:\/\/www.imdb.com\/title\/tt\d+/) && if_imdb_jump) {
    var imdbid = site_url.match(/tt\d+/i)[0];
    var imdbno = imdbid.substring(2);
    var search_name = $('title').text().trim().split(/ \(\d+\) - /)[0];
    search_name = search_name.replace(/season/i, '');
    var $container = $('h1[data-testid*=pageTitle]');
    add_search_urls($container, imdbid, imdbno, search_name, 1);
    $('.search_urls').find('a').css('color', 'yellow');
    return;
}

if (site_url.match(/^https:\/\/(music|book).douban.com\/subject\/\d+/)) {
    var source_type = '音乐';
    if (site_url.match(/book/)) {
        source_type = '书籍';
    }
    $('#mainpic').append(`<br><a href="#">海报转存</a>`);
    add_picture_transfer();
    var poster = $('#mainpic img')[0].src.replace(
        /^.+(p\d+).+$/,
        (_, p1) => `https://img9.doubanio.com/view/photo/l_ratio_poster/public/${p1}.jpg`
    );
    $('input[name=img_url]').val(poster);
    function walk_Dom(n) {
        do {
            if (n.nodeName == 'SPAN' && n.className == 'pl') {
                n.innerHTML = '◎' + n.innerHTML.trim();
            } else if (n.nodeName == 'BR') {
                n.innerHTML = '\r\n';
            }
            if (n.hasChildNodes()) {
                walk_Dom(n.firstChild);
            } else {
                if (n.nodeType !=1){
                    raw_info = raw_info + n.textContent.trim();
                }
            }
            n = n.nextSibling;
        } while (n);
        return raw_info;
    }
    var raw_info = '';
    var poster = `[img]${$('div#mainpic').find('a').prop('href')}[/img]\n`;
    var info = walk_Dom($('#info')[0].cloneNode(true));
    info = info.replace(/◎/g, '\n◎');
    info = info.replace(/:/g, '：');
    info = poster + info;
    try {
        info += '\n◎豆瓣评分：' + `${$('strong.rating_num').text()}/10 from ${$('div.rating_sum').text().match(/\d+/)[0]} users`;
    } catch(err) {
        info += '\n◎豆瓣评分： NaN';
    }
    info += '\n◎豆瓣链接：' + site_url.split('?')[0] + '\n';

    var tag = $('div.tags-body');
    if (tag.length) {
        info += '\n◎标签：' + Array.from(tag.find('a').map((index,e)=>{
            return $(e).text();
        })).join(' | ');
    }

    if (source_type == '音乐') {
        var introduction = $('span[property="v:summary"]');
        if (introduction.length) {
            if (introduction.parent().text().match(/展开全部/i) && introduction.parent().parent().find('span.hidden').length) {
                introduction = introduction.parent().parent().find('span.hidden');
            }
            introduction = introduction.clone();
            introduction.find('br').replaceWith(`\n`);
            info += `\n◎简介\n${introduction.text().replace(/\n\n/g, '\n')}`;
        } else {
            info += `\n◎简介\n　　该${source_type}暂无简介。`;
        }
        var track_list = $('div.track-list');
        if (track_list.length) {
            track_list = track_list.clone();
            track_list.find('br').replaceWith(`\n`);
            track_list_info = track_list.text().trim().replace(/  +/g, '').replace(/\n\n+/g, '\n');
            info += `\n\n◎曲目\n${track_list_info}`;
        }
    } else {
        var introduction = $('#link-report').find('div.intro:first');
        if (introduction.length) {
            if (introduction.text().match(/展开全部/i)) {
                introduction = $('#link-report').find('span[class*="all hidden"]').find('div.intro');
            }
            introduction = introduction.clone();
            introduction.find('p').map((index,e)=>{
                $(e).text($(e).text() + '\n\n');
            });
            info += `\n◎内容简介\n${'　　' + introduction.text().trim()}`;
        } else {
            info += `\n◎内容简介\n　　该${source_type}暂无简介。`;
        }
        var author_intro = $('span:contains(作者简介)').parent().next();
        if (author_intro.length) {
            if (author_intro.text().match('展开全部')){
                author_intro = author_intro.find('span[class*="all hidden"]').find('div.intro');
            } else {
                author_intro = author_intro.find('div.intro')
            }
            author_intro = author_intro.clone();
            author_intro.find('p').map((index,e)=>{
                $(e).text($(e).text() + '\n\n');
            });
            info += `\n\n◎作者简介\n${'　　' + author_intro.text().trim()}`;
        }
    }

    $('#info').append(`描述: <a id="copy">复制</a>`);
    $('#copy').click(e=>{
        GM_setClipboard(info);
        $('#copy').text('完成')
    });
}

/*******************************************************************************************************************
*                                         part 3 页面逻辑处理（源网页）                                              *
********************************************************************************************************************/
var sleep_time = 0;
if (origin_site == "HDF" || origin_site == 'HaresClub' || origin_site == 'PigGo'){
    sleep_time = 500;
} else if (origin_site == "digitalcore" || origin_site == 'HDSpace') {
    sleep_time = 3000;
}
if (site_url.match(/https:\/\/redacted.ch\/upload.php#seperator#/)) {
    sleep_time = 2500;
}

if (origin_site == 'BYR') {
    delete Array.prototype.remove;
}
function auto_feed() {
    if (site_url.match(/^https:\/\/zhuque.in\/torrent\/list\/\d+/)) {
        if (!$('div.markdown').length) {
            return;
        }
    }
    if (judge_if_the_site_as_source() == 1) {
        raw_info.origin_site = origin_site;
        raw_info.origin_url = site_url.replace('/', '***');

        var title, small_descr,descr, tbody, frds_nfo;
        var cmct_mode = 1;
        var torrent_id = "";//gz架构站点种子id
        var douban_button_needed = false;
        var search_mode = 1;

        var is_inserted = false;
        var opencd_mode = 0; //皇后有两种版面,默认新版面
        if (origin_site == 'OpenCD' && document.getElementById('kdescr')) {
            opencd_mode = 1;  //皇后老版面
        }

        //----------------------------------标题简介获取——国内站点-------------------------------------------
        if ((judge_if_the_site_in_domestic(site_url) && origin_site != 'HHClub') || opencd_mode) {
            if (origin_site == 'TTG' || origin_site == 'PuTao' || origin_site == 'OpenCD' || origin_site == 'HDArea') {
                title = document.getElementsByTagName("h1")[0];
                if ($(title).text().match(/上传成功|编辑成功/)) {
                    title = document.getElementsByTagName("h1")[1];
                }
            } else if (origin_site == 'HUDBT'){
                title = document.getElementById('page-title');
            } else if (origin_site == 'BYR'){
                raw_info.name = $('.index:eq(0)').text();
            } else if (origin_site == 'NPUPT'){
                title = document.getElementsByClassName('jtextfill')[0];
            } else {
                title = document.getElementById("top");
            }

            if (origin_site != 'BYR'){
                for (i = 0; i < title.childNodes.length; i++) {
                    raw_info.name = raw_info.name + title.childNodes[i].textContent;
                }
            }
            if (origin_site == 'TTG') {
                descr = document.getElementById("kt_d");
            } else {
                descr = document.getElementById("kdescr"); //kdescr
                if (!descr && origin_site == 'CMCT') {
                    descr = document.getElementById("kposter");
                    cmct_mode = 2;
                }
                if (origin_site == 'FRDS') {
                    descr = document.getElementById("kdescr").parentNode;
                    frds_nfo = document.getElementById("knfo");
                    if($('#kimdb').length) {
                        raw_info.url = match_link('imdb', $('#kimdb').html());
                    }
                    if($('#kdouban').length) {
                        raw_info.dburl = match_link('douban', $('#kdouban').html());
                    }
                    douban_button_needed = true;
                }
                if (site_url.match(/detailsgame/)) {
                    descr = document.getElementById("kdescription");
                    raw_info.type = '游戏';
                    try{ raw_info.small_descr = document.getElementsByTagName('h1')[1].textContent; } catch(err) {}
                }
                if (origin_site == 'HaresClub') {
                    descr = $('#kdescr').next()[0];
                }
            }
            if (origin_site == 'QingWa') {
                if($('#kimdb').length) {
                    raw_info.url = match_link('imdb', $('#kimdb').html());
                }
            }


            if (origin_site == 'PThome' || origin_site == 'Audiences' || origin_site == 'OurBits') {
                try{
                    var mediainfo1 = document.getElementsByClassName("codemain").pop();
                    if (origin_site != 'OurBits') {
                        mediainfo1 = mediainfo1.getElementsByTagName('font')[0];
                    }
                    mediainfo1 = walkDOM(mediainfo1.cloneNode(true));
                    mediainfo1 = mediainfo1.replace(/(<div class="codemain">|<\/div>|\[\/?(font|size|color).*?\])/g, '');
                    mediainfo1 = mediainfo1.replace(/<br>/g, '\n');
                    raw_info.full_mediainfo=mediainfo1;
                    raw_info.descr = "";
                } catch(err){
                }
            }

            //获取最外层table
            tbody = descr.parentNode.parentNode.parentNode;
            descr = descr.cloneNode(true);

            try{
                var codetop = descr.getElementsByClassName('codetop');
                Array.from(codetop).map((e, index)=>{
                    try{descr.removeChild(e);} catch(err){e.parentNode.removeChild(e)}
                });
                var codemain = descr.getElementsByClassName('codemain');
                Array.from(codemain).map((e, index)=>{
                    if (!e.innerHTML.match(/<table>/) && (origin_site != 'OurBits' || !$(e).find("fieldset").length)) {
                        try{e.innerHTML = '[quote]{mediainfo}[/quote]'.format({'mediainfo': e.innerHTML.trim() });} catch(err){}
                    }
                });
                if ((origin_site == 'PTer' || origin_site == 'FRDS' || origin_site == 'Audiences') && descr.getElementsByTagName('table').length){
                    var descr_table = descr.getElementsByTagName('table');
                    var table_num = descr_table.length;
                    var table_id = 0;
                    while (table_num >= 0) {
                        descr_table = descr_table[0];
                        if (descr_table.textContent.match(/general/i)){
                            descr_table.parentNode.removeChild(descr_table);
                            raw_info.full_mediainfo += $(`div.codemain:contains("General"):eq(${table_id})`).text() + '\n';
                        }
                        descr_table = descr.getElementsByTagName('table');
                        if (!descr_table.length) {
                            break;
                        }
                        table_id += 1;
                        table_num -= 1;
                    }
                }
            }catch(err){
                console.log(err);
            }

            raw_info.descr = walkDOM(descr);
            raw_info.descr = raw_info.descr.replace(/\[\/img\]\n\n/g, '[/img]\n');

            if (origin_site == 'Audiences') {
                if (raw_info.descr.match(/(\[img\].*?6170004c2ab3f51d91c7782a.*?\[\/img\][\s\S]*?)(\[quote\].*General[\s\S]*?\[\/quote\])/)) {
                    raw_info.descr = raw_info.descr.replace(/(\[img\].*?6170004c2ab3f51d91c7782a.*?\[\/img\][\s\S]*?)(\[quote\].*?General[\s\S]*?\[\/quote\])/, '$2\n$1');
                }
            }

            raw_info.descr = raw_info.descr.replace(/\[img\]https:\/\/ourbits.club\/pic\/(Ourbits_MoreScreens|Ourbits_info).png\[\/img\]/g, '');

            if (origin_site == 'U2') {
                tmp_descr = raw_info.descr;
                $('table.spoiler').map((index,e)=>{
                    raw_info.descr = '';
                    var clonetable = $(e).find('span.spoiler-content')[0].cloneNode(true);
                    if ($(e).html().match(/Screenshot/)) {
                        tmp_descr += walkDOM(clonetable);
                    } else {
                        tmp_descr += `[quote]\n${walkDOM(clonetable)}\n[/quote]\n\n`;
                    }
                });
                raw_info.descr = tmp_descr;
                console.log(raw_info.descr);
            }

            if (origin_site == 'FRDS') {
                if (frds_nfo != null) {
                    raw_info.descr = raw_info.descr + "[quote]" + frds_nfo.textContent + "[/quote]";
                }
            }


            if ($('.nexus-media-info-raw').length) {
                var mediainfo = $('.nexus-media-info-raw').text();
                if ($('.spoiler-content').length) {
                    mediainfo = $('.spoiler-content').text();
                }

                raw_info.descr += `\n  \n[quote]${mediainfo.trim()}[/quote]\n  \n`;
                try{
                    var intro = raw_info.descr.indexOf('◎简　　介');
                    var pictures = raw_info.descr.match(/(\[url=.*?\])?\[img\].*?\[\/img\](\[\/url\])?/g);
                    pictures.forEach(item=>{
                        if (raw_info.descr.indexOf(item) > 300) {
                            raw_info.descr = raw_info.descr.replace(item, '');
                            raw_info.descr += item + '\n';
                        }
                    });
                } catch(err) {}
            }

            //ourbits没有简介的话补充简介
            if (origin_site == 'OurBits') {
                raw_info.descr = raw_info.descr.replace(/Mediainfo|Screenshot|BDInfo|screenshot/g, '');
                try{
                    var imdbnew2 = document.getElementsByClassName("imdbnew2")[0];
                    raw_info.url = match_link('imdb', imdbnew2.innerHTML);
                } catch(err){}

                if (raw_info.descr.search(/主.*演/i) < 0 && raw_info.descr.search(/类.*别/i) < 0) {
                    try{
                        var doubanimg = document.getElementsByClassName("doubannew")[0];
                        doubanimg = doubanimg.getElementsByTagName("img")[0].src;
                        var douban = document.getElementsByClassName("doubaninfo")[0];
                        var douban_new = douban.cloneNode(true);
                        douban = domToString(douban_new);
                        douban = douban.replace(/<br>/g, '\n').replace('<div class="doubaninfo">', '').replace('</div>', '');
                        raw_info.descr = '[img]' + doubanimg + '[/img]\n' + douban + '\n\n' + raw_info.descr;
                    } catch(err){
                        if (raw_info.url) {
                            douban_button_needed = true;
                        }
                    }
                }
            }

            if (origin_site == 'HDChina' || origin_site == 'TTG'){
                if (raw_info.descr.search(/主.*演/i) < 0 && raw_info.descr.search(/类.*别/i) < 0){
                    var douban_content = document.getElementsByClassName('douban_content');
                    if (douban_content[0]){
                        raw_info.dburl = match_link('douban', douban_content[0].textContent);
                        if (raw_info.dburl){
                            douban_button_needed = true;
                        }
                    }
                }
                if (raw_info.descr.match(/https:\/\/img.hdchina.org\/images/) || raw_info.descr.match(/https?:\/\/tu.totheglory.im\/files/)) {
                    douban_button_needed = true;
                    if (origin_site == 'HDChina') {
                        var img = Array.from(document.getElementById("kdescr").getElementsByTagName('img'));
                    } else if (origin_site == 'TTG'){
                        var img = Array.from(document.getElementById("kt_d").getElementsByTagName('img'));
                    } else {
                        var img = Array.from(document.getElementById("kdescr").getElementsByTagName('img'));
                    }
                    raw_info.url = match_link('imdb', raw_info.descr);
                    img.forEach(e=> {e.setAttribute("class", 'checkable_IMG'); e.onclick='';});
                    $('.checkable_IMG').imgCheckbox({
                        onclick: function(el){
                            let tagA = Array.from(el.children()[0].parentNode.parentNode.parentNode.getElementsByTagName("a"));
                            tagA.forEach(e=>{e.onclick=function(){return false;};});
                            var isChecked = el.hasClass("imgChked"),
                            imgEl = el.children()[0];
                            var img_src = '';
                            if (origin_site == 'HDChina') {
                                img_src = imgEl.src.replace('.md', '');
                            } else {
                                img_src = imgEl.parentNode.parentNode.href;
                            }
                            if (isChecked) {
                                raw_info.images.push(img_src);
                            } else {
                                raw_info.images.remove(img_src);
                            }
                        },
                        "graySelected": false,
                        "checkMarkSize": "20px",
                        "fadeCheckMark": false
                    });
                }
            }

            if (origin_site == 'FRDS') {
                raw_info.torrent_name = $('a[href*="download.php"]:contains(torrent)').text();
                raw_info.torrent_url = 'https://pt.keepfrds.com/' + $('a[href*="download.php"]:contains(torrent)').attr('href');
            } else if (origin_site == '影') {
                raw_info.torrent_name = $('a[href*="download.php"]:contains(torrent)').text();
                raw_info.torrent_url = 'https://star-space.net/' + $('a[href*="download.php"]:contains(torrent)').attr('href');
            } else if (origin_site == 'HaresClub') {
                raw_info.torrent_name = $('td:contains(".torrent")').text();
                raw_info.torrent_url = used_site_info[origin_site].url + $('a[href*="download.php"]').attr('href');
            } else if (origin_site == 'U2') {
                raw_info.torrent_name = $('a[href*="download.php"]:first').text();
                raw_info.torrent_url = o_site_info[origin_site] + $('a[href*="download.php"]').attr('href');
            } else if (origin_site == 'other') {
                raw_info.torrent_name = $('a[href*="download.php"]:contains(torrent)').text();
                try {
                    raw_info.torrent_url = site_url.match(/^(https?:\/\/.*?\/)details.php/)[1] + $('a[href*="download.php"]:contains(torrent)').attr('href');
                } catch (err) {}
            } else {
                raw_info.torrent_name = $('a[href*="download.php"]:contains(torrent)').text();
                raw_info.torrent_url = used_site_info[origin_site].url + $('a[href*="download.php"]:contains(torrent)').attr('href');
                if (origin_site == 'HDSky') {
                    raw_info.torrent_name = $('input[value*=".torrent"]').val();
                    raw_info.torrent_url = $('a[href*="download.php"]').attr('href');
                } else if (origin_site == 'TTG') {
                    raw_info.torrent_name = $('a[href*="dl"]:contains(torrent)').text();
                    raw_info.torrent_url = used_site_info[origin_site].url + $('a[href*="dl"]:contains(torrent)').attr('href').slice(1);
                } else if (origin_site == 'HDChina') {
                    raw_info.torrent_name = $('a.torrentdown_button').attr('title');
                    raw_info.torrent_url = $('#clip_target').attr("href");
                }
            }
        }

        if (origin_site == 'HDRoute') {
            raw_info.torrent_name = $('.details-title-eng').text().trim().replace(/ /g, '.') + '.torrent';
            raw_info.torrent_url = 'http://hdroute.org/' + $('.buttonDownload').attr('onclick').match(/download.*id=\d+/)[0];
        }

        if (origin_site == 'OpenCD') {
            raw_info.torrent_name = $('a[href*="download.php"]').attr('title') + '.torrent';
            raw_info.torrent_url = used_site_info[origin_site].url + $('a[href*="download.php"]').attr('href');
        }

        if (origin_site == 'HDAtmos') {
            raw_info.descr = raw_info.descr.replace(/\[url=.*?\].*?极空间新Z4\[\/url\]/, '');
        }

        //------------------------------国外站点table获取(简介后续单独处理)-------------------------------------------

        var table, insert_row, douban_box;
        if (origin_site == 'HDT') {
            tbody = document.getElementById("TorrentsdetailsHideShowTR");
            tbody = tbody.getElementsByTagName('tbody')[0];
        }

        if (origin_site == 'HHClub') {
            function get_next_text(label, label_str) {
                $(`div[class="font-bold leading-6"]`).map((index,e)=>{
                    if ($(e).text() == label_str) {
                        raw_info[label] = $(e).next().text();
                    }
                });
            }
            function add_douban(tbody) {
                var index = no_need_douban_button_sites.indexOf('HHClub');
                if (index > -1) {
                    no_need_douban_button_sites.splice(index, 1);
                }
                search_row = tbody.insertRow(0);
                douban_button_needed = true;
            }
            get_next_text('name', '标题');
            get_next_text('small_descr', '副标题');
            var info = $('div:contains(基本信息):last').next().text();
            raw_info.type = info.get_type();
            raw_info.medium_sel = info.medium_sel();
            raw_info.codec_sel = info.codec_sel();
            raw_info.audiocodec_sel = info.audiocodec_sel();
            $('div:contains(副标题):last').next().after(`
                <div class="font-bold leading-6">转载</div>
                <div class="font-bold leading-6">
                    <table id="mytable" border=none;>
                    </table>
                </div>
            `);
            tbody = $('#mytable')[0];
            insert_row = tbody.insertRow(0);
            douban_box = tbody.insertRow(0);
            try {
                if ($('div:contains(其他信息):last').length) {
                    var div_descr = $('div:contains(其他信息):last').parent().next()[0];
                    raw_info.descr = walkDOM(div_descr.cloneNode(true)).trim();
                }
                if ($('#mediainfo-raw').length) {
                    raw_info.descr = raw_info.descr + '[quote]\n' + $('#mediainfo-raw').find('code').text() + '\n[/quote]\n';
                    console.log(raw_info.descr);
                }
                if ($('div.nexus-media-info-raw').length) {
                    raw_info.descr = raw_info.descr + '[quote]\n' + $('div.nexus-media-info-raw').find('code').text() + '\n[/quote]\n';
                    console.log(raw_info.descr)
                }
                if (!raw_info.descr.match(/◎简.*?介/)) {
                    add_douban(tbody);
                }
            } catch (err) {}
            try {
                var screen = $('#screenshot-content')[0];
                raw_info.descr = '\n' + walkDOM(screen.cloneNode(true));
            } catch (err) {}
            try {
                raw_info.url = match_link('imdb', $('#kimdb').html());
            } catch (err) {}
            try {
                raw_info.dburl = match_link('douban', $('#douban_info-content').parent().html());
            } catch (err) {}
            raw_info.torrent_url = 'https://hhanclub.top/' + $('a[href*="download.php"]').attr('href');
        }

        if (origin_site == 'Tik' || origin_site == 'Aither') {
            var ids = $('ul.meta__ids').html()
            raw_info.url = match_link('imdb', ids);
            raw_info.tmdb_url = match_link('tmdb', ids);
            raw_info.tvdb_url = match_link('tvdb', ids);
            $('menu[class="torrent__buttons form__group--short-horizontal"]').after(`
                <div style="padding-left:55px; padding-right:55px">
                    <table id="mytable">
                    </table>
                </div>
            `);
            tbody = $('#mytable')[0];
            insert_row = tbody.insertRow(0);
            douban_box = tbody.insertRow(0);
        }

        if (origin_site == 'PHD' || origin_site == 'avz' || origin_site == 'CNZ') {
            tbody = $('div.table-responsive:contains(Title)').find('tbody')[0];
        }

        if (origin_site == 'PTP') {
            if (site_url.match(/torrentid=(\d+)/)) {
                torrent_id = site_url.match(/torrentid=(\d+)/)[1];
            }
            try {
                raw_info.url = document.getElementById("imdb-title-link").href;
            } catch (err) {}
            tbody = document.getElementById("torrent-table");
            var tr_matched = document.getElementById('group_torrent_header_' + torrent_id);

            if (tr_matched.innerHTML.match(/High quality torrent/)){
                raw_info.golden_torrent = true;
            }
            try{
                var youtube_info = $('.youtube-player').attr('src');
                raw_info.youtube_url = youtube_info.match(/https:\/\/www.youtube.com\/embed\/([a-zA-Z0-9-]*)/)[1];
            } catch(err){}
            raw_info.ptp_poster = $('.sidebar-cover-image').parent().html();
            if (raw_info.ptp_poster.match(/https:\/\/ptpimg.me\/.*?.(jpg|png)/)){
                raw_info.ptp_poster = raw_info.ptp_poster.match(/https:\/\/ptpimg.me\/.*?.(jpg|png)/)[0];
            } else {
                raw_info.ptp_poster = '';
            }
        }

        if (origin_site == 'ANT') {
            if (site_url.match(/torrentid=(\d+)/)) {
                torrent_id = site_url.match(/torrentid=(\d+)/)[1];
            }
            raw_info.url = match_link('imdb', $('div.torrent_ratings').html());
            tbody = document.getElementById("torrent_details");
        }

        if (origin_site == 'SC') {
            if (site_url.match(/torrentid=(\d+)/)) {
                torrent_id = site_url.match(/torrentid=(\d+)/)[1];
            }
            try {
                raw_info.url = $(`tr#torrent${torrent_id}`).find('a:contains("IMDB")').attr("href");
            } catch (err) {}
            tbody = document.getElementById("torrent_details");
            raw_info.ptp_poster = $('#covers').find('img').first().attr("src");
        }

        if (origin_site == 'HD-Only') {
            if (site_url.match(/torrentid=(\d+)/)) {
                torrent_id = site_url.match(/torrentid=(\d+)/)[1];
            }
            tbody = document.getElementById("torrent_details");
        }

        if (origin_site == 'GPW') {
            if (site_url.match(/torrentid=(\d+)/)) {
                torrent_id = site_url.match(/torrentid=(\d+)/)[1];
            }
            try {
                raw_info.url = match_link('imdb', $('div.LayoutBody').html());
                console.log(raw_info.url)
            } catch (err) {}
            tbody = document.getElementById("torrent_details");
        }

        if (origin_site == 'BTN') {
            tbody = document.getElementsByClassName('torrent_table')[0];
            raw_info.type = '剧集';
            if (site_url.match(/torrentid=(\d+)/)) {
                torrent_id = site_url.match(/torrentid=(\d+)/)[1];
            }
            setTimeout(()=>{
                var series_num = $('.thin').find('a').attr('href');
                getDoc(used_site_info.BTN.url + series_num, null, function(doc){
                    var link_as = doc.getElementsByClassName('box')[1].getElementsByTagName('a');
                    for (i=0;i<link_as.length;i++){
                        if (link_as[i].href.match(/imdb.com/)){
                            raw_info.url = link_as[i].href;
                        }
                        if (link_as[i].href.match(/thetvdb.com/)) {
                            raw_info.tvdb_url = link_as[i].href;
                        }
                    }
                    try{
                        reBuildHref(raw_info, forward_r);
                    } catch(err){}
                });
            }, 2000);

            //获取name
            var torrent_tr = document.getElementById('torrent_' + torrent_id);
            raw_info.name = torrent_tr.previousElementSibling.getElementsByTagName('td')[0].textContent.replace('» ', '').trim();

            //获取简介
            var descr_box = torrent_tr.getElementsByTagName('blockquote');
            for (i=0; i<descr_box.length; i++){
                var tmp_descr = descr_box[i].textContent;
                if (tmp_descr.match(/Unique ID|DISC INFO:|.MPLS|General/i)){
                    descr_box = descr_box[i];
                    break;
                }
            }
            raw_info.descr =  '[quote]' + descr_box.textContent + '[/quote]\n\n';
            var imgs = descr_box.getElementsByTagName('img');
            var img_urls = '';
            for (i=0; i < imgs.length; i++) {
                if (imgs[i].parentNode.nodeName == 'A'){
                    img_urls += '[url='+ imgs[i].parentNode.href +'][img]' + imgs[i].src + '[/img][/url]';
                } else {
                    img_urls += '[img]' + imgs[i].src + '[/img]';
                }
            }
            raw_info.descr += img_urls;
            raw_info.torrent_url = used_site_info.BTN.url + $(`a[href*="download&id=${torrent_id}"]`).attr('href');
        }

        if (origin_site == 'TVV') {
            tbody = document.getElementsByClassName('torrent_table')[0];
            raw_info.type = '剧集';
            if (site_url.match(/torrentid=(\d+)/)) {
                torrent_id = site_url.match(/torrentid=(\d+)/)[1];
            }
            raw_info.url = match_link('imdb', $('body').html());
            var torrent_tr = $(`#torrent_${torrent_id}`);
            raw_info.descr = '[quote]\n' + torrent_tr.find('blockquote:eq(1)').text().trim() + '\n[/quote]\n\n';
            torrent_tr.find('img').map((index,e)=>{
                if ($(e).parent().prop("tagName") == 'A') {
                    raw_info.descr += '[url='+ $(e).parent().attr('href') +'][img]' + $(e).attr('src') + '[/img][/url]';
                } else {
                    raw_info.descr += '[img]' + $(e).attr('src') + '[/img]';
                }
            });
            raw_info.torrent_url = used_site_info.TVV.url + $(`a[href*="download&id=${torrent_id}"]`).attr('href');
            if (raw_info.descr.match(/Complete name.*?:.*/)) {
                raw_info.name = raw_info.descr.match(/Complete name.*?:(.*)/)[1].split('/').pop().trim();
            } else {
                GM_xmlhttpRequest({
                    method: "GET",
                    url: raw_info.torrent_url,
                    overrideMimeType: "text/plain; charset=x-user-defined",
                    onload: (xhr) => {
                        var r = xhr.responseText;
                        if (r.match(/4:name\d+:/)) {
                            var length = parseInt(r.match(/4:name(\d+):/)[1]);
                            var index = parseInt(r.search('4:name'));
                            raw_info.name = r.substring(index, index + length + 7 + length.toString().length).split(':').pop();
                            raw_info.torrent_name = raw_info.name + '.torrent';
                            rebuild_href(raw_info);
                        }
                    }
                });
            }
        }

        if (origin_site == 'NBL') {
            $('#mediainfobox').parent().prepend(`
                <div style="padding-left:55px; padding-right:55px">
                    <table id="mytable">
                    </table>
                </div>
            `);
            tbody = $('#mytable')[0];
            insert_row = tbody.insertRow(0);
            douban_box = tbody.insertRow(0);

            raw_info.type = '剧集';
            var search_name = $('h2').text().split('-')[0].trim();
            raw_info.name = $('div[id*=files_]').find('tr:eq(0)').find('td:first').text().replace(/\//g, '');
            try{
                var show_href = 'https://nebulance.io' + $('#coverimage').find('a').attr('href');
                getDoc(show_href, null, function(doc){
                    var show_id = $('#showinfobox', doc).find('a[href*="tvmaze.com"]').attr('href').match(/\d+/)[0];
                    var show_url = 'https://api.tvmaze.com/shows/' + show_id;
                    console.log(show_id)
                    console.log(show_url)
                    getJson(show_url, null, function(data){
                        if (data.externals.imdb) {
                            raw_info.url = 'https://www.imdb.com/title/' + data.externals.imdb;
                            reBuildHref(raw_info, forward_r);
                            if (all_sites_show_douban) {
                                getData(raw_info.url, function(data){
                                    console.log(data);
                                    if (data.data){
                                        $('td:contains(豆瓣信息)').last().parent().before(`<tr><td align=right style="font-weight: bold;">豆瓣</td><td id="douban_info"></td></tr>`);
                                        add_douban_info_table($('#douban_info'), 150, data);
                                        $('#douban_info').find('th').css({"color": "white"});
                                    }
                                });
                            }
                        }
                    });
                });
            } catch (Err) {}
            raw_info.descr = '[quote]\n' + $('#mediainfobox').find('div.mediainfo').text() + '\n[/quote]';
            raw_info.torrent_url = `https://nebulance.io/` + $(`a[href*="download&id=${torrent_id}"]`).attr('href');
        }

        if (origin_site == 'IPT') {
            if ($('#media').length) {
                $('#media').prepend(`
                    <div style="padding-left:55px; padding-right:55px">
                        <table id="mytable">
                        </table>
                    </div>
                `);
            } else {
                $('div.info').after(`<br>
                    <div style="padding-left:90px; padding-right:90px">
                        <table id="mytable">
                        </table>
                    </div>
                `);
            }
            tbody = $('#mytable')[0];
            insert_row = tbody.insertRow(0);
            douban_box = tbody.insertRow(0);
            try {
                raw_info.url = match_link('imdb', $('.des').has('blockquote').text());
                if (!raw_info.url) {
                    raw_info.url = match_link('imdb', $('#media').html());
                }
            } catch (err) {}
            raw_info.type = $('div.tags').text().get_type();
            var descr = $('.des').has('blockquote')[0];
            raw_info.descr = walkDOM(descr.cloneNode(true));

            if (all_sites_show_douban && raw_info.url) {
                getData(raw_info.url, function(data){
                    if (data.data){
                        $('td:contains(豆瓣信息)').last().parent().before(`<tr><td colSpan="2" id="douban_info"></td></tr>`);
                        add_douban_info_table($('#douban_info'), 150, data);
                        $('#douban_info').find('th').css({"color": "white"});
                        $('#douban_info').find('h3').hide();
                    }
                });
            }
            raw_info.name = $('h1').text();
            raw_info.torrent_url = 'https://iptorrents.com/' + $('a[href*="download.php"]').attr('href');
        }

        if (origin_site == 'HDSpace') {
            tbody = $('#mcol').find('table:first').find('table:contains("Info Hash")')[0];
            raw_info.url = match_link('imdb', $(tbody).html());
            insert_row = tbody.insertRow(3);
            douban_box = tbody.insertRow(3);
            raw_info.name = $(tbody).find('td:contains("Name"):first').next().text();
            $(tbody).find('td').map((index, e)=>{
                if ($(e).text() == "Description") {
                    descr = $(e).next()[0];
                }
            })
            raw_info.descr = walkDOM(descr.cloneNode(true));
            raw_info.descr = raw_info.descr.replace(/#[\s\S]*?Nfo hack/, '').replace(/# End[\s\S]*?#+/, '');
            raw_info.descr = raw_info.descr.replace(/(\[url=.*?\])[\s\S]*?(\[img\])/g, '$1$2').trim();
            raw_info.descr = `[quote]\n${raw_info.descr}\n[/quote]\n\n`;
            raw_info.descr.match(/(\[url=.*?\])?\[img\].*?\[\/img\](\[\/url\])?/g).map(e=>{
                raw_info.descr = raw_info.descr.replace(e, '') + e + '\n';
            });
            raw_info.descr = raw_info.descr.replace(/ +\n/g, '\n').replace(/\n\n+/, '\n\n');
            raw_info.torrent_url = 'https://hd-space.org/' + $('a[href*="download.php"]').attr('href');
        }

        if (origin_site == 'torrentseeds') {
            $('#meta-info').append(`
                <div style="padding-left:55px; padding-right:55px; padding-bottom: 15px">
                    <table id="mytable">
                    </table>
                </div>
            `);
            tbody = $('#mytable')[0];
            insert_row = tbody.insertRow(0);
            douban_box = tbody.insertRow(0);
            raw_info.name = $('h1:last').text().trim();
            raw_info.url = match_link('imdb', $('#torrent-page').html());
            raw_info.type = $('.torrent-format').text().get_type();
            if (all_sites_show_douban && raw_info.url) {
                getData(raw_info.url, function(data){
                    if (data.data){
                        $('td:contains(豆瓣信息)').last().parent().before(`<tr><td colSpan="2" id="douban_info"></td></tr>`);
                        add_douban_info_table($('#douban_info'), 150, data);
                        $('#douban_info').find('th').css({"color": "blue"});
                        $('#douban_info').find('h3').hide();
                    }
                });
            }
            raw_info.torrent_url = $('.torrent-buttons').find('a[href*="download"]').attr('href');
        }

        if (origin_site == 'SpeedApp') {
            $('div.row:eq(1)').after(`
                <div class="row card card-custom rounded-lg card-smoke backdrop-blur card-body d-flex flex-row" style="margin-bottom:20px; margin-left:1px; margin-right:1px;">
                    <table id="mytable">
                    </table>
                </div>
            `);
            tbody = $('#mytable')[0];
            insert_row = tbody.insertRow(0);
            douban_box = tbody.insertRow(0);
            raw_info.name = $('h5:first').text().trim();
            raw_info.url = match_link('imdb', $('div.container').html());
            raw_info.type = "电影";
            if (all_sites_show_douban && raw_info.url) {
                getData(raw_info.url, function(data){
                    if (data.data){
                        if (data.data.cast.split('/').length > 6) {
                            var cast = data.data.cast.split('/');
                            data.data.cast = cast.slice(0,6).join('/');
                        }
                        $('td:contains(豆瓣信息)').last().parent().before(`<tr><td colSpan="2" id="douban_info"></td></tr>`);
                        add_douban_info_table($('#douban_info'), 200, data);
                        $('#douban_info').find('th').css({"color": "white"});
                        $('#douban_info').find('h3').hide();
                    }
                });
            }
            raw_info.torrent_url = 'https://speedapp.io' + $('a[href*="/torrents/"]').attr('href');
            raw_info.descr = `[quote]\n${walkDOM($('#media_info_content')[0].cloneNode(true)).trim()}\n[/quote]\n`;
        }

        if (origin_site == 'IN') {
            if ($('#nzb-details').length) {
                $('#nzb-details').append(`
                    <div style="padding-right:15%; padding-bottom: 15px">
                        <table id="mytable">
                        </table>
                    </div>
                `);
                raw_info.url = match_link('imdb', $('#nzb-details').html());
            } else if ($('#movie-details').length){
                $(`
                    <div style="padding-right:15%; padding-bottom: 15px">
                        <table id="mytable">
                        </table>
                    </div>
                `).insertBefore($('.filters'));
                raw_info.url = match_link('imdb', $('#content').html());
            }
            tbody = $('#mytable')[0];
            insert_row = tbody.insertRow(0);
            douban_box = tbody.insertRow(0);
            raw_info.name = $('h1').last().text().trim();
            raw_info.type = "电影";
        }

        if (origin_site == 'HOU') {
            $('div.bbWrapper').prepend(`
                <div style="padding-right:15%; padding-bottom: 15px">
                    <table id="mytable">
                    </table>
                </div>
            `);
            raw_info.url = match_link('imdb', $('body').html());
            tbody = $('#mytable')[0];
            insert_row = tbody.insertRow(0);
            douban_box = tbody.insertRow(0);
            raw_info.name = $('div.bbWrapper').find("span:first").text().trim();
            raw_info.type = "电影";
        }

        if (origin_site == 'OMG') {
            tbody = $('#table_table')[0];
            raw_info.url = match_link('imdb', $('body').html());
            insert_row = tbody.insertRow(0);
            douban_box = tbody.insertRow(0);
            raw_info.name = $('div.window_header').text().trim();
            raw_info.type = "电影";
        }

        if (origin_site == 'digitalcore') {
            $('.imdbinfotext').parent().parent().parent().parent().append(`
                <div style="padding-left:55px; padding-right:55px; padding-bottom: 15px">
                    <table id="mytable">
                    </table>
                </div>
            `);
            tbody = $('#mytable')[0];
            insert_row = tbody.insertRow(0);
            douban_box = tbody.insertRow(0);
            raw_info.name = $('torrent').find('a').first().text().trim();
            raw_info.url = match_link('imdb', $('.imdbinfotext').parent().parent().parent().parent().html());
            var td = $('td:contains(Information)').next()[0];
            raw_info.descr = walkDOM(td.cloneNode(true));
            if (raw_info.url && all_sites_show_douban) {
                getData(raw_info.url, function(data){
                    console.log(data);
                    if (data.data){
                        $('td:contains(豆瓣信息)').last().parent().before(`<tr><td colSpan="2" id="douban_info"></td></tr>`);
                        add_douban_info_table($('#douban_info'), 150, data);
                        $('#douban_info').find('th').css({"color": "white"});
                        $('#douban_info').find('h3').hide();
                    }
                });
            }
        }

        if (origin_site == 'BlueBird') {
            $('#highlighted').find('tr:eq(1)').after(`<tr><td colspan=2>
                    <div style="padding-bottom: 15px">
                        <table id="mytable">
                        </table>
                    </div></td>
                </tr>
            `);
            tbody = $('#mytable')[0];
            insert_row = tbody.insertRow(0);
            douban_box = tbody.insertRow(0);
            raw_info.name = $('#highlighted').find('a[href*=download]').first().text().split('/').pop().trim();
            raw_info.url = match_link('imdb', $('#highlighted').html());
            if (raw_info.url && all_sites_show_douban) {
                getData(raw_info.url, function(data){
                    console.log(data);
                    if (data.data){
                        $('#highlighted').find('tr:eq(1)').after(`<tr><td align=right style="font-weight: bold;">豆瓣</td><td id="douban_info"></td></tr>`);
                        add_douban_info_table($('#douban_info'), 150, data);
                        $('#douban_info').find('th').css({"color": "white", "font-size": "2px"});
                    }
                });
            }
            var descr_td = $('td:contains(Description)').next();
            descr_td.find('div.spoiler-wrap').map((index,e)=>{
                if ($(e).find('.spoiler-head').text().match(/mediainfo|BDInfo|minfo/i)){
                    raw_info.descr = '[quote]\n' + $(e).find('.spoiler-body').text() + '\n[/quote]\n\n';
                }
            });
            descr_td.find('a').has('img').map((index,e)=>{
                if ($(e).find('img').attr('src').match(/http.*(jpg|png)/i)){
                    raw_info.descr += `[url=${$(e).attr('href')}][img]${$(e).find('img').attr('src')}[/img][/url] `;
                }
            });
            raw_info.type = $('td:contains(Type)').last().next().text().get_type();
        }

        if (origin_site == 'bwtorrents') {
            $('td.heading:contains(Name)').parent().before(`
                <tr><td colspan=2>
                    <div style="padding-bottom: 15px">
                        <table id="mytable">
                        </table>
                    </div></td>
                </tr>
            `);
            tbody = $('#mytable')[0];
            insert_row = tbody.insertRow(0);
            douban_box = tbody.insertRow(0);
            raw_info.name = $('#title_tt').text();
            raw_info.url = match_link('imdb', $('table.mainouter').html());
            if (raw_info.name.match(/S\d+|E\d+/i)) {
                raw_info.type = '剧集';
            } else {
                raw_info.type = '电影';
            }
            raw_info.descr = walkDOM($('#aeonsystems2017details2')[0].cloneNode(true));
            raw_info.descr = raw_info.descr.replace(/\n\n/g, '\n');
            raw_info.torrent_url = `https://bwtorrents.tv/` + $('a[href^="download.php"]').attr('href');
        }

        if (origin_site == 'bit-hdtv') {
            tbody = $('td.detail:contains("Torrent")').parent().parent()[0];
            raw_info.url = match_link('imdb', $(tbody).html());
            insert_row = tbody.insertRow(4);
            douban_box = tbody.insertRow(4);
            raw_info.name = $('td.detail:contains("Torrent"):first').next().text();

            if (!raw_info.url) {
                raw_info.descr += '[img]' + $('td.detail:contains("Poster"):first').next().find('img').attr('src') + '[/img]\n';
                var show_url = $('td.detail:contains("URL"):first').next().find('a').attr('href').split('url=').pop().replace(/%2F/g, '/').replace(/%3A/, ':');
                show_url = 'https://api.tvmaze.com/shows/' + show_url.match(/shows\/(\d+)/)[1];
                getJson(show_url, null, function(data){
                    console.log(data)
                    if (data.externals.imdb) {
                        raw_info.url = 'https://www.imdb.com/title/' + data.externals.imdb;
                        reBuildHref(raw_info, forward_r);
                    }
                });
            }
            raw_info.descr += '[quote]' + $('#mediainfo').text()  + '[/quote]\n\n';

            $('td.detail:contains("Screenshots"):first').next().find('a').map((index,e)=>{
                raw_info.descr += `[url=${$(e).attr('href').split('url=').pop().replace(/%2F/g, '/').replace(/%3A/, ':')}][img]${$(e).find('img').attr('src')}[/img][/url] `;
            });
            raw_info.torrent_url = 'https://www.bit-hdtv.com/' + $('a[href^="download.php"]').attr('href');
        }

        if (origin_site == 'bib') {
            raw_info.type = '书籍';
            $('#title').after(`
                <tr><td colspan=2>
                    <div style="padding-bottom: 15px">
                        <table id="mytable"></table>
                    </div></td>
                </tr>
            `);
            $('#title').append(`<input type="button" value="豆瓣搜索" id="search_douban" style="border:none; height:30px; margin-left:5px; margin-bottom:2px"/>`);
            $('#search_douban').click(()=>{
                window.open(`https://search.douban.com/book/subject_search?search_text=${$('#title').text().replace(/\(.*\)/, '')}`, '_blank');
            })
            tbody = $('#mytable')[0];
            insert_row = tbody.insertRow(0);
            douban_box = tbody.insertRow(0);
            raw_info.name = $('#title').text().trim();
            raw_info.small_descr = $('#details_content_info').text().trim();
            raw_info.small_descr += ' | ' + $('#creatorlist').text().trim();
            raw_info.torrent_url = 'https://bibliotik.me' + $('a[title="Download"]').attr('href');
            raw_info.descr += '[img]' + $('#sidebar').find('a').has('img').attr('href').replace('imagecache.bibliotik.me/?url=ssl%3A','') + '[/img]\n\n';
            raw_info.descr += $('#published').text().trim() + '\n\n';
            raw_info.descr += $('#details_tags').text().trim() + '\n\n';
            raw_info.descr += '[size=3][b]Description[/b][/size]\n\n';
            $('#description').find('p').map((index,e)=>{
                raw_info.descr += $(e).text().replace(/\n/g, ' ') + '\n\n';
            });
            $('#description').find('li').map((index,e)=>{
                raw_info.descr += '[*]' + $(e).text().replace(/\n/g, ' ') + '\n';
            });
        }

        if (origin_site == 'mam') {
            raw_info.type = '书籍';
            $('#fInfo').parent().after(`
                <tr><td colspan=2>
                    <div style="padding-bottom: 15px">
                        <table id="mytable"></table>
                    </div></td>
                </tr>
            `);
            $('#fInfo').append(`<input type="button" value="豆瓣搜索" id="search_douban" style="border:none; height:30px; margin-left:5px; margin-bottom:2px"/>`);
            $('#search_douban').click(()=>{
                window.open(`https://search.douban.com/book/subject_search?search_text=${$('span.TorrentTitle').text().replace(/\(.*\)/, '')}`, '_blank');
            })
            tbody = $('#mytable')[0];
            insert_row = tbody.insertRow(0);
            douban_box = tbody.insertRow(0);
            $('.round_icon').wait(function(){
                $('.round_icon').hide();
            });
            raw_info.name = $('span.TorrentTitle').text().trim();
            if ($('a.altColor').length) {
                raw_info.small_descr += 'Author(s): ';
                $('a.altColor').map((index,e)=>{
                    raw_info.small_descr += $(e).text() + ', ';
                });
                raw_info.small_descr = raw_info.small_descr.replace(/, $/, '');
            }
            raw_info.torrent_url = 'https://www.myanonamouse.net' + $('#tddl').attr('href');
            raw_info.descr += '[img]' + $('#torDetPoster').attr('src') + '[/img]\n\n';
            raw_info.descr += 'Tags and Labels: ' + $('div:contains("Tags and Labels:"):last').next().text().trim() + '\n\n';
            raw_info.descr = raw_info.descr.replace(/,$/, '');
            var descr = $('#torDesc')[0].cloneNode(true);
            raw_info.descr += '[size=3][b]Description[/b][/size]\n\n';
            raw_info.descr = walkDOM(descr);
        }

        if (origin_site == 'MTV') {
            if (site_url.match(/torrentid=(\d+)/)) {
                torrent_id = site_url.match(/torrentid=(\d+)/)[1];
            }
            tbody = document.getElementsByClassName('torrent_table')[0];
            try {
                raw_info.url = match_link('imdb', $('#groupinfo').html());
            } catch(err) {}
            if (!raw_info.url) {
                raw_info.url = match_link('imdb', $('#groupdescbox').html());
            }
        }

        if (origin_site == 'BHD'){
            tbody = document.getElementsByClassName('table-details')[0].getElementsByTagName('tbody')[0];
            var imdb_box = document.getElementsByTagName('body')[0];
            try {
                raw_info.url = match_link('imdb', imdb_box.innerHTML);
            } catch(err) {}
            var trailer_info = $('.movie-details').find('span').last().html();
            if (trailer_info.match(/https:\/\/www.youtube.com\/watch\?v=.*/)){
                raw_info.youtube_url = trailer_info.match(/https:\/\/www.youtube.com\/watch\?v=[a-zA-Z0-9-]*/)[0];
            }
        }

        if (['ACM', 'HDOli', 'JPTV', 'Monika', 'DTR'].indexOf(origin_site) > -1) {
            var iii = document.getElementsByTagName('h4')[0].parentNode.parentNode;
            var div_box = iii.getElementsByClassName('table-responsive')[0];
            if (origin_site == 'DTR' || origin_site == 'Monika') {
                div_box = iii.getElementsByClassName('table-responsive')[1];
                if (origin_site != 'DTR') {
                    $('h4').first().click();
                }
            }
            tbody = div_box.getElementsByTagName('table')[0];
            var imdb_box = document.getElementsByClassName('movie-details')[0];
            raw_info.url = match_link('imdb', imdb_box.parentNode.innerHTML);
            if (!raw_info.url) {
                var tmdb_url = match_link('tmdb', imdb_box.parentNode.innerHTML);
                if (tmdb_url) {
                    var _url = `https://api.themoviedb.org/3/${tmdb_url.match(/(tv|movie)\/\d+/)[0]}/external_ids?api_key=${used_tmdb_key}`;
                    getJson(_url, null, function(d){
                        console.log(d);
                        if (d.imdb_id) {
                            raw_info.url = 'https://www.imdb.com/title/' + d.imdb_id;
                            reBuildHref(raw_info, forward_r);
                        }
                    });
                }
            }
        }

        if (origin_site == 'KIMOJI' || origin_site == 'HDPost' || origin_site == 'FNP' || origin_site == 'OnlyEncodes') {
            raw_info.url = match_link('imdb', $('section.meta').html());
            raw_info.type = $('.torrent__tags').text().get_type();
            raw_info.name = $('h1.torrent__name').text().trim().match(/([\u4e00-\u9fa5]* )?(.*)/)[2];
            $('menu[class="torrent__buttons form__group--short-horizontal"]').after(`
                <div class="panelV2" style="padding-left:55px; padding-right:55px; padding-top:15px; padding-bottom:15px">
                    <table id="mytable">
                    </table>
                </div>
            `);
            tbody = $('#mytable')[0];
            insert_row = tbody.insertRow(0);
            douban_box = tbody.insertRow(0);
            raw_info.descr = `[quote]\n${$('code[x-ref="mediainfo"]').text()}\n[/quote]\n\n`;
            if (origin_site == 'KIMOJI') {
                $('summary:contains("截图")').next().find('img').map((index,e)=> {
                    if (!$(e).attr("src").match(/friendsite/)) {
                        raw_info.descr += `[img]${$(e).attr("src")}[/img]`;
                    }
                });
            } else {
                $('.panel__heading:contains("描述")').parent().next().find('img').map((index,e)=> {
                    if ($(e)[0].parentNode.href){
                        raw_info.descr += '[url='+ $(e)[0].parentNode.href +'][img]' + $(e)[0].src + '[/img][/url] ';
                    } else {
                        raw_info.descr += '[img]' + $(e)[0].src + '[/img] ';
                    }
                });
                $('.panel__heading:contains("Description")').parent().next().find('img').map((index,e)=> {
                    if ($(e)[0].parentNode.href){
                        raw_info.descr += '[url='+ $(e)[0].parentNode.href +'][img]' + $(e)[0].src + '[/img][/url] ';
                    } else {
                        raw_info.descr += '[img]' + $(e)[0].src + '[/img] ';
                    }
                });
                raw_info.descr = raw_info.descr.replace(/https:\/\/wsrv.nl\/\?n=-1&url=/g, '');
            }
            raw_info.torrent_url = $('a[href*="download/"]').attr('href');
            if (raw_info.url && all_sites_show_douban && (origin_site == 'FNP' || origin_site == 'OnlyEncodes')) {
                getData(raw_info.url, function(data){
                    console.log(data);
                    if (data.data) {
                        var score = data.data.average + '分';
                        if (!score.replace('分', '')) score = '暂无评分';
                        if (data.data.votes) score += `|${data.data.votes}人`;
                        $('h1.meta__title').append(`<span> | </span><a href="${douban_prex}${data.data.id}" target="_blank" style="display: inline; width: auto; border-bottom: 0px !important; text-decoration: none; color: #d3d3d3; font-weight: bold;">${data.data.title.split(' ')[0]}[${score}]</a>`);
                        $('p.meta__description,span.movie-overview').text(data.data.summary.replace(/ 　　/g, ''));
                    }
                });
            }
        }

        if (origin_site == 'HONE') {
            raw_info.url = match_link('imdb', $('#meta-info').html());
            raw_info.type = $('.torrent-category').text().get_type();
            $('div[class="meta-general box container"]').prepend(`
                <div style="padding-left:55px; padding-right:55px">
                    <table id="mytable">
                    </table>
                </div>
            `);
            tbody = $('#mytable')[0];
            insert_row = tbody.insertRow(0);
            douban_box = tbody.insertRow(0);

            raw_info.name = $('span[class="torrent-category badge-extra"]:first').text().replace(/\(|\)/g, '').replace(/English-/, '-');
            var search_name = get_search_name(raw_info.name);
            if (all_sites_show_douban) {
                getData(raw_info.url, function(data){
                    console.log(data);
                    if (data.data){
                        $('td:contains(豆瓣信息)').last().parent().before(`<tr><td align=right style="font-weight: bold;">豆瓣</td><td id="douban_info"></td></tr>`);
                        add_douban_info_table($('#douban_info'), 150, data);
                        $('#douban_info').find('th').css({"color": "white"});
                    }
                });
            }
            raw_info.descr = '[quote]' + $('.torrent-mediainfo-dump').find('pre').text().trim() + '\n[/quote]\n\n';
            $('.table-responsive:eq(2)').find('a').has('img').map((index,e)=>{
                raw_info.descr += `[url=${$(e).attr("href")}][img]${$(e).find("img").attr("src")}[/img][/url]`
            });
            raw_info.torrent_url = $('.torrent-buttons').find('a[href*="torrents/download"]').attr('href');
        }

        if (origin_site == 'BLU') {
            var ids = $('ul.meta__ids').html()
            raw_info.url = match_link('imdb', ids);
            raw_info.tmdb_url = match_link('tmdb', ids);
            raw_info.tvdb_url = match_link('tvdb', ids);
            $('menu[class="torrent__buttons form__group--short-horizontal"]').after(`
                <div style="padding-left:55px; padding-right:55px">
                    <table id="mytable">
                    </table>
                </div>
            `);
            tbody = $('#mytable')[0];
            insert_row = tbody.insertRow(0);
            douban_box = tbody.insertRow(0);
        }

        if (origin_site == 'UHD') {
            uhd_lack_descr = true;
            if (site_url.match(/torrentid=(\d+)/)) {
                torrent_id = site_url.match(/torrentid=(\d+)/)[1];
            }
            var imdb_box = document.getElementsByClassName('imovie_title')[0];
            raw_info.url = match_link('imdb', imdb_box.innerHTML);
            tbody = document.getElementById('torrent_details');
            try{
                var youtube_info = $('.box_trailer').html();
                if (youtube_info.match(/www.youtube.com\/embed\/([a-zA-Z0-9-]*)/)){
                    raw_info.youtube_url = youtube_info.match(/www.youtube.com\/embed\/([a-zA-Z0-9-]*)/)[1];
                }
            } catch(err) {}

            setTimeout(function(){
                if (raw_info.url && all_sites_show_douban) {
                    getData(raw_info.url, function(res){
                        console.log(res);
                        if (res.data) {
                            var score = res.data.average + '分';
                            if (!score.replace('分', '')) score = '暂无评分';
                            if (res.data.votes) score += `|${res.data.votes}人`;
                            $a = $('div.imovie_title').find('a:eq(0)').attr('href', `${douban_prex}${res.data.id}`);
                            $('div.imovie_title').html(`${res.data.title.split(' ')[0]}[${score}]`)
                            $('div.imovie_title').append($a);
                            console.log($('dt:contains(Plot)').next())
                            $('dt:contains(Plot)').next().text(res.data.summary.replace(/ 　　/g, ''))
                        }
                    });
                }

            }, 1000);
        }

        if (origin_site == 'HDF') {
            if (site_url.match(/torrentid=(\d+)/)) {
                torrent_id = site_url.match(/torrentid=(\d+)/)[1];
            }
            var imdb_box = document.getElementsByClassName('torrent_description')[0];
            raw_info.url = match_link('imdb', imdb_box.innerHTML);
            tbody = document.getElementById('torrent_details');
            if (raw_info.url && all_sites_show_douban) {
                getData(raw_info.url, function(data){
                    console.log(data);
                    if (data.data) {
                        data = data.data;
                        $('h2:first').prepend(`<a href="${douban_prex}${data.id}" target="_blank">[${data.title.split(' ')[0]}]</a> `);
                        $('table#torrent_details').before($('div.torrent_description'));
                        var total = 10;
                        var split = '/';
                        if (!data.average) {
                            data.average = '暂无评分';
                            total = '';
                            data.votes = 0;
                            split = '';
                        }
                        $('div.torrent_description').find('font').prepend(
                            `<a target="_blank" class="rating" href="${data.link}" rel="noreferrer">
                                <span class="icon-pt1" style="font-size: 14px;
                                display: inline-block;
                                text-align: center;
                                border: 1px solid #41be57;
                                background-color: #41be57;
                                color: white;
                                border-top-left-radius: 4px;
                                border-bottom-left-radius: 4px;
                                width: 24px;
                                height: 24px;
                                line-height: 24px;">豆</span><span class="icon-pt2" style="font-size: 14px;
                                display: inline-block;
                                text-align: center;
                                border: 1px solid #41be57;
                                color: #3ba94d;
                                background: #ffffff;
                                border-top-right-radius: 4px;
                                border-bottom-right-radius: 4px;
                                width: 69px;
                                height: 24px;
                                line-height: 24px;">豆瓣评分</span>
                            </a>
                            : <span class="rating"><strong>${data.average}</strong>${split}${total}</span> | `
                        );

                        $("a.rating").css("text-decoration", "none");
                        var $div = $('div.torrent_description').find('div.body').find('div').first();
                        $('div.torrent_description').find('div.body').html(``);
                        $('div.torrent_description').find('div.body').append($div);
                        $('div.torrent_description >.body').append(`<br><br>${data.summary.replace(/ 　　/g, '')}`);
                    }
                });
            }
        }

        if (origin_site == 'HDB') {
            raw_info.url = match_link('imdb', document.getElementById('details').innerHTML);
            tbody = document.getElementById('details');
        }

        if (origin_site == 'RED'){
            if (site_url.match(/torrentid=(\d+)/)) {
                torrent_id = site_url.match(/torrentid=(\d+)/)[1];
            }
            getJson(`https://redacted.ch/ajax.php?action=torrent&id=${torrent_id}`, null, function(data){
                raw_info.json = JSON.stringify(data);
                raw_info.log_info = [];
                $(`#logs_${torrent_id}`).find('blockquote').map((index, e)=>{
                    if (!$(e).text().match(/max 100/)) {
                        raw_info.log_info.push($(e).text());
                    }
                });
                raw_info.log_info = raw_info.log_info.join('==logs==');
                rebuild_href(raw_info);
            });
            raw_info.name = document.getElementsByTagName('h2')[0].textContent;
            raw_info.music_name = $('h2>span[dir="ltr"]').text();
            raw_info.music_author = raw_info.name.split(raw_info.music_name)[0].replace(/-.?$/, '').trim();
            raw_info.name = raw_info.name.replace(/\[|\]/g, '*');
            var cover_box = document.getElementById('cover_div_0');
            try{
                var cover = cover_box.getElementsByTagName('img')[0].getAttribute('onclick');
                cover = cover.match(/'(.*)'/)[1];
            } catch (err) {
                var cover = cover_box.getElementsByTagName('img')[0].getAttribute('src');
            }
            var mediainfo = document.getElementsByClassName('torrent_description')[0].getElementsByClassName('body')[0];
            raw_info.tracklist = mediainfo.textContent;
            if ($(mediainfo).find('ol.postlist').length) {
                $(mediainfo).find('ol.postlist').find('li').map((index,e)=>{
                    if (index == 0) {
                        raw_info.tracklist = raw_info.tracklist.split($(e).text())[0];
                    }
                    raw_info.tracklist += `\n${index+1} ${$(e).text()}`;
                });
            }
            raw_info.descr = '[img]' + cover + '[/img]\n\n';
            raw_info.type = '音乐';
            tbody = document.getElementById('torrent_details');
            var torrent_tr = $(`#torrent${torrent_id}`);
            count = 0;
            while (count <= 25 ) {
                var edition_info = torrent_tr.text().trim().match(/^− /) ? torrent_tr.text().trim().replace('− ', ''): '';
                if (edition_info) {
                    break;
                }
                torrent_tr = torrent_tr.prev();
                count += 1;
            }
            raw_info.edition_info = edition_info;
            raw_info.torrent_url = `https://redacted.ch/` + $(`a[href*="download&id=${torrent_id}"]`).attr('href');
        }

        if (origin_site == 'lztr') {
            if (site_url.match(/torrentid=(\d+)/)) {
                torrent_id = site_url.match(/torrentid=(\d+)/)[1];
            }
            getJson(`https://lztr.me/ajax.php?action=torrent&id=${torrent_id}`, null, function(data){
                raw_info.json =  JSON.stringify(data);
                rebuild_href(raw_info);
                if (raw_info.small_descr.match(/Log \(\d+%\)/)) {
                    var score = raw_info.small_descr.match(/Log \((\d+)%\)/)[1];
                    get_log(torrent_id, score);
                    raw_info.log_info = [];
                    $(`#logs_${torrent_id}`).find('.log_section').wait(function(){
                        $(`#logs_${torrent_id}`).find('.log_section').map((index, e)=>{
                            raw_info.log_info.push($(e).text());
                        });
                        raw_info.log_info = raw_info.log_info.join('==logs==');
                        rebuild_href(raw_info);
                    });
                }
            });
            raw_info.name = document.getElementsByTagName('h2')[0].textContent;
            raw_info.music_author = $('h2>a[href*="artist"]:last').text();
            raw_info.music_name = $('h2').text().split(raw_info.music_author)[1].replace(/^.?-.?|\[.*?\]/g, '').trim();
            raw_info.music_author = Array.from($('h2>a[href*="artist"]')).map((item)=>{return $(item).text()}).join(' & ');
            console.log(raw_info.music_author)
            raw_info.name = raw_info.name.replace(/\[|\]/g, '*');
            var cover = $('p.thumbnail-container').find('img').attr('onclick').match(/http.*(jpg|png|jpeg|webp)/)[0];
            console.log(cover);

            var mediainfo = $('div').has("strong:contains(Info)").last().parent().find('div.body');
            raw_info.tracklist = walkDOM(mediainfo[0].cloneNode(true));

            console.log(raw_info.tracklist)

            raw_info.descr = '[img]' + cover + '[/img]\n\n';
            raw_info.type = '音乐';
            tbody = document.getElementsByClassName('torrent_table')[0];
            var torrent_tr = $(`#torrent${torrent_id}`);
            count = 0;
            while (count <= 25 ) {
                var edition_info = torrent_tr.text().trim().match(/^(\d{4}|Original Release)/) ? torrent_tr.text().trim().replace('− ', ''): '';
                if (edition_info) {
                    break;
                }
                torrent_tr = torrent_tr.prev();
                count += 1;
            }
            raw_info.edition_info = edition_info;
            console.log(raw_info.edition_info);
            raw_info.small_descr = $(`#torrent${torrent_id}`).find('a:eq(4)').text().replace(' → ', '');
            console.log(raw_info.small_descr)
            raw_info.descr += $(`#torrent_${torrent_id}`).find('blockquote:last').text();
            console.log(raw_info.descr);

            raw_info.music_type = Array.from($('div.box_tags').find('a[href*="taglist"]').map((index,e)=>{
                return $(e).text();
            })).join(',');
            console.log(raw_info.music_type);
            raw_info.file_list = Array.from($(`#files_${torrent_id}`).find('tr:gt(0)').map((index,e)=>{
                return $(e).find('td:eq(0)').text();
            }));
            raw_info.file_list = raw_info.file_list.filter((item)=>{
                if (item.match(/\.(flac|wav)/i)) {
                    return item;
                }
            }).join('\n');
            raw_info.torrent_url = `https://lztr.me/` + $(`a[href*="download&id=${torrent_id}"]`).attr('href');
        }

        if (origin_site == 'OPS') {
            if (site_url.match(/torrentid=(\d+)/)) {
                torrent_id = site_url.match(/torrentid=(\d+)/)[1];
            }
            getJson(`https://orpheus.network/ajax.php?action=torrent&id=${torrent_id}`, null, function(data){
                raw_info.json =  JSON.stringify(data);
                if (raw_info.small_descr.match(/Log \(\d+%\)/)) {
                    var score = raw_info.small_descr.match(/Log \((\d+)%\)/)[1];
                    $('a:contains("View logs")').click();
                    raw_info.log_info = [];
                    $(`#viewlog_${torrent_id}`).find('.log_section').wait(function(){
                        $(`#viewlog_${torrent_id}`).find('.log_section').map((index, e)=>{
                            raw_info.log_info.push($(e).find('blockquote').text().trim());
                            console.log($(e).find('blockquote').text().trim())
                        });
                        raw_info.log_info = raw_info.log_info.join('==logs==');
                        rebuild_href(raw_info);
                    });
                }
                rebuild_href(raw_info);
            });
            raw_info.name = document.getElementsByTagName('h2')[0].textContent.replace(/–/g, '-');
            raw_info.music_author = $('h2>a[href*="artist"]:last').text();
            raw_info.music_name = $('h2').text().replace(/–/g, '-').split(raw_info.music_author)[1].replace(/^.?-.?|\[.*?\]/g, '').trim();
            raw_info.music_author = Array.from($('h2>a[href*="artist"]')).map((item)=>{return $(item).text()}).join(' & ');
            raw_info.name = raw_info.name.replace(/\[|\]/g, '*');
            try {
                var cover = $('#cover_div_0').find('img').attr('src');
                $('#cover_div_0').append(`<b style="margin-left:15px; color:red">转载前请进行封面转存！</b><br><a id="transfer_pixhost" target="_blank" href="#" style="margin-left:15px; color: yellow">转存Pixhost</a>`);
                $('#transfer_pixhost').click((e)=>{
                    e.preventDefault();
                    pix_send_images([cover]).then(function(new_url){
                        new_url = new_url[0].match(/\[img\](.*)\[\/img\]/)[1].replace('//t', '//img').replace('thumbs', 'images');
                        raw_info.descr = raw_info.descr.replace(cover, new_url);
                        rebuild_href(raw_info);
                        alert('转存成功！！');
                    });
                });
            } catch (err) {}
            var mediainfo = $('div.torrent_description').find('div.body');
            raw_info.tracklist = walkDOM(mediainfo[0].cloneNode(true)).trim();

            if ($(mediainfo).find('ol.postlist').length) {
                $(mediainfo).find('ol.postlist').find('li').map((index,e)=>{
                    if (index == 0) {
                        raw_info.tracklist = raw_info.tracklist.split($(e).text())[0];
                    }
                    raw_info.tracklist += `\n${index+1} ${$(e).text()}`;
                });
            }
            console.log(raw_info.tracklist);
            raw_info.descr = '[img]' + cover + '[/img]\n\n';
            raw_info.type = '音乐';
            tbody = document.getElementsByClassName('torrent_table')[0];
            var torrent_tr = $(`#torrent${torrent_id}`);
            count = 0;
            while (count <= 25 ) {
                console.log(torrent_tr.text().trim())
                var edition_info = torrent_tr.text().trim().match(/^– /) ? torrent_tr.text().trim().replace('– ', ''): '';
                if (edition_info) {
                    break;
                }
                torrent_tr = torrent_tr.prev();
                count += 1;
            }
            raw_info.edition_info = edition_info;
            console.log(raw_info.edition_info);
            raw_info.small_descr = $(`#torrent${torrent_id}`).find('a:eq(5)').text().replace('▶ ', '');
            console.log(raw_info.small_descr);
            raw_info.descr += $(`#torrent_${torrent_id}`).find('blockquote:last').text();
            console.log(raw_info.descr);
            raw_info.music_type = Array.from($('div.box_tags').find('a[href*="taglist"]').map((index,e)=>{
                return $(e).text();
            })).join(',');
            console.log(raw_info.music_type);
            raw_info.file_list = Array.from($(`#files_${torrent_id}`).find('tr:gt(0)').map((index,e)=>{
                return $(e).find('td:eq(0)').text();
            }));
            raw_info.file_list = raw_info.file_list.filter((item)=>{
                if (item.match(/\.(flac|wav)/i)) {
                    return item;
                }
            }).join('\n');
            raw_info.torrent_url = `https://orpheus.network/` + $(`a[href*="download&id=${torrent_id}"]`).attr('href');
        }

        if (origin_site == 'DICMusic') {
            if (site_url.match(/torrentid=(\d+)/)) {
                torrent_id = site_url.match(/torrentid=(\d+)/)[1];
            }
            getJson(`https://dicmusic.com/ajax.php?action=torrent&id=${torrent_id}`, null, function(data){
                $.each(data.response.torrent, function(key, value){
                    if (typeof value === "string" && value.match(/&#\d+;/) ) {
                        data.response.torrent[key] = value.replace(/&#(\d+);/g, function(match, code) {
                            return String.fromCharCode(code);
                        });
                    }
                });
                $.each(data.response.group, function(key, value){
                    if (typeof value === "string" && value.match(/&#\d+;/) ) {
                        data.response.group[key] = value.replace(/&#(\d+);/g, function(match, code) {
                            return String.fromCharCode(code);
                        });
                    }
                });
                raw_info.json =  JSON.stringify(data);
                if (raw_info.small_descr.match(/Log \(\d+%\)/)) {
                    var score = raw_info.small_descr.match(/Log \((\d+)%\)/)[1];
                    $('a:contains("查看Log")').click();
                    raw_info.log_info = [];
                    $(`#viewlog_${torrent_id}`).find('.log_section').wait(function(){
                        $(`#viewlog_${torrent_id}`).find('.log_section').map((index, e)=>{
                            raw_info.log_info.push($(e).find('blockquote:last').text().trim());
                            console.log($(e).find('blockquote:last').text().trim())
                        });
                        raw_info.log_info = raw_info.log_info.join('==logs==');
                        rebuild_href(raw_info);
                    });
                }
                rebuild_href(raw_info);
            });
            raw_info.name = document.getElementsByTagName('h2')[0].textContent;
            raw_info.music_name = $('h2>span[dir="ltr"]').text();
            raw_info.music_author = raw_info.name.split(raw_info.music_name)[0].replace(/-.?$/, '').trim();
            raw_info.name = raw_info.name.replace(/\[|\]/g, '*');
            var cover = $('#cover_div_0').find('img').attr('onclick').match(/http.*(jpg|png|jpeg|webp)/)[0];
            var mediainfo = $('div.torrent_description').find('div:eq(1)');
            raw_info.tracklist = walkDOM(mediainfo[0].cloneNode(true)).trim();
            if ($(mediainfo).find('ol.postlist').length) {
                $(mediainfo).find('ol.postlist').find('li').map((index,e)=>{
                    if (index == 0) {
                        raw_info.tracklist = raw_info.tracklist.split($(e).text())[0];
                    }
                    raw_info.tracklist += `\n${index+1} ${$(e).text()}`;
                });
            }
            raw_info.descr = '[img]' + cover + '[/img]\n\n';
            raw_info.type = '音乐';
            tbody = document.getElementById('torrent_details');
            raw_info.edition_info = $(`#torrent${torrent_id}`).prev().text().replace('− ', '').trim();
            raw_info.small_descr = $(`#torrent${torrent_id}`).find('a:eq(5)').text();
            var blockquote = $(`#torrent_${torrent_id}`).find('blockquote:last').text();
            if (!blockquote.match(/发布于/)) {
                raw_info.descr += $(`#torrent_${torrent_id}`).find('blockquote:last').text();
            }
            raw_info.music_type = Array.from($('div.box_tags').find('a[href*="taglist"]').map((index,e)=>{
                return $(e).text();
            })).join(',');
            if (raw_info.name.match(/原声/)) {
                raw_info.music_type += ',OST';
            }
            var reg = /[\u4e00-\u9fa5]*/g;
            raw_info.small_descr += " " + raw_info.name.match(reg).filter((item)=>{return item;}).join(" ");
            raw_info.small_descr = raw_info.small_descr.trim();
            raw_info.name = raw_info.name.replace(reg, "").trim();

            raw_info.file_list = Array.from($(`#files_${torrent_id}`).find('tr:gt(0)').map((index,e)=>{
                return $(e).find('td:eq(0)').text();
            }));
            raw_info.file_list = raw_info.file_list.filter((item)=>{
                if (item.match(/\.(flac|wav)/i)) {
                    return item;
                }
            }).join('\n');
            raw_info.torrent_url = `https://dicmusic.com/` + $(`a[href*="download&id=${torrent_id}"]`).attr('href');
            raw_info.labels = Array.from($('a[href*=taglist]').map((_,e)=>{
                return $(e).text();
            })).join(', ');
            console.log(raw_info.labels)
        }

        if (origin_site == 'SugoiMusic') {
            if (site_url.match(/torrentid=(\d+)/)) {
                torrent_id = site_url.match(/torrentid=(\d+)/)[1];
            }
            getJson(`https://sugoimusic.me/ajax.php?action=torrent&id=${torrent_id}`, null, function(data){
                raw_info.json =  JSON.stringify(data);
                console.log(data)
                raw_info.descr = raw_info.descr.replace(cover, data.response.group.wikiImage);
                rebuild_href(raw_info);
            });
            raw_info.edition_info = $('#title_en').text();
            raw_info.name = raw_info.edition_info;
            console.log(raw_info.edition_info);
            raw_info.music_name = $('h2>span[dir="ltr"]').text();
            raw_info.music_author = raw_info.name.split(raw_info.music_name)[0].replace(/-.?$/, '').trim();
            raw_info.name = raw_info.name.replace(/\[|\]/g, '*');
            var cover = $('#cover_div_0').find('img').attr('src').match(/http.*?(jpg|png|jpeg|webp)/)[0];
            var mediainfo = $('div.torrent_description').find('div:eq(1)');
            raw_info.tracklist = walkDOM(mediainfo[0].cloneNode(true)).trim();
            if ($(mediainfo).find('ol.postlist').length) {
                $(mediainfo).find('ol.postlist').find('li').map((index,e)=>{
                    if (index == 0) {
                        raw_info.tracklist = raw_info.tracklist.split($(e).text())[0];
                    }
                    raw_info.tracklist += `\n${index+1} ${$(e).text()}`;
                });
            }
            raw_info.descr = '[img]' + cover + '[/img]\n\n';
            raw_info.type = '音乐';
            tbody = document.getElementById('torrent_details');
            raw_info.small_descr = $(`#torrent${torrent_id}`).find('a:eq(3)').text();
            console.log(raw_info.small_descr)
            raw_info.file_list = Array.from($(`#files_${torrent_id}`).find('tr:gt(0)').map((index,e)=>{
                return $(e).find('td:eq(0)').text();
            }));
            raw_info.file_list = raw_info.file_list.filter((item)=>{
                if (item.match(/\.(flac|wav)/i)) {
                    return item;
                }
            }).join('\n');
            raw_info.torrent_url = `https://sugoimusic.me/` + $(`a[href*="download&id=${torrent_id}"]`).attr('href');
        }

        if (origin_site == 'jpop') {
            raw_info.edition_info = document.getElementsByTagName('h2')[0].textContent;
            raw_info.name = document.getElementsByTagName('h2')[0].textContent.replace(/\[|\]/g, '');
            raw_info.releasetype = document.getElementsByTagName('h2')[0].textContent.match(/^\[(.*?)\]/)[1];
            raw_info.music_author = $('h2>a[href*="artist"]:last').text();
            raw_info.music_name = $('h2').text().split(raw_info.music_author)[1].replace(/^.?-.?|\[.*?\]/g, '').trim();
            raw_info.music_author = Array.from($('h2>a[href*="artist"]')).map((item)=>{return $(item).text()}).join(' & ');
            if (raw_info.music_author == 'V.A.') {
                raw_info.music_author = Array.from($('.box:eq(2)').find('li').map((index,e)=>{
                    return $(e).find('a:eq(0)').text();
                })).join(' & ');
            }

            raw_info.name = raw_info.name.replace(/album|Single/i, '').trim();
            if (site_url.match(/torrentid=(\d+)/)) {
                torrent_id = site_url.match(/torrentid=(\d+)/)[1];
            }
            tbody = document.getElementsByClassName('torrent_table')[0];
            raw_info.type = '音乐';
            var cover_box = document.getElementsByClassName('box')[1];
            try{
                var cover = '[img]' + 'https://jpopsuki.eu/' + cover_box.getElementsByTagName('img')[0].getAttribute('src') + '[/img]\n\n';
                cover = cover.replace('.th', '');
            } catch(Err) {
                cover = '';
            }
            var info_box = document.getElementsByClassName('body')[2];
            var info = info_box.textContent.trim();
            console.log(info)
            raw_info.descr = cover;

            var tr_matched = document.getElementById('torrent_' + torrent_id);

            var table = tr_matched.getElementsByTagName('table')[0];
            var tds = table.getElementsByTagName('td');
            raw_info.file_list = '';
            for (i=2; i < tds.length; i+=2) {
                if (tds[i].textContent.match(/\.flac|\.wav/i)) {
                    raw_info.file_list += tds[i].textContent + '\n';
                }
            }
            raw_info.small_descr = $(`a[href*="download&id=${torrent_id}"]`).parent().parent().find('a:eq(3)').text().replace('» ', '');
            console.log(raw_info.small_descr)

            raw_info.tracklist = info;
            var label_box = $('div.box:contains(Tags)')[0];
            var label_info = label_box.getElementsByTagName('ul')[0].textContent;
            raw_info.source_sel = label_info.source_sel();
            if (!raw_info.source_sel) {
                raw_info.source_sel = '日韩';
            }
            raw_info.music_media = tr_matched.previousElementSibling.innerHTML;
            raw_info.music_type = Array.from($('.box:eq(3)').find('li').map((index,e)=>{
                return $(e).find('a:eq(0)').text();
            }));
            raw_info.torrent_url = `https://jpopsuki.eu/` + $(`a[href*="download&id=${torrent_id}"]`).attr('href');
        }

        if (origin_site == 'OpenCD' && !opencd_mode) {
            raw_info.name = document.getElementsByClassName('title')[0].textContent;
            raw_info.type = '音乐';

            var cover_box = document.getElementsByClassName('cover')[0];
            try{
                var cover = cover_box.getElementsByTagName('img')[0].getAttribute('onclick');
                cover = cover.match(/'(.*)'/)[1];
                cover = 'https://open.cd/' + cover;
            } catch (err) {
                var cover = cover_box.getElementsByTagName('img')[0].getAttribute('src');
            }

            var descr_box = document.getElementById('divdescr');
            raw_info.descr = '[img]' + cover + '[/img]\n\n' + descr_box.textContent;

            var tracklist_box = document.getElementById('divtracklist');
            raw_info.tracklist = tracklist_box.textContent;

            var nfo_box = document.getElementById('divnfo');
            raw_info.log_info = nfo_box.textContent;

            tbodys = document.getElementById('outer').getElementsByTagName('tbody');
            if (tbodys.length == 6){
                tbody = tbodys[2];
            } else {
                tbody = tbodys[1];
            }

            raw_info.music_name = $('td:contains("专辑名称"):last').next().text();
            raw_info.music_author = $('td:contains("艺术家名"):last').next().find('a').text();
            raw_info.labels = Array.from($('td:contains("标签列表"):last').next().find('a').map((_, e)=>{
                return $(e).text();
            })).join(', ');
        }

        if (origin_site == 'TorrentLeech') {
            var name = document.getElementById('torrentnameid');
            raw_info.name = name.textContent.replace(/freeleech/ig, '').trim();
            tbody = document.getElementsByClassName('table borderless')[0];

            var imdb_box = document.getElementsByClassName('torrent-main row mt-30')[0];
            if (imdb_box.innerHTML.match(/http(s*):\/\/www.imdb.com\/title\/tt(\d+)/i)){
                raw_info.url = imdb_box.innerHTML.match(/http(s*):\/\/www.imdb.com\/title\/tt(\d+)/i)[0];
            }

            if (raw_info.url && all_sites_show_douban) {
                getData(raw_info.url, function(data){
                    console.log(data);
                    if (data.data) {
                        var score = data.data.average + '分';
                        if (!score.replace('分', '')) score = '暂无评分';
                        if (data.data.votes) score += `|${data.data.votes}人`;
                        $('h3').append(`<span> | </span><a href="${douban_prex}${data.data.id}" target="_blank">${data.data.title.split(' ')[0]}[${score}]</a>`)
                        $('div.torrent-summary').text(data.data.summary.replace(/ 　　/g, ''));
                    }
                });
            }
        }

        if (origin_site.match(/xthor/i)) {
            try{raw_info.name = document.getElementsByTagName('h1')[0].textContent;}catch{
                raw_info.name = document.getElementsByTagName('h2')[0].textContent;
            }
            var download = document.getElementById('Download');
            var tbody = download.getElementsByTagName('tbody')[0];
            raw_info.url = match_link('imdb', download.innerHTML).split('?').pop();

            if (download.innerHTML.match(/https:\/\/xthor.tk\/pic\/bannieres\/info_film.png/i)){
                raw_info.type = '电影';
            } else if (download.innerHTML.match(/https:\/\/xthor.tk\/pic\/bannieres\/info_serie.png/i)){
                raw_info.type = '剧集';
            }
            if (!raw_info.type && raw_info.name.match(/s\d+/i)) {
                raw_info.type = '剧集';
            } else {
                raw_info.type = '电影';
            }
            var div_index = document.getElementsByClassName('breadcrumb')[0];
            var div = document.createElement('div');
            var mytable = document.createElement('table');
            var mytbody = document.createElement('tbody');
            insert_row = mytable.insertRow(0);
            douban_box = mytable.insertRow(0);
            div.appendChild(mytable);
            div_index.parentNode.insertBefore(div, div_index);

            var nfo = document.getElementById('NFO');
            raw_info.descr = nfo.textContent;
            raw_info.descr = '[quote]\n' + raw_info.descr + '\n[/quote]';

            if (raw_info.url && all_sites_show_douban) {
                getData(raw_info.url, function(data){
                    console.log(data);
                    if (data.data) {
                        var score = data.data.average + '分';
                        if (!score.replace('分', '')) score = '暂无评分';
                        if (data.data.votes) score += `|${data.data.votes}人`;
                        $('td>h2:first').append(`<span> | </span><a href="${douban_prex}${data.data.id}" target="_blank">${data.data.title.split(' ')[0]}[${score}]</a>`)
                        $a = $('h2').parent().find('i:eq(-2)').find('a').text('查看……');
                        $('h2:first').parent().find('i:eq(-1)').text(`${data.data.summary.replace(/ 　　/g, '')}`);
                        $('h2:first').parent().find('i:eq(-1)').append($a);
                        $('span:contains(/10)').before(` / ${data.data.genre}`)
                    }
                });
            }
            raw_info.torrent_url = `https://xthor.tk/` + $('a[href^="download.php"]').attr('href');
        }

        if (origin_site == 'HDRoute') {
            var hdroute=GM_getResourceText("hdroute");
            if (hdroute !== null){
                eval(hdroute);
            } else {
                throw new Error('error');
            }
        }

        if (origin_site == 'ZHUQUE') {

            raw_info.name = $('div.ant-card-body:eq(0)').find('span:first').text();
            raw_info.small_descr = $('div.ant-card-body:eq(0)').find('span:eq(1)').text();
            var info = $('div.ant-card-body:eq(0)').text();
            raw_info.type = info.get_type();
            raw_info.url = match_link('imdb', $('body').html());

            raw_info.torrent_url = 'https://zhuque.in' + $('a[href*="/api/torrent/download/"]').attr('href');

            if ($('div.ant-collapse-content-box').length < 2) {
                $('div.ant-collapse-header:eq(1)').click();
                $('div.ant-collapse-header:eq(1)').click();
            }
            $('div.ant-collapse-content-box:eq(1)').wait(function(){
                var mediainfo = $('div.ant-collapse-content-box:eq(1)').find('span:eq(0)').text();
                raw_info.descr += `[quote]\n${mediainfo.trim()}\n[/quote]\n\n`;

                $('div.ant-card-body:eq(2)').find('img').map((index, e)=>{
                    raw_info.descr += `[img]${$(e).attr('src')}[/img]\n`;
                });
                $('#forward_r').wait(function(){
                    reBuildHref(raw_info, $('#forward_r')[0]);
                });
            });

            $('div.ant-card-body:eq(0)').parent().after(`
                <div class="ant-row ant-form-item" data-v-0e4c1106="" style="row-gap: 0px;">
                    <div class="ant-col ant-col-21 ant-form-item-control">
                        <div class="ant-form-item-control-input">
                            <div class="ant-form-item-control-input-content">
                                <table id="mytable" style="background-color: #F1FAFA; margin-left:10%; margin-top:3%"></table>
                            </div><!---->
                        </div><!----><!---->
                    </div>
                </div>`
            );
            tbody = $('#mytable')[0];
            insert_row = tbody.insertRow(0);
            douban_box = tbody.insertRow(0);
        }

        if (origin_site == 'FileList') {

            raw_info.name = document.getElementsByTagName('h4')[0].textContent;

            var mydiv = document.getElementsByClassName('cblock-innercontent')[0];
            raw_info.url = match_link('imdb', mydiv.innerHTML);
            raw_info.tmdb_url = match_link('tmdb', mydiv.innerHTML);
            var filelist_tmdb = match_link('tmdb', mydiv.innerHTML);

            if(filelist_tmdb && $('#descr').length){
                var bbbs = document.getElementsByTagName('b');
                for(i=0; i<bbbs.length; i++) {
                    if(bbbs[i].textContent == 'Category') {
                        var info = bbbs[i].parentNode.textContent;
                        if (info.match(/Filme/)){
                            raw_info.type = '电影';
                        } else if(info.match(/Seriale HD/)){
                            raw_info.type = '剧集';
                        } else if (info.match(/Anime|Desene/)) {
                            raw_info.type = '动漫';
                        }
                    }
                }

                var div_index = document.getElementById('descr');
                var div = document.createElement('div');
                var mytable = document.createElement('table');
                var mytbody = document.createElement('tbody');
                insert_row = mytable.insertRow(0);
                douban_box = mytable.insertRow(0);
                div.appendChild(mytable);

                var hr = document.createElement('hr');
                hr.setAttribute('class', 'separator');
                hr.style.marginTop =  '15px';
                hr.style.marginBottom =  '15px';
                div.appendChild(hr);

                div_index.previousElementSibling.parentNode.insertBefore(div, div_index.previousElementSibling);
                tbody = mytbody;

                var imgs = Array.from(div_index.getElementsByTagName('img'));
                imgs.forEach(e=> e.setAttribute("class", 'checkable_IMG'));
                try{raw_info.youtube_url = mydiv.innerHTML.match(/www.youtube.com\/embed\/([a-zA-Z0-9-]*)/)[1];} catch(err) {raw_info.youtube_url='';}
            } else {
                var tds = document.getElementsByTagName('td');
                for(i=0; i<tds.length; i++) {
                    if(tds[i].textContent.trim() == 'Type') {
                        var info = tds[i+1].textContent;
                        if (info.match(/Filme/)){
                            raw_info.type = '电影';
                        } else if(info.match(/Seriale HD/)){
                            raw_info.type = '剧集';
                        } else if (info.match(/Anime|Desene/)) {
                            raw_info.type = '动漫';
                        }
                    }
                }

                var mytable = document.getElementsByClassName('cblock-innercontent')[0].getElementsByTagName('tbody')[0];
                insert_row = mytable.insertRow(1);
                douban_box = mytable.insertRow(1);
                tbody = mytable;

                var description = document.getElementsByTagName('center')[0];
                var imgs = Array.from(description.getElementsByTagName('img'));
                imgs.forEach(e=> e.setAttribute("class", 'checkable_IMG'));
            }

            var img_urls = '';
            for (i=0; i < imgs.length; i++) {
                if (imgs[i].src.match(/tvdb|imdb|tmdb/)) {
                    continue;
                }
                if (imgs[i].parentNode.nodeName == 'A'){
                    img_urls += '[url='+ imgs[i].parentNode.href +'][img]' + imgs[i].src + '[/img][/url]';
                } else {
                    img_urls += '[img]' + imgs[i].src + '[/img]';
                }
            }

            function get_email(email) {
                if (email.length) {
                    var email_str = "";
                    var a = email.attr('data-cfemail');
                    r = parseInt(a.substr(0, 2), 16);
                    for (j = 2; a.length - j; j += 2) {
                        c = parseInt(a.substr(j, 2), 16) ^ r;
                        email_str += String.fromCharCode(c);
                    }
                    email.replaceWith(`${email_str}`);
                }
            }

            var torrentid = site_url.match(/id=\d+/)[0];
            var mediainfo_url = 'https://filelist.io/mediainfo.php?' + torrentid;
            setTimeout(() => {
                getDoc(mediainfo_url, null, function(doc){
                    var email = $('#maincolumn', doc).find('div[class="cblock-innercontent"]').find('a[class="__cf_email__"]');
                    get_email(email);
                    var mediainfo = $('#maincolumn', doc).find('div[class="cblock-innercontent"]')[0];
                    raw_info.descr = '';
                    descr = walkDOM(mediainfo.cloneNode(true));
                    descr = descr.replace(/\[.?font.*?\]/g, '');
                    raw_info.descr = '[quote]' + descr + '[/quote]';
                    raw_info.descr = add_thanks(raw_info.descr);
                    $('h4:first').after('<h4 style="margin-left:5px;"><font color="red"><--Mediainfo/BDinfo加载成功！！！--></font></h4>');
                    if (img_urls.match(/yes.ilikeshots.club\/images/)) {
                        $('.checkable_IMG').imgCheckbox({
                            onclick: function(el){
                                let tagA = Array.from(el.children()[0].parentNode.parentNode.parentNode.getElementsByTagName("a"));
                                tagA.forEach(e=>{e.onclick=function(){return false;};});
                                var isChecked = el.hasClass("imgChked"),
                                imgEl = el.children()[0];
                                if (isChecked) {
                                    raw_info.images.push(imgEl.parentNode.parentNode.href.split('?')[1]);
                                } else {
                                    raw_info.images.remove(imgEl.parentNode.parentNode.href.split('?')[1]);
                                }
                            },
                            "graySelected": false,
                            "checkMarkSize": "20px",
                            "fadeCheckMark": false
                        });
                    }
                    raw_info.descr += '\n\n' + img_urls.replace(/https:\/\/filelist.io\/redir.php\?/g, '');
                })
            }, 1000);

            if (raw_info.url && all_sites_show_douban) {
                getData(raw_info.url, function(data){
                    console.log(data);
                    if (data.data) {
                        $('img[src="/styles/images/starbig.png"]').first().parent().append(` | 豆：${data.data.average}`);
                        $container = $('img[src="/styles/images/starbig.png"]').parent().parent().next();
                        $container.find('div').prepend(`<a href="${douban_prex}${data.data.id}" target="_blank"><font color="red">${data.data.title.split(' ')[0]}</font></a> [${data.data.region}-${data.data.year}]`)
                        $container.find('div').find('i:eq(0)').text(' ' + data.data.genre);
                        $container.find('div').find('span').text(data.data.summary.replace(/ 　　/g, ''));
                    }
                });
            }
            raw_info.torrent_url = 'https://filelist.io/' + $('a[href^="download.php"]').attr('href');
            raw_info.torrent_name = $('a[href^="download.php"]').text().trim();
        }

        if (origin_site == 'CG') {
            tbody = document.getElementById('torrent_details').parentNode.getElementsByTagName('table')[0];
            raw_info.type = '电影';
        }

        if (origin_site == 'KG') {
            if (site_url.match(/reqdetails/)) {
                raw_info.name = $('h1').text().replace(/\(.*\)|Request for/, '').trim();
            }
            tbody = document.getElementsByClassName('main')[0].getElementsByTagName('table');
            for (i=0;i<tbody.length;i++){
                if (tbody[i].getElementsByTagName('td').length > 8) {
                    tbody = tbody[i];
                    break;
                }
            }
            insert_row = tbody.insertRow(1);
            douban_box = tbody.insertRow(1);
        }

        if (origin_site == 'iTS') {
            if (site_url.match(/id=(\d+)/)) {
                torrent_id = site_url.match(/id=(\d+)/)[1];
            }
            raw_info.name = document.getElementsByTagName('h1')[0].textContent;
            raw_info.url = match_link('imdb', document.getElementsByClassName('IMDBtable')[0].innerHTML);
            tbody = document.getElementsByClassName('IMDBtable')[0].parentNode.parentNode.parentNode;
            table = tbody.parentNode;
        }

        if (origin_site == 'NPUPT') {
            raw_info.name = raw_info.name.split('剩')[0].trim();
            raw_info.small_descr = $('.large').text();
            tbody = document.getElementsByClassName('table-striped')[0];
            insert_row = tbody.insertRow(0);
            raw_info.type = $('#main').html().match(/<span class="label label-success">类型:(.*)<\/span>/)[1].get_type();
        }

        if (origin_site == 'MTeam') {
            var o_table = $('div.ant-descriptions-view').find('table')[0];
            var o_insert_row = o_table.insertRow(4);
            var d_table = o_table.cloneNode(true);
            $(d_table).find('div[class="flex justify-between mb-3"]').remove();
            $(d_table).find('div.ant-image-mask').remove();
            for (var i = 0; i < d_table.rows.length; i++) {
                var row = d_table.rows[i];
                for (var j = 0; j < row.cells.length; j++) {
                  var cell = row.cells[j];
                  if (cell.tagName === "TH") {
                    var newCell = document.createElement("td");
                    newCell.innerHTML = cell.innerHTML;
                    row.replaceChild(newCell, cell);
                  }
                }
            }
            tbody = d_table;
            raw_info.name = $('h2').find('span:first').text();
            raw_info.torrent_url = site_url;
        }

        //-------------------------------------根据table获取其他信息——包含插入节点（混合）-------------------------------------------
        var tds = tbody.getElementsByTagName("td");
        if (origin_site == 'HUDBT'){
            tds = tbody.getElementsByTagName("dt");
        }

        //循环处理所有信息
        for (i = 0; i < tds.length; i++) {
            if (origin_site == 'PHD' || origin_site == 'avz' || origin_site == 'CNZ') {
                if (i == 1 && tds[i].innerHTML.match(/Movie$/i)) {
                    raw_info.type = '电影';
                } else if (i == 1 && tds[i].innerHTML.match(/TV-Show$/i)) {
                    raw_info.type = '剧集';
                } else if (i == 3) {
                    raw_info.name = tds[i].innerHTML;
                    if (raw_info.name.match(/ E\d+/)) {
                        raw_info.name = raw_info.name.replace(/E\d+/, function(data){
                            return 'S01' + data;
                        });
                    }
                }
                if (tds[i].textContent == 'Video Quality') {
                    raw_info.standard_sel = tds[i + 1].innerHTML.trim();
                } else if (tds[i].textContent == 'Description') {
                    raw_info.descr += walkDOM(tds[i + 1]);
                } else if (tds[i].textContent == 'Rip Type') {
                    var tmp_type = tds[i + 1].innerHTML.trim();
                    if (tmp_type.match(/BluRay Raw/i)){
                        raw_info.medium_sel = 'Blu-ray';
                    } else if (tmp_type.match(/BluRay/i)){
                        raw_info.medium_sel = 'Encode';
                    }
                } else if (tds[i].textContent.trim() == 'Title') {
                    table = tds[i].parentNode.parentNode;
                    insert_row = table.insertRow(i / 2 + 1);
                    douban_box = table.insertRow(i / 2 + 1);
                }
            }

            if (origin_site == 'HDT') {
                if (tds[i].textContent.match(/Category:/i) && i>1) {
                    if(tds[i+1].textContent.match(/Movie/i)){
                        raw_info.type = '电影';
                    } else if (tds[i+1].textContent.match(/TV Show/i)) {
                        raw_info.type = '剧集';
                    }
                    if (tds[i+1].textContent.medium_sel()) {
                        raw_info.medium_sel = tds[i+1].textContent.medium_sel();
                    }
                }

                if (i < 5 && tds[i].textContent.match(/Torrent/)) {
                    raw_info.name = tds[i+1].textContent;
                }
                if (tds[i].innerHTML.match(/http(s*):\/\/www.imdb.com\/title\/tt(\d+)/i)) {
                    raw_info.url = tds[i].innerHTML.match(/http(s*):\/\/www.imdb.com\/title\/tt(\d+)/i)[0] + '/';
                }
            }

            if (origin_site == 'iTS'){
                if (tds[i].textContent == 'Info hash'){
                    insert_row = table.insertRow(i / 2 + 1);
                    douban_box = table.insertRow(i / 2 + 1);
                } else if (tds[i].textContent == 'Type') {
                    if(tds[i+1].textContent.match(/Movie/i)){
                        raw_info.type = '电影';
                    } else if (tds[i+1].textContent.match(/TV/i)) {
                        raw_info.type = '剧集';
                    }
                } else if (tds[i].textContent == 'Description') {
                    descr = tds[i+1].cloneNode(true);
                    raw_info.descr = walkDOM(descr);
                    raw_info.descr = '[quote]\n' + raw_info.descr + '\n[/quote]';
                    raw_info.descr = raw_info.descr.replace(/\[img\]https:\/\/shadowthein.*?\.gif\[\/img\]/g, '');
                    raw_info.descr = raw_info.descr.replace(/This image.*?Click this bar to view the full image./g, '');
                    raw_info.descr = raw_info.descr.replace(/\[url=.*https:\/\/i.ibb.co\/KD855ZM\/IMDb-Logo-2016.png\[\/img\]\[\/url\].*?\[size=3\]/, '');
                    raw_info.descr = raw_info.descr.replace(/\[url=.*?www.rottentomatoes.com.*rt-logo.png\[\/img\]\[\/url\]/, '');
                    raw_info.descr = raw_info.descr.replace('[img]https://i.ibb.co/VWMtVnN/0fa9aceda3e5.png[/img]', '');
                    var img_urls = raw_info.descr.match(/(\[url=.*\])?\[img\].*?\[\/img\](\[\/url\])?/g);
                    if (img_urls){
                        img_urls = img_urls.join('\n');
                        img_urls = img_urls.replace(/https:\/\/shadowthein.net\/redir.php\?/g, '');
                    } else {
                        img_urls = '';
                    }

                    var mediainfo_url = 'https://shadowthein.net/mediainfo.php?id=' + torrent_id;
                    getDoc(mediainfo_url, null, function(doc){
                        var mediainfo = doc.getElementsByTagName('pre')[0];
                        descr = mediainfo.textContent;
                        raw_info.descr = '';
                        raw_info.descr = '[quote]' + descr + '[/quote]\n\n' + img_urls;
                    });
                }
            }

            if (['PTP', 'MTV', 'UHD', 'HDF', 'RED' , 'BTN', 'jpop', 'GPW', 'HD-Only', 'SC', 'ANT', 'lztr', 'DICMusic', 'OPS', 'TVV', 'SugoiMusic'].indexOf(origin_site) > -1) {
                if (origin_site == 'PTP' || origin_site == 'UHD' || origin_site == 'GPW' || origin_site == 'SC' || origin_site == 'ANT') {
                    raw_info.type = '电影';
                } else if (origin_site == 'BTN' || origin_site == 'MTV' || origin_site == 'TVV'){
                    raw_info.type = '剧集';
                }
                if (tds[i].innerHTML.match(`torrent_(torrent_|detail_)?${torrent_id}`) || (['BTN','jpop', 'TVV', 'SugoiMusic'].indexOf(origin_site) >-1 && tds[i].parentNode.innerHTML.match('id=' + torrent_id))) {
                    table = tds[i].parentNode.parentNode;
                    if (origin_site == 'HDF' || origin_site == 'UHD') {
                        if(tds[i].parentNode.textContent.match(/s\d{1,3}/i)) {
                            raw_info.type = '剧集';
                        } else {
                            raw_info.type = '电影';
                        }
                    } else if (origin_site == 'RED') {
                        raw_info.small_descr = tds[i].getElementsByTagName('a')[3].textContent;
                        var tr = tds[i].parentNode;
                        while(true){
                            tr = tr.previousElementSibling;
                            var class_info = tr.getAttribute('class');
                            if (class_info.match(/release/) && !class_info.match(/torrentdetails/)) {
                                raw_info.music_media = tr.textContent.trim();
                                break;
                            }
                        }
                    }
                    if (!is_inserted) {
                        var child_nodes = table.childNodes;
                        var rowcount = 0;
                        for (k = 0; k < child_nodes.length; k++) {
                            if (child_nodes[k].nodeName == 'TR') {
                                rowcount = rowcount + 1;
                                if (child_nodes[k].id.match(`torrent_(torrent_|detail_)?${torrent_id}`)) {
                                    break;
                                }
                            }
                        }
                        search_row = table.insertRow(rowcount - 1);
                        insert_row = table.insertRow(rowcount - 1);
                        is_inserted = true;
                    }
                }
            }

            if (['BHD', 'ACM', 'HDOli', 'JPTV', 'Monika', 'DTR'].indexOf(origin_site) > -1){
                if (['Name', 'Nombre', '名称', '标题'].indexOf(tds[i].textContent.trim())>-1) {
                    raw_info.name = tds[i+1].textContent.replace(/ *\n.*/gm, '').trim();
                    if (origin_site == 'HDOli') {
                        raw_info.name = raw_info.name.replace(/[|]/g, '');
                    }
                    table = tds[i].parentNode.parentNode;
                    insert_row = table.insertRow(i / 2 + 1);
                    douban_box = table.insertRow(i / 2 + 1);
                }
                if (['Category', '类别', 'Categoría'].indexOf(tds[i].textContent.trim()) > -1){
                    if (tds[i+1].innerHTML.match(/Movie|电影|Películas/i)) {
                        raw_info.type = '电影';
                    }
                    if (tds[i+1].innerHTML.match(/(TV-Show|TV|剧集|Series)/i)) {
                        raw_info.type = '剧集';
                    }
                }
                if (['Type', 'Tipo', '规格'].indexOf(tds[i].textContent.trim()) > -1) {
                    //还有一些类型
                    var tmp_type = tds[i + 1].innerHTML.trim();
                    if (tmp_type.match(/BD 50/i)){
                        raw_info.medium_sel = 'Blu-ray';
                    } else if (tmp_type.match(/Remux/i)){
                        raw_info.medium_sel = 'Remux';
                    } else if (tmp_type.match(/encode/i)){
                        raw_info.medium_sel = 'Encode';
                    }  else if (tmp_type.match(/web-dl/i)){
                        raw_info.medium_sel = 'WEB-DL';
                    }
                }
            } else {
                if (tds[i].textContent.match(/Category/)){
                    if (origin_site == 'HDB') {
                        raw_info.type = tds[i].textContent.get_type();
                        raw_info.medium_sel = tds[i].textContent.medium_sel();
                    } else if (origin_site == 'bit-hdtv') {
                        raw_info.type = tds[i].textContent.get_type();
                        raw_info.medium_sel = tds[i].textContent.medium_sel();
                        raw_info.standard_sel = tds[i].textContent.standard_sel();
                    } else {
                        raw_info.type = tds[i+1].textContent.get_type();
                        raw_info.medium_sel = tds[i+1].textContent.medium_sel();
                        if (raw_info.name.match(/COMPLETE.*?BLURAY/)) {
                            raw_info.medium_sel = 'Blu-ray';
                        }
                    }
                }
            }

            if (origin_site == 'TorrentLeech') {
                if (tds[i].textContent.trim() == 'Added') {
                    table = tds[i].parentNode.parentNode;
                    insert_row = table.insertRow(i / 2 + 1);
                    douban_box = table.insertRow(i / 2 + 1);
                }
                if (tds[i].textContent.trim() == 'Category') {
                    if (tds[i+1].textContent.match(/(DVDRip|webrip|HDRIP|BLURAY|DVDR|4K)/i)) {
                        raw_info.type = '电影';
                    } else if (tds[i+1].textContent.match(/(Episodes)/i)) {
                        raw_info.type = '剧集';
                    } else if (tds[i+1].textContent.match(/documentaries/i)) {
                        raw_info.type = '纪录';
                    }
                }
                if (raw_info.name.match(/s\d+/i)){
                    raw_info.type = '剧集';
                }
            }

            if (origin_site == 'HDChina') {
                if (tds[i].innerHTML == '字幕') {
                    table = tds[i].parentNode.parentNode;
                    insert_row = table.insertRow(i / 2 + 1);
                    if (douban_button_needed){
                        douban_box = table.insertRow(i / 2 + 1);
                    }
                }
            }
            else if (origin_site == 'HUDBT'){
                if (!is_inserted){
                    if (['行为'].indexOf(tds[i].textContent) >-1 ) {
                        table = tds[i].parentNode;
                        var dd = document.createElement('dd');
                        table.insertBefore(dd, tds[i]);
                        var dt = document.createElement('dt');
                        dt.textContent = '转载';
                        table.insertBefore(dt, dd);
                        is_inserted = true;
                    }
                }
            } else {
                if (['行为', '小货车', '行為', '种子认领', '簡介', '简介', '操作', 'Action', 'Tagline', 'Tools:', '设备'].indexOf(tds[i].textContent.trim()) >-1 && origin_site != 'KG') {
                    if (!is_inserted){
                        if (origin_site != 'MTV') {
                            table = tds[i].parentNode.parentNode;
                            if (origin_site == 'TTG'){
                                insert_row = table.insertRow(i / 2 - 1);
                                if (douban_button_needed) {
                                    douban_box = table.insertRow(i / 2 - 1);
                                }
                            } else if (origin_site == 'OpenCD'){
                                insert_row = table.insertRow(6);
                                douban_box = table.insertRow(6);
                            } else {
                                insert_row = table.insertRow(i / 2 + 1);
                            }
                        }
                        if (origin_site == 'HDT' || origin_site == 'CG') {
                            douban_box = table.insertRow(i / 2 + 1);
                        } else if ((origin_site == 'OurBits' || origin_site == 'FRDS') && douban_button_needed) {
                            douban_box = table.insertRow(i / 2 + 1);
                        }
                        is_inserted = true;
                    }
                }
            }

            if (['副标题','副標題','副标题', 'Small Description'].indexOf(tds[i].textContent) > -1) {
                if (origin_site == 'HUDBT') {
                    raw_info.small_descr = tds[i].nextSibling.textContent;
                } else {
                    if (origin_site == 'U2') {
                        raw_info.small_descr = $(tds[i]).parent().find('td:last').text();
                    } else if (origin_site != 'FileList') {
                        raw_info.small_descr += tds[i].parentNode.lastChild.textContent;
                    }
                }
            }

            if (origin_site == 'CG') {
                if (tds[i].textContent == 'IMDB') {
                    raw_info.url = 'https://www.imdb.com/title/' + tds[i+1].textContent + '/'
                }
                if (tds[i].textContent == 'Description') {
                    var imgs = tds[i+1].getElementsByTagName('img');
                    var imgs_str = '';
                    for (kk=0; kk < imgs.length; kk++){
                        if (imgs[kk].src.match(/cinemageddon.net/)) {
                            var img_url = imgs[kk].src;
                            try{img_url = img_url.split('=')[1].replace(/%3A/g, ':').replace(/%2F/g, '/');}catch(err){}
                            imgs_str += '[img]' + img_url + '[/img]';
                        } else {
                            imgs_str += '[img]' + imgs[kk].src + '[/img]';
                        }

                    }
                }
                if (tds[i].textContent == 'mediainfo') {
                    raw_info.name = tds[i+1].getElementsByTagName('a')[0].textContent;
                    var descr_box = tds[i+1].getElementsByTagName('div')[0].cloneNode(true);
                    raw_info.descr = walkDOM(descr_box);
                    raw_info.descr = '[quote]' + raw_info.descr + '[/quote]\n\n' + imgs_str;
                }
            }

            if (origin_site == 'KG') {
                if (tds[i].textContent == 'Internet Link' || tds[i].textContent == 'IMDB') {
                    raw_info.url = tds[i+1].textContent + '/';
                } else if (tds[i].textContent == 'Type') {
                    if (tds[i+1].textContent.match(/movie/i)) {
                        raw_info.type = '电影';
                    } else if (tds[i+1].textContent.match(/music/i)) {
                        raw_info.type = '音乐';
                    }
                } else if (tds[i].textContent == 'Description') {
                    var imgs = tds[i+1].getElementsByTagName('img');
                    var imgs_str = '';
                    for (kk=0; kk < imgs.length; kk++){
                        imgs_str += '[img]' + imgs[kk].src + '[/img]';
                    }
                } else if (tds[i].textContent == 'Rip Specs') {
                    try{
                        raw_info.name = tds[i+1].getElementsByTagName('a')[0].textContent;
                        raw_info.descr = tds[i+1].getElementsByClassName('mediainfo')[0].textContent;
                    } catch(err){
                        raw_info.name=document.getElementsByTagName('h1')[0].textContent.split('-').pop().trim();
                        raw_info.descr = tds[i+1].textContent;
                    }
                    raw_info.descr = '[quote]' + raw_info.descr + '[/quote]\n\n' + imgs_str;
                }  else if (tds[i].textContent == 'Source') {
                    raw_info.medium_sel = tds[i+1].textContent.medium_sel();
                    if (tds[i+1].textContent.trim() == 'WEB') {
                        raw_info.medium_sel = 'WEB-DL';
                    }
                }
            }

            //主要是类型、medium_sel、地区等等信息
            if (['基本信息', '详细信息', '类型', '基本資訊', '標籤列表：', '媒介：', 'Basic Info'].indexOf(tds[i].textContent) >-1) {
                if (i + 1 < tds.length) {
                    if (origin_site == 'HUDBT') {
                        info_text = tds[i].nextSibling.textContent;
                    } else {
                        info_text = tds[i + 1].textContent;
                    }
                    if(info_text.source_sel()){
                        raw_info.source_sel = info_text.source_sel();
                    }
                    if (tds[i].innerHTML == '標籤列表：') {
                        raw_info.music_type = tds[i+1].textContent;
                        raw_info.descr += '\n标签： ' + raw_info.music_type + '\n';
                    } else if (tds[i].innerHTML == '媒介：') {
                        raw_info.music_media = tds[i+1].textContent;
                    }

                    if (tds[i].innerHTML == '基本資訊' && opencd_mode) {
                        raw_info.music_type = tds[i+1].textContent;
                        raw_info.music_media = tds[i+1].textContent;
                    }
                    if (info_text.get_type()){
                        raw_info.type = info_text.get_type();
                    }
                    if (origin_site == 'TTG' && info_text == 'BluRay原盘'){
                        raw_info.type = '电影';
                    }
                    if(info_text.medium_sel()){
                        raw_info.medium_sel = info_text.medium_sel();
                    }
                    if (info_text.codec_sel()){
                        raw_info.codec_sel = info_text.codec_sel();
                    }
                    if (info_text.audiocodec_sel()){
                        raw_info.audiocodec_sel = info_text.audiocodec_sel();
                    }
                    if (origin_site != 'TTG'){
                        if (info_text.standard_sel()){
                            raw_info.standard_sel = info_text.standard_sel();
                        }
                    }
                    if (site_url.match(/music.php/)) {
                        raw_info.music_media = tds[i+1].textContent;
                    }
                }
            }

            if (tds[i].innerHTML == '详细信息' && origin_site == 'TJUPT') {
                if (tds[i+1].innerHTML.match(/英文名:(.*)/i)){
                    raw_info.name = tds[i+1].innerHTML.match(/英文名:<\/b>(.*?)(&nbsp|<br>)/i)[1];
                }
                raw_info.fullname = $('h1').text();
                if (tds[i+1].innerHTML.match(/动漫文件格式:(.*)/i)) {
                    var type = tds[i+1].innerHTML.match(/动漫类别:<\/b>(.*?)<br>/i)[1];
                    raw_info.name += type == '剧场' ? ' MOVIE': ' ' + type;

                    if (tds[i+1].innerHTML.match(/动漫集数:(.*)/i)) {
                        raw_info.name += ' ' + tds[i+1].innerHTML.match(/动漫集数:<\/b>(.*?)<br>/i)[1].replace(type, '').replace('连载', '');
                    }
                    var format = tds[i+1].innerHTML.match(/动漫文件格式:<\/b>(.*?)<br>/i)[1];
                    var standard = tds[i+1].innerHTML.match(/画面分辨率:<\/b>(.*?)<br>/i)[1];
                    var team = tds[i+1].innerHTML.match(/字幕组\/漫画作者\/专辑艺术家:<\/b>(.*?)<br>/i)[1];
                    if (format.match(/BDRip|TVRip|DVDRip|BDMV|DVDISO|HQ-HDTVRip|HDTVRip/i)) {
                        raw_info.name += ' ' + format.match(/BDrip|TVRip|DVDRip|BDMV|DVDISO|HQ-HDTVRip|HDTVRip/i)[0];
                    }
                    raw_info.name += ' ' + standard;
                    if ((format+raw_info.descr).match(/x264|x265|h.?264|h.265|hevc/i)) {
                        raw_info.name += ' ' + (format+raw_info.descr).match(/x264|x265|h.?264|h.265|hevc|AVC/i)[0];
                    }
                    if ((format+raw_info.descr).match(/FLAC|AAC|AC3|DTS/i)) {
                        raw_info.name += ' ' + (format+raw_info.descr).match(/FLAC|AAC|AC3|DTS|LPCM/i)[0];
                    }
                    raw_info.name += team.trim() ? '-'+ team.replace(/&amp;/, '&'): '';
                    try {
                        var region = tds[i+1].innerHTML.match(/动漫国别:<\/b>(.*?)<br>/i)[1];
                        if (region == '日漫') { raw_info.source_sel = '日本'}
                        if (region == '美漫') { raw_info.source_sel = '欧美'}
                        if (region == '国产') { raw_info.source_sel = '大陆'}
                    } catch (err) {}
                    var c_name = tds[i+1].innerHTML.match(/中文名:<\/b>(.*?)(&nbsp|<br>)/i)[1];
                    raw_info.small_descr += c_name + ' | ';
                }
                raw_info.torrentName = $('#bookmark0').parent().find('a:first').text();
            }

            if (tds[i].textContent == '簡介' && origin_site == 'MTeam') {
                raw_info.descr = walkDOM(tds[i+1]);
            }
        }

        if (origin_site == 'U2'){
            raw_info.torrentName = $('a:contains(".torrent")').text();
            raw_info.descr = raw_info.descr.replace('SPEC', '[quote]\r\nSPEC');
            raw_info.descr = raw_info.descr.replace(/\[quote\]\n(感|Thank|OP From|OP&ED)/, function(data){
                return `[/quote]\r\n[quote]\r\n${data.split('\n')[1]}`;
            });
            raw_info.animate_info = raw_info.name;
            raw_info.name = raw_info.name.match(/\[.*?\]/g)[1].replace(/\[|\]/g, '');
            var anidb_info = '';
            if ($('#kanidb').length) {
                var anidb_info = $('#kanidb').text();
                if (anidb_info.match(/Wiki \(JP\)/)) {
                    raw_info.source_sel = '日本';
                }
            }
            if ((raw_info.descr+anidb_info).match(/(19|20)\d{2}/)){
                raw_info.name += ' ' + (raw_info.descr+anidb_info).match(/(19|20)\d{2}/)[0];
            }
            if (raw_info.animate_info.match(/\[movie\]/i)) {
                raw_info.name += ' MOVIE'
            }
            if (raw_info.animate_info.match(/BDRip|TVRip|DVDRip|BDMV|DVDISO|HQ-HDTVRip|HDTVRip/i)) {
                raw_info.name += ' ' + raw_info.animate_info.match(/BDrip|TVRip|DVDRip|BDMV|DVDISO|HQ-HDTVRip|HDTVRip/i)[0];
            }
            if (raw_info.name.match(/BDMV|BDRip/)) {
                raw_info.name += ' 1080p';
                raw_info.standard_sel = '1080p';
            }
            var release = raw_info.animate_info.match(/\[.*?\]/g).filter((e)=> { if (e.match(/disc|fin|Vol/i)) return e });
            if (release.length) {
                raw_info.name += ' ' + release[0].replace(/\[|\]/g, '');
            }
            if ((raw_info.animate_info+raw_info.descr).match(/x264|x265|h.?264|h.265|hevc|avc/i)) {
                raw_info.name += ' ' + (raw_info.animate_info+raw_info.descr).match(/x264|x265|h.?264|h.265|hevc|AVC/i)[0];
            }
            if ((raw_info.animate_info+raw_info.descr).match(/Truehd|DTS(.?HD.?MA.*)?|LPCM|FLAC|AC3/i)) {
                var audio = (raw_info.animate_info+raw_info.descr).match(/Truehd|DTS(.?HD.?MA.*)?|LPCM|FLAC|AC3/i)[0];
                if (audio.match(/DTS(.?HD.?MA.*\d\.\d)/i)) {
                    audio = 'DTS-HDMA ' + audio.match(/\d\.\d/)[0];
                }
                raw_info.name += ' ' + audio;
            } else {
                if ((raw_info.animate_info+raw_info.descr).match(/AAC/) && !(raw_info.animate_info+raw_info.descr).match(/AACS/)) {
                    raw_info.name += ' AAC';
                }
            }

            var author = raw_info.animate_info.match(/\[.*?\]/g).pop().replace(/\[|\]/g, '');
            if ((raw_info.small_descr + raw_info.animate_info).match(/自抓|自购|自購|自压|自壓/)) {
                if (author.match(/^(jp|r2j|r2_j.*|r2fr|ita|ger|uk|tw|hk|.*flac.*|scans|.*\+.*|usa|fra|movie|tv|自压|自抓|自购|自購|.*自壓.*)$/i)) {
                    raw_info.name += '-Anonymous@U2';
                } else {
                    raw_info.name += `-${author}@U2`;
                }
            } else {
                if (author.match(/@|arin/i)) {
                    raw_info.name += `-${author}`;
                } else {
                    var authors = ['lolihouse', 'jsum','Raws', 'KoushinRip', 'ANK','VCB-Studio', 'VCB','LittlePox', 'LittleBakas','ANE','Reinforce', 'SweetDreamDay','Moozzi2','mawen1250']
                    authors.forEach((item)=>{
                        if (author.match(item)) {
                            raw_info.name += `-${author}@U2`;
                        }
                    });
                }
                raw_info.descr = '[quote]转自U2, 对原作者表示感谢[/quote]\n\n' + raw_info.descr;
            }
            try {
                var uploader = $('td:contains("发布人")').next().text().replace(/\(.*\)/, '').trim();
                raw_info.name = raw_info.name.replace('Anonymous', uploader);
            } catch (err) {}

            raw_info.small_descr += ' ' + raw_info.animate_info.match(/\[.*?\]/g)[0].replace(/\[|\]/g, '');
            raw_info.type = '动漫';
            try{raw_info.anidb = raw_info.descr.match(/https:\/\/anidb\.net\/a\d+/i)[0];}catch(err){}
            if (!raw_info.anidb){
                try{raw_info.anidb = document.getElementById('kanidb').parentNode.innerHTML.match(/https:\/\/anidb\.net\/a\d+/i)[0];}catch(err){}
            }
            raw_info.anidb = raw_info.anidb.replace('anidb.net/a', 'anidb.net/anime/');
            try{raw_info.url = raw_info.descr.match(/https:\/\/www\.imdb\.com\/title\/tt\d+/i)[0];}catch(err){}
            var info_text = raw_info.animate_info + raw_info.descr + raw_info.name;
            if(info_text.medium_sel()){
                raw_info.medium_sel = info_text.medium_sel();
            }
            if (info_text.codec_sel()){
                raw_info.codec_sel = info_text.codec_sel();
            }
            if (info_text.audiocodec_sel()){
                raw_info.audiocodec_sel = info_text.audiocodec_sel();
            }
        }

        if (origin_site == 'MTeam') {
            insert_row = o_insert_row;
            var torrent_id = site_url.match(/detail\/(\d+)/)[1];
            postData('https://kp.m-team.cc/api/torrent/detail', encodeURI(`id=${torrent_id}`), function(data) {
                data = JSON.parse(data);
                data = data.data;
                raw_info.descr = data.descr.trim();
                raw_info.descr = raw_info.descr.replace(/!\[\]\(.*?.(jpg|png)\)/, function(data){
                    return `[img]${data.match(/\((.*?)\)/)[1]}[/img]`;
                });
                if (data.mediainfo) {
                    console.log(data)
                    var mediainfo = data.mediainfo;
                    try {
                        mediainfo = decodeURIComponent(data.mediainfo);
                    } catch (err) {}
                    var picture_info = '';
                    try{
                        var intro = raw_info.descr.indexOf('◎简　　介');
                        var pictures = raw_info.descr.match(/(\[url=.*?\])?\[img\].*?\[\/img\](\[\/url\])?\n?/g);
                        pictures.forEach(item=>{
                            if (raw_info.descr.indexOf(item) > 300) {
                                raw_info.descr = raw_info.descr.replace(item, '');
                                picture_info += item + '\n';
                            }
                        });
                        raw_info.descr = raw_info.descr.trim() + `\n  \n[quote]\n${mediainfo.trim()}\n[/quote]\n  \n` + picture_info;
                    } catch(err) {
                        console.log(err)
                    }
                }
                raw_info.descr = raw_info.descr.replace(/https:\/\/kp.m-team.cc.*?url=/ig, '');
                raw_info.descr = raw_info.descr.replace(/^\[quote\]\[b\]\[color=blue\]转自.*?，感谢原制作者发布。\[\/color\]\[\/b\]\[\/quote\]/i, '');
                raw_info.descr = add_thanks(raw_info.descr);
                rebuild_href(raw_info);
                console.log(raw_info.descr);
            });
        }

        //------------------------------------国外站点简介单独处理，最后辅以豆瓣按钮----------------------------------------------

        if (origin_site == 'PTP') {
            var torrent_box = document.getElementById("torrent_" + torrent_id);
            var subtitle_box = $(torrent_box).find('#subtitle_manager');
            subtitle_box.find('img').map((idnex, e)=>{
                if ($(e).attr('title') != "No Subtitles"){
                    raw_info.subtitles.push($(e).attr('title'));
                }
            });
            if ($('#trumpable_'+torrent_id).length && $('#trumpable_'+torrent_id).text().match('Hardcoded Subtitles')) {
                raw_info.subtitles.push('Hardcoded');
            }

            raw_info.edition_info = $(`#group_torrent_header_${torrent_id}`).find('a[id="PermaLinkedTorrentToggler"]').text();

            var torrent_div = torrent_box.getElementsByClassName("bbcode-table-guard");
            raw_info.comparisons = walk_ptp(torrent_div[0].cloneNode(true)).trim();
            $(torrent_box).find('a[onclick*="BBCode.MediaInfoToggleShow"]').each((index,e)=>{
                raw_info.multi_mediainfo += `[quote]${$(e).next().next().text()}[/quote]`;
            });
            torrent_div = torrent_div[torrent_div.length-1];

            var tmp_tag_as = torrent_div.getElementsByTagName('a');
            var compare_picture = '';
            for (i=0; i< tmp_tag_as.length; i++){
                if (tmp_tag_as[i].getAttribute("onclick") == 'BBCode.MediaInfoToggleShow( this );'){
                    raw_info.name = tmp_tag_as[i].textContent.replace(/\[|\]|\(|\)|mkv$|mp4$/g, '').trim();
                }
                try {
                    if (tmp_tag_as[i].getAttribute("onclick").match(/BBCode.ScreenshotComparisonToggleShow/i)){
                        comparing_picture = tmp_tag_as[i].getAttribute("onclick");
                        info = comparing_picture.match(/\[.*?\]/ig);
                        if (info){
                            try {
                                tmp_string_0 = info[0].replace(/\[|\]|"/ig, '');
                                tmp_string_0 = tmp_string_0.replace(/,/ig, ' | ');
                                compare_picture += '\n' + tmp_string_0 + '\n';
                                team_count = tmp_string_0.split('|').length;
                                tmp_string_1 = info[1].replace(/\[|\]|"/ig, '');
                                pictures = tmp_string_1.split(',');
                                for (idd = 0; idd < pictures.length; idd++){
                                    if ((idd+1) % team_count == 0){
                                        compare_picture += '[img]' + pictures[idd].replace(/\\/g, '') + '[/img]\n';
                                    } else {
                                        compare_picture += '[img]' + pictures[idd].replace(/\\/g, '')+ '[/img]';
                                    }
                                }
                            } catch (err){
                            }
                        }
                    }
                } catch (err){
                }
            }

            if (!raw_info.name || !raw_info.descr.match(raw_info.name)) {
                var file_box = document.getElementById('files_' + torrent_id);
                raw_info.name = file_box.getElementsByTagName('td')[0].textContent.replace(/\[|\]|\(|\)|mkv$|mp4$/g, '').trim();
            }
            var descr_box = torrent_box.getElementsByTagName('blockquote');
            for (i=0; i<descr_box.length; i++){
                var tmp_descr = descr_box[i].textContent;
                if (tmp_descr.match(/Unique ID|DISC INFO:|.MPLS|General/i)){
                    descr_info = descr_box[i].textContent;
                    if (descr_info.match(/Complete.*?name.*?(VOB|IFO)/i)) {
                        if (descr_info.match(/Complete.*?name.*?VOB/i)){
                            descr_info += '[/quote]\n\n[quote]' + descr_box[i+1].textContent;
                        } else {
                            descr_info = descr_box[i+1].textContent + '[/quote]\n\n[quote]' + descr_info;
                        }
                    }
                    break;
                }
            }
            if (raw_info.edition_info.match(/DVD\d/)) {
                raw_info.medium_sel = 'DVD';
                raw_info.name = $('h2').text().split(/\[.*?\]/)[0] + $('h2').text().match(/\[(\d+)\]/)[1];
                raw_info.name += ' ' + raw_info.edition_info.match(/NTSC|PAL/)[0];
                raw_info.name += ' ' + raw_info.edition_info.match(/DVD\d+/)[0];
            }
            try {
                raw_info.descr = '[quote]' + descr_info + '[/quote]\n\n';
            } catch (err) {}
            var img_urls = '';
            var imgs = torrent_div.getElementsByTagName('img');
            for (i=0; i< imgs.length; i++){
                img_urls += '[img]' + imgs[i].src + '[/img]\n';
            }
            raw_info.descr += img_urls;

            var img = Array.from(imgs);
            img.forEach(e=> {e.classList.add('checkable_IMG'); e.onclick='';});
            $('.checkable_IMG').imgCheckbox({
                onclick: function(el){
                    var isChecked = el.hasClass("imgChked"),
                    imgEl = el.children()[0]; // the img element
                    img_src = imgEl.src;
                    if (isChecked) {
                        raw_info.images.push(img_src);
                    } else {
                        raw_info.images.remove(img_src);
                    }
                    console.log(raw_info.images);
                },
                "graySelected": false,
                "checkMarkSize": "20px",
                "fadeCheckMark": false
            });

            if (compare_picture){
                raw_info.descr += '\n\n[b]对比图[/b]\n' + compare_picture;
            }

            raw_info.name = raw_info.name.replace(/\s+-\s+/i, '-');
            //PTP原盘处理
            if(raw_info.descr.match(/.MPLS/i)) {
                var tmp_name = document.getElementsByTagName('h2')[0].textContent.split('[')[0].trim();
                var tmp_year = document.getElementsByTagName('h2')[0].textContent.match(/\[(\d+)\]/)[1];
                raw_info.name = get_bluray_name_from_descr(raw_info.descr, tmp_name+' '+tmp_year);
                var team = document.getElementById('group_torrent_header_' + torrent_id).getAttribute('data-releasegroup');
                if (team) {
                    raw_info.name = raw_info.name.replace('NoGroup', team);
                }
                raw_info.medium_sel = 'Blu-ray';
                raw_info.name = raw_info.name.replace(/bluray/i, 'Blu-ray');
            }
            else {
                raw_info.name  =  raw_info.name;
            }
            raw_info.version_info = $(`#group_torrent_header_${torrent_id}`).find('#PermaLinkedTorrentToggler').text();
            raw_info.torrent_url = `https://passthepopcorn.me/` + $(`a[href*="download&id=${torrent_id}"]`).attr('href');
        }

        if (origin_site == 'ANT') {
            raw_info.name = $(`#torrent_${torrent_id}`).find('input.spoilerButton').attr('value').replace(/^SHOW /i, '');
            raw_info.descr = `[quote]\n${$(`#torrent_${torrent_id}`).find('input.spoilerButton').next().text()}\n[/quote]`;
            if ($(`#torrent_${torrent_id}`).find('.torrent_screenshots').length) {
                raw_info.descr += '\n\n';
                $(`#torrent_${torrent_id}`).find('.torrent_screenshots').find('img').map((index,e)=>{
                    raw_info.descr += `[img]${$(e).attr('src').split('=').pop()}[/img]\n`;
                });
            }
            raw_info.torrent_url = `https://anthelion.me/` + $(`a[href*="download&id=${torrent_id}"]`).attr('href');
        }

        if (origin_site == "SC") {
            var torrent_box = document.getElementById("torrent_" + torrent_id);
            var torrent_div = $(torrent_box).find('blockquote').has('blockquote').last();
            raw_info.descr = '[quote]' + torrent_div.find('blockquote').text() + '[/quote]\n\n';
            torrent_div.find('img').map((index, item)=>{
                raw_info.descr += '[img]' + $(item).attr('src') + '[/img]\n';
            });
            try{ raw_info.name = raw_info.descr.match(/complete.*? name.*?:(.*)/i)[1].trim(); } catch(err) {}
            raw_info.torrent_url = `https://secret-cinema.pw/` + $(`a[href*="download&id=${torrent_id}"]`).attr('href');
        }

        if (origin_site == 'HD-Only') {
            var hdo_torrents = GM_getValue('hdo_torrents') === undefined ? []: GM_getValue('hdo_torrents').split(',');
            hdo_torrents.map(e=>{
                if ($(`a[onclick*="torrent_${e}"]`).length) {
                    $(`a[onclick*="torrent_${e}"]`).css('color', 'yellow');
                }
            });
            var torrent_box = document.getElementById("torrent_" + torrent_id);
            var tmdb_url = $('div.torrent_description').find('a[href*="themovieDB"]').attr('href').replace(/\n/, '');
            if (tmdb_url.match(/\/tv\//)) {
                raw_info.type = '剧集';
            } else if (tmdb_url.match(/\/movie\//)) {
                raw_info.type = '电影';
            }
            var label = {
                'tv': {
                    'name': 'name',
                    'runtime': 'episode_run_time',
                    'country': 'origin_country'
                },
                'movie': {
                    'name': 'title',
                    'runtime': 'runtime',
                    'country': 'production_countries'
                }
            }
            var tmdb_id = tmdb_url.match(/\d{1,12}/)[0];
            if (raw_info.type == "电影") {
                var en_url = 'http://api.tmdb.org/3/movie/{tmdb_id}?api_key={key}&language=en-US';
                var zh_url = 'http://api.tmdb.org/3/movie/{tmdb_id}?api_key={key}&language=zh-CN';
                label = label.movie;
            } else {
                var en_url = 'http://api.tmdb.org/3/tv/{tmdb_id}?api_key={key}&language=en-US';
                var zh_url = 'http://api.tmdb.org/3/tv/{tmdb_id}?api_key={key}&language=zh-CN';
                label = label.tv;
            }
            en_url = en_url.format({'key': used_tmdb_key, 'tmdb_id': tmdb_id});
            zh_url = zh_url.format({'key': used_tmdb_key, 'tmdb_id': tmdb_id});

            getJson(en_url, null, function(data){
                var en_name = data[label.name];
                getJson(zh_url, null, function(data_1){
                    console.log(data_1);
                    var zh_name = data_1[label.name];
                    raw_info.zh_name = en_name;
                    $(`#files_${torrent_id}`).find('table').find('tr:gt(0)').find('td').map((index, e)=>{
                        var text = $(e).text();
                        var reg = new RegExp(en_name, 'i');
                        if (text.replace(/\./, ' ').match(reg)) {
                            if (!raw_info.name) {
                                raw_info.name = text;
                            }
                        }
                    });
                    if (!raw_info.name) {
                        raw_info.name = $(`#files_${torrent_id}`).find('tr:eq(1)').find('td:eq(0)').text();
                    }
                    raw_info.name = raw_info.name.split('/')[0];
                    if (raw_info.descr.match(/(Disc Title: |Disc Label: )(.*)/)) {
                        try { raw_info.name = raw_info.descr.match(/(Disc Title: |Disc Label: )(.*)/)[2] } catch(err) {}
                    }
                    raw_info.name = deal_with_title(raw_info.name);
                    var imdb_link = '';
                    if (data_1.imdb_id) {
                        raw_info.url = 'https://www.imdb.com/title/' + data_1.imdb_id;
                        $('#input_box').val(raw_info.url);
                        var search_name = data[label.name] ? data[label.name]: data_1[label.name];
                        try {
                            var imdbid = raw_info.url.match(/tt\d+/i)[0];
                            var imdbno = imdbid.substring(2);
                            var container = $('#forward_r');
                            add_search_urls(container, imdbid, imdbno, search_name, 0);
                        } catch(err) {}
                        imdb_link = ` | <a href=${raw_info.url} target="_blank">IMDB</a>`;
                    }
                    $('div.sidebar').append(`
                        <div class="box">
                            <div class="head">
                                <strong>影视介绍</strong>
                            </div>
                            <div id="infomation" class="pad">
                                <div><strong>英名:</strong> ${data[label.name]}</div>
                                <div><strong>中名:</strong> ${data_1[label.name]}</div>
                                <div><strong>类型:</strong> ${data_1.genres.map((e)=> {return e.name}).join('/')}</div>
                                <div><strong>制片国家/地区:</strong> ${data_1[label.country].map((e)=> {return e.name}).join('/')}</div>
                                <div><strong>语言:</strong> ${data_1.original_language}</div>
                                <div><strong>时长:</strong> ${label.runtime == "episode_run_time" ? data_1[label.runtime][0]: data_1[label.runtime]}</div>
                                <div><strong>评分:</strong> ${data_1.vote_average} / 10 From ${data_1.vote_count} Users</div>
                                <div><strong>链接:</strong> <a href=${tmdb_url.replace('language=fr', 'language=en')} target="_blank">TMDB-en</a>
                                 | <a href=${tmdb_url.replace('language=fr', 'language=zh')} target="_blank">TMDB-zh</a>${imdb_link}</div>
                                <div><strong>简介:</strong> <span>${data_1.overview ? data_1.overview.trim(): data.overview.trim()}</span></div>
                            </div>

                        </div>
                    `);
                });
            });
            var mediainfo = $(torrent_box).find('blockquote').filter((index, e)=>{
                if ($(e).text().match(/Unique ID|DISC INFO:|.MPLS|General|Disc Title|Stream size|Bit rate/)) {
                    return $(e).text();
                }
            });
            if (mediainfo) {
                raw_info.descr = '[quote]{mediainfo}[/quote]'.format({"mediainfo": mediainfo.text()});
            }
        }

        if (origin_site == 'GPW') {
            var torrent_box = document.getElementById("torrent_detail_" + torrent_id);
            raw_info.name = $(torrent_box).find('a[data-action="toggle-mediainfo"]').parent().text().split('详情 | ')[1].replace(/\[|\]|\(|\)|mkv$|mp4$/g, '').trim();
            if (!raw_info.name) {
                raw_info.name = $(torrent_box).find('table.filelist_table').find('tr:eq(1)').find('td:eq(0)').text().replace(/\[|\]|\(|\)|mkv$|mp4$/g, '').trim();
            }
            raw_info.descr = walkDOM(torrent_box.getElementsByClassName('MediaInfoText')[0].cloneNode(true));
            raw_info.descr = `[quote]\n${raw_info.descr}\n[/quote]\n\n`;
            $(torrent_box).find('img[class="scale_image"]').each((index, e) => {
                raw_info.descr += `[img]${$(e).attr('src')}[/img] `;
            });
            $(torrent_box).find('div[class="comparison"]').each((index, e) => {
                var info = $(e).find('a').attr('onclick').match(/\[.*?\]/g);
                raw_info.descr += '\n\n[b]对比图[/b]\n\n' + info[0].replace(/\[|\]|'/g, '').replace(',', ' |') + '\n';
                info[1].replace(/\[|\]|'/g, '').split(',').forEach((ee) => {
                    raw_info.descr += `[img]${ee.trim()}[/img]`;
                });
            });
            raw_info.torrent_url = `https://greatposterwall.com/` + $(`a[href*="download&id=${torrent_id}"]`).attr('href');
        }

        if (origin_site == 'HDB') {
            var html = '<tr><td><table id="HDB"><tbody></tbody></table></td></tr>';
            $('#details').find('tr:eq(0)').after(html);
            table = document.getElementById('HDB');
            insert_row = table.insertRow(0);
            douban_box = table.insertRow(0);
            raw_info.name = document.getElementsByTagName('h1')[0].textContent.trim();
            raw_info.torrent_name = $('a[class="js-download"]').text();
            raw_info.torrent_url = `https://hdbits.org/` + $('a[href*="/download.php"]').attr('href');
            var divs = document.getElementsByTagName('div');
            for (var i=0; i< divs.length; i++) {
                if (divs[i].textContent == 'Tags') {
                    var descr = divs[i].parentNode.parentNode.nextElementSibling;
                    if (descr.innerHTML.match(/Edit torrent/)){
                        descr = descr.previousElementSibling;
                    }
                    raw_info.descr = '[quote]' + walkDOM(descr.cloneNode(true)) + '[/quote]\n\n';
                    console.log(raw_info.descr)
                    if (raw_info.descr.match(/https:\/\/t.hdbits.org\/.*jpg/)){
                        var imgs = Array.from(descr.getElementsByTagName('img'));
                        imgs.forEach(e=>{e.setAttribute('class', 'checkable_IMG');});
                        $('.checkable_IMG').imgCheckbox({
                            onclick: function(el){
                                let tagA = Array.from(el.children()[0].parentNode.parentNode.parentNode.getElementsByTagName("a"));
                                tagA.forEach(e=>{e.onclick=function(){return false;};});
                                var isChecked = el.hasClass("imgChked"),
                                imgEl = el.children()[0];
                                var img_src = imgEl.src.replace('https://t', 'https://i').replace('jpg', 'png');
                                if (isChecked) {
                                    raw_info.images.push(img_src);
                                } else {
                                    raw_info.images.remove(img_src);
                                }
                            },
                            "graySelected": false,
                            "checkMarkSize": "20px",
                            "fadeCheckMark": false
                        });
                    };
                    var insert_point = raw_info.descr.search(/(\[url=.*?\])?\[img\].*?\[\/img\](\[\/url\])?/);
                    if (insert_point > -1) {
                        raw_info.descr = raw_info.descr.slice(0, insert_point) + '\n[/quote]\n\n' + raw_info.descr.slice(insert_point);
                        raw_info.descr = raw_info.descr.replace(/\[\/quote\](\s\n)*$/, '');
                    }

                    raw_info.descr = raw_info.descr.replace('Quote', '');
                    raw_info.descr = raw_info.descr.replace(/[\n ]*\[\/quote\]/gi, '[/quote]');

                    if ($('a[href*=mediainfo]').length) {
                        function bytes_to_upper_size (size, level) {
                            if (level == 'MiB') {
                                return parseInt(size/1024/1024);
                            } else {
                                return parseFloat((size/1024/1024/1024).toFixed(2));
                            }
                        }
                        function insert_name_to_descr (descr, name) {
                            try {
                                var uid = descr.match(/Unique ID.*/)[0];
                                var l = raw_info.descr.match(/File size.*: \d+(\.\d+)? (MiB|GiB)/)[0].split(':')[0].length;
                                name = "Complete name".padEnd(l) + ": " + name;
                                descr = descr.replace(uid, `${uid}\n${name}`);
                            } catch (err) {
                                console.log(err)
                            }
                            return descr;
                        }
                        var url = 'https://hdbits.org' + $('a[href*=mediainfo]').attr("href");
                        getDoc(url, null, function(doc){
                            var mediainfo = $('body', doc).text();
                            raw_info.descr = '[quote]' + mediainfo + '[/quote]\n\n' + raw_info.descr;
                            getDoc(raw_info.torrent_url, null, function(torrent) {
                                var t = $('body', torrent).text();
                                var length = parseInt(t.match(/4:name(\d+):/)[1]);
                                var index = parseInt(t.search('4:name'));
                                name = t.substring(index, index + length + 7 + length.toString().length).split(':').pop();
                                if (!t.match(/5:files/i)) {
                                    try {
                                        raw_info.descr = insert_name_to_descr(raw_info.descr, name);
                                        console.log(raw_info.descr);
                                    } catch (err) {}
                                } else {
                                    try {
                                        var target_length = raw_info.descr.match(/File size.*?: \d+(\.\d+)? (MiB|GiB)/)[0];
                                        var target_numer = target_length.match(/\d+(\.\d+)?/)[0];
                                        var inserted = false;
                                        t.match(/6:lengthi\d+?e4:pathl\d+.*?(eed|eee4)/g).map(e=>{
                                            var file_length = e.match(/6:lengthi(\d+?)e/)[1];
                                            var name_length = parseInt(e.match(/pathl(\d+)/)[1]);
                                            var name_index = parseInt(e.search('4:path'));
                                            var file_name = e.substring(name_index, name_index + 8 + name_length.toString().length + name_length).split(':').pop();
                                            var file_size = bytes_to_upper_size(file_length, target_length.match(/GiB|MiB/)[0]);
                                            if (file_size == target_numer && !inserted) {
                                                inserted = true;
                                                raw_info.descr = insert_name_to_descr(raw_info.descr, file_name);
                                                console.log(raw_info.descr);
                                            }
                                        });
                                    } catch (err) {}
                                }
                            });
                        });
                    }
                    break;
                }
            }
        }

        if (origin_site == 'RED') {
            var torrent_box = document.getElementById('torrent_' + torrent_id);
            var aaas = torrent_box.getElementsByTagName('a')[2];
            if (aaas.getAttribute('onclick').match(/show_logs/)){
                aaas.click();
                setTimeout(function(){
                    try {
                        var log_box = document.getElementById('logs_' + torrent_id);
                        raw_info.log_info = log_box.textContent;
                    } catch (err) {}
                }, 3000);
            }

            var append_info = torrent_box.getElementsByTagName('blockquote');
            append_info = append_info[append_info.length-1].textContent;
            if (!append_info.match(/Uploaded/)){
                raw_info.descr += append_info;
            }

            var tag_box = document.getElementsByClassName('nobullet');
            tag_box = tag_box[tag_box.length-1];
            var aaaas = tag_box.getElementsByTagName('a');

            raw_info.descr += '\n\n标签： ';

            for(i=0; i<aaaas.length; i++){
                if (aaaas[i].textContent.match(/[a-z]/i)){
                    if (i>0){
                        raw_info.descr += ' | ' + aaaas[i].textContent;
                    } else {
                        raw_info.descr += aaaas[i].textContent;
                    }
                }
            }
            raw_info.descr += '\n\n';
        }

        if (origin_site == 'HDF') {
            var file_box = document.getElementById('files_' + torrent_id);
            var filelist_path = file_box.getElementsByClassName('filelist_path')[0];
            if (filelist_path.innerHTML){
                raw_info.name = filelist_path.innerHTML.replace(/\//g, '').trim();
            } else {
                var h2 = document.getElementsByTagName('h2')[0];
                raw_info.name = h2.getElementsByTagName('span')[0].textContent;
            }

            var torrent_info_box = document.getElementById('torrent_' + torrent_id);
            var $content_box = $('#content');
            var $main_box = $content_box.find('div').filter('.thin').find('.main_column');
            var $torrent_table = $('#torrent_'+torrent_id).parent().parent();
            $main_box.prepend($torrent_table);
            $('.head').hide();
            $content_box.prepend($content_box.find('div').filter('.thin'));

            var torrent_info = torrent_info_box.getElementsByTagName('blockquote');
            for (i=0; i<torrent_info.length; i++) {
                if (torrent_info[i].textContent.match(/general|format|duration|bitrate/i)) {
                    raw_info.descr = '[quote]' + torrent_info[i].textContent + '[/quote]';
                    break;
                }
            }
            raw_info.torrent_url = `https://hdf.world/` + $(`a[href*="download&id=${torrent_id}"]`).attr('href');
        }

        if (origin_site == 'UHD') {
            raw_info.name = $('h2:first').text().split('[')[0];
            var realese_box = document.getElementById('release_' + torrent_id);

            var compare_string = '';
            var img_urls = '';
            raw_info.descr = '[quote]' + $(`#torrent_${torrent_id}`).find('#media-info').text() + '[/quote]\n\n';

            setTimeout(function(){
                var torrent_tr = document.getElementById('torrent_' + torrent_id);
                var description_box = document.getElementById('files_' + torrent_id);
                raw_info.name = description_box.getElementsByTagName('tr')[1].getElementsByTagName('td')[0].textContent;
                raw_info.name = raw_info.name.replace(/(\.mkv$|\.mp4)/, '');
                if (raw_info.name.match(/S\d+/i)){
                    raw_info.type = '剧集';
                }
                try{
                    raw_info.name = description_box.getElementsByTagName('tr')[0].textContent.match(/\/(.*)\//)[1];
                } catch(err) {}

                if(raw_info.descr.match(/.MPLS/i)) {
                    var tmp_name = document.getElementsByClassName('imovie_title')[0].textContent.replace(/\(|\)/g, '').trim();
                    raw_info.name = get_bluray_name_from_descr(raw_info.descr, tmp_name);
                }

                raw_info.name = deal_with_title(raw_info.name);

                while (true){
                    description_box = description_box.nextSibling;
                    if (description_box.nodeName == 'DIV'){
                        break;
                    }
                }
                var spans = description_box.getElementsByTagName('span');
                compare_count = 0;
                for (i = 0; i < spans.length; i++){
                    if (spans[i].style.color) {
                        color = rgb_2_hex(spans[i].style.color);
                        compare_string += '|' + '[color=' + color + ']' + spans[i].textContent + '[/color]';
                        compare_count += 1;
                    }
                }
                if (compare_string) {
                    compare_string += '|';
                }
                var imgs = description_box.getElementsByTagName('img');
                img_count = 0;
                for (i=0; i < imgs.length; i++) {
                    if (imgs[i].parentNode.nodeName == 'A'){
                        if (compare_count){
                            img_count += 1;
                            if ((img_count) % compare_count == 0 && i != 1){
                                img_urls += '[url='+ imgs[i].parentNode.href +'][img]' + imgs[i].src + '[/img][/url]\n';
                            } else {
                                img_urls += '[url='+ imgs[i].parentNode.href +'][img]' + imgs[i].src + '[/img][/url]';
                            }
                        }
                        else {
                            img_urls += '[url='+ imgs[i].parentNode.href +'][img]' + imgs[i].src + '[/img][/url]';
                        }
                    } else {
                        img_urls += '[img]' + imgs[i].src + '[/img]\n';
                    }
                }
                img_urls = img_urls.replace(/http:\/\/anonym.to\/\?/ig, '');
                raw_info.descr += img_urls;

                set_jump_href(raw_info, 1);
            }, 2000);
            raw_info.torrent_url = `https://uhdbits.org/` + $(`a[href*="download&id=${torrent_id}"]`).attr('href');
        }

        if (origin_site == 'PHD' || origin_site == 'avz' || origin_site == 'CNZ') {

            var mediainfo = document.getElementById('collapseMediaInfo').innerHTML;
            mediainfo = mediainfo.replace('<pre>', '');
            mediainfo = mediainfo.replace('</pre>', '');

            var picture_info = document.getElementById('collapseScreens');

            var imgs = Array.from(picture_info.getElementsByTagName('img'));
            imgs.forEach(e=> e.setAttribute("class", 'checkable_IMG'));

            $('.checkable_IMG').imgCheckbox({
                onclick: function(el){
                    setTimeout(function(){$('.mfp-close').click();}, 500);
                    let tagA = Array.from(el.children()[0].parentNode.parentNode.parentNode.getElementsByTagName("a"));
                    tagA.forEach(e=>{e.onclick=function(){return false;};});
                    var isChecked = el.hasClass("imgChked"),
                    imgEl = el.children()[0]; // the img element
                    if (isChecked) {
                        raw_info.images.push(imgEl.parentNode.parentNode.href);
                    } else {
                        raw_info.images.remove(imgEl.parentNode.parentNode.href);
                    }
                },
                "graySelected": false,
                "checkMarkSize": "20px",
                "fadeCheckMark": false
            });

            raw_info.descr = '[quote]' + mediainfo + '[/quote]';
            var movie_detail = document.getElementsByClassName('movie-details')[0];
            var movie_as = movie_detail.getElementsByTagName('a');
            for (i = 0; i < movie_as.length; i++) {
                if (movie_as[i].href.match(/www.thetvdb.com/)) {
                    raw_info.tvdb_url = 'https://www.thetvdb.com/?' + movie_as[i].href.split('?').pop();
                }
                if (movie_as[i].href.match(/www.imdb.com/i)) {
                    raw_info.url = ('http://www.imdb.com/title/tt' + movie_as[i].innerHTML).replace(/tttt/, 'tt');
                }
                if (movie_as[i].href.match(/www.themoviedb.org/)) {
                    raw_info.tmdb_url = movie_as[i].href.split('?').pop();
                }
            }
            if (raw_info.url && all_sites_show_douban) {
                getData(raw_info.url, function(data){
                    console.log(data);
                    if (data.data) {
                        var score = data.data.average + '分';
                        if (!score.replace('分', '')) score = '暂无评分';
                        if (data.data.votes) score += `|${data.data.votes}人`;
                        $('h3.movie-title').append(`<span> | </span><a href="${douban_prex}${data.data.id}" target="_blank">${data.data.title.split(' ')[0]}[${score}]</a>`);
                        $('p.movie-plot').text(data.data.summary.replace(/ 　　/g, ''));
                    }
                });
            }
            raw_info.torrent_url = $(`a[href*="download/torrent"]:last`).attr('href');
        }

        if (origin_site == 'HDT'){
            var descr = document.getElementById('technicalInfoHideShowTR');
            descr = descr.cloneNode(true);
            descr = walkDOM(descr);

            var reg_img = descr.match(/\[url=.*?]\[img\].*?\[\/img\]/ig);
            if (reg_img) {
                var quoted = false;
                reg_img.forEach(item=>{
                    if (descr.indexOf(item) >30 && !quoted) {
                        var replace_str = '[/quote]\n\n' + item;
                        raw_info.descr = '[quote]{descr}\n\n'.format({'descr': descr.replace(item, replace_str)});
                        quoted = true;
                    }
                });
            }
            else{
                raw_info.descr = '[quote]{descr}\n[/quote]\n\n'.format({'descr': raw_info.descr});
            }

            raw_info.descr = raw_info.descr.replace("Torrent:", "").replace("Quote:", "");
            raw_info.descr = raw_info.descr.replace("Torrent:", "").replace("Quote:", "").replace(/\[\/?font.*?\]/g, '');
            raw_info.descr = raw_info.descr.replace(/^\[quote\][\s\S]*?(DISC Info|Disc Title)/i, '[quote]$1');
            raw_info.descr = raw_info.descr.replace(/\[img\]https:\/\/hd-torrents\.org\/images\/.*\/.*.gif\[\/img\]|-\(SCREENSHOTS\)-/g, '');
            raw_info.descr = raw_info.descr.replace('[img]https://hdts.ru/avatars/kralimarko.png[/img]', '');
            raw_info.descr = raw_info.descr.replace(/\[font=consolas\].*KRaLiMaRKo wishes you lots of fun! Don't forget to keep seeding[\s\S]*$/, '');
            raw_info.descr = raw_info.descr.replace(/[\n ]*\[\/quote\]/gi, '[/quote]');


            var quotes = '', mediainfo = ''; var imgs = ''; var imginfo = '';
            quotes = raw_info.descr.match(/\[quote[\s\S]*?\[\/quote\]/g);
            mediainfo = quotes[quotes.length-1];
            raw_info.mediainfo_cmct = mediainfo;
            raw_info.mediainfo_cmct = mediainfo.replace(/\[.?quote.*?\]/ig, '');
            imgs = raw_info.descr.match(/\[url=.*?\] *\[img\].*?\[\/img\] *\[\/url\]/g);

            //从0开始，海报不在上述匹配模式里
            if (imgs) {
                for (i = 0; i < imgs.length; i++) {
                    if (!imgs[i].match(/(kralimarko)/i)) {
                        imginfo += imgs[i] + '\n';
                    }
                }
            }
            raw_info.imgs_cmct = imginfo;

            if (raw_info.url && all_sites_show_douban) {
                getData(raw_info.url, function(data){
                    console.log(data);
                    if (data.data) {
                        $container = $('.imdbnew2');
                        var score = data.data.average + '分';
                        if (!score.replace('分', '')) score = '暂无评分';
                        if (data.data.votes) score += `|${data.data.votes}人`;
                        $container.find('a:eq(0)').after($(`<span><font size="3"><b> | </b></font></span><a href="${douban_prex}${data.data.id}" target="_blank"><font size="3"><b>${data.data.title.split(' ')[0]}[${score}]</b></font></a>`));
                        console.log($container.find('strong:contains(Plot)')[2]);
                        $container.find('strong:contains(Plot)').last().html(`<br><br>　　${data.data.summary.replace(/ 　　/g, '')}<br><br>
                            演员：${data.data.cast}`);
                        $container.find('div').find('span').text(data.data.summary.replace(/ 　　/g, ''));
                    }
                });
            }
            raw_info.torrent_url = 'https://hd-torrents.org/' + $('a[href*="download.php"]').attr('href');
        }

        if (origin_site == 'MTV'){
            raw_info.name = $(`a[data-torrentid="${torrent_id}"]`).text();
            var mediainfo = $(`#content${torrent_id}`).find('div.mediainfo').text();
            img_info = '';
            $(`#content${torrent_id}`).find('a').has('img').each((index, e)=>{
                if ($(e).find('img').attr('data-src') !== undefined) {
                    var img = '[url={i}][img]{g}[/img][/url] '.format({'i': $(e).attr('href'), 'g': $(e).find('img').attr('data-src')});
                }
                if ($(e).find('img').attr('src') !== undefined) {
                    var img = '[url={i}][img]{g}[/img][/url] '.format({'i': $(e).attr('href'), 'g': $(e).find('img').attr('src')});
                }
                img_info += img;
            });
            $(`#content${torrent_id}`).find('img').each((index, e)=>{
                if ($(e).attr('data-src') !== undefined) {
                    var img = '[img]{g}[/img] '.format({'g': $(e).attr('data-src')});
                }
                if ($(e).attr('src') !== undefined) {
                    var img = '[img]{g}[/img] '.format({'g': $(e).attr('src')});
                }
                if ($(e).parent()[0].nodeName != 'A' && img.match(/http/)) {
                    img_info += img;
                }
            });
            raw_info.descr = '[quote]\n{mediainfo}\n[/quote]\n\n'.format({'mediainfo': mediainfo}) + img_info;
            var index = $('table.torrent_table').find(`#torrent${torrent_id}`).index();
            insert_row = tbody.insertRow(index + 1);
            search_row = tbody.insertRow(index + 1);
            douban_box = tbody.insertRow(index + 1);
            if (raw_info.name.match(/S\d+|E\d+/)) {
                raw_info.type = '剧集';
            } else {
                raw_info.type = '电影';
            }
            raw_info.torrent_url = `https://www.morethantv.me` + $(`a[href*="download&id=${torrent_id}"]`).attr('href');
        }

        if (origin_site == 'KG') {
            if (raw_info.url && all_sites_show_douban) {
                getData(raw_info.url, function(data){
                    console.log(data);
                    if (data.data){
                        $('td:contains(Internet Link)').last().parent().before(`<tr><td align=right style="font-weight: bold;">豆瓣</td><td id="douban_info"></td></tr>`);
                        add_douban_info_table($('#douban_info'), 150, data);
                    }
                });
            }
            raw_info.torrent_url = 'https://karagarga.in/' + $('a[href*="/down.php/"]').attr('href');
        }

        if (origin_site == 'CG') {
            if (raw_info.url && all_sites_show_douban) {
                getData(raw_info.url, function(data){
                    console.log(data);
                    if (data.data){
                        data.data.image = '//cinemageddon.net/cauldron.php?i=' + data.data.image.replace(/:/g, '%3A').replace(/\//g, '%2F');
                        $('td:contains(Tagline)').last().parent().before(`<tr><td align=right style="font-weight: bold;" class="rowhead">豆瓣</td><td id="douban_info"></td></tr>`);
                        add_douban_info_table($('#douban_info'), 150, data);
                    }
                });
            }
            raw_info.torrent_name = $('#torrent_details').parent().find('a[href*="download.php"]').text().trim();
            raw_info.torrent_url = 'http://cinemageddon.net/' + $('#torrent_details').parent().find('a[href*="download.php?id="]').attr('href');
        }

        if (origin_site == 'BHD'){

            var mediainfo_box = $('div[id*="stats-full"]')[0];
            var code_box = mediainfo_box.getElementsByTagName('code')[0];
            var mediainfo = code_box.textContent.trim();

            var picture_info = document.getElementsByClassName('decoda-image');
            var img_urls = '';
            for (i = 0; i < picture_info.length; i++){
                img_urls += '[url='+ picture_info[i].parentNode.href +'][img]' + picture_info[i].src + '[/img][/url] ';
            }
            picture_info = img_urls;
            raw_info.mediainfo_cmct = mediainfo;
            raw_info.imgs_cmct = img_urls;
            raw_info.descr = '[quote]' + mediainfo + '[/quote]\n\n' + picture_info;
            raw_info.descr = raw_info.descr.replace('[url=undefined][img]https://beyondhd.co/images/2017/11/30/c5802892418ee2046efba17166f0cad9.png[/img][/url]', '');

            if (raw_info.descr.match(/beyondhd.co\/images\/20\d{2}/)){
                var imgs = Array.from(document.getElementsByClassName('decoda-image'));
                imgs.forEach(e=>{e.setAttribute('class', 'checkable_IMG');});
                $('.checkable_IMG').imgCheckbox({
                    onclick: function(el){
                        let tagA = Array.from(el.children()[0].parentNode.parentNode.parentNode.getElementsByTagName("a"));
                        tagA.forEach(e=>{e.onclick=function(){return false;};});
                        var isChecked = el.hasClass("imgChked"),
                        imgEl = el.children()[0];
                        var img_src = imgEl.src.replace('.md', '');
                        if (isChecked) {
                            raw_info.images.push(img_src);
                        } else {
                            raw_info.images.remove(img_src);
                        }
                        console.log(raw_info.images)
                    },
                    "graySelected": false,
                    "checkMarkSize": "20px",
                    "fadeCheckMark": false
                });
            };

            if (raw_info.url && all_sites_show_douban) {
                getData(raw_info.url, function(data){
                    console.log(data);
                    if (data.data) {
                        var score = data.data.average + '分';
                        if (!score.replace('分', '')) score = '暂无评分';
                        if (data.data.votes) score += `|${data.data.votes}人`;
                        $('h1.bhd-title-h1').append(`<span> | </span><a href="${douban_prex}${data.data.id}" target="_blank" style="display: inline; width: auto; border-bottom: 0px !important; text-decoration: none; color: #d3d3d3; font-weight: bold;">${data.data.title.split(' ')[0]}[${score}]</a>`);
                        if (data.data.summary.trim() && data.data.summary.match(/[\u4e00-\u9fa5]/)) {
                            $('div.movie-overview').text(data.data.summary.replace(/ 　　/g, ''));
                        }
                    }
                });
            }
            raw_info.torrent_url = $('a[href*="me/download"][role=button]').attr('href');
        }

        if (origin_site == 'BLU' || origin_site == 'Tik' || origin_site == 'Aither') {
            var mediainfo = '';
            try {
                mediainfo = $('code[x-ref="mediainfo"]').text().trim();
                if (!mediainfo) {
                    mediainfo = $('code[x-ref="bdinfo"]').text().trim();
                }
                raw_info.descr = `[quote]\n${mediainfo}\n[/quote]`;
            } catch (err) {}
            raw_info.name = $('h1.torrent__name').text().trim();
            raw_info.type = $('li.torrent__category').text().get_type();

            var img_urls = '';
            try {
                var picture_info = $('h2.panel__heading:contains("Description")').parent().next()[0].getElementsByTagName('img');
                for (i = 0; i < picture_info.length; i++){
                    if (picture_info[i].parentNode.href){
                        img_urls += '[url='+ picture_info[i].parentNode.href +'][img]' + picture_info[i].src + '[/img][/url] ';
                    } else {
                        img_urls += '[img]' + picture_info[i].src + '[/img] ';
                    }
                }
            } catch (err) {}
            img_urls = img_urls.replace(/https:\/\/wsrv.nl\/\?n=-1&url=/g, '');
            var vob_info = '';
            if ($('summary').length && raw_info.descr.match(/IFO/)) {
                try{

                    $('details').has('pre').map((index,e)=>{
                        var info = $(e).find('code')[0].innerHTML;
                        console.log(index, info)
                        if (info.match(/Overall bit rate|Stream size|Format version/)){
                            vob_info = info;
                            vob_info = vob_info.replace(/<br>/g, '\n');
                            vob_info = vob_info.replace(/<div.*?>/, '[quote]');
                            vob_info = vob_info.replace(/<\/div>/, '[/quote]\n\n');
                            vob_info = vob_info.replace(/<\/?pre>/g, '');
                            vob_info = vob_info.replace(/&nbsp;/g, ' ');
                        }
                    })

                } catch (err) {
                    vob_info = ''
                }
            } else {
                vob_info = ''
            }
            raw_info.descr += '\n\n' + vob_info + img_urls;

            if (raw_info.url && all_sites_show_douban) {
                getData(raw_info.url, function(data){
                    if (data.data) {
                        var score = data.data.average + '分';
                        if (!score.replace('分', '')) score = '暂无评分';
                        if (data.data.votes) score += `|${data.data.votes}人`;
                        $('h1.meta__title').append(`<span> | </span><a href="${douban_prex}${data.data.id}" target="_blank" style="display: inline; width: auto; border-bottom: 0px !important; text-decoration: none; color: #d3d3d3; font-weight: bold;">${data.data.title.split(' ')[0]}[${score}]</a>`);
                        if (data.data.summary && data.data.summary.length < 700) {
                            $('p.meta__description').text(data.data.summary.replace(/ 　　/g, ''));
                        }
                    }
                });
            }
            raw_info.torrent_url = $('a[href*="torrents/download"]').attr('href');
        }

        if (['ACM', 'HDOli', 'JPTV', 'Monika', 'DTR'].indexOf(origin_site) > -1) {
            var mediainfo_lack = false;
            try {
                var mediainfo_box = document.getElementsByClassName('slidingDiv')[0];
                var code_box = mediainfo_box.getElementsByTagName('code')[0];
                var mediainfo = code_box.textContent.trim();
            } catch (err) {
                mediainfo_lack = true;
            }
            if (mediainfo_lack && (origin_site == 'Monika' || origin_site == 'DTR')) {
                mediainfo = $('pre[class="decoda-code"]').eq(0).text();
                mediainfo_lack = false;
            }
            var picture_boxes = document.getElementsByClassName('panel panel-chat shoutbox');
            var picture_info = document.getElementsByClassName('panel panel-chat shoutbox')[1];
            for (i=0; i<picture_boxes.length; i++) {
                var tmp_str = picture_boxes[i].getElementsByTagName('h4')[0].textContent;
                if (tmp_str.trim().match(/Description|描述/)) {
                    picture_info = picture_boxes[i];
                    break;
                }
            }
            //候补方式获取mediainfo
            if (mediainfo_lack) {
                var tmp_box = picture_info.getElementsByTagName('table')[0].cloneNode(true);
                mediainfo = walkDOM(tmp_box);
                mediainfo = mediainfo.slice(0, mediainfo.search(/\[url=/i));
                mediainfo = mediainfo.replace('[img]https://blutopia.cc/img/joypixels/24c2.png[/img]', ':m:');
                mediainfo = mediainfo.trim();
            }

            if ($('summary').length) {
                try{
                    var vob_info = $('details[class="label label-primary"]').find('code')[0].innerHTML;
                    vob_info = vob_info.replace(/<br>/g, '\n');
                    vob_info = vob_info.replace(/<div.*?>/, '[quote]');
                    vob_info = vob_info.replace(/<\/div>/, '[/quote]\n\n');
                    vob_info = vob_info.replace(/<\/?pre>/g, '');
                    vob_info = vob_info.replace(/&nbsp;/g, ' ');
                } catch (err) {
                    vob_info = ''
                }
            } else {
                vob_info = ''
            }

            picture_info = picture_info.getElementsByTagName('img');
            var img_urls = '';
            for (i = 0; i < picture_info.length; i++){
                if (picture_info[i].parentNode.href){
                    img_urls += '[url='+ picture_info[i].parentNode.href +'][img]' + picture_info[i].src + '[/img][/url] ';
                } else {
                    img_urls += '[img]' + picture_info[i].src + '[/img] ';
                }
            }
            picture_info = img_urls;
            raw_info.mediainfo_cmct = mediainfo;
            raw_info.imgs_cmct = img_urls;
            raw_info.descr = '[quote]' + mediainfo + '[/quote]\n\n' + vob_info + picture_info;

            if (raw_info.url && all_sites_show_douban) {
                getData(raw_info.url, function(data){
                    console.log(data);
                    if (data.data) {
                        var score = data.data.average + '分';
                        if (!score.replace('分', '')) score = '暂无评分';
                        if (data.data.votes) score += `|${data.data.votes}人`;
                        $('h1.movie-heading').append(`<span> | </span><a href="${douban_prex}${data.data.id}" target="_blank" style="display: inline; width: auto; border-bottom: 0px !important; text-decoration: none; color: #d3d3d3; font-weight: bold;">${data.data.title.split(' ')[0]}[${score}]</a>`);
                        $('div.movie-overview,span.movie-overview').text(data.data.summary.replace(/ 　　/g, ''));
                    }
                });
            }
            raw_info.torrent_url = $('a[href*="torrents/download"]').attr('href');
        }

        if (origin_site == 'TorrentLeech') {
            var mediainfo_box = document.getElementById('nfo_text');
            var tmp_box = mediainfo_box.cloneNode(true);
            var mediainfo = walkDOM(tmp_box);

            var picture_info = document.getElementsByClassName('galleryContents text-center mt-30')[0];
            picture_info = picture_info.getElementsByTagName('img');
            var img_urls = '';
            try{
                for (i = 0; i < picture_info.length; i++){
                    img_urls += '[url='+ picture_info[i].parentNode.href +'][img]' + picture_info[i].src + '[/img][/url]\n';
                }
            } catch(err) {}
            picture_info = img_urls;
            raw_info.mediainfo_cmct = mediainfo;
            raw_info.imgs_cmct = img_urls;
            raw_info.descr = '[quote]' + mediainfo + '[/quote]\n\n' + picture_info;
            raw_info.descr = raw_info.descr.replace(/\[img\]https:\/\/i\.ibb\.co.*\.png\[\/img\]/gi, "");
            raw_info.descr = raw_info.descr.replace(/\[img\]https:\/\/i\.imgur\.com.*\.png\[\/img\]/gi, "");
            raw_info.descr = raw_info.descr.replace(/\[img\]https:\/\/i\.imgur\.com.*\.jpg\[\/img\]/gi, "");

            img_urls = raw_info.descr.match(/(\[url=.*?\])?\[img\].*?\[\/img\](\[\/url\])?/ig);
            var img_info = '';
            try{
                for (i=0; i<img_urls.length; i++){
                    if (raw_info.descr.indexOf(img_urls[i])<10){
                    } else{
                        raw_info.descr = raw_info.descr.replace(img_urls[i], '');
                        try{img_info += img_urls[i].match(/(\[url=.*?\])?\[img\].*\[\/img\](\[\/url\])?/)[0];}catch(err){}
                    }
                }
            } catch (err) {}
            img_info = img_info.replace(/(\[url=.*?\])?\[img\]https:\/\/funkyimg.com\/i\/38aAB\.png\[\/img\](\[\/url\])?/, '');
            raw_info.descr = raw_info.descr + '\n\n' + img_info;
            raw_info.descr = raw_info.descr.replace(/\[color=.*?\]|\[\/color\]/ig, '');
            raw_info.descr = raw_info.descr.replace(/\n\n+/ig, '\n\n');
            raw_info.torrent_url = 'https://www.torrentleech.org' + $('#detailsDownloadButton').attr('href');
        }

        //----------------------------------------------对国内站点获取的信息进行一些修复-------------------------------------------------------

        if (origin_site == 'TTG') {
            raw_info.small_descr = raw_info.name.split('[')[1].replace(']', '');
            raw_info.small_descr = raw_info.small_descr.replace('「', '');
            raw_info.small_descr = raw_info.small_descr.replace('」', '');
            raw_info.name = raw_info.name.split('[')[0];
        }

        if (origin_site == 'FRDS') {
            var temp = ""; //主副标题互换
            temp = raw_info.name;
            raw_info.name = raw_info.small_descr;
            raw_info.small_descr = temp;
            raw_info.small_descr = raw_info.small_descr.replace(/免费|50%/g, "");
            raw_info.small_descr = raw_info.small_descr.trim(); //去除首尾空格
            raw_info.medium_sel = 'Encode';
        }

        if (origin_site == 'HDHome' || origin_site == 'MTeam' || origin_site == 'HDRoute' || origin_site == 'OurBits') {
            raw_info.small_descr = raw_info.small_descr.replace(/【|】/g, " ");
            raw_info.small_descr = raw_info.small_descr.replace(/diy/i, "【DIY】");

            //DIY图文换序兼顾圆盘补quote
            var img_info = '';
            if (raw_info.name.match(/DIY/i)){
                var img_urls = raw_info.descr.match(/(\[url=.*?\])?\[img\].*?\[\/img\](\[\/url\])?/ig);
                try {
                    for (i=0; i<img_urls.length; i++){
                        if (raw_info.descr.indexOf(img_urls[i])<10){
                        } else{
                            raw_info.descr = raw_info.descr.replace(img_urls[i], '');
                            img_info += img_urls[i].match(/\[img\].*?\[\/img\]/)[0];
                        }
                    }
                } catch (Err) {}
            }

            raw_info.descr = raw_info.descr.replace(/\n{3,10}/g, '\n\n');

            //圆盘补quote
            var tem_str = "";
            if (raw_info.descr.match(/DISC.INFO/i)) {
                var disc_info = raw_info.descr.match(/.*?DISC.INFO/i)[0];
                tem_str = raw_info.descr.slice(raw_info.descr.indexOf(disc_info) - 10, raw_info.descr.length);
                if (!tem_str.match(/quote/i)) {
                    var img_urls = tem_str.match(/(\[url=.*?\])?\[img\].*?\[\/img\](\[\/url\])?/ig);
                    var t_img_info = '';
                    try {
                        for (i=0; i<img_urls.length; i++){
                            raw_info.descr = raw_info.descr.replace(img_urls[i], '');
                            t_img_info += img_urls[i].match(/\[img\].*?\[\/img\]/)[0];
                        }
                    } catch (err) {}
                    raw_info.descr = raw_info.descr.replace(disc_info, `[img]https://images2.imgbox.com/04/6b/Ggp5ReQb_o.png[/img]\n\n[quote]\r${disc_info}`);
                    raw_info.descr = raw_info.descr.trim() + "\r" + "[/quote]\n" + t_img_info;
                }
            }
            raw_info.descr = raw_info.descr + '\n\n' + img_info;

            if (raw_info.descr.match(/^(\[img\].*?\[\/img\])\s*(\[quote\][\s\S]*?\[\/quote\])/)) {
                raw_info.descr = raw_info.descr.replace(/^(\[img\].*?\[\/img\])\s*(\[quote\][\s\S]*?\[\/quote\])/, '$2\n\n$1');
            }
        }

        if (origin_site == 'PTer'){
            raw_info.descr = raw_info.descr.replace(/https:\/\/pterclub.com\/link.php\?sign=.*?&target=/ig, '');
        }

        if (origin_site == 'BYR') {
            raw_info.descr = raw_info.descr.replace(/\n+\t+\n/ig, '\n').replace('Powered by BYRBT Info Clone', '');
            raw_info.descr = raw_info.descr.replace(/\t+|\t\n/ig, '');
            raw_info.descr = raw_info.descr.replace(/\n\n\t/ig, '\n\t');
            raw_info.descr = raw_info.descr.replace(/\n\n+/ig, '\n\n');
            if (raw_info.type == '动漫'){
                raw_info.animate_info = document.getElementById("share").textContent;
            }
        }

        if (origin_site == 'HDChina') {
            raw_info.small_descr = document.getElementsByTagName("h3")[0].textContent;
            var movie_info = $('.info_box ul').eq(2).html();
            raw_info.type = movie_info.get_type();
            raw_info.medium_sel = movie_info.medium_sel();
            raw_info.codec_sel = movie_info.codec_sel();
            raw_info.audiocodec_sel = movie_info.audiocodec_sel();
            raw_info.standard_sel = movie_info.standard_sel();
            raw_info.descr = raw_info.descr.replace(/\[size=3\]\[color=green\]\[font=Microsoft YaHei\][\s\S]*$/i, '');
        }

        if (raw_info.descr.match(/\[quote\]\[quote\]([\s\S]*?)\[\/quote\]\[\/quote\]/)) {
            raw_info.descr = raw_info.descr.replace(/\[quote\]\[quote\]([\s\S]*?)\[\/quote\]\[\/quote\]/, function(data) {
                return data.replace(/^\[quote\]/, '\n\n').replace(/\[\/quote\]$/, '\n');
            });
        }

        switch (origin_site) {
            case 'PTer':
                try {
                    if (!$('a.chs_tag-gy:last').is(":hidden")) {
                        raw_info.labels += 1;
                    }
                    if (!$('a.chs_tag-yy:last').is(":hidden")) {
                        raw_info.labels += 10;
                    }
                    if (!$('a.chs_tag-sub:last').is(":hidden")) {
                        raw_info.labels += 100;
                    }
                } catch (err) {}
                break;
            case 'HDDolby': case 'PThome': case 'HDHome': case 'Audiences':
                var tr = $('td:contains(标签)').last().parent();
                if (tr.find('span.tgy').length) {
                    raw_info.labels = 1;
                }
                if (tr.find('span.tyy').length) {
                    raw_info.labels += 10;
                }
                if (tr.find('span.tzz').length) {
                    raw_info.labels += 100;
                }
                break;
            case 'HaresClub':
                if ($('span.gy').length) {
                    raw_info.labels += 1;
                }
                if ($('span.yy').length) {
                    raw_info.labels += 10;
                }
                if ($('span.zz').length) {
                    raw_info.labels += 100;
                }
                break;
            case 'HHClub': case 'DaJiao': case '象岛': case 'AGSV':
                var tr = $('td:contains(标签)').last().parent();
                if (tr.find('span:contains("国语")').length) {
                    raw_info.labels += 1;
                }
                if (tr.find('span:contains("粤语")').length) {
                    raw_info.labels += 10;
                }
                if (tr.find('span:contains("中字")').length) {
                    raw_info.labels += 100;
                }
                break;
            case 'OurBits':
                var ob_link = raw_info.origin_url.replace('***', '/');
                var search_url = `https://ourbits.club/torrents.php?search=${raw_info.small_descr}&search_area=0&search_mode=0`;
                getDoc(search_url, null, function(doc) {
                    $('.torrentname', doc).map((index, e) => {
                        ob_url = $(e).find('a:first').attr('href');
                        if (ob_link.includes(ob_url)) {
                            if ($(e).find('.tag-gy').length) {
                                raw_info.labels += 1;
                            }
                            if ($(e).find('.tag-zz').length) {
                                raw_info.labels += 100;
                            }
                        }
                    });
                    rebuild_href(raw_info);
                });
                break;
        }

        if (origin_site  == 'HDArea'){
            raw_info.descr = raw_info.descr.slice(0, raw_info.descr.search(/\[quote\]\[color=red\]\[size=2\]\[font=Tahoma\] 本站列出的文件并没有保存在本站的服务器上/));
        }

        if (origin_site == 'CMCT' || origin_site == 'NanYang' || origin_site == 'CHDBits') {
            raw_info.name = raw_info.name.replace(/\d\.\d\/10.*$/g, '');
        }

        if (raw_info.type == '动漫') {
            if (['MTeam', 'PTer', 'PThome', 'HDHome', 'HDDolby'].indexOf(origin_site) > -1) {
                var bookmark = document.getElementById('bookmark0');
                while (bookmark.previousElementSibling) {
                    bookmark = bookmark.previousElementSibling;
                    if (bookmark.nodeName == 'A') {
                        raw_info.torrentName = bookmark.textContent.replace('.torrent', '');
                        break;
                    }
                }
            }
        }

        if (raw_info.name.audiocodec_sel()) {
            raw_info.audiocodec_sel = raw_info.name.audiocodec_sel();
        }

        if (raw_info.type == '音乐' && raw_info.small_descr.match(/WEB/)) {
            raw_info.medium_sel = 'WEB-DL';
        }

        if (origin_site != 'U2') {
            raw_info.name = deal_with_title(raw_info.name);
        }

        raw_info.small_descr = deal_with_subtitle(raw_info.small_descr);

        if (origin_site == 'HaresClub') {
            raw_info.descr = raw_info.descr.replace(/简介/, '');
            var mediainfo_hares = $('#kfmedia').clone();
            mediainfo_hares.find('br').each((index,e)=>{
                $(e).replaceWith(`\n`);
            });
            raw_info.small_descr = $('h3').text();
            mediainfo_hares = `\n\n[quote]${mediainfo_hares.text()}[/quote]`;
            var insert_point = raw_info.descr.length;
            var first_picture = raw_info.descr.match(/(◎主.*演|◎简.*介|◎演.*员)[\s\S]*?(\[url=.*?\].*?\[\/url\]|\[img\].*?\[\/img\])/);
            if (first_picture) {
                var introduction = first_picture[0].split(/\[url.*?\[img|\[img/)[0];
                insert_point = raw_info.descr.search(introduction) + introduction.length;
            }
            raw_info.descr = raw_info.descr.slice(0, insert_point) + mediainfo_hares + '\n\n' + raw_info.descr.slice(insert_point);
            raw_info.descr = raw_info.descr.replace(/img\]\n\n\[img/g, 'img]\n[img');
            $('#layer-photos-demo').find('img').map((index,e)=>{
                try{
                    var img1 = $(e).attr('src');
                    var img2 = $(e).attr('lay-src');
                    var img = img1? img1: img2;
                    if (img.match(/=/)) {
                        raw_info.descr += '\n' + '[img]' + img.split('=')[1].split('&')[0] + '[/img]';
                    } else {
                        raw_info.descr += '\n' + '[img]' + img + '[/img]';
                    }
                } catch (err) {}
            });
        }

        raw_info.descr = add_thanks(raw_info.descr);
        raw_info.descr = raw_info.descr.replace(/\[quote\].*?转自.*?感谢.*?\[\/quote\]/, '');

        if (origin_site == 'HaresClub') {
            console.log($('div[class="layui-col-md2 layui-col-sm2 layui-col-xs2"]:first').html())
            var img1 = $('div[class="layui-col-md2 layui-col-sm2 layui-col-xs2"]:first').find('img').attr('lay-src');
            var img2 = $('div[class="layui-col-md2 layui-col-sm2 layui-col-xs2"]:first').find('img').attr('src');
            var img = img1 ? img1: img2;
            if (img.match(/douban/)) {
                img = img.replace(/img\d/, 'img9').replace('s_ratio', 'l_ratio');
            }
            if (img.match(/=/)) {
                img = img.split('=')[1].split('&')[0];
            }

            var insert_point = raw_info.descr.search('◎');
            if (insert_point) {
                raw_info.descr = raw_info.descr.slice(0, insert_point) + `[img]${img}[/img]\n` + raw_info.descr.slice(insert_point);
            } else {
                raw_info.descr = `[img]${img}[/img]\n${raw_info.descr}`;
            }
            console.log(raw_info.descr)
        }

        if (origin_site == 'Audiences') {
            if ($('span[class="tags tdh"]').length) {
                raw_info.type = "动漫";
            }
        }

        if (raw_info.type == '音乐' && raw_info.descr.match(/视频码率|VideoCode/i)) {
            raw_info.type = 'MV';
        }

        if ((!raw_info.torrent_name || raw_info.torrent_name.match(/undefined/)) && raw_info.name) {
            raw_info.torrent_name = raw_info.name.replace(/ /g, '.').replace(/\*/g, '') + '.torrent';
            raw_info.torrent_name = raw_info.torrent_name.replace(/\.\.+/g, '.');
        }

        raw_info.torrent_name = raw_info.torrent_name.replace('#', '').replace(':', '.');

        raw_info.descr = raw_info.descr.replace(/\n\n+/g, '\n\n').replace('https://dbimg.audiences.me/?', '').replace('https://imgproxy.pterclub.com/douban/?t=', '');

        console.log(raw_info.torrent_name);
        console.log(raw_info.torrent_url);

        //获取跳转的字符串
        var jump_str = dictToString(raw_info);

        //添加ptgen跳转
        if (raw_info.url == ''){
            raw_info.url = match_link('imdb', raw_info.descr);
        }
        if (raw_info.dburl == ''){
            raw_info.dburl = match_link('douban', raw_info.descr);
        }
        if (raw_info.dburl && !raw_info.url) {
            getDoc(raw_info.dburl, null, function(doc){
                if ($('#info', doc).text().match(/tt\d+/)) {
                    raw_info.url = 'https://www.imdb.com/title/' + $('#info', doc).text().match(/tt\d+/)[0] + '/';
                    reBuildHref(raw_info, forward_r);
                }
            });
        }

    /*****************************************************************************************************************
    *                                       part 4 源网页转发跳转及功能部署                                             *
    ******************************************************************************************************************/
        var forward_l, forward_r;
        if (['PTP', 'MTV', 'UHD', 'HDF', 'RED', 'BTN', 'jpop', 'GPW', 'HD-Only', 'SC', 'ANT', 'lztr', 'DICMusic', 'OPS', 'TVV', 'SugoiMusic', 'HHClub'].indexOf(origin_site) > -1) {
            forward_r = insert_row.insertCell(0);
            forward_r.colSpan="5";
            forward_r.style.paddingLeft = '12px'; forward_r.style.paddingTop = '10px';
            forward_r.style.paddingBottom = '10px';
            if (origin_site != 'HHClub' || no_need_douban_button_sites.indexOf('HHClub') < 0) {
                forward_l = search_row.insertCell(0);
                forward_l.colSpan="5";
            } else {
                forward_r.style.paddingLeft = '0px';
                forward_r.style.paddingTop = '0px';
                forward_r.style.paddingRight = '60px';
                forward_r.style.border = 'none';
            }
            if (origin_site == 'MTV') { forward_r.colSpan="6"; forward_l.colSpan="6";}
            if (no_need_douban_button_sites.indexOf(origin_site) < 0) {
                init_buttons_for_transfer(forward_l, origin_site, 1, raw_info);
            }
        } else if (origin_site == 'HUDBT') {
            forward_r = dd;
        } else {
            forward_l = insert_row.insertCell(0);
            forward_r = insert_row.insertCell(1);
            if (origin_site == 'xthor' || origin_site == 'FileList' || origin_site == 'HDB' || origin_site == 'HDRoute') {
                forward_l.style.width = '80px'; forward_r.style.paddingTop = '10px';
                forward_r.style.paddingBottom = '10px'; forward_r.style.paddingLeft = '12px';
                if (origin_site == 'HDB'){
                    forward_l.style.paddingRight = '12px'; forward_r.style.paddingBottom = '12px';
                    forward_r.style.borderTop = 'none'; forward_r.style.borderBottom = 'none';
                    forward_r.style.borderRight = 'none'; forward_l.style.border = 'none';
                }
            } else if (origin_site == 'OpenCD') {
                forward_r.colSpan="4";
            }
            forward_l.innerHTML = "转发种子"; forward_l.valign = "top"; if (origin_site != 'MTeam') forward_l.style.fontWeight = "bold";
            if ((!judge_if_the_site_in_domestic() && no_need_douban_button_sites.indexOf(origin_site) < 0) || douban_button_needed) {
                var direct;
                if (['PHD', 'avz', 'CNZ', 'BLU', 'Tik', 'Aither', 'TorrentLeech', 'BHD', 'HDPost', 'ACM', 'HDOli', 'JPTV', 'Monika', 'DTR', 'HONE', 'KIMOJI', 'OMG'].indexOf(origin_site) > -1) {
                    direct = "left";
                } else {
                    direct = "right";
                }
                forward_l.align = direct;
                var box_left = douban_box.insertCell(0);
                var box_right = douban_box.insertCell(1);
                if (origin_site == 'FileList' || origin_site == 'xthor' || origin_site == 'HDB') {
                    box_right.style.paddingLeft = '12px';
                    if (origin_site == 'HDB'){
                        box_left.style.paddingRight = '12px'; box_left.style.paddingTop = '12px';
                        box_left.style.paddingBottom = '12px';
                        box_right.style.borderTop = 'none'; box_right.style.borderBottom = 'none';
                        box_right.style.borderRight = 'none'; box_left.style.border = 'none';
                    }
                }
                box_left.innerHTML = '豆瓣信息';
                if (origin_site == 'NBL' || origin_site == 'IPT' || origin_site == 'torrentseeds' || origin_site == 'HONE') {
                    box_left.style.width = '60px';
                } else if (['IN', 'digitalcore', 'BlueBird', 'bwtorrents', 'HOU', 'BLU', 'KIMOJI', 'Tik', 'Aither', 'HDPost', 'FNP', 'OnlyEncodes'].indexOf(origin_site) >= 0) {
                    box_left.style.width = '80px';
                }
                box_left.align = direct;
                box_left.style.fontWeight = "bold";
                box_right.id = 'box_right';
                if (origin_site == 'ZHUQUE') {
                    forward_l.innerHTML = " ";
                    box_left.innerHTML = ' ';
                }
                init_buttons_for_transfer(box_right, origin_site, 0, raw_info);
            }
            else {
                forward_l.align = "right";
            }
        }

        forward_r.innerHTML = ""; forward_r.valign = "top"; forward_r.align = "left";
        //样式美化
        if (origin_site == 'CMCT' || origin_site == 'OurBits' || origin_site == 'TJUPT' || origin_site == 'bit-hdtv' || origin_site == 'MTeam') {
            if (origin_site == 'TJUPT'){
                forward_r.style.border = "2px solid #FFFFFF";
            } else if (origin_site == 'MTeam'){
                forward_l.parentNode.setAttribute('class', 'ant-descriptions-row');
                forward_l.setAttribute('class', 'ant-descriptions-item-label');
                $(forward_l).css({'width': '135px', 'text-align': 'right'});
                forward_r.setAttribute('class', 'ant-descriptions-item-content');
            } else {
                forward_l.style.border = "1px solid #D0D0D0";
                forward_r.style.border = "1px solid #D0D0D0";
            }
            if (douban_button_needed || origin_site == 'bit-hdtv'){
                box_left.style.border = "1px solid #D0D0D0";
                box_right.style.border = "1px solid #D0D0D0";
            }
        }
        if (origin_site == 'HHClub' && douban_button_needed) {
            $(tbody).find('td').css('border', 'none');
        }
        if (origin_site == 'HDSpace') {
            $(tbody).find('td:even').addClass('header');
            $(tbody).find('td:odd').addClass('lista');
        }

        if (origin_site == 'FileList' && !$('#descr').length) {
            $(tbody).find('td:even').addClass('colhead');
        }

        if (origin_site == 'HDT') {
            forward_l.setAttribute('class', 'detailsleft');
            forward_r.setAttribute('class', 'detailsright');
            box_left.setAttribute('class', 'detailsleft');
            box_right.setAttribute('class', 'detailsright');
        } else if (origin_site == 'BHD') {
            forward_l.parentNode.setAttribute('class', 'dotborder');
            box_left.parentNode.setAttribute('class', 'dotborder');
        } else if (origin_site == 'iTS') {
            forward_l.setAttribute('class', 'row2');
            forward_r.setAttribute('class', 'row1');
            box_left.setAttribute('class', 'row2');
            box_right.setAttribute('class', 'row1');
        } else if (origin_site == 'bib' || origin_site == 'mam') {
            setTimeout(function(){
                $('td:contains("转发种子")').last().css({'width':'60px'});
            }, 500);
        }

        if (origin_site == 'FileList') {
            tds = mytable.getElementsByTagName('td');
            for(i=0; i<tds.length; i++){
                tds[i].style.border = '0px solid #0D8ED9';
            }
            if (!filelist_tmdb) {
                forward_l.setAttribute('class', 'colhead');
                box_left.setAttribute('class', 'colhead');
            }
        }

        if (origin_site == 'CG') {
            forward_l.setAttribute('class', 'rowhead');
            box_left.setAttribute('class', 'rowhead');
        }

        //循环部署转发节点，根据自己情况进行增加或删减
        var para;
        forward_r.id = 'forward_r';
        var style = document.createElement("style");
        style.type = "text/css";
        var text = document.createTextNode(".round_icon{ width: 11px; height: 11px; border-radius: 90%; margin-right: 2px;} #douban_button {outline:none;}");
        style.appendChild(text);
        var head = document.getElementsByTagName("head")[0];
        head.appendChild(style);

        var img_url, forward_url, key;
        for (index=0; index < site_order.length; index++) {
            var key = site_order[index];
            if (used_site_info[key].enable) {
                if (forward_r.innerHTML) {
                    forward_r.innerHTML = forward_r.innerHTML + ' | ';
                }
                para = document.createElement("a");
                para.setAttribute('class', 'forward_a');
                forward_r.appendChild(para);
                para.target = "_blank"; para.id = key;

                if(site_img_info.hasOwnProperty(key)){
                    img_url = site_img_info[key];
                }
                else{
                    img_url = used_site_info[key].url + 'favicon.ico';
                }

                if (origin_site != 'mam') {
                    img_url_wsrv = 'https://wsrv.nl/?url=' + img_url;
                } else {
                    img_url_wsrv = img_url;
                }
                para.innerHTML = '<div style="display:inline-block; margin-bottom: 2px;"><img src="' + img_url_wsrv +
                                 '"onerror="this.onerror=null; this.src=' + "'" + img_url + "'" +
                                 '"class="round_icon" style="display:inline-block">' + key + '</div>';

            }
        }

        var check=document.createElement("input");
        check.setAttribute("type","checkbox");
        check.setAttribute("id",'search_type');
        var check_text = document.createTextNode('查重');
        forward_r.append(check);
        forward_r.append(check_text);
        set_jump_href(raw_info, 1);

        if (origin_site == 'PTer') {
            try{ raw_info.url = $('a:contains("http://www.imdb.com")').last().text();} catch(err) {}
        }

        forward_r.innerHTML = forward_r.innerHTML + ' <br><br><font color="green">Tools →</font> ';
        var ptgen = document.createElement('a');
        ptgen.innerHTML = 'PTgen';
        ptgen.id = 'ptgen';
        ptgen.title = '根据页面的豆瓣或imdb的ID获取豆瓣信息。';
        ptgen.href = host_link + '#ptgen?';
        if (raw_info.dburl) {
            ptgen.href += raw_info.dburl.match(/\d+/)[0];
        } else if (raw_info.url) {
            ptgen.href += raw_info.url.match(/tt\d+/)[0];
        }
        ptgen.target = '_blank';
        forward_r.appendChild(ptgen);

        forward_r.innerHTML = forward_r.innerHTML + ' | ';
        var wiki = document.createElement('a');
        wiki.innerHTML = '教程';
        wiki.title = 'Github教程。';
        wiki.id = 'wiki';
        wiki.href = 'https://github.com/tomorrow505/auto_feed_js/wiki';
        wiki.target = '_blank';
        wiki.style.color = 'red';
        forward_r.appendChild(wiki);

        forward_r.innerHTML = forward_r.innerHTML + ' | ';
        var get_img = document.createElement('a');
        get_img.innerHTML = '提取图片';
        get_img.title = '对页面图片进行转存或者大图等操作，具体见教程。';
        get_img.id = 'get_img';
        get_img.href = host_link + '#dealimg';
        get_img.target = '_blank';
        forward_r.appendChild(get_img);

        //添加常用链接跳转
        if (used_common_sites.length > 0){
            forward_r.innerHTML = forward_r.innerHTML + ' | ';

            var common_link = document.createElement('a');
            forward_r.appendChild(common_link);
            common_link.id = 'common_link';
            common_link.title = '一键打开设置的所有转发站点，需要开启弹窗设置，具体见教程。';
            common_link.setAttribute('class', 'forward_a');

            common_link.href = '#common_link';
            window.scrollBy(0, -150);
            common_link.innerHTML = '常用站点';
        }

        forward_r.innerHTML = forward_r.innerHTML + ' | ';
        var mediainfo_link = document.createElement('a');
        mediainfo_link.innerHTML = '简化MI';
        mediainfo_link.title = '部分站点(如HDT)需要简化的Mediainfo/BDinfo，可以输入原始Mediainfo/BDinfo进行转换';
        mediainfo_link.href = host_link + "#mediainfo";
        mediainfo_link.target = '_blank';
        forward_r.appendChild(mediainfo_link);

        forward_r.innerHTML = forward_r.innerHTML + ' | ';
        var setting_link = document.createElement('a');
        setting_link.innerHTML = '脚本设置';
        setting_link.title = '对脚本的一些选项进行设置，具体内容见教程。';
        setting_link.href = host_link+'#setting';
        setting_link.target = '_blank';
        forward_r.appendChild(setting_link);

        forward_r.innerHTML = forward_r.innerHTML + ' | ';
        var reset_host = document.createElement('a');
        reset_host.innerHTML = '重置托管';
        reset_host.title = '重置脚本托管页面，避免网站关停情况脚本功能失灵。';
        reset_host.id = "reset_host";
        reset_host.href = host_link+'#setting';
        reset_host.target = '_blank';
        forward_r.appendChild(reset_host);

        forward_r.innerHTML = forward_r.innerHTML + ' | ';
        var rehost_link = document.createElement('a');
        rehost_link.innerHTML = '单图转存';
        rehost_link.title = '过期功能，基本上可以使用提取图片进行覆盖，具体见教程。';
        rehost_link.href = "#";
        rehost_link.target = '_blank';
        forward_r.appendChild(rehost_link);

        if (used_ptp_img_key != ''){
            forward_r.innerHTML = forward_r.innerHTML + ' | ';
            var transfer_ptp = document.createElement('a');
            transfer_ptp.href = '#';
            transfer_ptp.id = 'transfer_ptp';
            transfer_ptp.innerHTML = '转存PTP';
            forward_r.appendChild(transfer_ptp);
        }

        forward_r.innerHTML = forward_r.innerHTML + ' | ';
        var sign_in = document.createElement('a');
        sign_in.innerHTML = '签到';
        sign_in.title = '一键签到的简单实现。'
        sign_in.href = host_link+'#signin';
        sign_in.target = '_blank';
        forward_r.appendChild(sign_in);

        if (used_common_sites.length > 0) {
            if (origin_site != 'CMCT' || cmct_mode == 1){
                if (origin_site != 'UHD' && origin_site != 'TTG') {
                    document.getElementById('common_link').onclick = function(){
                        var key;
                        for (index in site_order){
                            key = site_order[index];
                            if (used_common_sites.indexOf(key) > -1 && origin_site != key){
                                if (['PTP', 'KG', 'BTN', 'GPW', 'SC', 'avz', 'PHD', 'CNZ', 'ANT', 'NBL', 'HDCity'].indexOf(key) < 0) {
                                    var site_href = document.getElementById(key).href;
                                    window.open(site_href, '_blank');
                                } else {
                                    $(`#${key}`).click();
                                }
                            }
                        }
                    };
                }
            }
        }
        var search_name = get_search_name(raw_info.name);
        try {
            var imdbid = raw_info.url.match(/tt\d+/i)[0];
            var imdbno = imdbid.substring(2);
            var container = $('#forward_r');
            add_search_urls(container, imdbid, imdbno, search_name, 0);
        } catch(err) {
            var imdbid = '';
            var imdbno = '';
            var container = $('#forward_r');
            add_search_urls(container, imdbid, imdbno, search_name, 0);
        }

        if (origin_site == 'CMCT' && cmct_mode == 2) {
            setTimeout(function(){
                raw_info.descr = '';
                raw_info.extra_text = '';
                try { raw_info.extra_text = walkDOM(document.getElementsByClassName('extra-text')[0].cloneNode(true)).trim(); } catch(Err) {}
                //海报和简介
                var img_address = document.getElementById("kposter").getElementsByTagName("img")[0].src;
                try {
                    var descr_box = document.getElementsByClassName('info douban-info');
                    var descr_node = descr_box[0].getElementsByTagName('artical')[0];
                    descr_node = descr_node.cloneNode(true);
                    raw_info.descr = walk_cmct(descr_node).trim().replace(/        ◎/, '◎');
                } catch (err){}
                raw_info.descr = '[img]' + img_address + '[/img]\n\n' + raw_info.descr + '\n\n';

                try{
                    var $html = $('td').filter('.douban_info').html();
                    if ($html.match(/https:\/\/www.imdb.com\/title\/tt\d+/)){
                        raw_info.url = $html.match(/https:\/\/www.imdb.com\/title\/tt\d+/)[0];
                        var imdbid = raw_info.url.match(/tt\d+/i)[0];
                        var imdbno = imdbid.substring(2);
                        var container = $('#forward_r');
                        add_search_urls(container, imdbid, imdbno, search_name, 0);
                    }
                } catch(err) {}

                //mediainfo——短
                try{
                    var mediainfo = document.getElementsByClassName("codemain")[0];
                    mediainfo = domToString(mediainfo.cloneNode(true));
                    mediainfo = mediainfo.replace(/(<div class="codemain">|<\/div>)/g, '');
                    mediainfo = mediainfo.replace(/<br>/g, '\n');
                    raw_info.descr += '[quote]' + mediainfo + '[/quote]\n\n';
                } catch(err){
                    console.log('获取mediainfo失败：'+err);
                }

                try{
                    var mediainfo1 = document.getElementsByClassName("codemain")[1];
                    mediainfo1 = domToString(mediainfo1.cloneNode(true));
                    mediainfo1 = mediainfo1.replace(/(<div class="codemain">|<\/div>)/g, '');
                    mediainfo1 = mediainfo1.replace(/<br>/g, '\n');
                    raw_info.full_mediainfo=mediainfo1;
                } catch(err){}

                //截图
                var screenshot = document.getElementsByClassName("screenshots-container");
                for (i = 0; i < screenshot.length; i++) {
                    var img = screenshot[i].getElementsByTagName("img");
                    for (j=0; j<img.length;j++){
                        if (img[j] && img[j].src.search(/detail/i) < 0) {
                            raw_info.descr = raw_info.descr + '[img]' + img[j].src + '[/img]\n';
                        }
                    }
                }
                raw_info.descr = add_thanks(raw_info.descr);
            }, 1000);
        }

        if(origin_site == 'MTV') {
            $('img.round_icon').hide();
        }

        $('.hdb-task').click((e)=>{
            GM_setValue('task_info', JSON.stringify(raw_info));
        });

        //判断是否禁转
        var if_exclusive = false;
        if (origin_site == 'HaresClub' && ( $('#outer').find('.jz').length || $('#outer').find('.xz').length)) {
            if_exclusive = true;
        } else if (origin_site == 'PigGo' && $('span:contains("禁转")').length) {
            if_exclusive = true;
        } else if (origin_site == 'TJUPT' && ( $('#tag').find('.tag-exclusive').length)) {
            if_exclusive = true;
        } else if (origin_site == 'PTer' && $('#kdescr').parent().parent().parent().find('a[href*="tag_exclusive=yes"]').length) {
            if_exclusive = true;
        } else if (origin_site == 'OpenCD' && opencd_mode == 0 && document.querySelector("#outer > center > table:nth-child(4) > tbody > tr:nth-child(6) > td:nth-child(2) > table > tbody > tr:nth-child(13)").textContent == "禁止轉載") {
            if_exclusive = true;
        } else if (origin_site == 'CHDBits') {
            if (raw_info.name.match(/CHD|SGNB|STBOX|ONEHD|BLUCOOK|HQC|GBT|KAN|PLP/i)){
                if (raw_info.url) {
                    $('#top').append(`<br><b><span id="checking"><font color="red">[禁转判断中……]</font></span></b>`);
                    var check_url = default_site_info[origin_site].url + 'torrents.php?incldead=0&spstate=0&inclbookmarked=0&search={imdbid}&search_area=4&search_mode=0';
                    var imdbid = raw_info.url.match(/tt\d+/)[0];
                    check_url = check_url.format({'imdbid': imdbid});
                    getDoc(check_url, null, function(doc){
                        var $table = $('.torrents', doc);
                        var torrentid = site_url.match(/id=\d+/)[0];
                        var torrent = $table.find(`a[href*="${torrentid}"]`);
                        if (torrent) {
                            if (torrent.parent().html().match(/tag-dz/)) {
                                $('#checking').html('<font color="red">[独占资源]</font>');
                                if_exclusive = true;
                            } else if (torrent.parent().html().match(/tag-limited/)) {
                                $('#checking').html('<font color="red">[限转资源]</font>');
                                if_exclusive = true;
                            } else {
                                $('#checking').html('<font color="red">[一般资源]</font>');
                            }
                        } else {
                            $('#checking').html('<font color="red">[查找失败, 自己检查]</font>');
                        }
                    });
                } else {
                    $('#top').append(`<br><b><span id="checking"><font color="red">[缺少IMDB请自查]</font></span></b>`);
                }
            } else {
                $('#top').append(`<br><b><span id="checking"><font color="red">[一般资源]</font></span></b>`);
            }
        } else if (origin_site == 'FRDS') {
            if (raw_info.url) {
                $('#top').append(`<br><b><span id="checking"><font color="red">[禁转判断中……]</font></span></b>`);
                var check_url = 'https://pt.keepfrds.com/torrents.php?incldead=1&spstate=0&inclbookmarked=0&search={imdbid}&search_area=4&search_mode=0';
                var imdbid = raw_info.url.match(/tt\d+/)[0];
                check_url = check_url.format({'imdbid': imdbid});
                getDoc(check_url, null, function(doc){
                    var $table = $('.torrents', doc);
                    var torrentid = site_url.match(/id=\d+/)[0];
                    var torrent = $table.find(`a[href*="${torrentid}"]`);
                    if (torrent) {
                        if (torrent.parent().html().match(/限时禁转/)) {
                            $('#checking').html('<font color="red">[限转资源]</font>');
                            if_exclusive = true;
                        } else if (torrent.parent().html().match(/禁转/)) {
                            $('#checking').html('<font color="red">[禁转资源]</font>');
                            if_exclusive = true;
                        } else {
                            $('#checking').html('<font color="red">[一般资源]</font>');
                        }
                    } else {
                        $('#checking').html('<font color="red">[查找失败, 自己检查]</font>');
                    }
                });
            } else {
                $('#top').append(`<br><b><span id="checking"><font color="red">[缺少IMDB请自查]</font></span></b>`);
            }
        } else if (['HDDolby', 'HDHome', 'PThome', 'Audiences'].indexOf(origin_site) > -1) {
            if ($('tr:contains("标签"):last').find('span.txz').length || $('tr:contains("标签"):last').find('span.tjz').length) {
                if_exclusive = true;
            }
        } else if (origin_site == 'BHD') {
            if ($('strong:contains("THIS IS A BEYONDHD EXCLUSIVE.")').length) {
                if_exclusive = true;
            }
        } else if (origin_site == 'HDB' && $('div.torrent-title>span.exclusive').length) {
            if_exclusive = true;
        }

        if ((raw_info.name + raw_info.descr + raw_info.small_descr).replace(/\[.*?\]/g, '').match(/(拒绝转发|不允许转发|严禁转发|谢绝.*?转载|禁转|禁止转载|禁转|謝絕.*?轉載|exclusive|严禁转载)/i)) {
            if_exclusive = true;
        }

        if (raw_info.name.match(/Audies$|-ADE$|-ADWeb$|UBits$|HHWEB$|-beAst$|-beAstTV$/i)) {
            $('#PTT').attr('disabled', true).css("pointer-events","none").css("color","grey").text(' 禁转至PTT');
            if (raw_info.name.match(/HHWEB$/i)) {
                $('#SharkPT').attr('disabled', true).css("pointer-events","none").css("color","grey").text(' 禁转至SharkPT');
            }
        }
        if (raw_info.name.match(/Dream$|DBTV$|QHstudIo$/i)) {
            $('#HDVideo').attr('disabled', true).css("pointer-events","none").css("color","grey").text(' 禁转至HDVideo');
        }
        if (raw_info.name.match(/HDVWEB$|HDVMV$/i)) {
            $('#HDDolby').attr('disabled', true).css("pointer-events","none").css("color","grey").text(' 禁转至HDDolby');
        }

        function check_exist_tid(site) {
            if (site == 'PTP') {
                if (search_mode == 0 || if_exclusive) {
                    return;
                }
                if (raw_info.type != '电影' || (raw_info.name + raw_info.small_descr).match(/DIY|@/)) {
                    if (!confirm('该资源可能不是电影或者属于DIY资源，确定发布？')) {
                        e.preventDefault();
                        return;
                    }
                }
                if (raw_info.name.match(/BMDru/)) {
                    if (!confirm('该小组作品被PTP认定为劣质资源，确定发布？')) {
                        e.preventDefault();
                        return;
                    }
                }
                if (raw_info.url){
                    var url = 'https://passthepopcorn.me/torrents.php?searchstr=' + raw_info.url.match(/tt\d+/)[0];
                    GM_xmlhttpRequest({
                        method: 'GET',
                        url: url,
                        onload: function(res) {
                            var upload_url = 'https://passthepopcorn.me/upload.php';
                            if (res.finalUrl.match(/id=\d+/)) {
                                upload_url += '?group' + res.finalUrl.match(/id=\d+/)[0];
                            }
                            jump_str = dictToString(raw_info);
                            site_href = upload_url + seperator + encodeURI(jump_str);
                            window.open(site_href, '_blank');
                            return;
                        }
                    });
                } else {
                    var url = 'https://passthepopcorn.me/torrents.php?searchstr=' + search_name;
                    GM_xmlhttpRequest({
                        method: 'GET',
                        url: url,
                        onload: function(res) {
                            var upload_url = 'https://passthepopcorn.me/upload.php';
                            if (res.finalUrl.match(/id=\d+/)) {
                                upload_url += '?group' + res.finalUrl.match(/id=\d+/)[0];
                            }
                            jump_str = dictToString(raw_info);
                            site_href = upload_url + seperator + encodeURI(jump_str);
                            window.open(site_href, '_blank');
                            return;
                        }
                    });
                }
            }
            else if (site == 'SC') {
                if (search_mode == 0 || if_exclusive) {
                    return;
                }
                if (raw_info.type != '电影' || (raw_info.name + raw_info.small_descr).match(/DIY|@/)) {
                    if (!confirm('该资源可能不是电影或者属于DIY资源，确定发布？')) {
                        e.preventDefault();
                        return;
                    }
                }
                if (raw_info.url){
                    var url = 'https://secret-cinema.pw/torrents.php?action=advanced&searchsubmit=1&filter_cat=1&cataloguenumber=' + raw_info.url.match(/tt\d+/)[0];
                    GM_xmlhttpRequest({
                        method: 'GET',
                        url: url,
                        onload: function(res) {
                            doc = res.responseText;
                            var upload_url = 'https://secret-cinema.pw/upload.php';
                            if ($('div.torrent_card_container', doc).length) {
                                upload_url += '?group' + $('div.torrent_card_container', doc).find('a').attr('href').match(/id=\d+/)[0];
                            }
                            jump_str = dictToString(raw_info);
                            site_href = upload_url + seperator + encodeURI(jump_str);
                            window.open(site_href, '_blank');
                            return;
                        }
                    });
                } else {
                    var url = 'https://secret-cinema.pw/torrents.php?searchstr=' + search_name;
                    GM_xmlhttpRequest({
                        method: 'GET',
                        url: url,
                        onload: function(res) {
                            doc = res.responseText;
                            var upload_url = 'https://secret-cinema.pw/upload.php';
                            if ($('div.torrent_card_container', doc).length) {
                                upload_url += '?group' + $('div.torrent_card_container', doc).find('a').attr('href').match(/id=\d+/)[0];
                            }
                            jump_str = dictToString(raw_info);
                            site_href = upload_url + seperator + encodeURI(jump_str);
                            window.open(site_href, '_blank');
                            return;
                        }
                    });
                }
            }
            else if (site == 'TVV') {
                if (search_mode == 0 || if_exclusive) {
                    return;
                }
                if (raw_info.url){
                    var url = 'http://tv-vault.me/torrents.php?action=advanced&searchstr=&searchtags=&tags_type=1&groupdesc=&imdbid=' + raw_info.url.match(/tt\d+/)[0];
                    GM_xmlhttpRequest({
                        method: 'GET',
                        url: url,
                        onload: function(res) {
                            doc = res.responseText;
                            console.log(doc)
                            var upload_url = 'http://tv-vault.me/upload.php';
                            if ($('#torrent_table', doc).length) {
                                upload_url += '?group' + $('#torrent_table', doc).find('tr.group').find('a[href*=torrents]').attr('href').match(/id=\d+/)[0];
                            }
                            jump_str = dictToString(raw_info);
                            site_href = upload_url + seperator + encodeURI(jump_str);
                            window.open(site_href, '_blank');
                            return;
                        }
                    });
                } else {
                    var url = 'http://tv-vault.me/torrents.php?action=advanced&searchstr=' + search_name;
                    GM_xmlhttpRequest({
                        method: 'GET',
                        url: url,
                        onload: function(res) {
                            doc = res.responseText;
                            var upload_url = 'http://tv-vault.me/upload.php';
                            if ($('#torrent_table', doc).length) {
                                upload_url += '?group' + $('#torrent_table', doc).find('tr.group').find('a[href*=torrents]').attr('href').match(/id=\d+/)[0];
                            }
                            jump_str = dictToString(raw_info);
                            site_href = upload_url + seperator + encodeURI(jump_str);
                            window.open(site_href, '_blank');
                            return;
                        }
                    });
                }
            }
            else if (site == 'avz' || site == 'PHD' || site == 'CNZ') {
                if (search_mode == 0 || if_exclusive) {
                    return;
                }
                GM_setValue('avz_info', JSON.stringify(raw_info));
                var domain = {
                    'avz': 'avistaz.to', 'PHD': 'privatehd.to', 'CNZ': 'cinemaz.to'
                }
                if (raw_info.url){
                    var url = `https://${domain[site]}/movies?search=&imdb=` + raw_info.url.match(/tt\d+/)[0];
                    var upload_url = `https://${domain[site]}/upload/movie`;
                    if (raw_info.type != '电影' && raw_info.type != '纪录') {
                        url = `https://${domain[site]}/tv-shows?search=&imdb=` + raw_info.url.match(/tt\d+/)[0];
                        upload_url = `https://${domain[site]}/upload/tv`;
                    }
                    GM_xmlhttpRequest({
                        method: 'GET',
                        url: url,
                        onload: function(res) {
                            doc = res.responseText;
                            if ($('div.overlay-container', doc).length) {
                                upload_url += '?movie_id=' + $('div.overlay-container', doc).find('a').attr('href').match(/\d+/)[0];
                            }
                            jump_str = dictToString(raw_info);
                            site_href = upload_url + seperator + encodeURI(jump_str);
                            window.open(site_href, '_blank');
                            return;
                        }
                    });
                } else {
                    var upload_url = `https://${domain[site]}/upload/movie`;
                    if (raw_info.type != '电影') {
                        upload_url = `https://${domain[site]}/upload/tv`;
                    }
                    jump_str = dictToString(raw_info);
                    site_href = upload_url + seperator + encodeURI(jump_str);
                    window.open(site_href, '_blank');
                    return;
                }
            }
            else if (site == 'ANT') {
                if (search_mode == 0 || if_exclusive) {
                    return;
                }
                var search_name = get_search_name(raw_info.name).replace(/ /g, '+');
                var url = 'https://anthelion.me/torrents.php?searchstr=' + search_name;
                if (raw_info.url) {
                    var imdbid = raw_info.url.match(/tt\d+/)[0];
                } else {
                    imdbid = 0;
                }
                GM_xmlhttpRequest({
                    method: 'GET',
                    url: url,
                    onload: function(res) {
                        doc = res.responseText;
                        var upload_url = 'https://anthelion.me/upload.php';
                        if ($('#torrent_table', doc).length) {
                            var table = $('#torrent_table', doc);
                            ids = table.find('tr.group').map((index, e)=>{
                                var imdburl = $(e).find('a:contains(IMDb:)').attr('href');
                                console.log(imdburl)
                                if (imdbid && imdburl.match(imdbid)) {
                                    return $(e).find('a.torrent_title').attr('href').match(/id=\d+/)[0];
                                }
                            });
                            if (ids.length) {
                                upload_url += '?group' + ids[0];
                            }
                        }
                        jump_str = dictToString(raw_info);
                        site_href = upload_url + seperator + encodeURI(jump_str);
                        window.open(site_href, '_blank');
                        return;
                    }
                });
            }
            else if (site == 'GPW') {
                if (search_mode == 0 || if_exclusive) {
                    return;
                }
                if (raw_info.url){
                    var url = 'https://greatposterwall.com/torrents.php?searchstr=' + raw_info.url.match(/tt\d+/)[0];
                    GM_xmlhttpRequest({
                        method: 'GET',
                        url: url,
                        onload: function(res) {
                            var upload_url = 'https://greatposterwall.com/upload.php';
                            if (res.responseText.match(/upload.php\?groupid=\d+/)) {
                                upload_url += '?group' + res.responseText.match(/upload.php\?group(id=\d+)/)[1];
                            }
                            jump_str = dictToString(raw_info);
                            site_href = upload_url + seperator + encodeURI(jump_str);
                            window.open(site_href, '_blank');
                            return;
                        }
                    });
                } else {
                    var url = 'https://greatposterwall.com/torrents.php?searchstr=' + search_name;
                    GM_xmlhttpRequest({
                        method: 'GET',
                        url: url,
                        onload: function(res) {
                            var upload_url = 'https://greatposterwall.com/upload.php';
                            if (res.responseText.match(/group_movie_title_a.*id=\d+/)) {
                                upload_url += '?group' + res.responseText.match(/group_movie_title_a.*(id=\d+)/)[1];
                            }
                            jump_str = dictToString(raw_info);
                            site_href = upload_url + seperator + encodeURI(jump_str);
                            window.open(site_href, '_blank');
                            return;
                        }
                    });
                }
            }
            else if (site == 'KG') {
                if (search_mode == 0 || if_exclusive) {
                    return;
                }
                GM_setValue('kg_info', JSON.stringify(raw_info));
                var href = 'https://karagarga.in/upload.php';
                window.open(href, target="_blank");
            }
            else if (site == 'HDCity') {
                if (search_mode == 0 || if_exclusive) {
                    return;
                }
                GM_setValue('hdcity_info', JSON.stringify(raw_info));
                var href = 'https://hdcity.city/upload';
                window.open(href, target="_blank");
            }
            else if (site == 'BTN') {
                if (search_mode == 0 || if_exclusive) {
                    return;
                }
                GM_setValue('btn_info', JSON.stringify(raw_info));
                var href = `${used_site_info.BTN.url}upload.php`;
                window.open(href, target="_blank");
            }
        }

        $('.forward_a').click(function(e){
            //站点资源明确禁转的规则优先
            if (search_mode){
                if (origin_site == 'FRDS' || raw_info.name.match(/frds/i)) {
                    if (['CMCT', 'OurBits', 'HDChina', 'HDSky'].indexOf(e.target.id) > -1) {
                        e.preventDefault();
                        alert('不支持该站资源转发！');
                        return;
                    }
                } else if (raw_info.name.match(/chd$|chdbits|chdweb|chdtv|chdpad|chdhktv/i)) {
                    if (['HDChina'].indexOf(this.id) > -1) {
                        if (!confirm('该资源可能触发禁止发布规则(岛资源禁转到HDC)，确定发布？')) {
                            e.preventDefault();
                            return;
                        }
                    }
                } else if (raw_info.name.match(/Audies$|-ADE$|-ADWeb$/i)) {
                    if (['PTT'].indexOf(this.id) > -1) {
                        alert('该资源触发了禁转规则(观众资源禁转到PTT)！！！');
                        e.preventDefault();
                        return;
                    }
                }else if (this.id == 'OurBits' && (raw_info.medium_sel == 'Remux' || raw_info.name.medium_sel() == 'Remux')) {
                    e.preventDefault();
                    alert('该站禁止Remux资源转发！');
                    return;
                }
                //判断是否禁止转载，如果确认之后也可以转载
                if (if_exclusive) {
                    if (!confirm('该资源可能禁止转载，请检查后确定是否仍旧发布？')) {
                        e.preventDefault();
                        return;
                    } else {
                        if_exclusive = false;
                    }
                }

                if (['PTP', 'SC', 'TVV', 'avz', 'PHD', 'CNZ', 'HDCity', 'BTN', 'ANT', 'GPW', 'KG'].indexOf(this.id) > -1) {
                    e.preventDefault();
                    check_exist_tid(this.id);
                }
            }
        });

        if (['UHD', 'FileList', 'RED', 'TJUPT', 'HDB', 'PTsbao', 'HD-Only'].indexOf(origin_site) > -1) {
            $('.forward_a').click(function(e){
                if (['KG', 'PTP', 'HDCity', 'BTN', 'GPW', 'common_link', 'SC', 'avz', 'PHD', 'CNZ', 'TVV', 'ANT', 'NBL', 'CarPt'].indexOf(this.id) > -1) {
                    return;
                }
                e.preventDefault();
                if (if_exclusive && search_mode) {
                    return;
                }
                if (search_mode == 0) {
                    window.open(this.href, '_blank');
                    return;
                }
                if (origin_site == 'UHD' && uhd_lack_descr){
                    var tmp_name = raw_info.descr.match(/movie name.*?:(.*)/i);
                    if (tmp_name && !raw_info.name){
                        raw_info.name = tmp_name[1].trim();
                        if (check_descr(raw_info.descr)) {
                            tmp_name = document.getElementsByClassName('imovie_title')[0].textContent.replace(/\(|\)/g, '').trim();
                            raw_info.name = get_bluray_name_from_descr(raw_info.descr, tmp_name);
                        }
                    }
                    raw_info.name = deal_with_title(raw_info.name);
                    if (raw_info.name.match(/S\d{2,3}/i)){
                        raw_info.type = '剧集';
                    } else {
                        raw_info.type = '电影';
                    }
                    uhd_lack_descr = false;
                }
                if (origin_site == 'TJUPT' || origin_site == 'PTsbao'){
                    if (raw_info.type == '动漫') {
                        raw_info.animate_info = document.getElementById('top').textContent;
                    }
                    descr = document.getElementById("kdescr");
                    descr = descr.cloneNode(true);
                    raw_info.descr = '';
                    raw_info.descr = walkDOM(descr);
                    raw_info.descr = raw_info.descr.replace(/站外链接 :: /ig, '');
                    if (raw_info.descr.match(/Infinity-1.2s-64px.svg/)) {
                        if (!confirm('图片可能加载不完全，是否仍继续转载？')) {
                            e.preventDefault();
                            return;
                        }
                    }
                }

                jump_str = dictToString(raw_info);
                if (this.id != 'common_link'){
                    this.href = decodeURI(this.href).split(seperator)[0] + seperator + encodeURI(jump_str);
                    if (['KG', 'PTP', 'HDCity', 'BTN', 'GPW', 'SC', 'avz', 'PHD', 'CNZ', 'TVV'].indexOf(this.id) < 0){
                        window.open(this.href, '_blank');
                    }
                } else{
                    var key;
                    for (key in used_common_sites){
                        if (origin_site != used_common_sites[key]){
                            var site_href = document.getElementById(used_common_sites[key]).href;
                            site_href = decodeURI(site_href).split(seperator)[0] + seperator + encodeURI(jump_str);
                            window.open(site_href, '_blank');
                        }
                    }
                }

            });
        } else if (origin_site == 'CMCT' && cmct_mode == 2) {
            $('.forward_a').click(function(e){
                e.preventDefault();
                if (if_exclusive && search_mode) {
                    return;
                }
                if (search_mode == 0) {
                    window.open(this.href, '_blank');
                    return;
                }
                jump_str = dictToString(raw_info);
                if (this.id != 'common_link'){
                    this.href = decodeURI(this.href).split(seperator)[0] + seperator + encodeURI(jump_str);
                    if (['KG', 'PTP', 'HDCity', 'BTN', 'GPW', 'SC', 'avz', 'PHD', 'CNZ', 'TVV', 'ANT', 'NBL'].indexOf(this.id) < 0){
                        window.open(this.href, '_blank');
                    }
                } else{
                    var key;
                    for (key in used_common_sites){
                        if (origin_site != used_common_sites[key]){
                            var site_href = document.getElementById(used_common_sites[key]).href;
                            site_href = decodeURI(site_href).split(seperator)[0] + seperator + encodeURI(jump_str);
                            window.open(site_href, '_blank');
                        }
                    }
                }
            });
        } else if (origin_site == 'TTG') {
            $('.forward_a').click(function(e){
                e.preventDefault();
                if (if_exclusive && search_mode) {
                    return;
                }
                if (search_mode == 0) {
                    window.open(this.href, '_blank');
                    return;
                }
                raw_info.descr = '';
                descr = document.getElementById('kt_d');
                descr_box = descr.cloneNode(true);
                raw_info.descr = walkDOM(descr_box);
                raw_info.descr = add_thanks(raw_info.descr);

                var reg_img = raw_info.descr.match(/\[img\]http(s*):\/\/totheglory.im\/pic\/ico_(free|half|30).gif\[\/img\].*/i);
                if (reg_img) {
                    raw_info.descr = raw_info.descr.replace(reg_img[0], '');
                }
                //替换官种简介顺序
                var reg_source = raw_info.descr.match(/\[color=.*?\]\.Comparisons[\s\S]*(thumb\.png|ajax-loader\.gif)\[\/img\]\[\/url\][\s\S]*?\[\/quote\]/im);
                if (reg_source){
                    reg_source = reg_source[0];
                    raw_info.descr = raw_info.descr.replace(reg_source, '');
                    if (reg_source.match(/\[size=3\].*\[\/size\]/)) {
                        var tmp_name = reg_source.match(/\[size=3\].*\[\/size\]/)[0];
                        reg_source = reg_source.split(tmp_name);
                        reg_source[0] = reg_source[0].replace(/http/g, 'https').replace(/httpss/g, 'https');
                        reg_source = tmp_name + reg_source[1] + '\n\n' + reg_source[0];
                    }
                    raw_info.descr = raw_info.descr + reg_source;
                    raw_info.descr = raw_info.descr.replace(/\n{3,5}/ig, '\n\n');
                }

                if (raw_info.images.length > 0) {
                    raw_info.descr += $('#textarea').val();
                }

                jump_str = dictToString(raw_info);
                if (this.id != 'common_link'){
                    this.href = decodeURI(this.href).split(seperator)[0] + seperator + encodeURI(jump_str);
                    if (['KG', 'PTP', 'HDCity', 'BTN', 'GPW', 'SC', 'avz', 'PHD', 'CNZ', 'TVV', 'ANT', 'NBL'].indexOf(this.id) < 0){
                        window.open(this.href, '_blank');
                    }
                } else{
                    var key;
                    for (key in used_common_sites){
                        if (origin_site != used_common_sites[key]){
                            var site_href = document.getElementById(used_common_sites[key]).href;
                            site_href = decodeURI(site_href).split(seperator)[0] + seperator + encodeURI(jump_str);
                            window.open(site_href, '_blank');
                        }
                    }
                }
            });
        }

        $('#reset_host').click((e) => {
            e.preventDefault();
            set_host_link();
        });

        //----------------------------------界面部署层逻辑：获取豆瓣链接button绑定点击事件-------------------------------------------------

        if ((!judge_if_the_site_in_domestic() && no_need_douban_button_sites.indexOf(origin_site) < 0) || douban_button_needed){

            douban_button.addEventListener('click', function() {

                var douban_info = '';
                douban_button.value = '获取中……';

                var is_douban_needed = false;

                if (raw_info.name.match(/S\d{2}E\d{2}/ig) || raw_info.type == '剧集') {
                    if(raw_info.name.match(/S\d{2}/ig)){
                        if(!raw_info.name.match(/S01/ig)){
                            is_douban_needed = true;
                        }
                    }
                }

                if (raw_info.url && !judge_if_the_site_in_domestic() && !raw_info.dburl) {
                    is_douban_needed = true;
                }
                if (douban_button_needed && raw_info.dburl == ''){
                    is_douban_needed = true;
                }
                var tmp_url = document.getElementById('input_box').value;
                if (tmp_url.match(/douban.com/)) {
                    raw_info.dburl = tmp_url;
                    is_douban_needed = false;
                }
                var textarea = document.getElementById('textarea');
                if (textarea && textarea.selectionStart != undefined && textarea.selectionEnd != undefined){
                    var chosen_value = textarea.value.substring(textarea.selectionStart, textarea.selectionEnd);
                    var dburl = chosen_value.match(/http(s*):\/\/.*?douban.com\/subject\/(\d+)/i);
                    if (dburl){
                        raw_info.dburl = dburl[0] + '/';
                        is_douban_needed = false;
                    }
                }

                create_site_url_for_douban_info(raw_info, is_douban_needed)
                .then(function(data){
                    console.log(data)
                    if (api_chosen == 0 || api_chosen == 2) {
                        if (raw_info.dburl){
                            url_to_search = '?url=' + raw_info.dburl;
                        } else if (raw_info.url){
                            url_to_search = '?url=' + raw_info.url;
                        }
                    } else {
                        if (raw_info.dburl){
                            url_to_search = '?url=' + raw_info.dburl;
                        } else if (raw_info.url){
                            url_to_search = '?site=douban&sid=' + raw_info.url.match(/tt\d+/)[0];
                        }
                    }
                    if (api_chosen < 3) {
                        getJson(apis[api_chosen] + url_to_search, null, function(res){
                            console.log(res)
                            if (api_chosen == 0) {
                                var douban_info = !res.msg ? res.data.format : "";
                            } else {
                                douban_info = !res.error ? res.format: "";
                            }
                            douban_info = douban_info.replace("[/img][/center]", "[/img]");
                            douban_info = douban_info.replace("hongleyou.cn", "doubanio.com");
                            if (douban_info != '') {
                                raw_info.descr = douban_info + '\n\n' + raw_info.descr;
                                var thanks = raw_info.descr.match(/\[quote\].*?感谢原制作者发布。.*?\[\/quote\]/);
                                if (thanks) {
                                    raw_info.descr = thanks[0] + '\n' + raw_info.descr.replace(thanks[0], '');
                                }

                                if (is_douban_needed && raw_info.descr.match(/http(s*):\/\/www.imdb.com\/title\/tt(\d+)/i)){
                                    raw_info.url = raw_info.descr.match(/http(s*):\/\/www.imdb.com\/title\/tt(\d+)/i)[0] + '/';
                                }
                                if (raw_info.descr.match(/类[\s\S]{0,5}别[\s\S]{0,30}纪录片/i)) {
                                    raw_info.type = '纪录';
                                } else if (raw_info.descr.match(/类[\s\S]{0,5}别[\s\S]{0,30}动画/i)) {
                                    raw_info.type = '动漫';
                                }
                                set_jump_href(raw_info, 1);
                                jump_str = dictToString(raw_info);
                                douban_button.value = '获取成功';
                                try { $('#textarea').val(douban_info); } catch(err) {}
                                GM_setClipboard(douban_info);
                                rebuild_href(raw_info);
                            } else {
                                douban_button.value = '获取失败';
                            }
                        });
                    } else {
                        get_douban_info(raw_info);
                    }
                })
                .catch(function(err){
                    douban_button.value = '获取失败';
                    if (raw_info.dburl) {
                        window.open(raw_info.dburl, target="_blank");
                    } else if (raw_info.url) {
                        window.open(`https://search.douban.com/movie/subject_search?search_text=${raw_info.url.match(/tt\d+/)[0]}&cat=1002`, target="_blank");
                    }
                    console.log(err);
                });

            }, false);

            search_button.addEventListener('click', function() {
                var search_name = get_search_name(raw_info.name);
                if (raw_info.type == '剧集'){
                    if (raw_info.name.match(/S\d+/i)){
                        var number = parseInt(raw_info.name.match(/S(\d+)/i)[1]);
                        if (number != 1 ) {
                            search_name = search_name + ' Season ' + number;
                        }
                    }
                }
                if (raw_info.zh_name) {
                    search_name = raw_info.zh_name;
                }
                if ($('#douban_api').prop('checked')){
                    const url_prex = 'https://movie.douban.com/j/subject_suggest?q=';
                    var search_url = url_prex + search_name;
                    var textarea = document.getElementById('textarea');
                    getJson(search_url, null, function(data){
                        if (data.length > 0) {
                            textarea.value = `搜索的影视名称为：${raw_info.name}\n`;
                            for(i=0;i<data.length;i++){
                                textarea.value += `${data[i].sub_title}---${data[i].title}: ${douban_prex}${data[i].id}/\n`;
                            }
                        } else {
                            textarea.value += "暂时没有搜索结果！！";
                        }
                    });

                } else {
                    var search_url = 'https://search.douban.com/movie/subject_search?search_text=' + search_name;
                    if (raw_info.type == '电影' && raw_info.url){
                        search_url = 'https://search.douban.com/movie/subject_search?search_text=' + raw_info.url.match(/tt\d+/)[0];
                    }
                    window.open(search_url, target='_blank');
                }

            }, false);

            ptgen_button.addEventListener('click', function(){
                var tmp_url = document.getElementById('input_box').value;
                create_site_url_for_douban_info(raw_info, true).then(function(data){
                    if (raw_info.dburl){
                        tmp_url = raw_info.dburl.match(/subject\/(\d+)/i)[1];
                    } else{
                        tmp_url = tmp_url.match(/tt\d+/)[0];
                    }
                    url = host_link + '#ptgen?' + tmp_url;
                    window.open(url, '_blank');
                }, function() {
                    url = host_link + '#ptgen?' + tmp_url.match(/tt\d+/)[0];
                    window.open(url, '_blank');
                });
            }, false);
        }
        add_picture_transfer();

        $('#get_img').click((e)=>{
            if (origin_site == 'TTG') {
                descr = document.getElementById('kt_d');
                descr_box = descr.cloneNode(true);
                raw_info.descr = walkDOM(descr_box);
            } else if (origin_site == 'TJUPT' || origin_site == 'PTsbao') {
                descr = document.getElementById("kdescr");
                descr = descr.cloneNode(true);
                raw_info.descr = '';
                raw_info.descr = walkDOM(descr);
            } else if (origin_site == 'HaresClub') {
                descr = $('#kdescr').next()[0];
                descr = descr.cloneNode(true);
                raw_info.descr = walkDOM(descr).replace(/^简介./, '');
            }
            GM_setValue("descr", raw_info.descr);
        });

        $('#search_type').on('change', function(){
            if (this.checked) {
                search_mode = 0;
                set_jump_href(raw_info, 0);
            } else {
                search_mode = 1;
                set_jump_href(raw_info, 1);
            }
        })

        if ($('#transfer_ptp').length) {
            $('#transfer_ptp')[0].addEventListener('click', function(e){
                e.preventDefault();
                var img_url = raw_info.images.join(',');
                if (!raw_info.images.length) {
                    img_url=prompt("请输入图片链接,多图用英文逗号隔开","");
                }
                if (img_url.match(/https?:\/\/.*?(jpg|png|webp)/)) {
                    ptp_send_images(img_url.split(','), used_ptp_img_key)
                    .then(function(new_urls){
                        new_urls = new_urls.toString().split(',').join('\n');
                        GM_setClipboard(new_urls);
                        alert("图片链接已成功复制到粘贴板，直接粘贴即可！！");
                    }).catch(function(err){
                        alert(err);
                    });
                } else {
                    alert('请输入图片地址！！');
                }
            }, false);
        }

        if (origin_site == 'DICMusic') {
            var html = $('#forward_r').html();
            html = html.replace(`<font color="green">Tools →</font>`, '<blockquote style="margin-right:200px"><font color="green">Tools →</font>');
            html = html.replace(`签到</a><br>`, '签到</a></blockquote>');
            html = html.replace(`查重 `, '查重 <div></div>')
            $('#forward_r').html(html);
        }
    }

    /*****************************************************************************************************************
    *                                       part 5 发布页数据逻辑处理                                                  *
    ******************************************************************************************************************/
    else if (judge_if_the_site_as_source() == 0) {
        var upload_site = site_url.split(seperator)[0]; //转发的站点
        var forward_site = find_origin_site(upload_site);
        var transfer_mode = 0; // 0表示直接转，1表示候选
        if (upload_site.match(/offers?.php/)) {
            transfer_mode = 1;
        }
        if ($('td:contains(你没有发布种子的权限)').length || $('td:contains(请提交候选)').length || $('a[href="?add_offer=1"]').length || $('h1:contains("候选区")').length) {
            if (forward_site == "CMCT") {
                upload_site = upload_site.replace('upload.php', 'upload.php?offer=1');
            } else if (forward_site == "HHClub" || forward_site == 'HUDBT') {
                upload_site = upload_site.replace('offers.php', 'offers.php?add_offer=1');
            } else if (forward_site == "TTG") {
                upload_site = upload_site.replace('viewoffers.php', 'offer.php');
            } else {
                upload_site = upload_site.replace('upload.php', 'offers.php?add_offer=1');
            }
            location.href = encodeURI(upload_site + seperator + site_url.split(seperator)[1]);
            return;
        }

        raw_info = stringToDict(site_url.split(seperator)[1]); //将弄回来的字符串转成字典
        raw_info.descr = raw_info.descr.replace(/ /g, ' ');
        raw_info.full_mediainfo = raw_info.full_mediainfo.replace(/ /g, ' ');
        if (raw_info.origin_site == 'OurBits') {
            raw_info.descr = raw_info.descr.replace(/ /g, ' ');
        }
        raw_info.descr = raw_info.descr.replace(/\[b\]\[\/b\]/g, '')
        var search_name = get_search_name(raw_info.name);

        raw_info = fill_raw_info(raw_info, forward_site);

        if (raw_info.origin_site == 'MTeam') {
            raw_info.descr = raw_info.descr.replace(/░/g, '');
        }
        if (raw_info.name.match(/Audies$|-ADE$|-ADWeb$/i) && forward_site == 'PTT') {
            return;
        }
        if (raw_info.descr.match(/img1.doubanio.com/)) {
            raw_info.descr = raw_info.descr.replace(/img1.doubanio.com/, 'img9.doubanio.com');
        }

        if (raw_info.codec_sel == 'H264' && raw_info.name.match(/x264/)) {
            raw_info.codec_sel = 'X264';
        }

        if (raw_info.medium_sel == 'Encode' && raw_info.name.match(/web/i)) {
            raw_info.medium_sel = 'WEB-DL';
        }

        //副标题加上原盘版本信息
        if (check_descr(raw_info.descr) && !raw_info.name.match(/(diy|@|remux)/i) && judge_forward_site_in_domestic(forward_site)){
            if (blurayVersion(raw_info.name) && raw_info.small_descr.indexOf(blurayVersion(raw_info.name).replace(/【|】/g, '')) < 0){
                raw_info.small_descr = raw_info.small_descr +'    '+ blurayVersion(raw_info.name);
            }
        }
        if (raw_info.golden_torrent == "true") {
            raw_info.small_descr = raw_info.small_descr +' | '+ 'PTP Golden Popcorn';
        }

        //对类别做出简单修正
        if (raw_info.descr.match(/类[\s\S]{0,5}别[\s\S]{0,30}纪录片/i)) {
            raw_info.type = '纪录';
        } else if (raw_info.descr.match(/类[\s\S]{0,5}别[\s\S]{0,30}动画/i)) {
            if (forward_site == 'PTer') {
                raw_info.type = '动漫';
            } else if (raw_info.type == '电影' && ['HUDBT', 'MTeam', 'TLFbits', 'HD4FANS', 'PuTao', 'TJUPT', 'NanYang', 'BYR', 'TTG'].indexOf(forward_site) < 0) {
                raw_info.type = '动漫';
            }
        }

        if (forward_site == "HDSky") {
            var tmp_small_descr = raw_info.small_descr.split('| 类别：');
            if (tmp_small_descr.length == 1) {
                tmp_small_descr = tmp_small_descr[0];
            } else {
                var plus_info = tmp_small_descr[1].replace('【', '[').replace('】', ']');
                plus_info = plus_info.match(/\[.*\]/) ? plus_info.match(/\[.*\]/)[0] : '';
                tmp_small_descr = tmp_small_descr[0] + plus_info;
            }
            raw_info.small_descr = tmp_small_descr.replace(/([\s]\/)/ig, '/');
            raw_info.small_descr = raw_info.small_descr.replace(/(\/[\s])/ig, '/');
        }

        if (forward_site == 'HDSky' && ['纪录', '动漫'].indexOf(raw_info.type) > -1) {
            raw_info.small_descr = (raw_info.type == "纪录" ? `[${raw_info.type}]`: '[动画]') + ' ' + raw_info.small_descr;
        }

        if (forward_site == 'HDSky' && ['剧集'].indexOf(raw_info.type) > -1) {
            if (raw_info.name.match(/s(\d+)/i)) {
                if (raw_info.name.match(/s?(\d+)-s?(\d+)/i)) {
                    [s1, s2] = raw_info.name.match(/ep?(\d+)-ep?(\d+)/i).slice(1,3);
                    raw_info.small_descr = raw_info.small_descr + ` [第${parseInt(s1)}-${parseInt(s2)}季]`;
                } else {
                    var season = raw_info.name.match(/s(\d+)/i)[1];
                    raw_info.small_descr = raw_info.small_descr + ` [第${parseInt(season)}季]`;
                    if (!raw_info.name.match(/e(p)?(\d+)/i) && raw_info.descr.match(/◎集.*数.*?(\d+)/)) {
                        var number = raw_info.descr.match(/◎集.*数.*?(\d+)/)[1];
                        raw_info.small_descr = raw_info.small_descr + `[${parseInt(number)}集全]`;
                    }
                }
            }
            if (raw_info.name.match(/e(p)?(\d+)/i)) {
                if (raw_info.name.match(/ep?(\d+)-ep?(\d+)/i)) {
                    [ep1, ep2] = raw_info.name.match(/ep?(\d+)-ep?(\d+)/i).slice(1,3);
                    raw_info.small_descr = raw_info.small_descr + ` [第${parseInt(ep1)}-${parseInt(ep2)}集]`;
                } else {
                    var episode = raw_info.name.match(/e(p)?(\d+)/i).pop();
                    raw_info.small_descr = raw_info.small_descr + ` [第${parseInt(episode)}集]`;
                }
            }
        }

        if (['RED', 'jpop', 'lztr','DICMusic', 'OPS', 'SugoiMusic'].indexOf(raw_info.origin_site) > -1) {
            raw_info.name = raw_info.name.replace(/\*/g, '');
            if (raw_info.tracklist) {
                raw_info.tracklist = '[quote=Tracklist]' + raw_info.tracklist + '[/quote]';
            } else {
                raw_info.tracklist = '';
            }
            if (raw_info.log_info){
                raw_info.log_info = '\n\n[hide]' + raw_info.log_info + '[/hide]\n\n';
            } else {
                raw_info.log_info = '';
            }
            raw_info.descr = raw_info.descr + raw_info.log_info + raw_info.tracklist;
        }

        raw_info.descr = raw_info.descr.replace(/\%2F/g, '/');
        raw_info.descr = raw_info.descr.replace(/\%3A/g, ':');

        //-------------------------------------数据填充到指定位置--------------------------------------
        if (forward_site == 'OpenCD') {

            var info = {
                "大陆": "1","欧美": "2","港台": "3","日韩": "4","其它地区": "5","流行(Pop)": "6",
                "发烧(HiFi)": "7","汽车(garage)": "8","古典(Classical)": "9","民族(National)": "10",
                "摇滚(rock)": "11","原声(OST)": "12","民间(Folk)": "13","乡村(Country)": "14",
                "天籁(Soul)": "15","新世纪(NewAge)": "16","蓝调(Blues)": "17","爵士(Jazz)": "18",
                "金属(Metal)": "19","朋克(Punk)": "20","电子(Electronic)": "21","儿童(Children's)": "22",
                "宗教(Religion)": "23","雷鬼(Reggae)": "24","贝斯(Drum Bass)": "25","说唱(Rap)": "26","音乐剧(musical)": "27"
            };
            var type_dict = {
                "electronic": "电子(Electronic)",
                "blues": "蓝调(Blues)",
                "blues": "蓝调(Blues)", "rhythm.and.blues": "蓝调(Blues)",
                "classical": "古典(Classical)",
                "country": "乡村(Country)",
                "folk": "民间(Folk)",
                "drum.and.bass": "贝斯(Drum Bass)",
                "jazz": "爵士(Jazz)",
                "new.age": "新世纪(NewAge)",
                "soul": "天籁(Soul)",
                "modern.classical": "古典(Classical)",
                "garage.house": "汽车(garage)", "garage.rock": "汽车(garage)",
                "reggae": "雷鬼(Reggae)",
                "hip.hop": "嘻哈(Hip Hop)",
                "instrumental": "器乐(Instrumental)",
                "indie": "独立(Indie)",
                "japanese": "日韩", "korean": "日韩",
                "chinese": "大陆", "thai": "其他地区",
                "dance": "舞曲(Dance)","english": "欧美",
                "soundtrack": "原声(OST)",
                'score.ost': "原声(OST)",
                "america": "欧美",
                "OST": "原声(OST)",
            }
            console.log(raw_info)
            raw_info.name = raw_info.name.trim();
            if (raw_info.origin_site == 'OPS') {
                raw_info.name = raw_info.name.replace(/–/g, '-');
            }
            var info_text = raw_info.name.split('*');
            var author_name = info_text[0];
            var music_name = '待填';
            if (author_name.split('-').length > 1) {
                music_name = author_name.split('-').pop().trim();
            }

            var year = '';
            if (raw_info.name.match(/(19|20)\d+/)){
                year = raw_info.name.match(/(19|20)\d+/)[0];
                music_name = music_name.split(year)[0].trim();
            }
            var author = raw_info.name.split(music_name)[0].replace(/-( *)?$/, '').trim();

            if (raw_info.json !== undefined) {
                raw_info.json = JSON.parse(raw_info.json);
                console.log(raw_info.json);
                var group = raw_info.json['response']['group'];
                var torrent = raw_info.json['response']['torrent'];
                if (group.artists) {
                    raw_info.music_author = Array.from(group.artists.map((e)=>{
                        return e.name;
                    })).join(' & ');
                }
                raw_info.music_name = group.name.replace(/&quot;/g, '');
                music_name = group.name.replace(/&quot;/g, '');
                if (group.tags) {
                    raw_info.music_type = group.tags.join(',');
                }
                raw_info.small_descr = torrent['format'] + ' / ' + torrent['encoding'] + ' / ' + torrent['media'];
                if (torrent.logScore !== undefined && torrent.logScore > 0) {
                    raw_info.small_descr += ` / Log (${torrent.logScore}%)`
                }
                if (torrent.hasCue !== undefined && torrent.hasCue) {
                    raw_info.small_descr += ` / Cue`
                }
            }
            $('#yadg_input').wait(function(){
                $('#yadg_input').val(music_name);
                $('#yadg_input').parentsUntil('table').last().css({"margin-left": "0.5%", "width": "99%"});
                $('#yadg_input').parentsUntil('table').find('tr').map((index,e)=>{
                    $(e).find('td:first').css({"border-left": "none"});
                    $(e).find('td:last').css({"border-right": "none"});
                });
            });
            if (['RED', 'jpop', 'lztr','DICMusic', 'OPS', 'SugoiMusic'].indexOf(raw_info.origin_site) > -1) {
                if (raw_info.origin_site == 'RED') {
                    try{
                        raw_info.music_type = raw_info.descr.match(/标签： (.*)/)[1].split(' | ');
                        raw_info.descr = raw_info.descr.replace(/标签： (.*)/, '');
                    } catch(err) {}
                } else {
                    raw_info.music_type = raw_info.music_type.split(',');
                }
                try{
                    var music_type = [];
                    raw_info.music_type.map((item)=>{
                        if (item.match(/pop/) && music_type.indexOf("流行(Pop)") < 0) {
                            music_type.push("流行(Pop)");
                        }
                        if (item.match(/rock/) && music_type.indexOf("摇滚(rock)") < 0) {
                            music_type.push("摇滚(rock)");
                        }
                        if (item.match(/punk/) && music_type.indexOf("朋克(Punk)") < 0) {
                            music_type.push("朋克(Punk)");
                        }
                        if (item.match(/Metal/i) && music_type.indexOf("金属(Metal)") < 0) {
                            music_type.push("金属(Metal)");
                        }
                        if (type_dict.hasOwnProperty(item) && music_type.indexOf(type_dict[item]) < 0) {
                            music_type.push(type_dict[item]);
                        }
                        if (item.match(/alternative/) && music_type.indexOf("另类(Alternative)") < 0) {
                            music_type.push("另类(Alternative)");
                        }
                        if (item.match(/world.music/) && music_type.indexOf("世界音乐(World)") < 0) {
                            music_type.push("世界音乐(World)");
                        }
                    });
                    raw_info.music_type = music_type;
                } catch(err) {}

                var name_dict = {
                    "RED": 'Redacted', 'OPS': 'Orpheus', 'jpop': 'Jpopsuki', 'DICMusic': 'DICMusic', 'lztr': 'LzTr', 'SugoiMusic': 'SugoiMusic'
                }
                $('#frname').val(name_dict[raw_info.origin_site]);
            }
            if (raw_info.origin_site == 'jpop') {
                raw_info.name = raw_info.name.replace(/\d{4} \d{2} \d{2}/, function(data) { return data.split(' ')[0]; });
            }

            if (forward_site == 'OpenCD') {
                raw_info.music_media += raw_info.small_descr + (raw_info.file_list? raw_info.file_list: '');
                raw_info.descr = raw_info.descr.split(/\[b\]\[color=green\]\[size=3\]本站提供的所有影视/)[0].trim();
                raw_info.descr = raw_info.descr.replace(/ \n \n/g, ' \n');
                raw_info.descr = raw_info.descr.replace(raw_info.tracklist, '');
                raw_info.name = raw_info.name.replace(/(Album|Single)$/, '');
                $('#artist').val(raw_info.music_author || author); $('#year').val(year); $('#browsecat').val(408); $('#resource_name').val(raw_info.music_name || music_name); $('#share_rule').val(3);
                $(`#name`).parent().parent().after(`<tr>
                    <td class="rowhead nowrap rowtitle">豆瓣搜索:</td>
                    <td><input id="douban"/></td>
                    <td><input id="douban_button" type="button" value="搜索"></td>
                    </tr>`);
                $('#douban').val(music_name);
                $('#douban_button').click(()=>{
                    window.open(`https://search.douban.com/music/subject_search?search_text=${$('#douban').val()}&cat=1003`, '_blank');
                })
                try {
                    var poster = raw_info.descr.match(/\[img\](.*?)\[\/img\]/)[1].trim();
                    $('#cover').after(`<img style="max-width:200px; margin-top:5px;" src=${poster} />`);
                    setTimeout(function () {
                        addPoster(poster, forward_site);
                    }, 2000);
                } catch (err) {
                    console.log(err)
                }
                raw_info.descr = raw_info.descr.replace(/^\[img\].*?\[\/img\]([\n\s]*)/, '');

                function add_log(name, log_txt, index) {
                    log_txt = log_txt.replace(/^\n{0,5}\[hide\]/, '').replace(/\[\/hide\]/, '').replace(/^Score.*?\(max 100\)/, '').trim();
                    var fileData = new Blob([log_txt], { type: "text/plain" });
                    var fileName = `${name}-${index+1}.log`;
                    console.log(log_txt)
                    var fileInput = $('input[name*=nfo1]:last')[0];
                    let container = new DataTransfer();
                    const files = new window.File([fileData], fileName, { type: 'text/plain' });
                    container.items.add(files);
                    fileInput.files = container.files;
                }

                if (raw_info.log_info !== '' && raw_info.log_info) {
                    raw_info.log_info = raw_info.log_info.split('==logs==');
                    add_log(raw_info.name, raw_info.log_info[0], 0);
                    if (raw_info.log_info.length > 1) {
                        for (var index = 1; index < raw_info.log_info.length; index++) {
                            $('#nfoadd').click();
                            add_log(raw_info.name, raw_info.log_info[index], index);
                        }
                    }
                }

                if (raw_info.music_media) {
                    raw_info.music_media += raw_info.edition_info ? raw_info.edition_info: '';
                    var media_selected = false;
                    var standard_selected = false;
                    $('#standard>option').map((index,e)=>{
                        if (!standard_selected && (raw_info.music_media + raw_info.small_descr).toUpperCase().match(e.innerText)) {
                            $(`#standard>option:eq(${index})`).attr('selected', true);
                            standard_selected = true;
                        }
                    });

                    $('#medium>option').map((index,e)=>{
                        if (!media_selected && (raw_info.music_media + raw_info.small_descr).toUpperCase().match(e.innerText.toUpperCase())) {
                            $(`#medium>option:eq(${index})`).attr('selected', true);
                            media_selected = true;
                        }
                    });
                    if (raw_info.music_media.match(/整轨/)){
                        $('#audio_mode').val('single');
                    } else if (raw_info.music_media.match(/分轨/) || $('#standard').val() == 4){
                        $('#audio_mode').val('multi');
                    } else {
                        $('#audio_mode').val('none');
                    }

                    if ($('#medium').val() == "1") {
                        var dict_cd = { "LPCD": "4", "HDCD": "5", "SACD": "6", "SRCD": "7", "K2CD": "8", "HQCD": "16", "XRCD": "17", "SHM-CD": "18" };
                        for (key in dict_cd) {
                            var reg = new RegExp(key, 'i');
                            if (raw_info.music_media.match(reg)) {
                                $('#medium').val(dict_cd[key]);
                            }
                        }
                    }
                }
                $('#team').val('5');
                var source_selected = false;
                if (['RED', 'jpop', 'lztr','DICMusic', 'OPS', 'SugoiMusic'].indexOf(raw_info.origin_site) > -1) {
                    $('a.tag:contains("大陆")').wait(function(){
                        raw_info.music_type.map(item=>{
                            var source = $(`a.tag:contains(${item})`);
                            if (item == "贝斯(Drum Bass)") { source = $(`a.tag[value="25"]`); }
                            if (source.length) {
                                addTag(source);
                            }
                            if (!source_selected) {
                                if (item == '摇滚(rock)') {
                                    item = '摇滚(Rock)';
                                }
                                if ($(`#source>option:contains(${item})`).length) {
                                    $(`#source>option:contains(${item})`).attr('selected', true);
                                    source_selected = true;
                                }
                            }
                        })
                    });
                }
                try{
                    if (raw_info.tracklist) {
                        raw_info.tracklist = raw_info.tracklist.replace(/\[.*?\]/g, function(data) {
                            if (data.match(/url/)) {
                                return data;
                            } else {
                                return '';
                            }
                        }).trim();
                        $('textarea[name="track_list"]').val(raw_info.tracklist.replace(/\.(flac|wav)/g, ''));
                        $('#descr').wait(function(){
                            $('#descr').val(raw_info.tracklist);
                            $('#descr').parent().append(`<a style="text-decoration:none;" href="#" id="file2descr"><font color="red">从简介导入</font></a>`);
                            $('#file2descr').click((e)=>{
                                e.preventDefault();
                                $('#descr').val(raw_info.descr);
                            });
                        });
                    } else {
                        var track_list = raw_info.descr.match(/0?1(\.|\))[\s\S]*\d+.*(\n|$)/)[0];
                        $('textarea[name="track_list"]').val(track_list);
                    }
                } catch(err) {}
                try{
                    if (raw_info.musicspectrum !== null) {
                        $('#spectrogram').val(raw_info.musicspectrum);
                    }
                } catch(err) {}
                try{
                    if (raw_info.file_list) {
                        $('textarea[name=track_list]').parent().append(`<a style="text-decoration:none;" href="#" id="file2tracklist"><font color="red">从文件列表导入</font></a>`);
                        $('#file2tracklist').click((e)=>{
                            e.preventDefault();
                            $('textarea[name=track_list]').val(`[b]Tracklist[/b]\n` + raw_info.file_list.replace(/\.flac|\.wav/g, ''));
                        });
                    }
                } catch (err) {}
                document.getElementById('audio_mode').dispatchEvent(evt);
            } else {
                raw_info.descr = raw_info.descr.replace(/^\[img\].*?\[\/img\]([\n\s]*)/, '');
                $('input[name="artists[]"]').val(author);
                $('input[name="title"]').val(music_name);
                $('input[name="year"]').val(year);
                $('input[name=title]').after(`<input type="button" value="搜索" id="search"/>`);
                $('#search').click(()=>{
                    var discogs_url = `https://www.discogs.com/search?q=${music_name}&type=all`;
                    window.open(discogs_url, "_blank");
                });
                if (raw_info.edition_info) {
                    $('input[name=year]').parent().parent().after(`<tr><td class="nowrap noboder right"><strong>辅助信息</strong></td><td class="nowrap noboder"><input value="${raw_info.edition_info.trim()}" size="60"/></td></tr>`);
                    $('input[name=remaster_year]').val(raw_info.edition_info.match(/\d{4}/)[0]);
                }
                if (raw_info.tracklist.match(/https:\/\/www.discogs.com\/release\/.*/)) {
                    $('input[name=discogs_url]').val(raw_info.tracklist.match(/https:\/\/www.discogs.com\/release\/.*/)[0]);
                }
            }
        } else if (raw_info.origin_site == 'OpenCD') {
            raw_info.descr += '\n\n' + '[quote]' + raw_info.tracklist + '[/quote]'
        }

        if (forward_site == 'OPS') {
            var announce = $('a:contains(已隐藏你的个人)').attr('href');
            if (forward_site == 'OPS') {
                announce = $('input[value*="announce"]').val();
                if (raw_info.releasetype !== undefined) {
                    switch (raw_info.releasetype) {
                        case 'Single': $('#releasetype').val(9); break;
                        case 'Album': $('#releasetype').val(1); break;
                        case 'PV': $('#releasetype').val(11); break;
                        case 'DVD': $('#releasetype').val(21); break;
                        case 'TV-Music': $('#releasetype').val(21); break;
                        case 'TV-Variety': $('#releasetype').val(21); break;
                        case 'TV-Drama': $('#releasetype').val(21); break;
                        case 'Fansubs': $('#releasetype').val(21); break;
                        case 'Pictures': $('#releasetype').val(21); break;
                    }
                }
                try { if (!$('#tags').val()) { $('#tags').val(raw_info.music_type.replace(/,/g, ', ')) } } catch (err) {}
            }
            addTorrent(raw_info.torrent_url, raw_info.torrent_name, forward_site, announce);
            function add_extra_info() {
                $('#artist_tr').before(`<tr class="section_tr"><td class="label">辅助信息:</td><td>${raw_info.name}<br>${raw_info.edition_info}<br>${raw_info.small_descr}</td></tr>`)
                raw_info.name = raw_info.name.trim();
                if (raw_info.origin_site == 'OPS') {
                    raw_info.name = raw_info.name.replace(/–/g, '-');
                }
                var info_text = raw_info.name.split('*');
                var author_name = info_text[0];
                var music_name = '待填';
                if (author_name.split('-').length > 1) {
                    music_name = author_name.split('-').pop().trim();
                }

                try {
                    raw_info.music_author.split(' & ').forEach((item, index)=>{
                        if (index == $('input[name="artists[]"]').length) {
                            AddArtistField();
                        }
                        if (item) {
                            $(`#artist_${index}`).val(item);
                        }
                    });
                } catch (Err) {}
                raw_info.descr = raw_info.descr.replace(/\[quote=Tracklist\]/, 'Tracklist\n').replace(/\[\/quote\]/, '');

                var year = '';
                if (raw_info.name.match(/(19|20)\d+/)){
                    year = raw_info.name.match(/(19|20)\d+/)[0];
                    music_name = music_name.split(year)[0].trim();
                }
                var author = raw_info.name.split(music_name)[0].replace(/-( *)?$/, '').trim();
                $('#yadg_input').wait(function(){
                    $('#yadg_input').val(music_name);
                });
                if (!$('#artist').val()) { $('#artist').val(raw_info.music_author || author); }
                if (!$('#year').val()) { $('#year').val(year); }
                if (!$('#title').val()) { $('#title').val(raw_info.music_name || music_name); }
                if (raw_info.edition_info && raw_info.edition_info.match(/(19|20)\d{2}/)) {
                    if (!$('#remaster_year').val()) { $('#remaster_year').val(raw_info.edition_info.match(/(19|20)\d{2}/)[0]); }
                }
                var media_selected = false;
                var standard_selected = false;
                if ($('#format').val() == '---' || !$('#format').val()) {
                    $('#format>option').map((index,e)=>{
                        if (!standard_selected && (raw_info.music_media + raw_info.small_descr + raw_info.edition_info).toUpperCase().match(e.innerText)) {
                            $(`#format>option:eq(${index})`).attr('selected', true);
                            standard_selected = true;
                        }
                    });
                }
                if ($('#media').val() == '---' || !$('#media').val()) {
                    $('#media>option').map((index,e)=>{
                        if (!media_selected && (raw_info.music_media + raw_info.small_descr + raw_info.edition_info).toUpperCase().match(e.innerText.toUpperCase())) {
                            $(`#media>option:eq(${index})`).attr('selected', true);
                            media_selected = true;
                        }
                    });
                }

                if ($('#bitrate').val() == '---' || !$('#bitrate').val()) {
                    if ((raw_info.small_descr).match(/24bit Lossless/)) {
                        $('#bitrate').val('24bit Lossless');
                    } else if ((raw_info.small_descr).match(/Lossless/)) {
                        $('#bitrate').val('Lossless');
                    } else if (raw_info.small_descr.match(/320|256|192|160|128|96|64/)) {
                        $('#bitrate').val(raw_info.small_descr.match(/320|256|192|160|128|96|64/)[0]);
                    }
                }
                var poster = raw_info.descr.match(/\[img\](.*?)\[\/img\]/)[1].trim();
                if (!$('#image').val()) { $('#image').val(poster); }
            }

            if (raw_info.json !== undefined) {
                var data = JSON.parse(raw_info.json);
                console.log(data)
                var group = data['response']['group'];
                var torrent = data['response']['torrent'];

                var categories_mapping = {
                    'Music': 0,
                    'Applications': 1,
                    'E-Books': 2,
                    'Audiobooks': 3,
                    'E-Learning Videos': 4,
                    'Comedy': 5,
                    'Comics': 6
                };
                var index = 0;
                if (categories_mapping.hasOwnProperty(group['categoryName'])) {
                    index = categories_mapping[group['categoryName']];
                }
                if (torrent.format) {
                    raw_info.small_descr += torrent.format;
                }
                var categories = $('#categories');
                if (!group['categoryName']) {
                    group['categoryName'] = 'Music';
                }
                categories.val(index).triggerHandler('change');
                WaitForCategory(function() {
                    fillMusicForm(group, torrent);
                    add_extra_info();
                    setTimeout(function(){
                        if (group.wikiBody.match(/\<(br|span).*?\>/)) {
                            var tmp_descr = raw_info.descr;
                            raw_info.descr = '';
                            var wikiBody = $(`<div>${group.wikiBody}</div>`);
                            wikiBody = walkDOM(wikiBody[0]);
                            $('#album_desc').val(wikiBody);
                            raw_info.descr = tmp_descr;
                        }
                        $('#release_desc').val(torrent.description.replace(/&emsp;/g, ' '));
                        if (torrent.encoding == "24bit Lossless") {
                            $('#bitrate').val('24bit Lossless');
                        }
                        if (group['tags']) {
                            $('#tags').val(Object.values(group['tags']).filter(f => f != "").join(', '));
                        }
                    }, 2000);
                });
            } else {
                add_extra_info();
            }
        }

        if (forward_site == 'RED') {
            var announce = $('input[value*="announce"]').val();
            addTorrent(raw_info.torrent_url, raw_info.torrent_name, forward_site, announce);
            var JSONReleaseTypes = {
                '1': 'Album',
                '3': 'Soundtrack',
                '5': 'EP',
                '6': 'Anthology',
                '7': 'Compilation',
                '9': 'Single',
                '11': 'Live album',
                '13': 'Remix',
                '14': 'Bootleg',
                '15': 'Interview',
                '16': 'Mixtape',
                '17': 'Sampler',
                '21': 'Unknown',
                '22': 'Demo',
                '23': 'DJ Mix',
                '24': 'Concert Recording'
            };
            function fillForm(releaseJSON) {
                var categories = ['Music', 'Applications', 'E-Books', 'Audiobooks', 'E-Learning Videos', 'Comedy', 'Comics'];
                var category = document.getElementById('categories');
                var categoryJSON = parseInt(releaseJSON.response.group.categoryId);
                var categoryNameJSON = releaseJSON.response.group.categoryName;
                var categoryIndex = categories.indexOf(categoryNameJSON);

                if (categoryIndex > -1) {
                    if (categoryIndex != 0) {
                        alert('Currently only Music category torrents are supported. Aborting...');
                        return;
                    } else {
                        category.selectedIndex = categories.indexOf(categoryNameJSON);
                    }
                } else {
                    alert('The category name indicated in the JSON (' + categoryNameJSON + ') is not one of the available category types! Aborting...');
                    return;
                }

                switch(categoryIndex) {
                    case 0:
                        var artists = [];
                        var artistRoles = [
                            {'name': 'artists', 'index': 0},
                            {'name': 'with', 'index': 1},
                            {'name': 'composers', 'index': 2},
                            {'name': 'conductor', 'index': 3},
                            {'name': 'dj', 'index': 4},
                            {'name': 'remixedBy', 'index': 5},
                            {'name': 'producer', 'index': 6},
                        ];
                        var artistsJSON = releaseJSON.response.group.musicInfo;

                        for (var i = 0, len = artistRoles.length; i < len; i++) {
                            if (artistsJSON[artistRoles[i].name].length == 0) continue;
                            for (var j = 0, lenj = artistsJSON[artistRoles[i].name].length; j < lenj; j++) {
                                artists.push({'name': artistsJSON[artistRoles[i].name][j].name, 'index': artistRoles[i].index});
                            }
                        }

                        if (artists.length > 0) {
                            var artistInputs = [];
                            artistInputs.length = artists.length;
                            for (i = 0, len = artists.length; i < len; i++) {
                                if (i > 0) window.eval('AddArtistField();');
                                artistInputs[i] = document.getElementById('artist' + (i > 0 ? '_' + i : ''));
                                artistInputs[i].value = artists[i].name;
                                var roles = document.querySelectorAll('td#artistfields > #importance');
                                roles[i].selectedIndex = artists[i].index;
                            }
                        } else {
                            alert('No artists are included in the JSON!');
                        }

                        var albumTitle = document.getElementById('title');
                        var albumTitleJSON = releaseJSON.response.group.name;

                        if (albumTitleJSON != '') {
                            albumTitle.value = albumTitleJSON;
                        } else {
                            alert('No album title is included in the JSON!');
                        }

                        var initialYear = document.getElementById('year');
                        var initialYearJSON = releaseJSON.response.group.year;

                        if (initialYearJSON != '') {
                            initialYear.value = initialYearJSON;
                        } else {
                            alert('No initial year is included in the JSON!');
                        }

                        var releaseType = document.getElementById('releasetype');
                        var releaseTypes = [];
                        for (i = 0, len = releaseType.options.length; i < len; i++) {
                            releaseTypes.push(releaseType.options[i].textContent.toLowerCase());
                        }

                        try {
                            var releaseTypeIndexJSON = parseInt(releaseJSON.response.group.releaseType);
                            var releaseTypeNameJSON = JSONReleaseTypes[releaseTypeIndexJSON];
                            var releaseTypeIndex = releaseTypes.indexOf(releaseTypeNameJSON.toLowerCase());

                            if (releaseTypeIndex > -1) {
                                releaseType.selectedIndex = releaseTypeIndex;
                            } else {
                                alert('The release type indicated in the JSON (' + releaseTypeNameJSON + ' [' + releaseTypeIndexJSON + ']) ' +
                                      'is not one of the available release types!\n\nManually select the appropriate release type.');
                            }
                        } catch (err) {}

                        var editionYear = document.getElementById('remaster_year');
                        var editionTitle = document.getElementById('remaster_title');
                        var editionLabel = document.getElementById('remaster_record_label');
                        var editionCatNo = document.getElementById('remaster_catalogue_number');
                        var edition = releaseJSON.response.torrent.remastered;

                        if (edition) {
                            var editionYearJSON = releaseJSON.response.torrent.remasterYear;
                            var editionTitleJSON = releaseJSON.response.torrent.remasterTitle;
                            var editionLabelJSON = releaseJSON.response.torrent.remasterRecordLabel;
                            var editionCatNoJSON = releaseJSON.response.torrent.remasterCatalogueNumber;
                        } else {
                            editionYearJSON = initialYearJSON
                            editionTitleJSON = '';
                            editionLabelJSON = releaseJSON.response.group.recordLabel;
                            editionCatNoJSON = releaseJSON.response.group.catalogueNumber;
                        }

                        if (editionYearJSON == '') {
                            alert('No edition year is included in the JSON!');
                        }

                        editionYear.value = editionYearJSON;
                        editionTitle.value = editionTitleJSON;
                        editionLabel.value = editionLabelJSON;
                        editionCatNo.value = editionCatNoJSON;

                        var scene = document.getElementById('scene');
                        var sceneJSON = releaseJSON.response.torrent.scene;
                        if (sceneJSON) scene.checked = true;

                        var format = document.getElementById('format');
                        var formats = [];
                        for (i = 0, len = format.options.length; i < len; i++) {
                            formats.push(format.options[i].textContent.toLowerCase());
                        }

                        var formatJSON = releaseJSON.response.torrent.format;
                        var formatIndex = formats.indexOf(formatJSON.toLowerCase());

                        if (formatIndex > -1) {
                            format.selectedIndex = formatIndex;
                        } else {
                            alert('The format indicated in the JSON (' + formatJSON + ') ' +
                                  'is not one of the available formats!\n\nManually select the appropriate formats.');
                        }

                        var bitrate = document.getElementById('bitrate');
                        var bitrates = [];
                        for (i = 0, len = bitrate.options.length; i < len; i++) {
                            bitrates.push(bitrate.options[i].textContent.toLowerCase());
                        }
                        var otherBitrate = document.getElementById('other_bitrate');
                        var otherBitrateVBR = document.getElementById('vbr');

                        var bitrateJSON = releaseJSON.response.torrent.encoding;
                        var bitrateIndex = bitrates.indexOf(bitrateJSON.toLowerCase());

                        if (bitrateIndex > -1) {
                            bitrate.selectedIndex = bitrateIndex;
                        } else {
                            bitrate.selectedIndex = bitrates.indexOf('other');
                            document.getElementById('other_bitrate_span').classList.remove('hidden');
                            otherBitrate.value = bitrateJSON.replace(/ \(VBR\)$/i, '');
                            otherBitrateVBR.checked = /.+ \(VBR\)$/i.test(bitrateJSON);
                        }

                        var media = document.getElementById('media');
                        var medias = [];
                        for (i = 0, len = media.options.length; i < len; i++) {
                            medias.push(media.options[i].textContent.toLowerCase());
                        }

                        var mediaJSON = releaseJSON.response.torrent.media;
                        var mediaIndex = medias.indexOf(mediaJSON.toLowerCase());

                        if (mediaIndex > -1) {
                            media.selectedIndex = mediaIndex;
                        } else {
                            alert('The media indicated in the JSON (' + mediaJSON + ') ' +
                                  'is not one of the available media!\n\nManually select the appropriate media.');
                        }

                        if (formats[formatIndex] == 'flac' && bitrates[bitrateIndex] == 'lossless' && medias[mediaIndex] == 'cd') {
                            var hasLogJSON = releaseJSON.response.torrent.hasLog;
                            var logs = document.getElementById('upload_logs');
                            if (hasLogJSON) logs.classList.remove('hidden');
                        }

                        var tags = document.getElementById('tags');
                        var tagsJSON = releaseJSON.response.group.tags;
                        var tagList = '';

                        if (tagsJSON.length > 0) {
                            for (i = 0, len = tagsJSON.length; i < len; i++) {
                                tagList += (i > 0 ? ', ' : '') + tagsJSON[i];
                            }
                        }

                        tags.value = tagList;

                        var image = document.getElementById('image');
                        var imageJSON = releaseJSON.response.group.wikiImage;
                        image.value = imageJSON;

                        var albumDesc = document.getElementById('album_desc');
                        var albumDescJSON = releaseJSON.response.group.wikiBody;

                        if (albumDescJSON != '') {
                            albumDescJSON = albumDescJSON.replace(/<br \/>/g, '');
                            albumDescJSON = albumDescJSON.replace(/&amp;/g, '&');
                            albumDescJSON = albumDescJSON.replace(/&lt;/g, '<');
                            albumDescJSON = albumDescJSON.replace(/&gt;/g, '>');
                            albumDescJSON = albumDescJSON.replace(/&quot;/g, '"');
                            albumDescJSON = albumDescJSON.replace(/&apos;/g, '\'');
                            albumDescJSON = albumDescJSON.replace(/&#39;/g, '\'');
                            albumDescJSON = albumDescJSON.replace(/<a href="artist\.php\?artistname=.+?">(.+?)<\/a>/g, '[artist]$1[/artist]');
                            albumDescJSON = albumDescJSON.replace(/<a href="user\.php\?action=search&amp;search=.+?">(.+?)<\/a>/g, '[user]$1[/user]');
                            albumDescJSON = albumDescJSON.replace(/<a .+?>(https?:\/\/.+?)<\/a>/g, '$1');
                            albumDescJSON = albumDescJSON.replace(/<a .*?href="(https?:\/\/.+?)".*?>(.+?)<\/a>/g, '[url=$1]$2[/url]');
                            albumDescJSON = albumDescJSON.replace(/<span class="size(\d+)">(.+?)<\/span>/g, '[size=$1]$2[/size]');
                            albumDescJSON = albumDescJSON.replace(/<span style="font-style: italic;">(.+?)<\/span>/g, '[i]$1[/i]');
                            albumDescJSON = albumDescJSON.replace(/<ol class="postlist">([\s\S]+?)<\/ol>/g, function(data){
                                var data = data.replace(/<ol class="postlist">([\s\S]+?)<\/ol>/g, '$1');
                                data = data.replace(/<li>(.+?)<\/li>/g, '[#]$1\n');
                                return data;
                            });
                            albumDescJSON = albumDescJSON.replace(/<span style="text-decoration: underline;">(.+?)<\/span>/g, '[u]$1[/u]');
                            albumDescJSON = albumDescJSON.replace(/<span style="text-decoration: line-through;">(.+?)<\/span>/g, '[s]$1[/s]');
                            albumDescJSON = albumDescJSON.replace(/<span style="color: (.+?);">(.+?)<\/span>/g, '[color=$1]$2[/color]');
                            albumDescJSON = albumDescJSON.replace(/<div style="text-align: (.+?);">(.+?)<\/div>/g, '[align=$1]$2[/align]');
                            albumDescJSON = albumDescJSON.replace(
                                /<img class="scale_image" onclick="lightbox.init\(this, \$\(this\)\.width\(\)\);" alt="(.+?)" src=".+?">/g,
                                '[img]$1[/img]');
                            albumDescJSON = albumDescJSON.replace(
                                /<a href="#" onclick="QuoteJump\(event, '(\d+)'\); return false;"><strong class="quoteheader">(.+?)<\/strong> wrote: <\/a><blockquote>(.+?)<\/blockquote>/g,
                                '[quote=$2|$1]$3[/quote]');
                            albumDescJSON = albumDescJSON.replace(/<strong class="quoteheader">(.+?)<\/strong> wrote: <blockquote>(.+?)<\/blockquote>/g,
                                                                  '[quote=$1]$2[/quote]');
                            albumDescJSON = albumDescJSON.replace(/<blockquote>([\s\S]+?)<\/blockquote>/g, function(data) {
                                return `[quote]${data.replace(/<blockquote>([\s\S]+?)<\/blockquote>/, '$1').trim()}[/quote]`;
                            });
                            albumDescJSON = albumDescJSON.replace(/<strong>(.+?)<\/strong>: <a href="javascript:void\(0\);" onclick="BBCode\.spoiler\(this\);">Show<\/a><blockquote class="hidden spoiler">(.+?)<\/blockquote>/g,
                                                                  '[hide=$1]$2[/hide]');
                            albumDescJSON = albumDescJSON.replace(/<strong>Hidden text<\/strong>: <a href="javascript:void\(0\);" onclick="BBCode\.spoiler\(this\);">Show<\/a><blockquote class="hidden spoiler">(.+?)<\/blockquote>/g,
                                                                  '[hide]$1[/hide]');
                            albumDescJSON = albumDescJSON.replace(/<strong class="important_text">(.+?)<\/strong>/g, '[important]$1[/important]');
                            albumDescJSON = albumDescJSON.replace(/<(pre|code)>(.+?)<\/\1>/g, '[$1]$2[/$1]');
                            albumDescJSON = albumDescJSON.replace(/<(\/)?strong>/g, '[$1b]');

                            // 没有匹配上的标签给它去掉
                            albumDescJSON = albumDescJSON.replace(/<(\/)?span.*?>/g, '');

                            albumDesc.value = albumDescJSON;
                            albumDesc.style.height = '400px';
                            document.querySelector('input.button_preview_0').click();
                        } else {
                            alert('No album description is included in the JSON!');
                        }

                        var relDesc = document.getElementById('release_desc');
                        var relDescJSON = releaseJSON.response.torrent.description;
                        var groupIDJSON = releaseJSON.response.group.id;
                        var torrentIDJSON = releaseJSON.response.torrent.id;
                        sourceWebsiteDomains = ['notwhat.cd', 'orpheus.network'];
                        relDesc.value = relDescJSON;
                        document.querySelector('input.button_preview_1').click();
                        break;
                }
            }
            if (raw_info.json !== undefined) {
                var data = JSON.parse(raw_info.json);
                fillForm(data);
            }
        }

        var allinput = document.getElementsByTagName("input");
        if (forward_site == 'BLU' || forward_site == 'Audiences' || forward_site == 'Tik' || forward_site == 'Aither') {
            if (raw_info.descr.match(/Atmos/) && !raw_info.name.match(/atmos/i)) {
                raw_info.name = raw_info.name.replace(/(DDP|DD|AAC|HDMA|TrueHD|DTS.HD|DTS|PCM|FLAC)[ \.](.*?)(\d.\d)/i, '$1 $2 $3 Atmos').replace(/ +/g, ' ');
            }
        }
        if (forward_site == 'PTer' || forward_site == 'Dragon') {
            function re_build_name(channels, name) {
                var label = ''; label_str = '';
                if (channels == '1') {
                    label = /1\.0/; label_str = '1.0';
                } else if (channels == '2') {
                    label = /2\.0/; label_str = '2.0';
                } else if (channels == '6') {
                    label = /5\.1/; label_str = '5.1';
                } else if (channels == '8') {
                    label = /7\.1/; label_str = '7.1';
                }
                if (!name.match(label)) {
                    name = name.replace(/(DDP|AAC|FLAC|DTS|LPCM|TrueHD|DTS-HD.MA|DTS:X|DTS-HD.?HR|AC3)/i, `$1 ${label_str}`);
                }
                return name;
            }
            try{
                var channels = (raw_info.descr + raw_info.full_mediainfo).match(/Channel.*?(\d) channels/)[1];
                raw_info.name = re_build_name(channels, raw_info.name);
            } catch(err) {
                if (raw_info.descr.match(/(AUDIO.*CODEC.*?|音频.*?)(2\.0|1\.0|5\.1|7\.1)/i)) {
                    channels = raw_info.descr.match(/(AUDIO.*CODEC.*?|音频.*?)(2\.0|1\.0|5\.1|7\.1)/i)[2];
                    if (!raw_info.name.includes(channels)) {
                        raw_info.name = raw_info.name.replace(/(DDP|AAC|FLAC|DTS|LPCM|TrueHD|DTS-HD.MA|DTS:X|DTS-HD.?HR|AC3)/i, `$1 ${channels}`);
                    }
                } else if (raw_info.descr.match(/\d channels/i)) {
                    channels = raw_info.descr.match(/(\d) channels/i)[1];
                    raw_info.name = re_build_name(channels, raw_info.name);
                }
            }
            if (raw_info.name.match(/WEB-DL/)) {
                raw_info.name = raw_info.name.replace(/HEVC/, 'H.265').replace(/AVC/, 'H.264');
            }
        }
        if (raw_info.origin_site == 'BHD' && raw_info.name.match(/-FraMeSToR/)) {
            raw_info.name = raw_info.name.replace(/(BluRay)(.*?)(AVC|VC-1|HEVC)(.*?)(REMUX)/i, '$1 $5 $3 $2').replace(/ +/g, ' ').replace(' -', '-');
        }
        for (i = 0; i < allinput.length; i++) {
            if (allinput[i].name == 'name' && forward_site != 'GPW' && forward_site != 'OpenCD') { //填充标题
                if (['HDChina', 'NanYang', 'CMCT', 'iTS', 'NPUPT', 'xthor'].indexOf(forward_site) > -1) {
                    allinput[i].value = raw_info.name.replace(/\s/g, ".");
                } else if (forward_site == 'TTG') {
                    raw_info.name = raw_info.name.replace(/(5\.1|2\.0|7\.1|1\.0)/, function(data){
                        return data.replace('.', '{@}');
                    });
                    raw_info.name = raw_info.name.replace(/h\.(26(5|4))/i, 'H{@}$1');
                    $('input[name=subtitle]').val(raw_info.small_descr.trim());
                    allinput[i].value = raw_info.name;
                } else if (forward_site == 'PuTao'){
                    raw_info.name = '[{chinese}] {english}'.format({
                        'english': raw_info.name,
                        'chinese': get_small_descr_from_descr(raw_info.descr, raw_info.name).split('/')[0].split(/\| 类别/)[0].split('*')[0].trim()
                    });
                    allinput[i].value = raw_info.name;
                } else if (forward_site == 'Panda'){
                    raw_info.name = raw_info.name.replace(/TrueHD(\d\.\d)/, 'TrueHD $1');
                    raw_info.name = raw_info.name.replace(/DTS-HD.?MA.?(\d\.\d)/, 'DTS-HD MA $1');
                    raw_info.name = raw_info.name.replace(/DTS-HD.?(HRA?).?(\d\.\d)/, 'DTS-HD $1 $2');
                    allinput[i].value = raw_info.name;
                } else {
                    if (forward_site == 'BLU') {
                        raw_info.name = raw_info.name.replace(/Remux/i, 'REMUX');
                        raw_info.name = raw_info.name.replace(/(Atmos)(.*?)(TrueHD)(.*?)(7.1)/, '$2$3 $5 $1').replace(/ +/g, ' ');
                        if (raw_info.name.match(/DV HDR/i)) {
                            raw_info.name = raw_info.name.replace(/(1080|2160)[pi]/i, function(data){
                                return 'Hybrid ' + data;
                            });
                        }
                        raw_info.name = raw_info.name.replace(/DDP/i, 'DD+');
                        raw_info.name = raw_info.name.replace(/(DD\+|DD|AAC|TrueHD|DTS.HD.?MA|DTS.HD.?HR|DTS.HD|DTS|L?PCM|FLAC)(.*?)(5\.1|2\.0|7\.1|1\.0)/i, '$1 $3');
                        raw_info.name = raw_info.name.replace(/(WEB-DL)(.*?)(AVC|x264|H264)/i, '$1$2H.264');
                        raw_info.name = raw_info.name.replace(/(WEB-DL)(.*?)(HEVC|x265|H265)/i, '$1$2H.265');
                    }
                    if (['ACM'].indexOf(forward_site) > -1) {
                        raw_info.name = raw_info.name.replace(/DDP/i, 'DD+');
                        raw_info.name = raw_info.name.replace(/(DD\+|DD|AAC|TrueHD|DTS.HD.?MA|DTS.HD.?HR|DTS.HD|DTS|L?PCM|FLAC)[ \.](.*?)(5\.1|2\.0|7\.1|1\.0)/i, '$1$3');
                        raw_info.name = raw_info.name.replace(/(WEB-DL|HDTV|SDTV)(.*?)(AVC|x264|H264)/i, '$1$2H.264');
                        raw_info.name = raw_info.name.replace(/(WEB-DL|HDTV|SDTV)(.*?)(x265|H265|H.265)/i, '$1$2HEVC');
                    }
                    if (['BHD'].indexOf(forward_site) > -1) {
                        raw_info.name = raw_info.name.replace(/DD\+/i, 'DDP');
                        raw_info.name = raw_info.name.replace(/(DDP|DD|AAC|TrueHD|DTS.HD.?MA|DTS.HD.?HR|DTS.HD|DTS|L?PCM|FLAC)(.*?)(5\.1|2\.0|7\.1|1\.0)/i, '$1 $3');
                    }
                    allinput[i].value = raw_info.name;
                }
            }

            if (allinput[i].name == 'small_descr') { //填充副标题
                allinput[i].value = raw_info.small_descr;
                if (forward_site == 'OpenCD') {
                    allinput[i].value = raw_info.small_descr.replace('- {自抓}', '');
                }
                if (forward_site == 'CMCT') {
                    allinput[i].value = raw_info.small_descr.replace('【', '[').replace('】', ']');
                }
            }

            if (allinput[i].name == 'pt_gen') {
                allinput[i].value = raw_info.dburl ? raw_info.dburl: raw_info.url;
            }

            if (allinput[i].name == 'custom_fields[4][1]' && forward_site == 'KuFei') {
                allinput[i].value = raw_info.dburl ? raw_info.dburl: '';
            }

            if (allinput[i].name == 'picture' && !site_url.split('#seperator#')[0].match(/offer/)) {
                if (raw_info.descr.match(/\[img\](\S*?)\[\/img\]/i)){
                    allinput[i].value = raw_info.descr.match(/\[img\](\S*?)\[\/img\]/i)[1].split('=').pop();
                }
            }

            if (['url', 'pt_gen[imdb][link]', 'imdb'].indexOf(allinput[i].name) > -1 && allinput[i].type == 'text') { //填充imdb信息
                if (forward_site == 'OurBits' && raw_info.url == ''){
                    if (raw_info.dburl){
                        raw_info.url = raw_info.dburl;
                    }
                }
                if (forward_site == 'CMCT'){
                    if (raw_info.dburl){
                        allinput[i].value = raw_info.dburl;
                    } else {
                        allinput[i].value = raw_info.url;
                    }
                } else {
                    allinput[i].value = raw_info.url;
                }
            }

            if (['url_douban', 'douban', 'dburl', 'douban_url', 'douban_id', 'durl', 'pt_gen[douban][link]'].indexOf(allinput[i].name)>-1) { //豆瓣信息
                if (forward_site == 'TTG' && raw_info.dburl) {
                    allinput[i].value = raw_info.dburl.match(/\d+/)[0];
                } else {
                    allinput[i].value = raw_info.dburl;
                }
            }

            if (['HDDolby'].indexOf(forward_site) > -1 && allinput[i].name == 'douban_id' && raw_info.dburl){
                allinput[i].value = raw_info.dburl.match(/\d+/i)[0];
            }

            if (forward_site == 'BTSchool' && allinput[i].name == 'imdbid' && raw_info.url){
                allinput[i].value = raw_info.url.match(/tt\d+/i)[0];
            }
            if (forward_site == 'BTSchool' && allinput[i].name == 'doubanid' && raw_info.dburl){
                allinput[i].value = raw_info.dburl.match(/\d+/i)[0];
            }

            if (['TJUPT'].indexOf(forward_site) > -1 && allinput[i].name == 'external_url'){
                allinput[i].value = raw_info.url? raw_info.url:raw_info.dburl;
            }

            if (forward_site == 'HDT' && allinput[i].name == 'filename') {
                if (raw_info.name.match(/remux/i)) {
                    raw_info.name = raw_info.name.replace(/bluray/i, 'Blu-ray');
                }
                allinput[i].value = raw_info.name.replace(/DDP/i, 'DD+').replace(/Remux/i, 'Remux');
            }
            if (forward_site == 'HDT' && allinput[i].name == 'infosite') {
                allinput[i].value = raw_info.url.replace('http:', 'https:').replace(/(tt\d+[^/]$)/, '$1/');
            }
        }

        //填写简介，一般都是textarea，特殊情况后续处理--CMCT改版兼容
        var descr_box = document.getElementsByTagName('textarea');
        if (forward_site == 'HDAtmos') {
            raw_info.descr.match(/(\[url=.*?\])?\[img\].*?\[\/img\](\[\/url\])?/g).forEach((item)=>{
                var index = raw_info.descr.indexOf(item);
                if (index > 500 ) {
                    raw_info.descr = raw_info.descr.replace(item, '').trim();
                }
            });
        }
        if (forward_site == 'AGSV') {
            raw_info.descr = raw_info.descr.replace(/\[color=.*?\].*?\[\/color\]/i, '').trim();
        }
        if (['CMCT', 'PTsbao', 'HDPost','HDCity', 'BLU', 'UHD', 'HDSpace', 'HDB', 'iTS', 'PTP', 'BYR', 'GPW', 'HaresClub', 'HDTime', 'KIMOJI',
        'HD-Only', 'HDfans', 'SC', 'MTV', 'NBL', 'avz', 'PHD', 'CNZ', 'ANT', 'TVV', 'xthor', 'HDF', 'OpenCD', 'PigGo', 'RED', 'Tik', 'Aither',
        'SugoiMusic', 'CG', 'ZHUQUE', 'KIMOJI', 'MTeam', 'FNP', 'OnlyEncodes'].indexOf(forward_site) < 0){
            if (forward_site == 'HDT') {
                descr_box[0].style.height = '600px';
                var mediainfo_hdt = get_mediainfo_picture_from_descr(raw_info.descr);
                descr_box[0].value = '[quote]' + simplifyMI(mediainfo_hdt.mediainfo, 'HDT') + '[/quote]\n' + mediainfo_hdt.pic_info.replace(/\n/g,'');
            } else if (forward_site != 'HaiDan'){
                if (forward_site != 'OpenCD') {
                    descr_box[0].style.height = '800px';
                    if ($('textarea[name="technical_info"]').length) {
                        descr_box[0].style.height = '460px';
                    }
                }
                if (forward_site == 'OPS' && raw_info.origin_site == 'jpop') {
                    descr_box[0].style.height = '400px';
                    raw_info.descr = raw_info.descr.replace(/^\[.*?\/img\]/, '').trim();
                }
                if (forward_site == 'PTer') {
                    try{
                        raw_info.descr.match(/\[quote\][\s\S]*?\[\/quote\]/g).map((e)=> {
                            if (e.match(/General.{0,2}\n?(Unique|Complete name)/)) {
                                var ee = e.replace('[quote]', '[hide=mediainfo]').replace('[/quote]', '[/hide]');
                                raw_info.descr = raw_info.descr.replace(e, ee);
                            } else if (e.match(/Disc Title|Disc Info|Disc Label/)) {
                                var ee = e.replace('[quote]', '[hide=bdinfo]').replace('[/quote]', '[/hide]');
                                raw_info.descr = raw_info.descr.replace(e, ee);
                            }
                        });
                    } catch(err) {}
                } else if (forward_site == 'Audiences') {
                    try{
                        raw_info.descr.match(/\[quote\][\s\S]*?\[\/quote\]/g).map((e)=> {
                            if (e.match(/General|Disc Title|Disc Info|Disc Label|RELEASE.NAME|RELEASE DATE|Unique ID|RESOLUTiON|Bitrate|帧　率|音频码率|视频码率/i)) {
                                var ee = e.replace('[quote]', '[Mediainfo]').replace('[/quote]', '[/Mediainfo]');
                                raw_info.descr = raw_info.descr.replace(e, ee);
                            }
                        });
                    } catch(err) {}
                }
                descr_box[0].value = raw_info.descr;
                if (forward_site == 'BHD') {
                    document.getElementById('mediainfo').dispatchEvent(evt);
                }
                if (forward_site == 'TCCF') {
                    $('span:contains("[bbcode]")').click();
                    descr_box[0].value = raw_info.descr;
                    $('span:contains("[bbcode]")').click();
                }
            } else {
                descr_box[2].value = raw_info.descr;
            }
        }

        if ($('textarea[name="technical_info"]').length || (forward_site == 'HHClub' && site_url.match(/add_offer/))) {
            for (i=0; i<skip_img.length; i++) {
                raw_info.descr = raw_info.descr.replace(skip_img[i], '');
            }
            raw_info.descr = raw_info.descr.replace(/\n\n+/, '\n\n');
            var container = $('textarea[name="technical_info"]');
            if (forward_site == 'HHClub' && site_url.match(/add_offer/)) {
                container = $('textarea[name="mediainfo"]');
            }
            try{
                var infos = get_mediainfo_picture_from_descr(raw_info.descr);
                if (raw_info.multi_mediainfo) {
                    mediainfo = raw_info.multi_mediainfo.match(/\[quote.*?\][\s\S]*?General[\s\S]*?\[\/quote\]/ig);
                    mediainfo = mediainfo.join('\n\n').replace(/\[\/?quote\]/g, '');
                    container.val(mediainfo.trim());
                } else if (infos.multi_mediainfos) {
                    container.val(infos.multi_mediainfos);
                } else if (raw_info.full_mediainfo){
                    container.val(raw_info.full_mediainfo.trim());
                } else {
                    container.val(infos.mediainfo.replace(/\[\/?(size|font|color).*?\]/g, '').trim());
                }
                if ($('input[name="screenshot"]').length) {
                    get_full_size_picture_urls(null, infos.pic_info, $('#not'), false, function(img_info) {
                        $('input[name="screenshot"]').val(img_info.trim().split('\n').join(','));
                    });
                }
                container.css({'height': '600px'});
                var tmp_descr = raw_info.descr.replace(infos.mediainfo, '');
                tmp_descr = tmp_descr.replace(/\[quote\].*?官组作品.*?\[\/quote\]/g, '').replace(/\[quote\][.\n]*?\[\/quote\]/g, function(data) {
                    if (!data.replace(/\[.*?\]/g, '').trim()) {
                        return '';
                    } else {
                        return data;
                    }
                });
                tmp_descr = tmp_descr.replace(/ +\n/g, '\n');
                if (raw_info.full_mediainfo) {
                    tmp_descr = tmp_descr.replace(/\[quote\][\s\S]{0,80}(General|Disc)[\s\S]{50,30000}?\[\/quote\]/g, '');
                }
                tmp_descr = tmp_descr.replace('[img]https://i.ibb.co/8KwqmMK/Shark-PT-More-Screenshot.png[/img]', '');
                if (raw_info.origin_site == 'Audiences') {
                    tmp_descr = tmp_descr.replace(/\[\/?font.*?\]/g, '');
                }
                raw_info.descr = tmp_descr;
                raw_info.descr = add_thanks(raw_info.descr);
                $('textarea[name="descr"]').val(raw_info.descr.trim().replace(/\n\n+/g, '\n\n').replace(/\]\n\n\[/g, '\]\n\['));
            } catch(Err) {
                if (raw_info.full_mediainfo){
                    container.val(raw_info.full_mediainfo);
                } else {
                    container.val(raw_info.descr);
                }
                container.css({'height': '600px'});
            }
        }

        if (forward_site == 'TTG'){
            setTimeout(function(){
                descr_box[0].value = descr_box[0].value.replace(/http:\/\/anonym\.to\/\?/ig, '');
            }, 2000);
        }

        //-------------------------------------------勾选国语粤语中字等标签--------------------------------------------------------
        var label_str = raw_info.small_descr + raw_info.name + '#seperator#' + raw_info.descr;
        if ($('textarea[name="technical_info"]').length) {
            label_str += $('textarea[name="technical_info"]').val();
        }
        var labels = label_str.get_label();
        if (raw_info.labels % 2) {
            labels.gy = true;
        }
        if (9 < raw_info.labels && raw_info.labels < 100) {
                labels.yy = true;
        }
        if (raw_info.labels > 99) {
            labels.zz = true;
        }
        if (raw_info.descr.match(/◎语.*?言　汉语普通话/) && !label_str.match(/mpls/i)) {
            labels.gy = true;
        }
        if (raw_info.descr.match(/◎语.*?言　粤语/) && !label_str.match(/mpls/i)) {
            labels.yy = true;
        }
        if (raw_info.name.match(/(x|H)(264|265)/i)) {
            labels.diy = false;
        }
        if ( (raw_info.name.match(/[\. ]S\d+/) && !raw_info.name.match(/S\d+.?E\d+/)) || (raw_info.name.match(/Complete/i) && raw_info.type == '剧集')) {
            labels.complete = true;
        } else {
            labels.complete = false;
        }
        if (raw_info.descr.match(/Presentation Graphics.*Chinese/)) {
            labels.zz = true;
        }
        console.log(labels)
        try {
            switch (forward_site){
                case '红叶':
                    if (labels.gy){ $('input[name="tags[5][]"][value="5"]').attr('checked', true); }
                    if (labels.yy){ $('input[name="tags[5][]"][value="18"]').attr('checked', true); }
                    if (labels.zz){ $('input[name="tags[5][]"][value="6"]').attr('checked', true); }
                    if (labels.diy){ $('input[name="tags[5][]"][value="4"]').attr('checked', true); }
                    if (labels.hdr10 || labels.hdr10plus) { try { $('input[name="tags[5][]"][value="7"]').attr('checked', true); } catch(err) {}}
                    if (labels.db) { $('input[name="tags[5][]"][value="17"]').attr('checked', true); }
                    break;
                }
        } catch (err) {
        }

        //匿名勾选
        if (forward_site == 'TTG') {
            var anonymity = if_uplver ? "option[value='yes']" : "option[value='no']";
            $("select[name='anonymity']").find(anonymity).attr("selected", true);
        } else if (forward_site == 'HDRoute') {
            document.getElementsByName('is_anonymous')[0].checked = if_uplver;
        } else if (forward_site == 'HDT') {
            document.getElementsByName('anonymous')[1].checked = if_uplver;
        } else if (forward_site == 'UHD') {
            $('#anonymous').prop('checked', if_uplver);
        } else if (forward_site == 'HDSpace') {
            $('input[name="anonymous"]:eq(1)').prop('checked', if_uplver);
        } else if (forward_site == 'KIMOJI' || forward_site == 'FNP' || forward_site == 'OnlyEncodes') {
            $('#anon').prop('checked', if_uplver);
        } else if (['HDPost', 'BLU', 'Tik', 'Aither', 'BHD', 'iTS', 'PTP', 'ACM', 'JPTV', 'Monika'].indexOf(forward_site) < 0){
            setTimeout(()=>{
                try {
                    document.getElementsByName('uplver')[0].checked = if_uplver;
                } catch(err) {}
            }, 1000)
        }

        //---------------------------------------干掉选择种子后主标题变化的bug------------------------------------------
        var torrent_box = document.getElementById("torrent");
        try{
            if (forward_site == 'CHDBits') {
                torrent_box.parentNode.innerHTML = '<input type="file" class="file" id="torrent" name="torrentfile" accept=".torrent">';
            } else if (forward_site == 'HDCity' || forward_site == 'HDSpace') {

            } else if (forward_site == 'BHD') {
                torrent_box.parentNode.innerHTML = ' <input class="beta-form-main" type="file" accept=".torrent" name="torrent" id="torrent" style="width: 100% !important;" required="">';
            } else if (forward_site == 'HDPost' || forward_site == 'ACM' || forward_site == 'JPTV' || forward_site == 'Monika' || forward_site == 'KIMOJI' || forward_site == 'FNP' || forward_site == 'OnlyEncodes') {
                torrent_box.parentNode.innerHTML = '<label for="torrent" class="form__label">Torrent 文件</label><input class="upload-form-file form__file" type="file" accept=".torrent" name="torrent" id="torrent" required="">';
            } else if (forward_site == 'BLU' || forward_site == 'Tik' || forward_site == 'Aither') {
                torrent_box.parentNode.innerHTML = '<label for="torrent" class="form__label">Torrent File</label><input class="upload-form-file form__file" type="file" accept=".torrent" name="torrent" id="torrent" required="">';
            } else if (forward_site != 'xthor') {
                torrent_box.parentNode.innerHTML = '<input type="file" class="file" id="torrent" name="file" accept=".torrent">';
            } else if (forward_site == 'xthor') {
                $('#torrent').removeAttr("onchange");
            }
        } catch(err){}

        if (judge_if_the_site_in_domestic(forward_site) || ['HDPost', 'GPW', 'HDRoute', 'OpenCD', 'KIMOJI'].indexOf(forward_site) > -1) {
            try{
                addTorrent(raw_info.torrent_url, raw_info.torrent_name, forward_site, null);
            } catch (err) {
                console.log(err);
            }
        }


        //-----------------------------------------------选择类填写------------------------------------------------
        try {
            // 显示质量与标签
            var interval = setInterval(function(){
                var displayCSS = $('tr.mode_4:eq(0)').css("display");
                if(displayCSS === 'none'){
                    $('tr.mode_4').show();
                    clearInterval(interval);
                }
            },100);
        } catch (err) {}

        if (forward_site == 'PTer'){
            var type_dict = {'电影': 401, '剧集': 404, '动漫': 403, '综艺': 405, '音乐': 406, '纪录': 402,
                             '体育': 407, '软件': 410, '学习': 411, '书籍': 408, 'MV': 413};
            if (type_dict.hasOwnProperty(raw_info.type)){
                var index = type_dict[raw_info.type];
                $('select[name="type"]').val(index);
            }

            var source_box = $('select[name=source_sel]');
            switch(raw_info.audiocodec_sel){
                case 'Flac': source_box.val(8); break;
                case 'WAV': source_box.val(9);
            }
            switch(raw_info.medium_sel){
                case 'UHD': source_box.val(1); break;
                case 'Blu-ray': source_box.val(2); break;
                case 'Remux': source_box.val(3); break;
                case 'HDTV': source_box.val(4); break;
                case 'WEB-DL': source_box.val(5); break;
                case 'Encode': source_box.val(6); break;
                case 'DVD': source_box.val(7);
            }

            var team_box = $('select[name=team_sel]');
            var team_dict = {'欧美': 4, '大陆': 1, '香港': 2, '台湾': 3, '日本': 6, '韩国': 5, '印度': 7, '': 8 };
            if (team_dict.hasOwnProperty(raw_info.source_sel)){
                var index = team_dict[raw_info.source_sel];
                team_box.val(index);
            }

            $('tr:contains(简介):last').after(`<tr><td style="text-align:right"><b>转换</b></td>
                <td><a id="img2" style="margin-left:5px" href="#">IMG2</a>
                <a id="img3" style="margin-left:5px" href="#">IMG3</a>
                <a id="img4" style="margin-left:5px" href="#">IMG4</a>
                <font style="margin-left:5px" color="red">选中要转换的bbcode图片部分点击即可。</font></td></tr>`);
            $('#img2,#img3').click(function(e){
                e.preventDefault();
                var text = $('#descr').val();
                var textarea = document.getElementById('descr');
                if (textarea && textarea.selectionStart != undefined && textarea.selectionEnd != undefined){
                    var chosen_value = textarea.value.substring(textarea.selectionStart, textarea.selectionEnd);
                    if (this.id == 'img2') {
                        $('#descr').val(text.replace(chosen_value, chosen_value.replace(/\[img\]/g, '[img2]')));
                    } else if (this.id == 'img3') {
                        $('#descr').val(text.replace(chosen_value, chosen_value.replace(/\[img\]/g, '[img3]')));
                    } else if (this.id == 'img4') {
                        $('#descr').val(text.replace(chosen_value, chosen_value.replace(/\[img\]/g, '[img4]')));
                    }
                }
            })
        }


        else if (forward_site == 'ZMPT' || forward_site == '红叶') {
            var browsecat = $('#browsecat');
            var type_dict = {'电影': 401, '剧集': 402, '动漫': 405, '综艺': 403, '音乐': 408, '纪录': 404,
                             '体育': 407, '软件': 409, '学习': 409, '': 409, '游戏': 409, 'MV': 406};
            browsecat.val(409)
            if (type_dict.hasOwnProperty(raw_info.type)){
                var index = type_dict[raw_info.type];
                browsecat.val(index);
            }

            if (raw_info.type == '纪录' && forward_site == 'ZMPT') {
                browsecat.val(422);
            }

            if (raw_info.type == '书籍' && forward_site == 'ZMPT' && raw_info.descr.match(/m4a|mp3/i)) {
                browsecat.val(424);
            }

            if (raw_info.type == '动漫' && forward_site == 'ZMPT') {
                switch (raw_info.source_sel){
                    case '大陆': case '台湾': case '香港': case '港台':
                        browsecat.val(417);
                        break;
                    case '日本': browsecat.val(418); break;
                    case '韩国': browsecat.val(419); break;
                    case '欧美': browsecat.val(420); break;
                    default: browsecat.val(421);
                }
            }

            try {
                if (raw_info.type == '游戏') {
                    disableother('gamescat','browsecat');
                    disableother('gamescat','specialcat');
                } else {
                    disableother('browsecat','specialcat');
                    disableother('browsecat','gamescat');
                }
            } catch (err) {}
            setTimeout(function(){
                if (raw_info.type == '游戏') {
                    $('tr.mode_7').css('display', '');
                } else {
                    $('tr.mode_5').css('display', '');
                }
            }, 1000);
            var medium_box = $('select[name="medium_sel[5]"]');
            if (forward_site == 'ZMPT') {
                medium_box = $('select[name="medium_sel[4]"]');
            }
            switch(raw_info.medium_sel){
                case 'UHD': medium_box.val(1); break;
                case 'Blu-ray': medium_box.val(1); break;
                case 'DVD':
                    medium_box.val(2);
                    if (raw_info.name.match(/DVDr/i)) {
                        medium_box.val(6);
                    }
                    break;
                case 'Remux': medium_box.val(3); break;
                case 'HDTV': medium_box.val(5); break;
                case 'Encode': medium_box.val(7); break;
                case 'WEB-DL':
                    medium_box.val(10);
                    if (forward_site == '红叶') {
                        medium_box.val(8);
                    }
                    break;
                case 'CD':
                    if (forward_site == '红叶') { medium_sel.val(6); } else { medium_sel.val(8); }
            }
            if (raw_info.name.match(/MiniBD/i)) {
                medium_box.val(4);
            }
            var codec_box = $('select[name="codec_sel[5]"]');
            if (forward_site == 'ZMPT') {
                var codec_box = $('select[name="codec_sel[4]"]');
                codec_box.val(5)
                switch (raw_info.codec_sel){
                    case 'H265': case 'X265': codec_box.val(6); break;
                    case 'H264': case 'X264': codec_box.val(1); break;
                    case 'VC-1': codec_box.val(5); break;
                    case 'MPEG-2': case 'MPEG-4': codec_box.val(4); break;
                    case 'XVID': codec_box.val(5);
                }
            } else {
                codec_box.val(5);
                switch (raw_info.codec_sel){
                    case 'H265': case 'X265': codec_box.val(10); break;
                    case 'H264': case 'X264': codec_box.val(1); break;
                    case 'VC-1': codec_box.val(2); break;
                    case 'MPEG-2': case 'MPEG-4': codec_box.val(4); break;
                    case 'XVID': codec_box.val(3);
                }
            }
            var audiocodec_box = $('select[name="audiocodec_sel[5]"]');
            if (forward_site == '红叶') {
                switch (raw_info.audiocodec_sel){
                    case 'DTS-HD': case 'DTS-HDMA:X 7.1': case 'DTS-HDMA': case 'DTS-HDHR': audiocodec_box.val(16); break;
                    case 'TrueHD': audiocodec_box.val(15); break;
                    case 'Atmos': audiocodec_box.val(15); break;
                    case 'DTS': audiocodec_box.val(3); break;
                    case 'AC3':
                        audiocodec_box.val(20);
                        if (raw_info.name.match(/DD[P\+]/)) {
                            audiocodec_box.val(19);
                        }
                        break;
                    case 'AAC': audiocodec_box.val(6); break;
                    case 'Flac': audiocodec_box.val(1); break;
                    case 'APE': audiocodec_box.val(2); break;
                    case 'LPCM': audiocodec_box.val(14); break;
                    case 'WAV': audiocodec_box.val(14);
                }
            } else {
                audiocodec_box = $('select[name="audiocodec_sel[4]"]');
                switch (raw_info.audiocodec_sel){
                    case 'DTS-HD': case 'DTS-HDMA:X 7.1': case 'DTS-HDMA': audiocodec_box.val(3); break;
                    case 'TrueHD': audiocodec_box.val(7); break;
                    case 'Atmos': audiocodec_box.val(7); break;
                    case 'DTS': audiocodec_box.val(3); break;
                    case 'AC3': audiocodec_box.val(8); break;
                    case 'AAC': audiocodec_box.val(6); break;
                    case 'Flac': audiocodec_box.val(1); break;
                    case 'APE': audiocodec_box.val(2); break;
                    case 'LPCM': audiocodec_box.val(7); break;
                    case 'WAV': audiocodec_box.val(7);
                }
            }

            if (forward_site == '红叶') {
                var team_box = $('select[name="processing_sel[5]"]');
                team_box.val(6);
                var team_dict = {'欧美': 3, '大陆': 2, '香港': 1, '台湾': 1, '日本': 4, '韩国': 5};
                if (team_dict.hasOwnProperty(raw_info.source_sel)){
                    var index = team_dict[raw_info.source_sel];
                    team_box.val(index);
                }
            }

            var standard_box = $('select[name="standard_sel[5]"]');
            var standard_dict = {
                '4K': 5, '1080p': 1, '1080i': 2, '720p': 3, 'SD': 4,
            };
            if (forward_site == 'ZMPT') {
                standard_box = $('select[name="standard_sel[4]"]');
                standard_dict = {
                    '4K': 5, '1080p': 1, '1080i': 1, '720p': 8, 'SD': 7,
                };
            }
            if (standard_dict.hasOwnProperty(raw_info.standard_sel)){
                var index = standard_dict[raw_info.standard_sel];
                standard_box.val(index);
            }
            $('select[name="team_sel[5]"]').val(5);
            check_team(raw_info, 'team_sel[5]');
            $('select[name="team_sel[4]"]').val(5);
            check_team(raw_info, 'team_sel[4]');
        }


        else if (forward_site == 'PTLSP') {
            //类型
            var browsecat = $('#browsecat');
            var type_dict = {'电影': 401, '剧集': 402, '综艺': 403, '纪录': 404, '动漫': 405, 'MV': 406,
                             '体育': 407, '音乐': 411, '其他': 409};
            browsecat.val(409);
            if (type_dict.hasOwnProperty(raw_info.type)){
                var index = type_dict[raw_info.type];
                browsecat.val(index);
            }
            disableother('browsecat','specialcat');

            //媒介
            var medium_box = $('select[name="medium_sel[4]"]');
            medium_box.val(13);
            switch(raw_info.medium_sel){
                case 'Blu-ray': medium_box.val(1); break;
                case 'DVD': medium_box.val(2); break;
                case 'Remux': medium_box.val(3); break;
                case 'HDTV': medium_box.val(5); break;
                case 'Encode': medium_box.val(7); break;
                case 'CD': medium_box.val(8); break;
                case 'WEB-DL': medium_box.val(10); break;
                case 'UHD': medium_box.val(11); break;
            }
            if (raw_info.name.match(/minibd/i)) {
                medium_box.val(4);
            }
            //视频编码
            var codec_box = $('select[name="codec_sel[4]"]');
            codec_box.val(11);
            switch (raw_info.codec_sel){
                case 'H264': codec_box.val(1); break;
                case 'X264': codec_box.val(1); break;
                case 'VC-1': codec_box.val(2); break;
                case 'XVID': codec_box.val(3); break;
                case 'MPEG-2': codec_box.val(4); break;
                case 'DIVX': codec_box.val(5); break;
                case 'H265': codec_box.val(6); break;
                case 'X265': codec_box.val(6); break;
                case 'MPEG-4': codec_box.val(10); break;
            }

            //音频编码
            var audiocodec_box = $('select[name="audiocodec_sel[4]"]');
            audiocodec_box.val(16);
            switch (raw_info.audiocodec_sel){
                case 'Atmos': audiocodec_box.val(17); break;
                case 'TrueHD': audiocodec_box.val(9); break;
                case 'DTS-HDMA': audiocodec_box.val(8); break;
                case 'DTS': audiocodec_box.val(3); break;
                case 'AC3':
                    audiocodec_box.val(11);
                    if (raw_info.name.match(/DD\+|DDP/i)) {
                        audiocodec_box.val(13);
                    }
                    break;
                case 'AAC': audiocodec_box.val(6); break;
                case 'LPCM': audiocodec_box.val(10); break;
                case 'MP3': audiocodec_box.val(4); break;
                case 'Flac': audiocodec_box.val(1); break;
                case 'APE': audiocodec_box.val(2); break;
                case 'WAV': audiocodec_box.val(15); break;
            }

            //分辨率
            var standard_box = $('select[name="standard_sel[4]"]');
            var standard_dict = {
                'SD': 4, '720p': 3,'1080i': 2, '1080p': 1, '4K': 5, '8K': 6
            }
            standard_box.val(6);
            if (standard_dict.hasOwnProperty(raw_info.standard_sel)){
                var index = standard_dict[raw_info.standard_sel];
                standard_box.val(index);
            }

            // 制作组
            $('select[name="team_sel[4]"]').val(22);
            check_team(raw_info, 'team_sel[4]');
        }

        else if (forward_site == 'GTK') {
            //类型
            var browsecat = $('#browsecat');
            var type_dict = {'电影': 401, '剧集': 402, '综艺': 403, '纪录': 404, '动漫': 405, 'MV': 406,
                             '体育': 407, '音乐': 411, '其他': 409};
            browsecat.val(409);
            if (type_dict.hasOwnProperty(raw_info.type)){
                var index = type_dict[raw_info.type];
                browsecat.val(index);
            }

            //媒介
            var medium_box = $('select[name="medium_sel"]');
            medium_box.val(9);
            switch(raw_info.medium_sel){
                case 'Blu-ray': medium_box.val(1); break;
                case 'UHD': medium_box.val(10); break;
                case 'DVD':
                    medium_box.val(6);
                    if (raw_info.name.match(/HD.?DVD/)) {
                        medium_box.val(2);
                    }
                    break;
                case 'Remux': medium_box.val(3); break;
                case 'HDTV': medium_box.val(5); break;
                case 'WEB-DL': medium_box.val(11); break;
                case 'Encode': medium_box.val(7); break;
                case 'CD': medium_box.val(8); break;
            }
            if (raw_info.name.match(/minibd/i)) {
                medium_box.val(4);
            }
            //视频编码
            var codec_box = $('select[name="codec_sel"]');
            codec_box.val(5);
            switch (raw_info.codec_sel){
                case 'H264': case 'X264': codec_box.val(1); break;
                case 'H265': case 'X265': codec_box.val(6); break;
                case 'VC-1': codec_box.val(2); break;
                case 'XVID': codec_box.val(3); break;
                case 'MPEG-2': case 'MPEG-4': codec_box.val(4); break;
            }

            // 制作组
            $('select[name="team_sel"]').val(5);
            check_team(raw_info, 'team_sel');

            //分辨率
            var standard_box = $('select[name="standard_sel"]');
            var standard_dict = {
                'SD': 4, '720p': 3,'1080i': 2, '1080p': 1, '4K': 5, '8K': 6
            }
            if (standard_dict.hasOwnProperty(raw_info.standard_sel)){
                var index = standard_dict[raw_info.standard_sel];
                standard_box.val(index);
            }
        }

        else if (forward_site == '象岛') {
            //类型
            var browsecat = $('#browsecat');
            var type_dict = {'电影': 401, '剧集': 402, '综艺': 403, '纪录': 404, '动漫': 405, 'MV': 406, '音乐': 409, '短剧': 415};
            browsecat.val(409);
            if (type_dict.hasOwnProperty(raw_info.type)){
                var index = type_dict[raw_info.type];
                browsecat.val(index);
            }
            //来源
            var source_box = $('select[name="source_sel[4]"]');
            source_box.val(37);
            switch(raw_info.source_sel){
                case '大陆': source_box.val(30); break;
                case '港台': case '香港': case '台湾': case '澳门':source_box.val(31); break;
                case '欧美': source_box.val(32); break;
                case '日本': source_box.val(34); break;
                case '韩国': source_box.val(33); break;
                case '印度': source_box.val(36); break;
                case '东南亚': case '新加坡': case '马来西亚': case '泰国': source_box.val(35); break;
            }
            //媒介
            var medium_box = $('select[name="medium_sel[4]"]');
            medium_box.val(16);
            switch(raw_info.medium_sel){
                case 'UHD':medium_box.val(8); break;
                case 'Blu-ray': medium_box.val(9); break;
                case 'Remux': medium_box.val(10); break
                case 'Encode': medium_box.val(11); break
                case 'WEB-DL': medium_box.val(17); break;
                case 'HDTV': medium_box.val(12); break;
                case 'DVD':
                    if (raw_info.name.match(/dvdrip/i)) {
                        medium_box.val(13);
                    } else {
                        medium_box.val(14);
                    }
                    break;
                case 'CD': medium_box.val(15); break;
            }

            //视频编码
            var codec_box = $('select[name="codec_sel[4]"]');
            codec_box.val(5);
            switch (raw_info.codec_sel){
                case 'H264': case 'X264': codec_box.val(1); break;
                case 'H265': case 'X265': codec_box.val(6); break;
                case 'MPEG-4': case 'MPEG-2': case 'XVID': codec_box.val(4); break;
                case 'VC-1': codec_box.val(2); break;
                case 'AV1': codec_box.val(10); break;
                case 'VP9': codec_box.val(8); break;
                case 'VP8': codec_box.val(9); break;
            }

            //音频编码
            var audiocodec_box = $('select[name="audiocodec_sel[4]"]');
            audiocodec_box.val(7);
            switch (raw_info.audiocodec_sel){
                case 'Atmos': audiocodec_box.val(13); break;
                case 'TrueHD': audiocodec_box.val(16); break;
                case 'DTS-HDMA:X 7.1': audiocodec_box.val(14); break;
                case 'DTS-HDMA': audiocodec_box.val(15); break;
                case 'DTS-HDHR': audiocodec_box.val(15); break;
                case 'DTS': audiocodec_box.val(3); break;
                case 'EAC3': case 'DDP': audiocodec_box.val(19); break;
                case 'AC3':
                    audiocodec_box.val(9);
                    if (raw_info.name.match(/DD.?[P\+]/)) {
                        audiocodec_box.val(19);
                    }
                    break;
                case 'AAC': audiocodec_box.val(6); break;
                case 'LPCM': audiocodec_box.val(18); break;
                case 'MP3': audiocodec_box.val(4); break;
                case 'Flac': audiocodec_box.val(1); break;
                case 'APE': audiocodec_box.val(2); break;
                case 'WAV': audiocodec_box.val(11); break;
            }

            //分辨率
            var standard_box = $('select[name="standard_sel[4]"]');
            var standard_dict = {
                '1080i': 2, '1080p': 1, '4K': 5, '8K': 6, '720p': '7', 'SD': '8'
            }
            if (standard_dict.hasOwnProperty(raw_info.standard_sel)){
                var index = standard_dict[raw_info.standard_sel];
                standard_box.val(index);
            }

            var processing_box = $('select[name="processing_sel[4]"]');
            if (labels.db) {
                processing_box.val(15);
            } else if (labels.hdr10 || labels.hdr10plus) {
                if (labels.hdr10) {
                    processing_box.val(17);
                }
                if (labels.hdr10plus) {
                    processing_box.val(16);
                }
            } else {
                processing_box.val(20);
                if ($('textarea[name="technical_info"]').val().match(/HLG/)) {
                    processing_box.val(19);
                } else if ($('textarea[name="technical_info"]').val().match(/SDR/)) {
                    processing_box.val(18);
                }
            }

            $('input[name="hr[4]"]:first').click();

            // 制作组
            $('select[name="team_sel[4]"]').val(5);
            check_team(raw_info, 'team_sel[4]');
        }


        else if (forward_site == 'AGSV') {
            //类型
            var browsecat = $('#browsecat');
            var specialcat = $('#specialcat');
            var type_dict = {'电影': 401, '剧集': 402, '综艺': 403, '纪录': 404, '动漫': 405, 'MV': 406,'体育': 407, '音乐': 411,
                '': 409, '学习': 417, '游戏': 413, '软件': 412, '书籍': 415 };
            browsecat.val(409);
            specialcat.attr("disabled",true);
            if (type_dict.hasOwnProperty(raw_info.type)){
                var index = type_dict[raw_info.type];
                if (index == 412 || index == 413 || index == 417 || index == 415) {
                    specialcat.attr("disabled",false);
                    browsecat.attr("disabled",true);
                    specialcat.val(index)
                } else {
                    specialcat.attr("disabled",true);
                    browsecat.val(index);
                }
            }
            //媒介
            var medium_box = $('select[name="medium_sel[4]"]');
            medium_box.val(13);
            switch(raw_info.medium_sel){
                case 'UHD':medium_box.val(11); break;
                case 'Blu-ray': medium_box.val(1); break;
                case 'Remux': medium_box.val(3); break;
                case 'Encode': medium_box.val(7); break;
                case 'WEB-DL': medium_box.val(10); break;
                case 'HDTV': medium_box.val(5); break;
                case 'DVD': medium_box.val(2); break;
                case 'CD': medium_box.val(8); break;
            }

            //视频编码
            var codec_box = $('select[name="codec_sel[4]"]');
            codec_box.val(5);
            switch (raw_info.codec_sel){
                case 'H264': case 'X264': codec_box.val(1); break;
                case 'H265': case 'X265': codec_box.val(6); break;
                case 'MPEG-2': case 'MPEG-4': codec_box.val(4); break;
                case 'VC-1': codec_box.val(2); break;
            }

            //音频编码
            var audiocodec_box = $('select[name="audiocodec_sel[4]"]');
            audiocodec_box.val(7);
            switch (raw_info.audiocodec_sel){
                case 'Flac': audiocodec_box.val(1); break;
                case 'MP3': audiocodec_box.val(4); break;
                case 'WAV': audiocodec_box.val(15); break;
                case 'DTS': audiocodec_box.val(3); break;
                case 'DTS-HDMA': case 'DTS-HDHR': audiocodec_box.val(8); break;
                case 'TrueHD': audiocodec_box.val(9); break;
                case 'LPCM':audiocodec_box.val(10); break;
                case 'AC3': audiocodec_box.val(11); break;
                case 'Atmos': audiocodec_box.val(17); break;
                case 'APE': audiocodec_box.val(2); break;
                case 'AAC': audiocodec_box.val(6); break;
            }
            if (raw_info.name.match(/DD[P\+]/i) || raw_info.descr.match(/E.AC3/)) {
                audiocodec_box.val(19);
            }
            //分辨率
            var standard_box = $('select[name="standard_sel[4]"]');
            var standard_dict = {
                '1080i': 1, '1080p': 1, '4K': 5, '8K': 6, '720p': 3, '': 4
            }
            if (standard_dict.hasOwnProperty(raw_info.standard_sel)){
                var index = standard_dict[raw_info.standard_sel];
                standard_box.val(index);
            }

            // 制作组
            $('select[name="team_sel[4]"]').val(22);
            check_team(raw_info, 'team_sel[4]');
        }

        else if (forward_site == 'ECUST') {
            var browsecat = $('#browsecat');
            var type_dict = {'电影': 401, '剧集': 402, '综艺': 403, '纪录': 404, '动漫': 405, 'MV': 406, 
                             '体育': 407, '音乐': 411, '其他': 409};
            browsecat.val(409);
            if (type_dict.hasOwnProperty(raw_info.type)){
                var index = type_dict[raw_info.type];
                browsecat.val(index);
            }
            disableother('browsecat','specialcat');

            var medium_box = $('select[name="medium_sel[4]"]');
            medium_box.val(9);
            switch(raw_info.medium_sel){
                case 'Blu-ray': case 'UHD': medium_box.val(1); break;
                case 'DVD':
                    medium_box.val(6);
                    if (raw_info.name.match(/HD.?DVD/)) {
                        medium_box.val(2);
                    }
                    break;
                case 'WEB-DL': medium_box.val(10); break;
                case 'Remux': medium_box.val(3); break;
                case 'HDTV': medium_box.val(5); break;
                case 'Encode': medium_box.val(7); break;
                case 'CD': medium_box.val(8); break;
            }
            if (raw_info.name.match(/minibd/i)) {
                medium_box.val(4);
            }
            var codec_box = $('select[name="codec_sel[4]"]');
            codec_box.val(5);
            switch (raw_info.codec_sel){
                case 'H264': case 'X264': codec_box.val(1); break;
                case 'H265': case 'X265': codec_box.val(6); break;
                case 'VC-1': codec_box.val(2); break;
                case 'XVID': codec_box.val(3); break;
                case 'MPEG-2': case 'MPEG-4': codec_box.val(4); break;
            }

            $('select[name="team_sel[4]"]').val(5);
            check_team(raw_info, 'team_sel[4]');

            var standard_box = $('select[name="standard_sel[4]"]');
            var standard_dict = {
                'SD': 4, '720p': 3,'1080i': 2, '1080p': 1, '4K': 5, '8K': 1
            }
            if (standard_dict.hasOwnProperty(raw_info.standard_sel)){
                var index = standard_dict[raw_info.standard_sel];
                standard_box.val(index);
            }
        }

        else if (forward_site == 'iloli'){
            var browsecat = $('#browsecat');
            var type_dict = {
                '电影': 401, '剧集': 402, '动漫': 405, '纪录': 404, '综艺': 402, '体育': 402, '音乐': 408, '软件': 413, '学习': 409, '游戏': 412 };
            if (type_dict.hasOwnProperty(raw_info.type)) {
                var index = type_dict[raw_info.type];
                browsecat.val(index);
            }
            var medium_box = $('select[name="medium_sel[4]"]');
            var medium_dict = { 'Blu-ray': 1, 'DVD': 2, 'UHD': 14, 'Remux': 3, 'HDTV': 5, 'WEB-DL': 12, 'Encode': 7, 'CD': 8 };
            medium_box.val(11);
            if (medium_dict.hasOwnProperty(raw_info.medium_sel)) {
                var index = medium_dict[raw_info.medium_sel];
                medium_box.val(index);
            }
            if (raw_info.name.match(/MiniBD/i)) {
                medium_box.val(4);
            } else if (raw_info.name.match(/DVDRip/i)) {
                medium_box.val(6);
            }

            var codec_box = $('select[name="codec_sel[4]"]');
            var codec_dict = { "H265": 8, 'X265': 8, 'H264': 9, 'X264': 9, 'VC-1': 12, 'MPEG-4': 13, 'MPEG-2': 13};
            codec_box.val(5);
            if (codec_dict.hasOwnProperty(raw_info.codec_sel)) {
                var index = codec_dict[raw_info.codec_sel];
                codec_box.val(index);
            }

            var audiocodec_box = $('select[name="audiocodec_sel[4]"]');
            var audiocodec_dict = {
                'DTS-HD': 3, 'DTS-HDMA:X 7.1': 23, 'DTS-HDMA': 10, 'TrueHD': 9, 'DTS-HDHR': 10,'MP3': 21, 'DTS': 3, 'AC3': 13, 'AAC': 6, 'Flac': 1, 'LPCM': 15
            };
            audiocodec_box.val(14);
            if (audiocodec_dict.hasOwnProperty(raw_info.audiocodec_sel)) {
                var index = audiocodec_dict[raw_info.audiocodec_sel];
                audiocodec_box.val(index);
                if(index==13 && raw_info.name.match(/DD[p\+]/i)) {
                    audiocodec_box.val(20);
                }
            }
            var info_plus = raw_info.name + $('textarea[name="technical_info"]').val() + raw_info.descr;
            if(raw_info.audiocodec_sel=='Atmos' && info_plus.match(/True.?HD/i)) {
                audiocodec_box.val(9);
            }

            var standard_box = $('select[name="standard_sel[4]"]');
            var standard_dict = { '4K': 5, '1080p': 1, '1080i': 2, '720p': 3, 'SD':4 };
            standard_box.val(4);
            if (standard_dict.hasOwnProperty(raw_info.standard_sel)) {
                var index = standard_dict[raw_info.standard_sel];
                standard_box.val(index);
            }
            
            //制作组
            $('select[name="team_sel[4]"]').val(5);
            check_team(raw_info, 'team_sel[4]');
        }

    } else if (judge_if_the_site_as_source() == 2) { //HDCity
        if (GM_getValue('hdcity_info') !== undefined) {
            raw_info = JSON.parse(GM_getValue('hdcity_info'));
            raw_info = fill_raw_info(raw_info, 'HDcity');
            raw_info.descr = raw_info.descr.replace(/ /g, ' ');
            raw_info.full_mediainfo = raw_info.full_mediainfo.replace(/ /g, ' ');
        } else {
            return;
        }
        if (location.href == 'https://hdcity.city/upload') {
            document.getElementById('qr').disabled = false;
            addTorrent(raw_info.torrent_url, raw_info.torrent_name, 'HDCity', null);
            $("#name").val(raw_info.name);
        } else {
            setTimeout(function(){
                var unSelected = "#999";
                var selected = "#333";
                $("select").css("color", unSelected);
                $("option").css("color", selected);
                $("select").change(function () {
                    var selItem = $(this).val();
                    if (selItem == $(this).find('option:first').val()) {
                        $(this).css("color", unSelected);
                    } else {
                        $(this).css("color", selected);
                    }
                });

                $('#bigname').css({'width': '650px'});
                $('#bigname').val(raw_info.name);
                document.getElementsByName('small_descr')[0].value = raw_info.small_descr;
                document.getElementsByName('url')[0].value = raw_info.url;
                if (raw_info.descr.match(/\[img\](\S*?)\[\/img\]/i)){
                    document.getElementsByName('posterimg')[0].value = raw_info.descr.match(/\[img\](\S*?)\[\/img\]/i)[1];
                }


                try{
                    var info = get_mediainfo_picture_from_descr(raw_info.descr);
                    var cmctinfos = info.mediainfo;
                    $('#mediainfo').val(cmctinfos);
                    var tmp_descr = raw_info.descr.replace(infos.mediainfo, '');
                    tmp_descr = tmp_descr.replace(/\[(b|color|size|font).*?\][\s\S]{0,30}\[\/(b|color|size|font)\]/g, '');
                    tmp_descr = tmp_descr.replace(/\[quote\][\s\S]{0,10}\[\/quote\]/g, '');
                    raw_info.descr = tmp_descr;
                    $('#descr').val(raw_info.descr.trim().replace(/\n{2,15}/g, '\n\n').replace(/\]\n\n\[/g, '\]\n\['));
                } catch(err) {
                    console.log(err)
                    $('#descr').val(raw_info.descr);
                }

                var browsecat = document.getElementById('browsecat');
                var type_dict = {'电影': 1, '剧集': 2, '动漫': 4, '综艺': 5, '音乐': 8, '纪录': 3, 'MV': 6,
                                 '体育': 7, '软件': 11, '学习': 10, '': 12};
                if (type_dict.hasOwnProperty(raw_info.type)){
                    var index = type_dict[raw_info.type];
                    browsecat.options[index].selected = true;
                }

                var medium_box = document.getElementsByName('medium_sel')[0];
                medium_box.options[12].selected = true;
                switch(raw_info.medium_sel){
                    case 'UHD': case 'Blu-ray':
                        medium_box.options[1].selected = true; break;
                    case 'DVD': medium_box.options[2].selected = true; break;
                    case 'Remux': medium_box.options[3].selected = true; break;
                    case 'HDTV': medium_box.options[6].selected = true; break;
                    case 'WEB-DL': medium_box.options[6].selected = true; break;
                    case 'Encode': medium_box.options[4].selected = true; break;
                }

                var codec_box = document.getElementsByName('codec_sel')[0];
                var audiocodec_dict = {'Flac': 7, 'APE': 8, 'DTS': 9, 'AC3': 10, 'WAV': 12, 'MP3': 13,
                                       'AAC': 14, 'TrueHD': 11};
                if (audiocodec_dict.hasOwnProperty(raw_info.audiocodec_sel)){
                    var index_ = audiocodec_dict[raw_info.audiocodec_sel];
                    codec_box.options[index_].selected = true;
                }

                switch (raw_info.codec_sel){
                    case 'H264': case 'X264':
                        codec_box.options[1].selected = true; break;
                    case 'VC-1':
                        codec_box.options[5].selected = true; break;
                    case 'XVID':
                        codec_box.options[4].selected = true; break;
                    case 'MPEG-2':
                        codec_box.options[3].selected = true; break;
                    case 'MPEG-4':
                        codec_box.options[3].selected = true; break;
                    case 'H265': case 'X265':
                        codec_box.options[2].selected = true;
                }

                var standard_box = document.getElementsByName('standard_sel')[0];
                var standard_dict = {'4K': 3, '1080p': 5, '1080i': 6, '720p': 7, 'SD': 11, '': 0};
                if (standard_dict.hasOwnProperty(raw_info.standard_sel)){
                    var index_1 = standard_dict[raw_info.standard_sel];
                    standard_box.options[index_1].selected = true;
                }
                if (if_uplver) {
                    document.getElementsByName('uplver')[0].checked = true;
                }
                GM_deleteValue('hdcity_info');
            }, 2000);
        }
    } else if (judge_if_the_site_as_source() == 4) { //KG

        var title = $(document).attr("title");

        if (GM_getValue('kg_info') !== undefined) {
            raw_info = JSON.parse(GM_getValue('kg_info'));
            raw_info = fill_raw_info(raw_info, 'KG');
            raw_info.descr = raw_info.descr.replace(/ /g, ' ');
            raw_info.full_mediainfo = raw_info.full_mediainfo.replace(/ /g, ' ');
        } else {
            return;
        }

        var page = parseInt(title.split(' ').pop());
        if (page == 1) {
            $('input[name=title]').val(raw_info.url);
        } else if (page == 2) {
            var descr = kg_intro_base_content;
            async function formatDescr() {
                raw_info.url = $('input[name=link]').val();
                const aka = await getAKAtitle(raw_info.url);
                if (aka) {
                    $('input[name=title]').val(aka);
                }
                if (raw_info.descr.match(/Audio[\s\S]*commentary/i)) {
                    $('input[name=title]').val( $('input[name=title]').val() + ' [+commentary]');
                }
                var doc = await getimdbpage(raw_info.url);
                var country = Array.from($('li.ipc-metadata-list__item:contains("Countr")', doc).find('a')).map(function(e){
                    return $(e).text();
                });
                var country_selected = false;
                country.map(function(e){
                    if (e == 'United States') e = 'USA';
                    if (e == 'United Kingdom') e = 'UK';
                    if ($('select[name="country_id"]').find(`option:contains(${e.trim()})`).length) {
                        if (!country_selected){
                            country_selected = true;
                            $('select[name="country_id"]').find(`option:contains(${e.trim()})`).attr('selected', true);
                        }
                    }
                });
                var poster_url = 'https://www.imdb.com/' + $('a[href*=tt_ov_i]', doc).first().attr('href');
                if ($('a[href*=tt_ov_i]', doc).length == 0) {
                    poster_url = 'https://www.imdb.com/' + $('div[class*=ipc-poster] > div > a', doc).last().attr('href');
                }

                var poster = await getPoster(poster_url);
                descr = descr.format({'poster': poster});
                descr = descr.format({'title': $('h1:eq(0)', doc).text().trim()});
                descr = descr.format({'genres': Array.from($('div[data-testid*=genres]', doc).find('a')).map(function(e){
                    return $(e).text();
                }).join(', ').replace(/, Read all/g, '')});
                descr = descr.format({'date': $('li.ipc-metadata-list__item:contains("Release date")', doc).find('div').find('li').text()});
                descr = descr.format({'score': $('div[data-testid*=aggregate-rating__score]:eq(0)', doc).text()});
                descr = descr.format({'imdb_url': raw_info.url});
                var director = Array.from($('li.ipc-metadata-list__item:contains("Director"):eq(0)', doc).find('a')).map(function(e){
                    return $(e).text();
                }).join(', ');
                descr = descr.format({'director': director});

                var creators = await getFullCredits(raw_info.url);
                descr = descr.format({'creator': creators});

                var actors = Array.from($('div.title-cast__grid', doc).find('a[data-testid="title-cast-item__actor"]:lt(8)')).map(function(e){
                    return $(e).text();
                }).join(', ');
                descr = descr.format({'cast': actors});
                var imdb_descr = $('span[data-testid="plot-xs_to_m"]:eq(0)', doc).text().trim();
                if (imdb_descr.match(/Read all/)){
                    var full_descr_url = 'https://www.imdb.com/title/' + raw_info.url.match(/tt\d+/)[0] + '/' + $('span[data-testid="plot-xs_to_m"]:eq(0)', doc).find('a').attr('href');
                    imdb_descr = await getFullDescr(full_descr_url);
                } else if (imdb_descr.match(/Add a Plot/)) {
                    imdb_descr =  `No data from IMDB: ${raw_info.url}`;
                }
                descr = descr.format({'en_descr': imdb_descr});

                try{
                    var infos = get_mediainfo_picture_from_descr(raw_info.descr);
                    get_full_size_picture_urls(null, infos.pic_info, $('#nowhere'), true, function(data) {
                        descr = descr.format({'screenshots': data.trim()});
                    })
                } catch (err) {}
                $('textarea[name=descr]').val(descr);
                var language = Array.from($('li[data-testid="title-details-languages"]', doc).find('ul').find('a')).map(function(e){
                    return $(e).text();
                }).join(', ');
                $('input[name=lang]').val(language);

                var genre = Array.from($('div[data-testid*=genres]', doc).find('a')).map(function(e){
                    return $(e).text().trim();
                });
                var filled = {
                    'main': -1,
                    'sub': -1
                }
                for (i=0; i < genre.length; i++) {
                    if (filled.main == -1 && $('select[name="genre_main_id"]').find(`option:contains(${genre[i]})`).length) {
                        $('select[name="genre_main_id"]').find(`option:contains(${genre[i]})`).attr('selected', true);
                        filled.main = i;
                        continue;
                    } else if ($('select[name="subgenre"]').find(`option:contains(${genre[i]})`).length) {
                        $('select[name="subgenre"]').find(`option:contains(${genre[i]})`).attr('selected', true);
                        filled.sub = i;
                        break;
                    }
                }
            }
            formatDescr();

            $('input[value="Preview"]').after(`<input type="button" value="Upload-Picture" onclick="window.open('https://iup.crowing.me/', target='_blank')">`);

            $('input[name="subs"]').val('None');

            $('b:contains(Rip Specs)').last().after(`<input type="button" value="Search-Dvdcompare" onclick="window.open('http://www.dvdcompare.net/comparisons/search.php?param=${$('input[name=title]').val()}', target='_blank')">`)

            switch(raw_info.medium_sel){
                case 'UHD': case 'Blu-ray': case 'Encode': case 'Remux': $('select[name=source]').val('Blu-ray'); break;
                case 'HDTV': $('select[name=source]').val('HDTV'); break;
                case 'WEB-DL': $('select[name=source]').val('WEB'); break;
                case 'DVD': $('select[name=source]').val('DVD'); break;
                case 'TV': $('select[name=source]').val('TV'); break;
            }
            if (raw_info.name.match(/hd-dvd/i)) {
                $('select[name=source]').val('HD-DVD');
            }
            var standard_dict = {
                'SD': '0', '720p': '1', '1080i': '2', '1080p': '2', '4K': '2160p', '': '0'
            };
            if  (standard_dict.hasOwnProperty(raw_info.standard_sel)){
                $('select[name=hdrip]').val(standard_dict[raw_info.standard_sel]);
            }

            if (raw_info.medium_sel == 'Blu-ray' || raw_info.medium_sel == 'UHD') {
                $('select[name=hdrip]').val('3');
                var bluray_info = kg_bluray_base_content;
                var summary = full_bdinfo2summary(raw_info.descr);

                var size = get_size_from_descr(raw_info.descr + summary);
                if (0 < size && size <= 23.28) {
                    bluray_info = bluray_info.format({'size': 'BD25'});
                } else {
                    bluray_info = bluray_info.format({'size': 'BD50'});
                }
                if (raw_info.audiocodec_sel) {
                    bluray_info = bluray_info.format({'audio': raw_info.audiocodec_sel});
                }

                if (raw_info.name.match(/(7\.1|5\.1|2\.0|1\.0)/i)) {
                    bluray_info = bluray_info.format({'channels': raw_info.name.match(/(7\.1|5\.1|2\.0|1\.0)/i)[1]});
                }

                if (raw_info.descr.match(/DISC INFO[\s\S]*PLAYLIST[\s\S]{3,90}?Length:(.*)/i)) {
                    bluray_info = bluray_info.format({'runtime': raw_info.descr.match(/DISC INFO[\s\S]*PLAYLIST[\s\S]{3,90}?Length:(.*)/i)[1].trim()});
                } else if (summary.match(/Length:.*(\d+:\d+:\d+)/)){
                    bluray_info = bluray_info.format({'runtime': summary.match(/Length:.*(\d+:\d+:\d+)/)[1]});
                }

                $('#ripspecs').val( bluray_info + '\n\n' + summary );
                var subtitles_info = [];
                if (summary.match(/subtitles?:.*?(Chinese|Danish|German|English|Spanish|French|Italian|Dutch|Norwegian|Finnish|Swedish|Japanese|Korean).*/i)) {
                    var subtitles = summary.match(/subtitles?:.*?(Chinese|Danish|German|English|Spanish|French|Italian|Dutch|Norwegian|Finnish|Swedish|Japanese|Korean).*/ig);
                    subtitles.map(function(e){
                        console.log(e)
                        try {
                            var title = (e.split(':')[1].trim().split('/')[0].trim());
                            if (subtitles_info.indexOf(title) < 0) {
                                subtitles_info.push(title);
                            }
                        } catch(err) {}
                    });
                }
                if (subtitles_info.length) {
                    $('input[name="subs"]').val(subtitles_info.join(', '));
                }

            } else if (raw_info.medium_sel == 'DVD') {
                var dvd_info = kg_dvd_base_content;
                $('input[name=dvdr]').attr('checked', true);
                $('#ripspecs').val( $('#ripspecs').val());
                if ((raw_info.descr + raw_info.name).match(/dvd5/i)) {
                    dvd_info = dvd_info.format({'size': 'DVD5'});
                } else if ((raw_info.descr + raw_info.name).match(/dvd9/i)) {
                    dvd_info = dvd_info.format({'size': 'DVD9'});
                }
                if ((raw_info.descr + raw_info.name).match(/PAL/i)) {
                    dvd_info = dvd_info.format({'source': 'PAL'});
                } else if ((raw_info.descr + raw_info.name).match(/NTSC/i)) {
                    dvd_info = dvd_info.format({'source': 'NTSC'});
                }
                if (raw_info.audiocodec_sel) {
                    dvd_info = dvd_info.format({'audio': raw_info.audiocodec_sel});
                }
                if (raw_info.descr.match(/Channel[\s\S]*?(8|6|2).*?channels/i)) {
                    var number = raw_info.descr.match(/Channel[\s\S]*?(2|6|8).*?channels/i)[1];
                    if (number == '2') {
                        dvd_info = dvd_info.format({'channels': '2.0'});
                    } else if (number == '6') {
                        dvd_info = dvd_info.format({'channels': '5.1'});
                    } else if (number == '8') {
                        dvd_info = dvd_info.format({'channels': '7.1'});
                    }

                }
                if (raw_info.descr.match(/.IFO[\s\S]*?Duration.*?:(.*)/)) {
                    dvd_info = dvd_info.format({'runtime': raw_info.descr.match(/.IFO[\s\S]*?Duration.*?:(.*)/)[1].trim()});
                }
                $('#ripspecs').val(dvd_info);
            } else {
                try {
                    var info = get_mediainfo_picture_from_descr(raw_info.descr);
                    $('#ripspecs').val(info.mediainfo);
                } catch (err) {
                    $('#ripspecs').val(raw_info.descr);
                }
                var subtitles = raw_info.descr.match(/Text(.*#\d+)?\nid[\s\S]*/i);
                var subtitles_info = [];
                if (subtitles) {
                    subtitles = subtitles[0].split(/text/i).map(function(e) {
                        if (e.match(/Language.*?:(.*)/i)) {
                            if (subtitles_info.indexOf(e.match(/Language.*?:(.*)/i)[1].trim())  < 0 ) {
                                subtitles_info.push(e.match(/Language.*?:(.*)/i)[1].trim());
                            }
                        }
                    });
                }
                if (subtitles_info.length) {
                    $('input[name="subs"]').val(subtitles_info.join(', '));
                }
            }
        } else if (page == 3) {
            try {
                var announce = $('input[value*="announce"]').val();
                addTorrent(raw_info.torrent_url, raw_info.torrent_name, 'KG', announce);
                GM_deleteValue('kg_info');
            } catch(err) {}
        }
    } else if (judge_if_the_site_as_source() == 5) { //btn
        $('#dnu_header').parent().hide();
        if (GM_getValue('btn_info') !== undefined) {
            raw_info = JSON.parse(GM_getValue('btn_info'));
            raw_info = fill_raw_info(raw_info, 'BTN');
            if (raw_info.name.match(/S\d+ E\d+/)) {
                raw_info.name = raw_info.name.replace(/(S\d+) (E\d+)/, '$1$2');
            }
            var search_name = get_search_name(raw_info.name);
            if (raw_info.name.match(/complete/i) && !raw_info.name.match(/S\d+/i)) {
                raw_info.name = raw_info.name.replace(/complete/i, 'S01');
            } else if (raw_info.name.match(/complete/i) && raw_info.name.match(/S\d+/i)) {
                raw_info.name = raw_info.name.replace(/complete/i, '');
            }
            raw_info.name = raw_info.name.replace(/ +/g, ' ');
            if ($('#table_manual_upload_2').css('display') == 'table') {
                GM_deleteValue('btn_info');
                try{
                    var announce = $('input[value*="announce"]').val();
                    addTorrent(raw_info.torrent_url, raw_info.torrent_name, 'BTN', announce);
                    $('#file').on('change', function(){
                        if ($('#show_info').length) {
                            $('#show_info').html('<font color="yellow">Self-Torrent Re-Loaded！！！！</font>')
                        } else {
                            $(this).after(`<div id='show_info' style="display:inline-block; margin-left:5px"><font color="yellow">Torrent Loaded！！！！</font></div>`);
                        }
                    });
                } catch(err) {}
                $('#content').find('table').first().hide();
                $('td.label:contains(Release Name)').last().parent().before($(`<tr><td class="label">Links</td>
                    <td><input type="text" id="imdbid" name="imdbid" size="60" />
                    <input id="fill" type="button" value="辅助发布">
                    </td></tr>`));
                if (raw_info.url) {
                    $('#imdbid').val(raw_info.url);
                } else if (raw_info.tmdb_url !== undefined) {
                    $('#imdbid').val(raw_info.tmdb_url);
                } else if (raw_info.tvdb_url !== undefined) {
                    $('#imdbid').val(raw_info.tvdb_url);
                }
                $('#scenename').val(raw_info.name);
                $('#scenename').after(`<div id='remind_scenename' style="display:inline-block; margin-left:5px"><font color="red">请点击辅助发布后检查！！</font></div>`);
                if (!$('#tags').val()) {
                    $('#tags').after(`<div id='remind_tags' style="display:inline-block; margin-left:5px"><font color="red">请选择对应的标签！！</font></div>`);
                }
                if (raw_info.descr.match(/\[quote\]/)){
                    raw_info.descr = raw_info.descr.slice(raw_info.descr.match(/\[quote\]/).index);
                }
                try {
                    var info = get_mediainfo_picture_from_descr(raw_info.descr);
                    var mediainfo = info.mediainfo;//图片
                } catch (err) {
                    mediainfo = '';
                }
                if (!mediainfo) {
                    mediainfo = raw_info.descr.replace(/\[\/?(quote|code)\]/g, '').trim();
                }
                if (raw_info.full_mediainfo) {
                    mediainfo = raw_info.full_mediainfo;
                }
                $('#release_desc').val(mediainfo.replace(/\[\/?(quote|code)\]/g, '').trim());
                if (!mediainfo.match(/Video[\s\S]{0,10}?ID/)) {
                    $('#fill').after(`<div id='remind_desc'><font color='red'>请先将mediainfo补充完整后点击辅助发布！！</font></div>`)
                }
                setTimeout(function() {
                    $('#fill').click(function(){
                        $('#remind_scenename').find('font').css('color', 'yellow').text('已经点击辅助发布，请检查！！');
                        var name = $('#scenename').val().trim();
                        var tv_title = $('#title').val();
                        if (name.match(/S\d+E\d+-E?\d+/)) {
                            name = name.replace(name.match(/S\d+E\d+-E?\d+/)[0], tv_title);
                        } else if (name.match(/E\d+-E?\d+/)) {
                            name = name.replace(name.match(/E\d+-E?\d+/)[0], tv_title);
                        } else if (!name.match(/S\d+/) && !tv_title.match(/Season/)) {
                            name = name.replace(search_name, `${search_name} ${tv_title} `).replace(/ +/g, ' ');
                        } else if (!name.match(/S\d+/i) && tv_title.match(/Season/)) {
                            var season = tv_title.match(/\d+/)[0];
                            if (season.length < 2) {
                                name = name.replace(search_name, `${search_name} S0${season} `).replace(/ +/g, ' ');
                            } else {
                                name = name.replace(search_name, `${search_name} S${season} `).replace(/ +/g, ' ');
                            }
                        } else if (name.match(/S\d+/) && !tv_title.match(/Season/)) {
                            name = name.replace(/S\d+(E\d+)?/, `${tv_title}`).replace(/ +/g, ' ');
                        }
                        var title = $('#title').val().trim();
                        if (title == name.replace(/ /g, '.')) {
                            if (name.match(/E\d+/i) && !name.match(/S\d+E\d+/i)) {
                                name = name.replace(/(E\d+)/, 'S01$1');
                                $('#title').val('S01' + title.match(/E\d+/)[0])
                            }
                        }
                        var tv_series = $('#artist').val();
                        if (!tv_series.match(/(19|20)\d{2}/) && name.match(/[^S](19|20)\d{2}[^pP]/i)) {
                            name = name.replace(/([^S])(19|20)\d{2}/i, '$1').replace(/ +/g, ' ');
                        }
                        if (tv_series.match(/(19|20)\d{2}/) && !name.match(/(19|20)\d{2}[^pP]/)) {
                            name = name.replace(search_name, tv_series.replace(/\(|\)/g, ' ') + ' ').replace(/ +/g, ' ');
                        } else if (tv_series.match(/\(.*\)/)) {
                            var country = tv_series.match(/\((.*)\)/)[1];
                            if (!name.match(country)) {
                                name = name.replace(search_name, tv_series.replace(/\(|\)/g, ' ') + ' ').replace(/ +/g, ' ');
                            }
                        } else {
                            name = name.replace(search_name, tv_series.replace(/\(|\)/g, ' ') + ' ').replace(/ +/g, ' ');
                        }
                        name = name.replace(/4k/i, '2160p');
                        function re_build_name(channels, name) {
                            var label = null;
                            var label_str = '';
                            if (channels == '1') {
                                label = /1\.0/;
                                label_str = '1.0';
                            } else if (channels == '2') {
                                label = /2\.0/;
                                label_str = '2.0';
                            } else if (channels == '6') {
                                label = /5\.1/;
                                label_str = '5.1';
                            } else if (channels == '8') {
                                label = /7\.1/;
                                label_str = '7.1';
                            }
                            if (!name.match(label)) {
                                name = name.replace(/(DDPA|AAC|DDP|FLAC|DTS|LPCM|TrueHD)/, `$1${label_str}`);
                            }
                            if (name.match(/(H.265|H.264|x264|x265)(.*?)(DDPA|AAC|DDP|FLAC|DTS|LPCM|TrueHD)(2\.0|1\.0|5\.1|7\.1)/i)) {
                                name = name.replace(/(H.265|H.264|x264|x265)(.*?)(DDPA|AAC|DDP|FLAC|DTS|LPCM|TrueHD)(2\.0|1\.0|5\.1|7\.1)/, '$3 $4 $1 $2');
                            }
                            return name;
                        }
                        try{
                            var channels = (raw_info.descr + $('#release_desc').val()).match(/Channel.*?(\d)/)[1];
                            name = re_build_name(channels, name);
                        } catch(err) {
                            if (raw_info.descr.match(/(AUDIO.*CODEC.*?|音频编码.*?)(2\.0|1\.0|5\.1|7\.1)/i)) {
                                channels = raw_info.descr.match(/(AUDIO.*CODEC.*?|音频编码.*?)(2\.0|1\.0|5\.1|7\.1)/i)[2];
                                if (!name.includes(channels)) {
                                    name = name.replace(/(DDPA|AAC|DDP|FLAC|DTS|LPCM|TrueHD)/, `$1${channels}`);
                                }
                                if (name.match(/(H.265|H.264|x264|x265)(.*?)(DDPA|AAC|DDP|FLAC|DTS|LPCM|TrueHD)(2\.0|1\.0|5\.1|7\.1)/i)) {
                                    name = name.replace(/(H.265|H.264|x264|x265)(.*?)(DDPA|AAC|DDP|FLAC|DTS|LPCM|TrueHD)(2\.0|1\.0|5\.1|7\.1)/i, '$3 $4 $1 $2');
                                }
                            } else if (raw_info.descr.match(/\d channels/i)) {
                                channels = raw_info.descr.match(/(\d) channels/i)[1];
                                name = re_build_name(channels, name);
                            }
                        }
                        if (name.match(/(WEB-DL|Bluray|HDTV).(1080p|4K|2160p|720p|480p)/i)) {
                            name = name.replace(/(WEB-DL|Bluray|HDTV).(1080p|4K|2160p|720p|480p)/i, '$2 $1');
                        }
                        name = name.replace(/'|’/g, '').replace(/ +/g, ' ').replace(' -', '-');
                        $('#scenename').val(name.replace(/ /g, '.').replace(/(,|!|\?|'|;|\\|:)\./g, function(data){ return data[1] }));
                        $('#origin').val('P2P');

                        var info = $('#album_desc').val();
                        if (!info.match(/Season/)) {
                            info = `[b]Episode Name: [/b]\n[b]Season: {s} [/b]\n[b]Episode: {e} [/b]\n[b]Aired: [/b]\n\n[b]Episode Overview: [/b]`;
                            try {
                                info = info.format({'s': parseInt(name.match(/S(\d+)/)[1])});
                                info = info.format({'e': parseInt(name.match(/E(\d+)/)[1])});
                                $('#album_desc').val(info);
                            } catch (err) {
                                console.log(err)
                            }
                        }

                        var codec = name.codec_sel();
                        if (codec == 'H264' || codec == 'X264') {
                            $('#bitrate').val('H.264');
                        } else if (codec == 'H265' || codec == 'X265') {
                            $('#bitrate').val('H.265');
                        }
                        var medium = name.medium_sel();
                        if (medium == 'HDTV') {
                            $('#media').val('HDTV');
                        } else if (medium == 'WEB-DL') {
                            $('#media').val('WEB-DL');
                        } else if (medium == 'Blu-ray') {
                            $('#media').val('Bluray');
                        }
                        var standard = name.standard_sel();
                        if (standard == '720p') {
                            $('#resolution').val('720p');
                        } else if (standard == '1080p') {
                            $('#resolution').val('1080p');
                        } else if (standard == '1080i') {
                            $('#resolution').val('1080i');
                        } else if (standard == '4K') {
                            $('#resolution').val('2160p');
                        }

                        var mediainfo = $('#release_desc').val();
                        if (mediainfo.match(/\.mp4/)) {
                            $('#format').val('MP4');
                        } else if (mediainfo.match(/\.mkv/)) {
                            $('#format').val('MKV');
                        } else if (mediainfo.match(/\.MPLS/)) {
                            $('#format').val('M2TS');
                        }
                        $('#international_box').attr('checked', true);
                        var url = $('#imdbid').val();
                        if (url.match(/tt\d+/)) {
                            var imdb_url = 'https://www.imdb.com/title/' + url.match(/tt\d+/)[0];
                            getDoc(imdb_url, null, function(doc) {
                                var country = Array.from($('li.ipc-metadata-list__item:contains("Countr")', doc).find('a')).map(function(e){
                                    return $(e).text();
                                });
                                var country_selected = false;
                                country.map(function(e){
                                    if (e == "UK") { e = 'United Kingdom'} else if (e == 'USA') { e = 'United States of America'}
                                    if ($('#country').find(`option:contains(${e.trim()})`).length) {
                                        if (!country_selected){
                                            country_selected = true;
                                            $('#country').find(`option:contains(${e.trim()})`).attr('selected', true);
                                            $('#country')[0].dispatchEvent(evt);
                                        }
                                    }
                                });
                                var language = $('li[data-testid="title-details-languages"]', doc).find('a').text().trim();
                                if (language == 'English') {
                                    $('#international_box').attr('checked', false);
                                }
                            })
                        } else if (url.match(/themoviedb/)) {
                            var tv_id = url.match(/tv\/(\d+)/)[1];
                            var search_url = `https://api.themoviedb.org/3/tv/${tv_id}?api_key=${used_tmdb_key}&language=en-US`;
                            getJson(search_url, null, function(data){
                                console.log(data)
                                var country = data.origin_country[0];
                                var country_dict = {
                                    "AD": "Andorra",
                                    "AF": "Afghanistan",
                                    "AG": "Antigua Barbuda",
                                    "AL": "Albania",
                                    "AO": "Angola",
                                    "AR": "Argentina",
                                    "AT": "Austria",
                                    "AU": "Australia",
                                    "BB": "Barbados",
                                    "BD": "Bangladesh",
                                    "BE": "Belgium",
                                    "BF": "Burkina Faso",
                                    "BG": "Bulgaria",
                                    "BN": "Brunei",
                                    "BR": "Brazil",
                                    "BS": "Bahamas",
                                    "BZ": "Belize",
                                    "CA": "Canada",
                                    "CG": "Congo",
                                    "CH": "Switzerland",
                                    "CL": "Chile",
                                    "CN": "China",
                                    "CO": "Colombia",
                                    "CR": "Costa Rica",
                                    "CS": "Czech",
                                    "CU": "Cuba",
                                    "CY": "Cyprus",
                                    "CZ": "Czech Republic ",
                                    "DE": "Germany ",
                                    "DK": "Denmark",
                                    "DZ": "Algeria",
                                    "EC": "Ecuador",
                                    "EE": "Estonia",
                                    "EG": "Egypt",
                                    "ES": "Spain",
                                    "FI": "Finland",
                                    "FJ": "Fiji",
                                    "FR": "France",
                                    "GB": "United Kiongdom",
                                    "GR": "Greece",
                                    "GT": "Guatemala",
                                    "HK": "Hongkong",
                                    "HN": "Honduras",
                                    "HU": "Hungary",
                                    "ID": "Indonesia",
                                    "IE": "Ireland",
                                    "IL": "Israel",
                                    "IN": "India",
                                    "IR": "Iran",
                                    "IS": "Iceland",
                                    "IT": "Italy",
                                    "JM": "Jamaica",
                                    "JP": "Japan",
                                    "KG": "Kyrgyzstan",
                                    "KH": "Cambodia",
                                    "KP": "North Korea",
                                    "KR": "South Korea",
                                    "KW": "Kuwait",
                                    "LA": "Laos",
                                    "LB": "Lebanon",
                                    "LK": "Sri Lanka",
                                    "LT": "Lithuania",
                                    "LU": "Luxembourg",
                                    "LV": "Latvia",
                                    "MX": "Mexico",
                                    "MY": "Malaysia",
                                    "NG": "Nigeria",
                                    "NL": "Netherlands",
                                    "NO": "Norway",
                                    "NR": "Nauru",
                                    "NZ": "New Zealand",
                                    "PE": "Peru",
                                    "PH": "Philippines",
                                    "PK": "Pakistan",
                                    "PL": "Poland",
                                    "PR": "Puerto Rico",
                                    "PT": "Portugal",
                                    "PY": "Paraguay",
                                    "QA": "Qatar",
                                    "RO": "Romania",
                                    "RU": "Russia",
                                    "SA": "Saudi Arabia",
                                    "SC": "Seychelles",
                                    "SE": "Sweden",
                                    "SG": "Singapore",
                                    "SI": "Slovenia",
                                    "SK": "Slovakia",
                                    "SN": "Senegal",
                                    "TG": "Togo",
                                    "TH": "Thailand",
                                    "TM": "Turkmenistan ",
                                    "TR": "Turkey",
                                    "TT": "Trinidad and Tobago",
                                    "TW": "Taiwan",
                                    "UA": "Ukraine",
                                    "US": "United States of America",
                                    "UY": "Uruguay",
                                    "UZ": "Uzbekistan",
                                    "VE": "Venezuela",
                                    "VN": "Vietnam",
                                    "WS": "Western Samoa",
                                    "YU": "Yugoslavia",
                                    "ZA": "South Africa"
                                }
                                if (country_dict.hasOwnProperty(country)) {
                                    country = country_dict[country];
                                }
                                if ($('#country').find(`option:contains(${country.trim()})`).length) {
                                    $('#country').find(`option:contains(${country.trim()})`).attr('selected', true);
                                    $('#country')[0].dispatchEvent(evt);
                                }
                                var language = data.original_language;
                                if (language == 'en') {
                                    $('#international_box').attr('checked', false);
                                }
                            });
                        } else if (url.match(/thetvdb/)) {
                            getDoc(url, null, function(doc){
                                var country = $('strong:contains(Original Country)', doc).next().text();
                                if ($('#country').find(`option:contains(${country.trim()})`).length) {
                                    $('#country').find(`option:contains(${country.trim()})`).attr('selected', true);
                                    $('#country')[0].dispatchEvent(evt);
                                }
                                var language = $('strong:contains(Original Language)', doc).next().text();
                                if (language == 'English') {
                                    $('#international_box').attr('checked', false);
                                }
                            });
                        } else {
                            alert('没有相关链接，请自行填写剧集国名。');
                        }
                    });
                    $('#country').after(`<div id="common_country" style="display:inline-block;margin-left:5px">
                            <a class="s_country" href="#" id="China">China</a> |
                            <a class="s_country" href="#" id="Hong Kong">Hong Kong</a> |
                            <a class="s_country" href="#" id="South Korea">South Korea</a>
                            <div style="display:inline-block;margin-left:5px" id="country_selected"><font color="red">请选择剧集对应的国家！！</font></div>
                        </div>`);
                    $('a.s_country').click((e)=>{
                        e.preventDefault();
                        var country = e.target.id;
                        $(`#country`).find(`option:contains(${country})`).attr('selected', true);
                        $(`#country`)[0].dispatchEvent(evt);
                        $('#country_selected').css('color', 'yellow').text('已经选择对应的国家！！');
                    });
                    $('#country').on('change', function(){
                        if (this.value != '---') {
                            $('#country_selected').css('color', 'yellow').text('已经选择对应的国家！！');
                        }
                    });
                }, 500);
                var dropZone = $('#release_desc')[0];
                dropZone.addEventListener("dragenter", function (e) {
                    e.preventDefault();
                    e.stopPropagation();
                }, false);

                dropZone.addEventListener("dragover", function (e) {
                    e.preventDefault();
                    e.stopPropagation();
                }, false);

                dropZone.addEventListener("dragleave", function (e) {
                    e.preventDefault();
                    e.stopPropagation();
                }, false);

                dropZone.addEventListener("drop", function (e) {
                    e.preventDefault();
                    e.stopPropagation();
                    // 处理拖拽文件的逻辑
                    var df = e.dataTransfer;
                    var dropFiles = []; // 拖拽的文件，会放到这里
                    var dealFileCnt = 0; // 读取文件是个异步的过程，需要记录处理了多少个文件了
                    var allFileLen = df.files.length; // 所有的文件的数量，给非Chrome浏览器使用的变量

                    // 获得拖拽文件的回调函数
                    function getDropFileCallBack (dropFiles) {
                        console.log(dropFiles, dropFiles.length);
                    }

                    // 检测是否已经把所有的文件都遍历过了
                    function checkDropFinish () {
                        if ( dealFileCnt === allFileLen-1 ) {
                            getDropFileCallBack(dropFiles);
                        }
                        dealFileCnt++;
                    }

                    if(df.items !== undefined){
                        // Chrome拖拽文件逻辑
                        for(var i = 0; i < df.items.length; i++) {
                            var item = df.items[i];
                            if(item.kind === "file" && item.webkitGetAsEntry().isFile) {
                                var file = item.getAsFile();
                                dropFiles.push(file);
                                file.text().then(function(data){
                                    $('#release_desc').val(data);
                                    $('#release_desc')[0].dispatchEvent(evt);
                                });
                            }
                        }
                    } else {
                        // 非Chrome拖拽文件逻辑
                        for(var i = 0; i < allFileLen; i++) {
                            var dropFile = df.files[i];
                            if ( dropFile.type ) {
                                dropFiles.push(dropFile);
                                checkDropFinish();
                            } else {
                                try {
                                    var fileReader = new FileReader();
                                    fileReader.readAsDataURL(dropFile.slice(0, 3));
                                    fileReader.addEventListener('load', function (e) {
                                        console.log(e, 'load');
                                        dropFiles.push(dropFile);
                                        checkDropFinish();
                                    }, false);
                                    fileReader.addEventListener('error', function (e) {
                                        console.log(e, 'error，不可以上传文件夹');
                                        checkDropFinish();
                                    }, false);
                                } catch (e) {
                                    console.log(e, 'catch error，不可以上传文件夹');
                                    checkDropFinish();
                                }
                            }
                        }
                    }
                }, false);

                $('#release_desc').on('change', function(){
                    $('#remind_desc').find('font').css('color', 'yellow');
                    if ($('#release_desc').val().match(/Video[\s\S]{0,10}?ID/)) {
                        $('#remind_desc').find('font').text('Mediainfo已经补充，请检查后点击辅助发布！！')
                    }
                });

                $('#album_desc').css({'width': '600px', 'height': '200px'});
                $('#release_desc').css({'width': '600px', 'height': '500px'});
            } else {
                function load_episodes(season_url) {
                    if ($('#episode_jump').length) {
                        $('#episode_jump').attr('href', season_url);
                    } else {
                        $('#tvdb_episode').after(`<a href="${season_url}" target="_blank" style="margin-left:3px" id="episode_jump">跳转</a>`);
                    }
                    getDoc(season_url, null, function(doc){
                        if ($('table.table-bordered', doc).find('td').length > 3) {
                            $('#tvdb_episode').html('');
                            $('table.table-bordered', doc).find('td').map((index,e)=>{
                                if ($(e).text().match(/S\d+E\d+/)) {
                                    $('#tvdb_episode').append(`<option val="${$(e).text().match(/S\d+(E\d+)/)[1]}">${$(e).text().match(/S\d+(E\d+)/)[1]}</option>`);
                                }
                            })
                        }
                    });
                }
                function add_info_bytvdb(tvdb_url) {
                    raw_info.name = $('#autofill').val();
                    if (raw_info.tvdb_url) {
                        $('#tvdbid').val(raw_info.tvdb_url.match(/id=(\d+)/)[1]);
                    }
                    getDoc(tvdb_url, null, function(doc) {
                        var tvdb_name = $('div[class="change_translation_text"][data-language="eng"]', doc).attr("data-title");
                        if (tvdb_name) {
                            if (tvdb_name == '2 Days & 1 Night') {
                                tvdb_name = '1 Night 2 Days';
                            }
                            raw_info.name = raw_info.name.replace(/(19|20)\d{2}/, ' ');
                            raw_info.name = raw_info.name.replace(search_name.trim(), tvdb_name).replace(/ +/g, ' ');
                        }
                        var season = $('#tab-official', doc).find('a:last').text().trim();
                        if (season.match(/\d{4}/)) {
                            raw_info.name = raw_info.name.replace(/S\d+/, `S${season.match(/\d{4}/)[0]}`);
                        }
                        $('#autofill').val(raw_info.name);
                        $('.tvdb').attr('disabled', true).css("color", "grey");
                        var container = $('#tvdb_season');
                        $('#tab-official', doc).find('a').map((index,e)=>{
                            try{
                                container.prepend(`<option value="${$(e).text().match(/\d+/)[0]}" name="${$(e).attr('href')}">${$(e).text().trim()}</optipon>`);
                                container.find(`option:contains(${$(e).text().trim()})`).attr('selected', true);
                            } catch (err) {}
                        });
                        if ($('#tvdb_season').find(`option:selected`).val().match(/\d{4}/) && !raw_info.name.match(/\d{4}/)) {
                            $('#autofill').val($('#autofill').val().replace(/S\d+/, $('#tvdb_season').find(`option:selected`).val()));
                        }
                        load_episodes($('#tvdb_season').find(`option:selected`).attr('name'));
                        container.on('change', function() {
                            if (this.value.length < 2) {
                                value = 'S0' + this.value;
                            } else {
                                value = 'S' + this.value;
                            }
                            load_episodes($(this).find(`option[value=${this.value}]`).attr('name'));
                            $('#autofill').val($('#autofill').val().replace(/S\d+/, value));
                        });
                    });
                }
                $('#content').find('table').first().hide();
                if (raw_info.name.match(/e\d+/i) || raw_info.small_descr.match(/第\d+.*?集/)) {
                    $('#categories').val('Episode');
                } else {
                    $('#categories').val('Season');
                }
                $('#scene_yesno').val('Yes');

                $('#autofill_scene_yes').css({'display': 'block'});
                var $table = $('#autofill_scene_yes').find('td:contains(Release Name)').last().parent().parent();
                $table.prepend(`<tr><td style="text-align:right">剧集名称填写说明:</td>
                    <td><font color="red">剧名以<a href="https://thetvdb.com/search?query=${search_name}" target="_blank">TVDB(点击跳转搜索)</a>为准,
                    可能出现含有年份和国别如:EVE (2022)<br>或Insider (KR)。剧名没有年份则点击<a id="hide_year" href="#">→去掉年份←</a>(一般是没有年份的)</font><br>
                    <b>检索TVDB名称：</b><input type="button" value="Search-By-IMDB" id="gettvdb" class="tvdb" title="根据imdb搜索" /><br>
                    <b>剧集TVDB编号：</b><input type="text" value="" id="tvdbid" class="tvdb" style="width:86px" />
                    <input type="button" value="获取TVDB信息" style="margin-left:2px" id="gettvdb2" class="tvdb" /><br>
                    <b>Season数选择：</b><select id="tvdb_season" style="width:94px; margin-left:2px"></select><select id="tvdb_episode" style="width:86px; margin-left:5px"></select>
                    </td></tr>`);
                for (var i = 0; i <= 50; i++) {
                    if ( i < 10 ) {
                        $('#tvdb_episode').append(`<option value="E0${i}">E0${i}</option>`);
                    } else {
                        $('#tvdb_episode').append(`<option value="E${i}">E${i}</option>`);
                    }
                }
                $('#tvdb_episode').on('change', function() {
                    var name_k = $('#autofill').val();
                    name_k = name_k.replace(/E\d+(-E?\d+)?/, this.value);
                    if (name_k.match(/S\d+/) && !name_k.match(/E\d+/)) {
                        name_k = name_k.replace(/(S\d+)/, `$1${this.value}`)
                    }
                    $('#autofill').val(name_k);
                    $('#categories').val('Episode');
                });
                if (!raw_info.name.match(/S\d+/i)) {
                    raw_info.name = raw_info.name.replace(search_name, `${search_name} S01 `).replace(/ +/g, ' ');
                }
                $('#autofill').val(raw_info.name);
                $('#hide_year').click((e)=>{
                    e.preventDefault();
                    var name = $('#autofill').val();
                    name = name.replace(/(19|20)\d{2}/, ' ').replace(/ +/g, ' ');
                    if (name.match(/S\d+ E\d+/)) {
                        name = name.replace(/(S\d+) (E\d+)/, '$1$2');
                    }
                    $('#autofill').val(name);
                });
                if (!raw_info.url) {
                    $('#gettvdb').attr('disabled', true).css("color", "grey");
                }
                $('#gettvdb').click((e)=>{
                    var tmdb_url = `https://api.themoviedb.org/3/find/${raw_info.url.match(/tt\d+/)[0]}?api_key=${used_tmdb_key}&language=en-US&external_source=imdb_id`;
                    console.log(tmdb_url)
                    getJson(tmdb_url, null, function(data){
                        console.log(data);
                        var tv_id = '';
                        if (data.tv_results.length) {
                            tv_id = data.tv_results[0].id;
                        } else if (data.tv_season_results.length) {
                            tv_id = data.tv_season_results[0].id;
                        } else if (data.tv_episode_results.length) {
                            tv_id = data.tv_episode_results[0].id;
                        } else {
                            alert("暂无结果，请直接跳转搜索！！");
                        }
                        if (tv_id) {
                            var _url = `https://api.themoviedb.org/3/tv/${tv_id}/external_ids?api_key=${used_tmdb_key}`;
                            console.log(_url);
                            getJson(_url, null, function(d){
                                console.log(d)
                                if (d.tvdb_id) {
                                    tvdb_id = d.tvdb_id;
                                    $('#tvdbid').val(tvdb_id);
                                    var tvdb_url = `https://www.thetvdb.com/?id=${tvdb_id}&tab=series`;
                                    add_info_bytvdb(tvdb_url);
                                    getDoc(tvdb_url, null, function(doc) {
                                        var tvdb_name = $('div[class="change_translation_text"][data-language="eng"]', doc).attr("data-title");
                                        if (tvdb_name) {
                                            raw_info.name = raw_info.name.replace(/(19|20)\d{2}/, ' ').replace(/ +/g, ' ');
                                            raw_info.name = raw_info.name.replace(search_name, `${tvdb_name} `).replace(/ +/g, ' ');
                                            if (raw_info.name.match(/S\d+ E\d+/)) {
                                                raw_info.name = raw_info.name.replace(/(S\d+) (E\d+)/, '$1$2');
                                            }
                                            var season = $('#tab-official', doc).find('a:last').text().trim();
                                            if (season.match(/\d{4}/)) {
                                                raw_info.name = raw_info.name.replace(/S\d+/, `S${season.match(/\d{4}/)[0]}`);
                                            }
                                            $('#autofill').val(raw_info.name);
                                            $('.tvdb').attr('disabled', true).css("color", "grey");
                                        }
                                    });
                                } else {
                                    alert("暂无结果！！！");
                                    $('.tvdb').attr('disabled', true).css("color", "grey");
                                }
                            });
                        }
                    });
                });
                $('#gettvdb2').click((e)=>{
                    var tvdb_id = $('#tvdbid').val().match(/\d+/)[0];
                    var tvdb_url = `https://www.thetvdb.com/?id=${tvdb_id}&tab=series`;
                    add_info_bytvdb(tvdb_url);
                });
                if (raw_info.tvdb_url !== undefined) {
                    add_info_bytvdb(raw_info.tvdb_url);
                }
            }
        }
    } else if (judge_if_the_site_as_source() == 6) { //avz系列
        if (GM_getValue('avz_info') !== undefined) {
            raw_info = JSON.parse(GM_getValue('avz_info'));
            raw_info = fill_raw_info(raw_info, 'AVZ');
            raw_info.descr = raw_info.descr.replace(/ /g, ' ');
            raw_info.full_mediainfo = raw_info.full_mediainfo.replace(/ /g, ' ');
            GM_deleteValue('avz_info');
        } else {
            return;
        }
        $('#file_name').val(raw_info.name);
        $('input[name=anon_upload]:first').attr('checked', true);
    } else if (judge_if_the_site_as_source() == 7) { //HDB-UPLOADER
        if (GM_getValue('task_info') !== undefined) {
            raw_info = JSON.parse(GM_getValue('task_info'));
            raw_info = fill_raw_info(raw_info, null);
            raw_info.descr = raw_info.descr.replace(/ /g, ' ');
            raw_info.full_mediainfo = raw_info.full_mediainfo.replace(/ /g, ' ');
            console.log(raw_info);
            GM_deleteValue('task_info');
            $('input[name=imdb]').val(raw_info.url);

            name = raw_info.name;
            name = name.replace(/DDPA?/i, 'DD+').replace(/AC3/, 'DD').replace(/DTS(\d+)/i, 'DTS $1');

            try {
                var team = raw_info.name.match(/.*-(.*?)$/i)[1];
                $('#team').val(team);
            } catch (err) {}

            if (raw_info.name.match(/MULTI COMPLETE/i)) {
                raw_info.medium_sel = 'Blu-ray';
            }

            if (raw_info.origin_site == 'HOU' || raw_info.origin_site == 'OMG') {
                $('#path').val('/home/sabnzbd/data/Downloads/complete/' + raw_info.name.replace(/ /g, '.'));
                if (raw_info.name.match(/COMPLETE|CiA/)) {
                    $('#scene').attr('checked', true);
                }
            }

            function get_audio_codec_from_descr(descr) {
                var audio_format = descr.match(/Audio[\s\S]{0,3}ID[\s\S]*?Format.*?:(.*)/)[1];
                if (audio_format.match(/E-AC-3/)) {
                    return 'DD+';
                } else if (audio_format.match(/AC-3/)) {
                    return 'DD';
                } else if (audio_format.match(/FLAC/)) {
                    return 'FLAC'
                }
            }

            function re_build_name(channels, name, type, descr) {
                try {
                    audio_codec = get_audio_codec_from_descr(descr);
                } catch(err) {
                    audio_codec = '';
                }
                var label = null;
                var label_str = '';
                if (channels == '1') {
                    label = /1\.0/;
                    label_str = '1.0';
                } else if (channels == '2') {
                    label = /2\.0/;
                    label_str = '2.0';
                } else if (channels == '6') {
                    label = /5\.1/;
                    label_str = '5.1';
                } else if (channels == '8') {
                    label = /7\.1/;
                    label_str = '7.1';
                }
                if (!name.match(label)) {
                    name = name.replace(/(DD\+|DD|AAC|FLAC|DTS|LPCM|TrueHD)/, `$1${label_str}`);
                }
                if (type == 'WEB-DL' || type == 'Encode') {
                    if (name.match(/(H.265|H.264|x264|x265)(.*?)(DD\+|DD|AAC|FLAC|DTS|LPCM|TrueHD) ?(2\.0|1\.0|5\.1|7\.1)/i)) {
                        name = name.replace(/(H.265|H.264|x264|x265)(.*?)(DD\+|DD|AAC|FLAC|DTS|LPCM|TrueHD) ?(2\.0|1\.0|5\.1|7\.1)/, '$3 $4 $1 $2');
                    }
                }
                if (!name.match(audio_codec)) {
                    if (type == 'WEB-DL' || type == 'Encode') {
                        if (name.match(/(H.265|H.264|x264|x265)/)) {
                            name = name.replace(/(H.265|H.264|x264|x265)/, `${audio_codec}${label_str} $1`);
                        }
                    }
                }
                return name;
            }

            try{
                var channels = (raw_info.descr).match(/Channel.*?(\d)/)[1];
                name = re_build_name(channels, name, raw_info.medium_sel, raw_info.descr);
            } catch(err) {
                if (raw_info.descr.match(/(AUDIO.*CODEC.*?|音频编码.*?)(2\.0|1\.0|5\.1|7\.1)/i)) {
                    channels = raw_info.descr.match(/(AUDIO.*CODEC.*?|音频编码.*?)(2\.0|1\.0|5\.1|7\.1)/i)[2];
                    if (!name.includes(channels)) {
                        name = name.replace(/(DD\+|DD|AAC|FLAC|DTS|LPCM|TrueHD)/, `$1${channels}`);
                    }
                    if (name.match(/(H.265|H.264|x264|x265)(.*?)(DD\+|DD|AAC|FLAC|DTS|LPCM|TrueHD)(2\.0|1\.0|5\.1|7\.1)/i)) {
                        name = name.replace(/(H.265|H.264|x264|x265)(.*?)(DD\+|DD|AAC|FLAC|DTS|LPCM|TrueHD)(2\.0|1\.0|5\.1|7\.1)/i, '$3 $4 $1 $2');
                    }
                } else if (raw_info.descr.match(/\d channels/i)) {
                    channels = raw_info.descr.match(/(\d) channels/i)[1];
                    name = re_build_name(channels, name, raw_info.medium_sel, raw_info.descr);
                }
            }
            if (name.match(/(WEB-DL|Bluray|HDTV).(1080p|4K|2160p|720p|480p)/i)) {
                name = name.replace(/(WEB-DL|Bluray|HDTV).(1080p|4K|2160p|720p|480p)/i, '$2 $1');
            }
            name = name.replace(/(DD\+|DD|FLAC|LPCM|TrueHD|MA|HR) (2\.0|1\.0|5\.1|7\.1)/, '$1$2');
            if (raw_info.type == '剧集' || raw_info.type == '综艺' || raw_info.type == '纪录') {
                year = name.match(/(19|20)\d{2}[^pP]/g);
                try{
                    if (year[0] !== undefined) {
                        name = name.replace(year, ' ');
                        name = name.replace(/ +/g, ' ');
                    }
                } catch(err) {}
            }
            $('#name').val(name.replace(/ +-|- +/g, '-'));
            if (raw_info.tvdb_url !== undefined) {
                if (raw_info.tvdb_url.match(/\d+/)) {
                    $('#tvdb').val(raw_info.tvdb_url.match(/\d+/)[0]);
                }
                getDoc(raw_info.tvdb_url, null, function(doc){
                    if (!$('#tvdb').val()) {
                        var tvdb_id = $('li:contains(TheTVDB.com Series ID):last', doc).find('span').text();
                        $('#tvdb').val(tvdb_id);
                    }
                    var genres = $('li:contains(Genres):last', doc).find('span').text();
                    if (genres.includes('Documentary')) {
                        $('#type_category').val("3");
                    }
                });
            }
            var announce = 'http://tracker.hdbits.org/announce.php';
            addTorrent(raw_info.torrent_url, raw_info.torrent_name, 'hdb-task', announce);
            $('#file').parent().append(`<a id="remove_file" href="#" style="color:red; margin-left: 100px;">取消种子文件</a>`);
            $('#remove_file').click((e)=>{
                e.preventDefault();
                var _file = document.getElementById("file");
                _file.outerHTML = _file.outerHTML;
            })

            switch(raw_info.medium_sel){
                case 'UHD': case 'Blu-ray':  case 'Encode': case 'Remux': $('#source').val('Blu-ray'); break;
                case 'HDTV': $('#source').val('HDTV'); break;
                case 'WEB-DL': $('#source').val('WEB'); break;
                case 'DVD': $('#source').val('DVD'); break;
                case 'TV': $('#source').val('TV'); break;
            }
            if (raw_info.name.match(/hd-dvd/i)) {
                $('#source').val('HD-DVD');
            }

            switch (raw_info.type){
                case '电影': $('#type_category').val("1"); break;
                case '剧集': $('#type_category').val("2"); break;
                case '音乐': $('#type_category').val("4"); break;
                case '综艺': $('#type_category').val("2"); break;
                case '纪录': $('#type_category').val("3"); break;
                case '动漫': $('#type_category').val("8"); break;
                case '体育': $('#type_category').val("5");
            }

            switch (raw_info.codec_sel){
                case 'H264': case 'X264': $('#type_codec').val("1"); break;
                case 'H265': case 'X265': $('#type_codec').val("5"); break;
                case 'VC-1': $('#type_codec').val("3"); break;
                case 'MPEG-2': $('#type_codec').val("2"); break;
                case 'XVID': $('#type_codec').val("4"); break;
                default: $('#type_codec').val("0");
            }

            switch(raw_info.medium_sel){
                case 'UHD': case 'Blu-ray': case 'DVD':  $('#type_medium').val("1"); break;
                case 'Remux': $('#type_medium').val("5"); break;
                case 'HDTV': $('#type_medium').val("4"); break;
                case 'WEB-DL': $('#type_medium').val("6"); break;
                case 'Encode': $('#type_medium').val("3"); break;
                default: $('#type_medium').val("0");
            }

            if (raw_info.type == '剧集') {
                if (raw_info.name.match(/S(\d+)(E\d+)?/)) {
                    season_episode = raw_info.name.match(/S(\d+)(E\d+)?/);
                    console.log(season_episode)
                    if (season_episode[1] !== undefined) {
                        $('#season').val(parseInt(season_episode[1]));
                    }
                    if (season_episode[2] !== undefined) {
                        $('#episode').val(parseInt(season_episode[2].replace(/e/i, '')));
                    }
                }
            }
            var search_name = get_search_name(raw_info.name);
            $('#tvdb_parse_title').click((e)=>{
                e.preventDefault();
                var url_to_search = `https://thetvdb.com/search?query=${search_name}`;
                window.open(url_to_search, "_blank");
            })

            try {
                var infos = get_mediainfo_picture_from_descr(raw_info.descr);
                if (raw_info.medium_sel == 'UHD' || raw_info.medium_sel == 'Blu-ray' || raw_info.descr.match(/mpls/i)) {
                    $('textarea[name="release_desc"]').val(infos.mediainfo);
                }
                setTimeout(function(){
                    try{
                        var intro = raw_info.descr.match(/◎简　　介[\s]*.*/i)[0];
                        $('textarea[name="descr"]').val(raw_info.descr.split(intro)[0] + intro);
                    } catch(err) {}
                }, 2000)
            } catch (err) {}

            // 开始填写瓷器
            $('input[name="hdc_name"]').val(raw_info.name);
            $('input[name="small_descr"]').val(raw_info.small_descr);
            switch (raw_info.type){
                case '电影':
                    if (raw_info.medium_sel == 'Blu-ray' || raw_info.medium_sel == 'UHD'){
                        if (raw_info.standard_sel == '4K'){
                            $('#browsecat').val('410');
                        } else{
                            $('#browsecat').val('20');
                        }
                    } else {
                        if (raw_info.standard_sel == '720p'){
                            $('#browsecat').val('9');
                        } else if(raw_info.standard_sel == '1080i'){
                            $('#browsecat').val('16');
                        } else if (raw_info.standard_sel == '1080p'){
                            $('#browsecat').val('17');
                        }
                    }
                    break;
                case '剧集':
                    switch (raw_info.source_sel){
                        case '大陆': case '台湾': case '香港': case '港台':
                            //是否合集
                            if (raw_info.name.match(/(complete|S\d{2}[^E])/i) && (!raw_info.name.match(/E\d{2,3}/i))) { //合集
                                $('#browsecat').val('22');
                            } else {
                                $('#browsecat').val('25');
                            }
                            break;

                        case '日本':
                            if (raw_info.name.match(/(complete|S\d{2}[^E])/i)) {
                                $('#browsecat').val('23');
                            } else {
                                $('#browsecat').val('24');
                            }
                            break;
                        case '韩国':
                            if (raw_info.name.match(/(complete|S\d{2}[^E])/i)) {
                                $('#browsecat').val('23');
                            } else {
                                $('#browsecat').val('24');
                            }
                            break;

                        case '欧美':
                            //单集
                            if (raw_info.name.match(/(S\d{2}E\d{2})/i)) {
                                $('#browsecat').val('13');
                            } else {
                                $('#browsecat').val('21');
                            }
                            break;
                    }
                    break;
                case '音乐':
                    if (raw_info.small_descr.match(/音乐会/i)){
                        $('#browsecat').val('402');
                    } else {
                        $('#browsecat').val('408');
                    }
                    break;
                case 'MV': $('#browsecat').val('406'); break;
                case '综艺': $('#browsecat').val('401'); break;
                case '动漫': $('#browsecat').val('14'); break;
                case '学习': $('#browsecat').val('404'); break;
                case '纪录': $('#browsecat').val('5'); break;
                case '动漫': $('#browsecat').val('14'); break;
                case '体育': $('#browsecat').val('15'); break;
                case '书籍': $('#browsecat').val('404');
            }
            if (raw_info.name.match(/(pad$|ipad)/i)){
                $('#browsecat').val('27');
            }
            $("select[name='medium_sel']").val('15');  //默认其它
            if (raw_info.name.match(/MiniBD/i)) {
                $("select[name='medium_sel']").val('2');
            }
            else {
                switch (raw_info.medium_sel){
                    case 'UHD': case 'Blu-ray':
                        $("select[name='medium_sel']").val('11'); break;
                    case 'HDTV': $("select[name='medium_sel']").val('13'); break;
                    case 'WEB-DL': $("select[name='medium_sel']").val('21'); break;
                    case 'Encode': $("select[name='medium_sel']").val('5'); break;
                    case 'Remux': $("select[name='medium_sel']").val('6'); break;
                    case 'DVD':
                        if (raw_info.name.match(/DVDR/i)) {
                            $("select[name='medium_sel']").val('4');
                        } else if (raw_info.name.match(/HD.?DVD/i)){
                            $("select[name='medium_sel']").val('12');
                        } else {
                            $("select[name='medium_sel']").val('14');
                        }
                }
            }

            $("select[name='team_sel']").val('5');
            check_team(raw_info, 'team_sel');
            document.getElementsByName('uplver')[0].checked = if_uplver;

            //格式
            $("select[name='standard_sel']").val('10'); //默认其它
            switch (raw_info.standard_sel){
                case '8K': $("select[name='standard_sel']").val('19'); break;
                case '4K': $("select[name='standard_sel']").val('17'); break;
                case '1080p': $("select[name='standard_sel']").val('11'); break;
                case '1080i': $("select[name='standard_sel']").val('12'); break;
                case '720p': $("select[name='standard_sel']").val('13'); break;
                case 'SD': $("select[name='standard_sel']").val('15');
            }

            switch (raw_info.codec_sel){
                case 'H265': case 'X265': $("select[name='codec_sel']").val('10'); break;
                case 'H264': $("select[name='codec_sel']").val('1'); break;
                case 'X264': $("select[name='codec_sel']").val('6'); break;
                case 'XVID': $("select[name='codec_sel']").val('3'); break;
                case 'VC-1': $("select[name='codec_sel']").val('2'); break;
                case 'MPEG-2': case 'MPEG-4': $("select[name='codec_sel']").val('4'); break;
                case '': $("select[name='codec_sel']").val('5');
            }

            //音频编码
            $("select[name='audiocodec_sel']").val('7'); //默认其它
            switch (raw_info.audiocodec_sel){
                case 'DTS-HDMA:X 7.1': case 'DTS-HDMA':
                    $("select[name='audiocodec_sel']").val('12'); break;
                case 'Atmos':
                    $("select[name='audiocodec_sel']").val('15'); break;
                case 'TrueHD':
                    $("select[name='audiocodec_sel']").val('13'); break;
                case 'LPCM':
                    $("select[name='audiocodec_sel']").val('11'); break;
                case 'DTS': case 'DTS-HD':
                    if (raw_info.name.match(/DTS.?X[^ \d]/i)){
                        $("select[name='audiocodec_sel']").val('14');
                    } else {
                        $("select[name='audiocodec_sel']").val('3');
                    }
                    break;
                case 'AC3':
                    $("select[name='audiocodec_sel']").val('8'); break;
                case 'AAC':
                    $("select[name='audiocodec_sel']").val('6'); break;
                case 'Flac':
                    $("select[name='audiocodec_sel']").val('1'); break;
                case 'APE':
                    $("select[name='audiocodec_sel']").val('2'); break;
                case 'MP3':
                    $("select[name='audiocodec_sel']").val('4'); break;
                case 'WAV':
                    $("select[name='audiocodec_sel']").val('9');
            }

            $('.get_descr').click((e)=>{
                e.preventDefault();
                if (raw_info.dburl) {
                    flag = false;
                } else if (raw_info.url) {
                    flag = true;
                } else {
                    alert("当前资源没有豆瓣和IMDB链接,请手动获取！！");
                    return;
                }
                create_site_url_for_douban_info(raw_info, flag).then(function(raw_info){
                    console.log(raw_info)
                    if (raw_info.dburl){
                        get_douban_info(raw_info);
                    }
                }, function(err) {
                    console.log(err);
                    $(e.target).prop('value', '获取失败');
                    if (flag) {
                        window.open(`https://search.douban.com/movie/subject_search?search_text=${raw_info.url.match(/tt\d+/)[0]}&cat=1002`, target="_blank");
                    } else {
                        window.open(url, target='_blank');
                    }
                });
            });

            //海报，从简介获取
            reg_img = raw_info.descr.match(/\[img\](.*?)\[\/img\][\s\S]+?(主.{0,6}演|译.{0,6}名)/i);
            if (reg_img){
                $('#cover').val(reg_img[1]);
            }

            $('#descr').val(raw_info.descr.split('[quote]')[0]);

            var label_str = raw_info.small_descr + raw_info.name + raw_info.descr;
            var labels = label_str.get_label();
            if (raw_info.labels % 2) {
                labels.gy = true;
            }
            if (9 < raw_info.labels && raw_info.labels < 100) {
                    labels.yy = true;
            }
            if (raw_info.labels > 99) {
                labels.zz = true;
            }
            if (raw_info.descr.match(/◎语.*?言.*?汉语普通话/)) {
                labels.gy = true;
            }
            if (raw_info.name.match(/(x|H)(264|265)/i)) {
                labels.diy = false;
            }

            raw_info.name = raw_info.name + (raw_info.edition_info === undefined ? '': raw_info.edition_info);

            $('#get_ptp').click((e)=>{
                e.preventDefault();
                var imdburl = $('#imdb').val();
                var search_url = 'https://passthepopcorn.me/ajax.php?' + encodeURI(`action=torrent_info&imdb=${imdburl}&fast=1`)
                getJson(search_url, null, function(data){
                    if (data.length) {
                        data = data[0];
                        $('#title').val(data.title);
                        $('#year').val(data.year);
                        if (data.groupid) {
                            $('#groupid').val(data.groupid);
                        } else {
                            $('#image').val(data.art);
                            $('#tags').val(data.tags);
                            $('#album_desc').val(data.plot);
                            $('div.ptp-extra').show();
                        }
                        $('#get_ptp').css({"color": "orange"})
                        alert('获取信息成功！！');
                    }
                })
            });

            $('#show_pic').click((e)=>{
                if (e.target.checked) {
                    $('#pictures').show();
                    var pic_urls = infos.pic_info.match(/http.*?(png|jpg)/g);
                    $('#pictures').val(pic_urls.join('\n'));
                } else {
                    $('#pictures').hide();
                    $('#pictures').val('');
                }
            });

            $('#get_ptp').parent().append(`<input type="checkbox" id="show_ptp_hidden" value="1" style="vertical-align: middle; margin-left:5px;">显示更多选项`);
            $('#show_ptp_hidden').click((e)=>{
                $('div.ptp-extra').removeClass('hidden');
            });

            function addedition(str) {
                var event = document.createEvent("HTMLEvents");
                event.initEvent("click", false, true);
                $(`a:contains(${str})`)[0].dispatchEvent(event);
                $(`a:contains(${str})`).css({"color": "yellow"});
            }

            if (raw_info.name.match(/Criterion Collection/i) || raw_info.small_descr.match(/CC标准收藏|Criterion Collection/i)) {
                addedition('The Criterion Collection');
            }
            if (raw_info.name.match(/Masters of Cinema/i) || raw_info.small_descr.match(/Masters of Cinema/i)) {
                addedition('Masters of Cinema')
            }
            if (raw_info.name.match(/Warner Archive Collection/i) || raw_info.small_descr.match(/WAC|Warner Archive Collection/i)) {
                addedition('Warner Archive Collection')
            }
            if (labels.db || raw_info.small_descr.match(/杜比|dolby version/i)) {
                addedition('Dolby Vision')
            }
            if (labels.hdr10 || raw_info.small_descr.match(/hdr10/i)) {
                addedition('HDR10')
            }
            if (raw_info.name.match(/4K remaster/i) || raw_info.small_descr.match(/4K.?修复/i)) {
                addedition('4K Remaster')
            }
            if (raw_info.name.match(/atmos/i) || raw_info.small_descr.match(/atmos/i) || raw_info.descr.match(/Dolby Atmos/)) {
                addedition('Dolby Atmos')
            }
            if (raw_info.name.match(/amzn/i)) {
                addedition('Amazon')
            }
            if (raw_info.name.match(/remux/i)) {
                addedition('Remux')
            }
            if (raw_info.name.match(/netflix/i)) {
                addedition('Netflix')
            }
            if (raw_info.name.match(/hulu/i)) {
                addedition('Hulu')
            }
            if (raw_info.name.match(/dsnp/i)) {
                addedition('Disney+')
            }
            if (raw_info.name.match(/aptv/i)) {
                addedition('Apple TV+')
            }
            if (raw_info.name.match(/itunes/i)) {
                addedition('iTunes')
            }
            if (raw_info.name.match(/Unrated/i) || raw_info.small_descr.match(/未分级版/)) {
                addedition('Unrated')
            }
            if (raw_info.name.match(/\d+.Uncut/i) || raw_info.small_descr.match(/未删节版/)) {
                addedition('Uncut')
            }
            if (raw_info.name.match(/Director's cut/i) || raw_info.small_descr.match(/导演剪辑版/)) {
                addedition("Director's Cut")
            }
            if (raw_info.name.match(/Extended/i) || raw_info.small_descr.match(/加长版/)) {
                addedition('Extended')
            }
            if (raw_info.name.match(/10.?bit/i)) {
                addedition('10-bit')
            }
            if (raw_info.name.match(/2-Disc/) || raw_info.small_descr.match(/双碟版/)) {
                addedition('2-Disc Set')
            }
            if (raw_info.name.match(/commentary/i) || raw_info.small_descr.match(/评论音轨/)) {
                addedition('With Commentary')
            }

            $('input[type=submit]').click(()=>{
                if (!$('#ptp').is(':checked') && !$('#hdb').is(':checked') && !$('#hdc').is(':checked')) {
                    alert('请至少选择一个发布站点！！');
                    return false;
                }
                if ($('#type_category').val() != '1' && $('#ptp').is(':checked')) {
                    alert('此工具仅支持Movie发布到PTP站。');
                    return false;
                }
                if (raw_info.descr.match(/\.mp4/) && $('#ptp').is(':checked')) {
                    alert('此工具不支持MP4发布到PTP站。');
                    return false;
                }
                if (!$('#title').val() && $('#ptp').is(':checked')) {
                    alert('选择了PTP站点, 请先点击获取信息！！');
                    return false;
                }
                if (!$('#tvdb').val() && $('#hdb').is(':checked') && $('#type_category').val() == '2') {
                    alert('HDB发布剧集需要TVDB信息');
                    return false;
                }
                if (!$('#season').val() && $('#hdb').is(':checked') && $('#type_category').val() == '2') {
                    alert('HDB发布剧集需要TVDB季度信息');
                    return false;
                }
                if ($('#hdc').is(':checked') && !$('#descr').val()) {
                    alert('HDChina发布影视需要豆瓣信息');
                    return false;
                }
                GM_deleteValue('task_info');
            })

        } else {
            return;
        }
    }
}

if (origin_site == 'ZHUQUE' && site_url.match(/^https:\/\/zhuque.in\/torrent\/info\/\d+/)) {
    var executed = false;
    mutation_observer(document, function() {
        if ($('a[href*=download]').length && !executed) {
            setTimeout(auto_feed, sleep_time);
            executed = true;
        }
    })
} else if (origin_site == 'ZHUQUE' && site_url.match(/^https:\/\/zhuque.in\/torrent\/list\/\d+/)) {
    mutation_observer(document, function() {
        if ($('div.markdown').length) {
            setTimeout(function(){
                if (!$('#mytable').length) {
                    setTimeout(auto_feed, sleep_time);
                }
            }, 1000);

        }
    });
} else if (origin_site == 'MTeam' && site_url.match(/^https?:\/\/kp.m-team.cc\/detail\/\d+/)) {
    var executed = false;
    mutation_observer(document, function() {
        if ($('h2').length  && !executed) {
            setTimeout(auto_feed, sleep_time);
            executed = true;
        }
    });
} else {
    setTimeout(auto_feed, sleep_time);
}

```
