package edu.mum.coffee.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
	@Autowired
	private DataSource dataSource;
	@Override
    protected void configure(HttpSecurity http) throws Exception {
        http
        
            .authorizeRequests()
                .antMatchers("/","/resources/static/**","/assets/**", "/home", "/index","/products","/resources/**", "/registration","/login","/api/**").permitAll()
                .anyRequest().authenticated()
                .and()
            .formLogin()
            .loginPage("/views/login.jsp")
          //  .usernameParameter("username")
           // .passwordParameter("password")
          .defaultSuccessUrl("/views/secure.jsp")
        //  .failureForwardUrl("/login")
          .loginProcessingUrl("/login")
            	.permitAll()
            	
            	.and()
            .logout()
            	.logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
            	.logoutSuccessUrl("/login")
                .permitAll();
             //   .and().csrf().disable();
    }

	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		/*auth.inMemoryAuthentication().withUser("amanuel@gmail.com").password("A").roles("ADMIN");
		auth.inMemoryAuthentication().withUser("tekle@gmail.com").password("T").roles("USER");*/
		
		auth.jdbcAuthentication().dataSource(dataSource)
		.usersByUsernameQuery(
			"select username,password, enabled from users where username=?")
		.authoritiesByUsernameQuery(
			"select username, role from user_roles where username=?");
	}
}