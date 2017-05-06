# DLFMDB
DLFMDB是对FMDB的封装，可以使用直接实体类对象来做增、删、改、查。<br>

[![CI Status](http://img.shields.io/travis/LinDing/DLFMDB.svg?style=flat)](https://travis-ci.org/LinDing/DLFMDB)
[![Version](https://img.shields.io/cocoapods/v/DLFMDB.svg?style=flat)](http://cocoapods.org/pods/DLFMDB)
[![License](https://img.shields.io/cocoapods/l/DLFMDB.svg?style=flat)](http://cocoapods.org/pods/DLFMDB)
[![Platform](https://img.shields.io/cocoapods/p/DLFMDB.svg?style=flat)](http://cocoapods.org/pods/DLFMDB)

# Feature
1.自动创建数据库、自动创建数据库表。<br>
2.自动检测字段添加新字段。<br>
3.一行代码实现数据库的CURD操作。<br>
4.源码及其简单，易于理解和掌握。<br>
5.支持多线程。<br>
6.支持切换数据库目录。<br>
7.支持外键。<br>

## Example

DLRSSGroup.h

```objc
#import <DLDBModel.h>

@interface DLRSSGroup : DLDBModel
@property (nonatomic, assign) int pk_id;
@property (nonatomic, copy) NSString *rg_id;
//分组的名称
@property (nonatomic, copy) NSString *name;
//外键，分组的作者id
@property (nonatomic, copy) NSString *u_id_fk;

@end
```
DLRSSGroup.m

```objc
#import "DLRSSGroup.h"
#import <DLDBTool.h>

@implementation DLRSSGroup

//必须重写此方法
+ (NSDictionary *)describeColumnDict{

DLDBColumnDes *pk_id = [[DLDBColumnDes alloc] initWithAuto:YES isNotNull:NO check:nil defaultVa:nil];
pk_id.primaryKey = YES;
pk_id.columnName = @"pk_id";

DLDBColumnDes *rg_id = [[DLDBColumnDes alloc] initWithgeneralFieldWithAuto:NO unique:YES isNotNull:NO check:nil defaultVa:nil];
rg_id.columnName = @"rg_id";

DLDBColumnDes *name = [[DLDBColumnDes alloc] initWithgeneralFieldWithAuto:NO unique:NO isNotNull:NO check:nil defaultVa:nil];
name.columnName = @"name";

DLDBColumnDes *u_id_fk = [[DLDBColumnDes alloc] initWithgeneralFieldWithAuto:NO unique:NO isNotNull:NO check:nil defaultVa:nil];
u_id_fk.columnName = @"u_id_fk";

return @{@"pk_id":pk_id,@"rg_id":rg_id,@"name":name,@"u_id_fk":u_id_fk};
}

@end
```
DLAddRSSGroupViewController.m

```objc
DLRSSGroup *RSSGroup = [[DLRSSGroup alloc] init];
RSSGroup.rg_id = @"12345";
RSSGroup.name = @"technology";
RSSGroup.u_id_fk = @"12345";
[RSSGroup saveOrUpdateByColumnName:@"rg_id" AndColumnValue:RSSGroup.rg_id];
```



## Requirements

## Installation

DLFMDB is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "DLFMDB"
```

## Author

LinDing, dinglin1991@yeah.net

## License

DLFMDB is available under the MIT license. See the LICENSE file for more info.
