package bloggy.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import bloggy.entities.BlogDetails;
import bloggy.entities.User;
import bloggy.helper.Message;
import bloggy.services.ProfileService;
import bloggy.services.RegisterAndLoginService;

@Controller
public class HomeController {

	@Autowired
	private RegisterAndLoginService registerAndLoginService;
	
	@Autowired
	private ProfileService profileService;

	@RequestMapping(value = {"/","/home"})
	public String home(Model model) {
		
		List<BlogDetails> allblogs=profileService.getAllBlogPosts();
		model.addAttribute("allblogs", allblogs);
		return "home";
	}

	@RequestMapping(value="/login")
	public String login(Model model) {
		return "login";
	}
	
	@RequestMapping(value="/login",method = RequestMethod.POST)
	public String login(Model model,HttpSession session,@RequestParam("email") String email,@RequestParam("password") String password) {
		System.out.println("Login Request For:"+email);
		if (registerAndLoginService.findUserByEmail(email)) {
			User user=registerAndLoginService.checkLogin(email, password);
			if(user!=null) {
				System.out.println("Login Successful For:"+email);
				session.setAttribute("user",user);
				return "redirect:/profile/"+user.getUsername();
			}else {
				System.out.println("Incorrect Password For:"+email);
				Message message = new Message("Incorrect Password!!", "error", "alert-danger");
				session.setAttribute("msg", message);
			}
		}else {
			System.out.println("Email Not Yet Registered!! For:"+email);
			Message message = new Message("Email Not Yet Registered!!", "error", "alert-danger");
			session.setAttribute("msg", message);
		}
		return "redirect:/login";
	}

	@RequestMapping(path = "/register")
	public String register(Model model) {
		return "register";
	}

	@RequestMapping(path = "register", method = RequestMethod.POST)
	public String register(Model model, HttpSession session, @RequestParam("name") String name,
			@RequestParam("email") String email, @RequestParam("username") String username,
			@RequestParam("password") String password) {
		System.out.println("Register Request For:"+email);
		User user = new User();
		user.setName(name);
		user.setEmail(email);
		user.setUsername(username);
		user.setPassword(password);
		if (registerAndLoginService.findUserByEmail(email)) {
			System.out.println("Email Already Registered!! For:"+email);
			Message message = new Message("Email Already Registered!!", "error", "alert-danger");
			session.setAttribute("msg", message);
		} else {
			if (registerAndLoginService.findUserByUsername(username)) {
				System.out.println("Username Already Taken!! For:"+email);
				Message message = new Message("Username Already Taken!!", "error", "alert-danger");
				session.setAttribute("msg", message);
			} else {
				if (registerAndLoginService.addNewUser(user)) {
					System.out.println("Register Successful For:"+email);
					Message message = new Message("Registered Successfully!!", "success", "alert-success");
					session.setAttribute("msg", message);
				} else {
					Message message = new Message("Something Went Wrong!!", "danger", "alert-danger");
					session.setAttribute("msg", message);
				}
			}
		}
		return "redirect:/register";
	}
	
	@RequestMapping(path="/logout",method=RequestMethod.GET)
	public String logout(Model model,HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user != null) {
			session.removeAttribute("user");
			Message message = new Message("Logged Out Successfully !!", "success", "alert-success");
			session.setAttribute("msg", message);
			return "redirect:/login";
		}else {
			Message message = new Message("You Are Not Logged In !!", "success", "alert-success");
			session.setAttribute("msg", message);
			return "redirect:/login";
		}
		
	}
	
	@RequestMapping(path="/checkEmail",method=RequestMethod.GET)
	public @ResponseBody String validateEmailAjax(@RequestParam("email") String email) {
		String result="";
		//System.out.println(email);
		if(registerAndLoginService.findUserByEmail(email))
		{
			result="Email Already Registered !!";
		}
		return result;		
	}
	
	@RequestMapping(path="/checkUsername",method=RequestMethod.GET)
	public @ResponseBody String validateUsernameAjax(@RequestParam("username") String username) {
		String result="";
		
		//System.out.println(username);
		
		if(registerAndLoginService.findUserByUsername(username))
		{
			result="Username Already Taken !!";
		}
		return result;		
	}
}
