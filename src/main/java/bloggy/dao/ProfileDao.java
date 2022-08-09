package bloggy.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import bloggy.entities.Blog;
import bloggy.entities.BlogDetails;

@Repository
public class ProfileDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public int savePost(Blog blog)
	{
		String query="insert into blog(title,body,image,userid) values(?,?,?,?)";
		return jdbcTemplate.update(query,blog.getTitle(),blog.getBody(),blog.getImage(),blog.getUserid());
	}
	public int deleteBlogById(int id)
	{
		String query="delete from blog where id=?";
		return jdbcTemplate.update(query,id);
	}
	public int updateBlogByBlogId(int id,String title,String body)
	{
		String query="update blog set title=?,body=? where id=?";
		return jdbcTemplate.update(query,title,body,id);
	}
	public int updateDetailsById(int id,String name,String password)
	{
		String query="update user set name=?,password=? where id=?";
		return jdbcTemplate.update(query,name,password,id);
	}
	public List<Blog> getAllBlogPostById(int id)
	{
		String query="select * from blog where userid=? order by postdate DESC";
		List<Blog> blogs = jdbcTemplate.query(query,new BlogRowMapper(),id);
		return blogs;
	}
	
	public List<BlogDetails> getAllBlogPosts()
	{
		String query="select blog.id,user.name,title,body,image,postdate from user INNER JOIN blog ON user.id=blog.userid order by postdate DESC";
		List<BlogDetails> blogs = jdbcTemplate.query(query,new BlogDetailsRowMapper());
		return blogs;
	}
}
