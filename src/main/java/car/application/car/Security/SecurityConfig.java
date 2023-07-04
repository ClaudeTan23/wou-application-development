package car.application.car.Security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig
{
    @Bean
    public PasswordEncoder encoder()
    {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception
    {
        http.authorizeRequests()
            .antMatchers(HttpMethod.GET, "/").permitAll()
            .antMatchers(HttpMethod.GET, "/css/**").permitAll()
            .antMatchers(HttpMethod.GET, "/js/**").permitAll()
            .antMatchers(HttpMethod.GET, "/about").permitAll()
            .antMatchers(HttpMethod.GET, "contact").permitAll()
            .antMatchers(HttpMethod.GET, "/login").permitAll()
            .antMatchers(HttpMethod.POST, "/register").permitAll()
            .antMatchers(HttpMethod.GET, "/cars/**").hasAnyAuthority("user", "admin")
            .antMatchers(HttpMethod.GET, "/car/**").hasAnyAuthority("user", "admin")
            .antMatchers(HttpMethod.GET, "/car").hasAnyAuthority("user", "admin")
            .antMatchers(HttpMethod.POST, "/update-user").hasAnyAuthority("user", "admin")
            .antMatchers(HttpMethod.POST, "/upload-car").hasAnyAuthority("user", "admin")
            .antMatchers(HttpMethod.POST, "/approve-bid").hasAnyAuthority("user", "admin")
            .antMatchers(HttpMethod.POST, "/deactivate").hasAnyAuthority("user", "admin")
            .antMatchers(HttpMethod.GET, "/cars").hasAnyAuthority("user", "admin")
            .antMatchers(HttpMethod.GET, "/mycar").hasAnyAuthority("user", "admin")
            .antMatchers(HttpMethod.GET, "/myappointment").hasAnyAuthority("user", "admin")
            .antMatchers(HttpMethod.GET, "/users").hasAnyAuthority("admin")
            .and()
        .formLogin()
            .loginPage("/login")
            .loginProcessingUrl("/login")
            .defaultSuccessUrl("/", true)
            .usernameParameter("password")
            .passwordParameter("password")
            .permitAll()
            .and()
        .exceptionHandling()
            .accessDeniedPage("/403")
            .and()
        .logout()
            .logoutUrl("/logout")
            .logoutSuccessUrl("/")
            .deleteCookies();

        return http.build();

    }
}
