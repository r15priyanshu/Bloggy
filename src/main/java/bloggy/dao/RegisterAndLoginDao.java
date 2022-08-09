package bloggy.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import bloggy.entities.User;

@Repository
public class RegisterAndLoginDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	/*
	public boolean checkUserWithEmail(String email)
	{
		String query="Select * from user email=?";
		System.out.println(jdbcTemplate.query(query,email, null));				
	}
	public boolean checkUserWithUsername(String username)
	{
		String query="Select * from user username=?";
		System.out.println(jdbcTemplate.query(query,username, null));			
	}*/
	public int addNewUser(User user)
	{
		String query="insert into user(name,email,username,password) values(?,?,?,?)";
		return jdbcTemplate.update(query,user.getName().trim(),user.getEmail().trim(),user.getUsername().trim(),user.getPassword().trim());				
	}
	public User findUserByUsername(String username)
	{
		String query="select * from user where username=?";
		User user = jdbcTemplate.queryForObject(query,new UserRowMapper(),username.trim());
		return user;
	}
	public User findUserByEmail(String email)
	{
		String query="select * from user where email=?";
		User user = jdbcTemplate.queryForObject(query,new UserRowMapper(),email.trim());
		return user;
	}
	public User findUserById(int id)
	{
		String query="select * from user where id=?";
		User user = jdbcTemplate.queryForObject(query,new UserRowMapper(),id);
		return user;
	}
	public User checkLogin(String email,String password)
	{
		String query="select * from user where email=? and password=?";
		User user = jdbcTemplate.queryForObject(query,new UserRowMapper(),email.trim(),password.trim());
		return user;
	}
}
