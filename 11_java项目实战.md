# 技术选型 SSM
1. Spring
2. Spring MVC
3. Mybatis
4. redis 缓存
5. solor 搜索服务
6. EasyUI 后台管理系统界面
7. UEditor 百度的富文本编辑
8. JQuery  
9. Freemark 模板渲染引擎
10. activMQ 消息队列 中间件
11. httpClient 
12. MyAQL

# 开发环境

1. InteliJ IDEA
2. Maven || gradle
3. Tomcat7
4. JDK
5. Nginx 横向代理，负载均衡
6. Git
7. postman
8. sqlyog 连接数据库的界面管理工具


# 计划
- 技术架构 (集群和分布式架构的区别)
- 工程搭建 (maven)
- SSM框架的整合
- Mybatis逆向工程以及使用
- 日志的添加与使用
- 拦截器
- 后端功能 (系统的开发，图片系统，数据等等)
- 前端功能 (商品浏览，下订单，购物车等等)
- redis使用和集群搭建
- solor使用和集群搭建
- JMS 消息队列 (activMQ)
- sso单点登录
- restful服务
- 署部


## maven
1. 项目管理
- 提供了一套完整的构建生命周期的框架

2. 整合工具
- 自动的完成一些工程的基础构建配置

3. 依赖管理
- jar包依赖
- 工程间的依赖
- 继承
- 聚合

4. 工程类型
- war包的项目
- jar包的项目
- pom工程

# 架构
1. parent模块 其它模块继承它
2. manager
3. common 通用模块 配置 工具类
4. search 搜索模块 -> solor 
5. sso单点登录
6. restful
    - portal 门户网站 面向用户
    - android app
    - ios app
    - wechat
7. redis 缓存 负载高并发