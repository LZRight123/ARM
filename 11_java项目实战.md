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
1. parent模块 其它模块继承它 是所有子模块的父类，集中定义一些依赖的版本， 集中定义一些插件
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


# 使用 Intellij IDEA 创建 Maven 工程并配置
https://mvnrepository.com/artifact
1. parent模块
```
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <groupId>com.kendinghui</groupId>
    <artifactId>manong_parent</artifactId>
    <version>1.0-SNAPSHOT</version>
    <packaging>pom</packaging>

<!--    子模块-->
    <modules>

    </modules>

<!--    集中的定义版本号-->
    <properties>
        <junit.version>4.12</junit.version>
        <maven-resources-plugin.vsersion>3.1.0</maven-resources-plugin.vsersion>
        <maven-compiler-plugin>3.8.0</maven-compiler-plugin>
    </properties>

<!--    定义依赖-->
<!--    https://mvnrepository.com/  -->
    <dependencyManagement>
        <dependencies>
            <!-- https://mvnrepository.com/artifact/junit/junit -->
            <dependency>
                <groupId>junit</groupId>
                <artifactId>junit</artifactId>
                <version>${junit.version}</version>
            </dependency>
        </dependencies>
    </dependencyManagement>

    <build>
        <plugins>
            <plugin>
<!--                定义一个资源拷贝的插件啊-->
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-resources-plugin</artifactId>
                <version>${maven-resources-plugin.vsersion}</version>
                <configuration>
                    <encoding>UTF-8</encoding>
                </configuration>
            </plugin>
            <plugin>
                <!-- https://mvnrepository.com/artifact/org.apache.maven.plugins/maven-compiler-plugin -->
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-compiler-plugin</artifactId>
                <version>${maven-compiler-plugin}</version>
                <configuration>
                    <compilerVersion>1.8</compilerVersion>
                    <source>1.8</source>
                    <target>1.8</target>
                    <encoding>UTF-8</encoding>
                </configuration>
            </plugin>
        </plugins>
    </build>

</project>
```
2. 其它子模块创建完
3. manager
- pojo (实体类 jar包)
```
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <parent>
        <artifactId>manong_manager</artifactId>
        <groupId>com.kendinghui</groupId>
        <version>1.0-SNAPSHOT</version>
    </parent>
    <modelVersion>4.0.0</modelVersion>

    <packaging>jar</packaging>

    <artifactId>manong_manager_pojo</artifactId>


</project>
```
- mapper (继承pojo jar包)
```
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <parent>
        <artifactId>manong_manager</artifactId>
        <groupId>com.kendinghui</groupId>
        <version>1.0-SNAPSHOT</version>
    </parent>
    <modelVersion>4.0.0</modelVersion>
    <packaging>jar</packaging>
    <artifactId>manong_manager_mapper</artifactId>

    <dependencies>
        <dependency>
            <groupId>com.kendinghui</groupId>
            <artifactId>manong_manager_pojo</artifactId>
            <version>1.0-SNAPSHOT</version>
        </dependency>
    </dependencies>

</project>
```
- service (服务层 jar包)
```
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <parent>
        <artifactId>manong_manager</artifactId>
        <groupId>com.kendinghui</groupId>
        <version>1.0-SNAPSHOT</version>
    </parent>
    <modelVersion>4.0.0</modelVersion>
    <packaging>jar</packaging>
    <artifactId>manong_manager_service</artifactId>

    <dependencies>
        <dependency>
            <groupId>com.kendinghui</groupId>
            <artifactId>manong_manager_mapper</artifactId>
            <version>1.0-SNAPSHOT</version>
        </dependency>
    </dependencies>

</project>
```
- web (继承service war包)
```
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <parent>
        <artifactId>manong_manager</artifactId>
        <groupId>com.kendinghui</groupId>
        <version>1.0-SNAPSHOT</version>
    </parent>
    <modelVersion>4.0.0</modelVersion>
    <packaging>war</packaging>
    <artifactId>manong_manager_web</artifactId>

    <dependencies>
        <dependency>
            <groupId>com.kendinghui</groupId>
            <artifactId>manong_manager_service</artifactId>
            <version>1.0-SNAPSHOT</version>
        </dependency>
    </dependencies>

</project>
```

4. SSM的整合
- Spring --> Service
- Spring MVC --> 表现层
- [Mybatis](http://www.mybatis.org/mybatis-3/zh/index.html) -> MyBatis 是一款优秀的持久层框架，它支持定制化 SQL、存储过程以及高级映射。MyBatis 避免了几乎所有的 JDBC 代码和手动设置参数以及获取结果集。MyBatis 可以使用简单的 XML 或注解来配置和映射原生类型、接口和 Java 的 POJO（Plain Old Java Objects，普通老式 Java 对象）为数据库中的记录。
