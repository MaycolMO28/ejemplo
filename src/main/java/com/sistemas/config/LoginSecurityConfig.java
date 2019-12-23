package com.sistemas.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class LoginSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder authenticationMgr) throws Exception {
        authenticationMgr.inMemoryAuthentication()
                .withUser("lilyramirez").password("{noop}lily").authorities("ALUMNO")
                .and()
                .withUser("isabelperez").password("{noop}isabel").authorities("ALUMNO")
                .and()
                .withUser("kellysullon").password("{noop}kelly").authorities("ALUMNO")
                .and()
                .withUser("director").password("{noop}123").authorities("DIRECTOR");
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {


        http.authorizeRequests()
                .antMatchers("/docente/index").hasAnyAuthority("ALUMNO", "DIRECTOR")
                .antMatchers("/curso/index").hasAnyAuthority("ALUMNO", "DIRECTOR")
                .antMatchers("/alumno/index").hasAnyAuthority("ALUMNO", "DIRECTOR")
                .antMatchers("/docente/nuevo").hasAuthority("DIRECTOR")
                .antMatchers("/docente/editar").hasAuthority("DIRECTOR")
                .antMatchers("/docente/eliminar").hasAuthority("DIRECTOR")
                .antMatchers("/curso/nuevo").hasAuthority("DIRECTOR")
                .antMatchers("/curso/editar").hasAuthority("DIRECTOR")
                .antMatchers("/curso/eliminar").hasAuthority("DIRECTOR")
                .antMatchers("/alumno/nuevo").hasAuthority("DIRECTOR")
                .antMatchers("/alumno/editar").hasAuthority("DIRECTOR")
                .antMatchers("/alumno/eliminar").hasAuthority("DIRECTOR")
                .antMatchers("/adminPanel").hasAuthority("DIRECTOR")
                .antMatchers("/userPanel").hasAuthority("ALUMNO")
                .and()
                .formLogin().loginPage("/")
                .defaultSuccessUrl("/success")
                .failureUrl("/?error")
                .usernameParameter("username").passwordParameter("password")
                .and()
                .logout().logoutSuccessUrl("/?logout");

    }
}