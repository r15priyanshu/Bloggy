package bloggy.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import bloggy.dao.ProfileDao;
import bloggy.entities.Blog;
import bloggy.entities.BlogDetails;
import bloggy.entities.User;
import bloggy.helper.FileUploader;

@Service
public class ProfileService {
	@Autowired
	private ProfileDao profileDao;
	
	public boolean savePost(Blog blog,CommonsMultipartFile file,String fullpath)
	{
		try {
			FileUploader.uploadFile(file, fullpath);
			profileDao.savePost(blog);
			return true;
		}catch (Exception e) {
			System.out.println("exception in savePost");
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean updateDetailsById(int id,String name,String password)
	{
		try {
			profileDao.updateDetailsById(id, name, password);
			return true;
		}catch (Exception e) {
			System.out.println("updateDetailsById");
			e.printStackTrace();
			return false;
		}
	}
	
	
	
	public boolean deleteBlogById(int id)
	{
		try {
			profileDao.deleteBlogById(id);
			return true;
		}catch (Exception e) {
			System.out.println("exception in deleteBLogById");
			return false;
		}
	}
	
	public boolean updateBlogByBlogId(int id,String title,String body)
	{
		try {
			profileDao.updateBlogByBlogId(id, title, body);
			return true;
		}catch (Exception e) {
			System.out.println("exception in updateBlogByBlogId");
			e.printStackTrace();
			return false;
		}
	}
	
	public List<Blog> getAllBlogPostById(int id)
	{
		//System.out.println("getAllBlogPostById service:"+id);
		List<Blog> blogs=null;
		try {
			blogs=profileDao.getAllBlogPostById(id);
		}catch (Exception e) {
			System.out.println("Exception occurred in getAllBlogPostById Service:"+id);
			blogs=null;
		}
		return blogs;
	}
	
	public List<BlogDetails> getAllBlogPosts()
	{
		//System.out.println("getAllBlogPosts service");
		List<BlogDetails> blogs=null;
		try {
			blogs=profileDao.getAllBlogPosts();
		}catch (Exception e) {
			System.out.println("Exception occurred in getAllBlogPosts Service");
		}
		return blogs;
	}
	
}
