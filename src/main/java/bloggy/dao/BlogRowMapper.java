package bloggy.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import bloggy.entities.Blog;

public class BlogRowMapper implements RowMapper<Blog> {

	public BlogRowMapper() {
		// TODO Auto-generated constructor stub
	}

	public Blog mapRow(ResultSet rs, int rowNum) throws SQLException {
		Blog blog=new Blog();
		blog.setId(rs.getInt("id"));
		blog.setTitle(rs.getString("title"));
		blog.setImage(rs.getString("image"));
		blog.setBody(rs.getString("body"));
		blog.setUserid(rs.getInt("userid"));
		return blog;
	}

}
