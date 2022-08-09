package bloggy.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

import bloggy.dao.UserRowMapper;
import bloggy.entities.User;

public class BloggyTest {
	public static void main(String[] args) {

		ApplicationContext context = new ClassPathXmlApplicationContext("bloggy/test/config.xml");
		JdbcTemplate template = (JdbcTemplate) context.getBean("jdbcTemplateTest");
		// String query="insert into user(name,email,username,password)
		// values(?,?,?,?)";
		// System.out.println(template.update(query,"bokaal","anandpriyanshu@gmail.com","hello","dole"));

		//System.out.println(template.queryForObject("select * from user where email=? and password=?",
		//		new UserRowMapper(), "anandpriyanshu6@gmail.com", "123456"));
		String query="insert into blog(title,body,image,userid) values('anshu','paka','loka',128)";
		System.out.println(template.update(query));
	}
}
