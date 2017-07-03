package com.raulbuzila.config;

import com.raulbuzila.dao.*;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

import javax.sql.DataSource;

@EnableWebMvc
@Configuration
@ComponentScan({"com.raulbuzila.web.*"})
@Import({ SecurityConfig.class })
public class MvcConfiguration extends WebMvcConfigurerAdapter {

    // bean and connection to database
    @Bean(name="dataSource")
    public DataSource getDataSource() {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("com.mysql.jdbc.Driver");
        dataSource.setUrl("jdbc:mysql://localhost:3306/loginform");
        dataSource.setUsername("root");
        dataSource.setPassword("");

        return dataSource;
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/resources/**").addResourceLocations("/WEB-INF/resources/");
    }

	@Bean
	public InternalResourceViewResolver viewResolver() {
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setViewClass(JstlView.class);
		viewResolver.setPrefix("/WEB-INF/pages/");
		viewResolver.setSuffix(".jsp");
		return viewResolver;
	}

	@Bean
	public ProductDAO getProductDAO(){return new ProductDAOImpl(getDataSource());}

	@Bean
	public ProductTypeDAO getProductTypeDAO(){return new ProductTypeImpl(getDataSource());}

    @Bean
    public UserProductDAO getUserProductDAO(){return new UserProductImpl(getDataSource());}

    @Bean
    public UserDAO getUserDAO(){return new UserDAOImpl(getDataSource());}

    @Bean
    public CommentDAO getCommentDAO(){return new CommentDAOImpl(getDataSource());}

  @Bean
  public ReviewDAO getReviewDAO(){return new ReviewDAOImpl(getDataSource());}
}