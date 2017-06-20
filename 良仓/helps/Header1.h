//
//  Header.h
//  FreeDemo
//
//  Created by DuHaiFeng on 14-1-17.
//  Copyright (c) 2014年 dhf. All rights reserved.
//

#ifndef FreeDemo_Header_h
#define FreeDemo_Header_h

//  逛


//(1)礼物页—展示界面
#define URL_LW @"http://api.iliangcang.com/i/appshopgoods?app_key=iphone&build=158&count=12&list_id=%ld&osVersion=81&page=1&self_host=1&sig=545947611%7C4618e455961a188da2f50209e23599ce576f1b01&user_id=545947611&v=2.4.0"


//(2)专题页面
#define URL_ZT @"http://api.iliangcang.com/i/appshopmaga?app_key=iphone&build=158&osVersion=81&v=2.4.0"


//(3)分类页--展示界面
#define URL_FL @"http://app.iliangcang.com/goods/class?app_key=iphone&build=158&cat_code=%@&count=12&list_id=3&osVersion=81&page=%ld&self_host=1&v=2.4.0"

//商品详情页面
#define URL_XQ @"http://app.iliangcang.com/goods?app_key=iphone&build=158&goods_id=%@&osVersion=81&sig=435695611%7C17b69be0160b34eb544fc685cfaa6279577af881&user_id=435695611&v=2.4.0"

#define URL_XQQ @"http://app.iliangcang.com/goods?app_key=iphone&build=158&goods_id=%@&osVersion=81&v=2.4.0"




//(4)分享页面

#define URL_SHARE @"http://app.iliangcang.com/goods/class?app_key=iphone&build=158&count=12&osVersion=81&page=10&sig=435695611%7C17b69be0160b34eb544fc685cfaa6279577af881&user_id=435695611&v=2.4.0"

//(5)推荐页面 ---tableView

#define URL_SHOUYETB @"http://api.iliangcang.com/i/appshopgoods?app_key=iphone&build=158&count=12&list_id=3&osVersion=81&page=1&self_host=1&sig=435695611%7C17b69be0160b34eb544fc685cfaa6279577af881&user_id=435695611&v=2.4.0"

//(6)推荐页面 ----scrollView

#define URL_SHOUYE @"http://api.iliangcang.com/i/appshophome?app_key=iphone&build=158&osVersion=81&sig=545947611%7C4618e455961a188da2f50209e23599ce576f1b01&user_id=545947611&v=2.4.0"



//发现

//(1)攻略

#define URL_GL @"http://api.yhouse.com/m/guide/list?app_type=2&app_key=86bd86245948c45bd6fc20c4225d806fad2a74c97b0f7e13c2365db55e3fc73a&app_token=%@&page=%ld&pageSize=20"


//(2)玩家

#define URL_PLAYER @"http://api.yhouse.com/?r=v2/experience/list&app_type=2&app_key=86bd86245948c45bd6fc20c4225d806fad2a74c97b0f7e13c2365db55e3fc73a&app_token=740D3687814B02154E948FE29CC0E792ot3c9tNzxEJfP0zyQmuMNQ==&page=%ld&pageSize=20"


//(3)视野--广告栏

#define URL_SYGG @"http://api.yhouse.com/m/promotion/list/6?app_type=2&app_key=86bd86245948c45bd6fc20c4225d806fad2a74c97b0f7e13c2365db55e3fc73a&app_token=740D3687814B02154E948FE29CC0E792y7HZeQg%2BQfv2TRBU5DvC3A==&cityId=100&siteInfo=ios"

//视野--tableView

#define URL_SYVIEW @"http://api.yhouse.com/m/life/list?app_type=2&app_key=86bd86245948c45bd6fc20c4225d806fad2a74c97b0f7e13c2365db55e3fc73a&app_token=740D3687814B02154E948FE29CC0E792xveI64nMh4d6iyJK5Ec2kQ==&page=%ld&pageSize=20"





//达人
#define URL_DR @"http://app.iliangcang.com/expert?app_key=iphone&build=158&count=20&orderby=%@&osVersion=81&page=1&v=2.4.0"

#define URL_DRONE @"http://app.iliangcang.com/expert?app_key=iphone&build=158&count=20&orderby=&osVersion=81&page=1&v=2.4.0"

//达人详情

#define URL_DRXQ @"http://app.iliangcang.com/user/recommendation?app_key=iphone&build=158&count=12&osVersion=81&owner_id=%@&page=1&sig=435695611%7C17b69be0160b34eb544fc685cfaa6279577af881&user_id=435695611&v=2.4.0"

//达人推荐商品详情

#define URL_DRTJXQ @"http://app.iliangcang.com/goods?app_key=iphone&build=158&goods_id=%@&osVersion=81&v=2.4.0"

//评论
#define URL_COMMENT @"http://app.iliangcang.com/goods/comments?app_key=iphone&build=158&count=10&goods_id=%@&osVersion=81&page=1&v=2.4.0"

//关注

#define URL_FOLLOW @"http://app.iliangcang.com/user/%@?app_key=iphone&build=158&count=12&osVersion=81&owner_id=%@&page=1&v=2.4.0"


#endif





