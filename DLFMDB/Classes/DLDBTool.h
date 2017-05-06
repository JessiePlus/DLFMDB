//
//  DLDBTool.h
//  Vodka
//
//  Created by dinglin on 2017/5/5.
//  Copyright © 2017年 dinglin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"
#import "FMDB.h"
#import <objc/runtime.h>
#import "DLDBColumnDes.h"
#import "DLDBSQLState.h"

@interface DLDBTool : NSObject

@property (nonatomic, retain, readonly) FMDatabaseQueue *dbQueue;
/**
 *  单列 操作数据库保证唯一
 */
+ (instancetype)shareInstance;
/**
 *  数据库路径
 */
+ (NSString *)dbPath;
/**
 *  切换数据库
 */
- (BOOL)changeDBWithDirectoryName:(NSString *)directoryName;

@end
