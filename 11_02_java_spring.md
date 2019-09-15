# [Spring的使用](https://spring.io/)
1. 定义配置 用在配置类 
- @Configuration
- @ComponentScan

2. 定义组件 自动装配
- @Component
- @Autowired 自动装配
- @Autowired(required = false)

3. 自动装配歧义性解决方案
- @Primary 在声明类的时候使用，并且只能用一次
- @Qualifier

4. 分层架构中定义组件, 和@Component一样，但是可以更清晰的定义组优缺点类型
- @Controller
- @Service
- @Repository

5. Spring测试环境 
- @RunWith
- @ContextConfiguration

6. 使用xml启动组件扫描
- <context:component-scan base-package=".."/>

7. demo pom依赖的配置
```
<dependencies>
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-context</artifactId>
            <version>4.3.13.RELEASE</version>
        </dependency>

        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-test</artifactId>
            <version>4.3.13.RELEASE</version>
        </dependency>

        <dependency>
            <groupId>log4j</groupId>
            <artifactId>log4j</artifactId>
            <version>1.2.17</version>
        </dependency>

        <dependency>
            <groupId>junit</groupId>
            <artifactId>junit</artifactId>
            <version>4.12</version>
            <scope>test</scope>
        </dependency>

</dependencies>
```

# javaConfig配置
- @Configuration
- @Bean

2. 依赖注入
- 构造函数
- setter
- 任意方法

3. 装配过程的歧义性
- 和自动装配一样

4. spring上下文bean作用域
```
@Component
@Scope(ConfigurableBeanFactory.SCOPE_PROTOTYPE) //不是单例
```

5. 懒加载
```
@Lazy
```

