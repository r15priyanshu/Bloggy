package bloggy.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import bloggy.entities.Blog;
import bloggy.entities.User;
import bloggy.helper.FileUploader;
import bloggy.helper.Message;
import bloggy.services.ProfileService;
import bloggy.services.RegisterAndLoginService;

@Controller
public class ProfileController {
	
	@Autowired
	private ProfileService profileService;
	
	@Autowired
	private RegisterAndLoginService registerAndLoginService;

	@RequestMapping(value = "/profile/{username}")
	public String profile(Model m, HttpSession session, @PathVariable String username) {
		User user = (User) session.getAttribute("user");
		if (user != null && username.equals(user.getUsername())) {
			List<Blog> blogs=profileService.getAllBlogPostById(user.getId());
			session.setAttribute("blogs", blogs);
			return "profile";
		} else {
			return "redirect:/login";
		}
	}
	
	@RequestMapping(value = "/profile/{username}/edit",method = RequestMethod.POST)
	public String editDetails(Model m, HttpSession session, @PathVariable String username,@RequestParam("name") String name,@RequestParam("password") String password) {
		User user = (User) session.getAttribute("user");
		if (user != null && username.equals(user.getUsername())) {
			System.out.println(name+password);
			if(profileService.updateDetailsById(user.getId(), name, password))
			{
				Message msg=new Message("User Details Updated Successfully!!","success","alert-success");
				int id=user.getId();
				session.removeAttribute("user");
				user=(User)registerAndLoginService.findUserById(id);
				session.setAttribute("user",user);
				
				session.setAttribute("msg", msg);
				return "redirect:/profile/"+user.getUsername();
			}else {
				Message msg=new Message("Something Went Wrong!!","error","alert-danger");
				session.setAttribute("msg", msg);
				return "redirect:/profile/"+user.getUsername();
			}
			
		} else {
			return "redirect:/login";
		}
	}


	@RequestMapping(value = "/blog/add", method = RequestMethod.POST)
	public String addBlog(Model m, HttpSession session, @RequestParam("title") String title,
			@RequestParam("body") String body, @RequestParam("image") CommonsMultipartFile file) {
		User user = (User) session.getAttribute("user");
		Date date = new Date();
		String filename = date.getTime() + "-" + file.getOriginalFilename();
		String fullpath = session.getServletContext().getRealPath("/resources/image/uploads/") + filename;

		Blog blog = new Blog();
		blog.setTitle(title);
		blog.setBody(body);
		blog.setImage(filename);
		blog.setUserid(user.getId());
		System.out.println(blog);
		System.out.println(file);
		System.out.println(fullpath);

		if (profileService.savePost(blog, file, fullpath)) {
			Message msg=new Message("Post Added Successfully!!","success","alert-success");
			session.setAttribute("msg", msg);
		} else {
			Message msg=new Message("Something Went Wrong!!","error","alert-danger");
			session.setAttribute("msg", msg);
		}
		return "redirect:/profile/" + user.getUsername();
	}
	
	@RequestMapping(value = "/blog/delete/{id}")
	public String deleteBlog(Model m, HttpSession session, @PathVariable("id") Integer id){
		User user = (User) session.getAttribute("user");
		
		if (profileService.deleteBlogById(id)) {
			Message postmsg=new Message("One Post Deleted Successfully!!","success","alert-success");
			session.setAttribute("postmsg", postmsg);
		} else {
			Message postmsg=new Message("Something Went Wrong!!","error","alert-danger");
			session.setAttribute("postmsg",postmsg);
		}
		return "redirect:/profile/" + user.getUsername();
	}
	
	@RequestMapping(value = "/blog/edit/{id}",method = RequestMethod.POST)
	public String editBlog(Model m, HttpSession session, @PathVariable("id") Integer id,@RequestParam("editTitle") String title,@RequestParam("editBody") String body){
		User user = (User) session.getAttribute("user");
		if (profileService.updateBlogByBlogId(id,title,body)) {
			Message postmsg=new Message("One Post Edited Successfully!!","success","alert-success");
			session.setAttribute("postmsg", postmsg);
		} else {
			Message postmsg=new Message("Something Went Wrong!!","error","alert-danger");
			session.setAttribute("postmsg",postmsg);
		}
		return "redirect:/profile/" + user.getUsername();
	}
	
	
}
