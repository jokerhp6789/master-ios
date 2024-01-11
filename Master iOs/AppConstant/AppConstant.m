//
//  AppConstant.m
//  Master iOs
//
//  Created by Trung DX on 30/12/2566 BE.
//

#import "AppConstant.h"

@implementation  AppConstant

-(instancetype)init {
    self = [super init];
    if(self){
        self.TEAM_DATA =@[
            @{@"id":@"0", @"name":@"Arsenal",@"info":@"Arsenal Football Club is a professional football club based in Islington, London, England, that plays in the Premier League, the top flight of English football. The club has won 13 league titles (including one unbeaten title), a record 14 FA Cups, two League Cups, 16 FA Community Shields, the League Centenary Trophy, one European Cup Winners' Cup, and one Inter-Cities Fairs Cup.",
              @"manager":@{@"name":@"Mikel Arteta",@"job":@(0)},
              @"founded":@"October 1886"
              
            },
            @{@"id":@"1", @"name":@"Aston Villa",@"info":@"Arsenal Football Club is a professional football club based in Islington, London, England, that plays in the Premier League, the top flight of English football. The club has won 13 league titles (including one unbeaten title), a record 14 FA Cups, two League Cups, 16 FA Community Shields, the League Centenary Trophy, one European Cup Winners' Cup, and one Inter-Cities Fairs Cup.",
              @"manager":@{@"name":@"Dean Smith",@"job":@(1)},
              @"founded":@"June 1901"
            },
            @{@"id":@"2", @"name":@"Burnley",@"info":@"Burnley Football Club is an English association football club based in Burnley, Lancashire. Founded on 18 May 1882, it was one of the first to become professional (in 1883), and subsequently put pressure on the Football Association to permit payments to players. The club entered the FA Cup for the first time in 1885–86 and was one of the 12 founder members of the Football League in 1888–89. The team currently competes in the Premier League, the top tier of English football.",
              @"manager":@{@"name":@"Sean Dyche",@"job":@(1)},
              @"founded":@"May 1882"
            },
            @{@"id":@"3", @"name":@"Brighton",@"info":@"Brighton & Hove Albion Football Club, commonly referred to simply as Brighton, is an English professional football club based in the city of Brighton and Hove. They compete in the Premier League, the top tier of the English football league system. The club's home ground is the 30,750-capacity Falmer Stadium, situated in Falmer to the north east of the city.",
              @"manager":@{@"name":@"Graham Potter",@"job":@(1)},
              @"founded":@"June 1901"
            },
            @{@"id":@"4", @"name":@"Chelsea",@"info":@"Chelsea Football Club are an English professional football club based in Fulham, London. Founded in 1905, the club competes in the Premier League, the top division of English football. Chelsea are among England's most successful clubs, having won over thirty competitive honours, including six league titles and six European trophies. Their home ground is Stamford Bridge.",
              @"manager":@{@"name":@"Frank Lampard",@"job":@(1)},
              @"founded":@"March 1905"
            },
            
        ];
        
    }
    return self;
}

@end
