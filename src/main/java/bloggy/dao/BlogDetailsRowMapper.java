package bloggy.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import bloggy.entities.BlogDetails;

public class BlogDetailsRowMapper implements RowMapper<BlogDetails> {

	public BlogDetailsRowMapper() {
	
	}

	public BlogDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
		BlogDetails blog=new BlogDetails();
		blog.setPostid(rs.getInt("id"));
		blog.setUserfullname(rs.getString("name"));
		blog.setBlogtitle(rs.getString("title"));
		blog.setBlogbody(rs.getString("body"));
		blog.setBlogimage(rs.getString("image"));
		blog.setBlogpostdate(rs.getString("postdate"));
		return blog;
	}

}
