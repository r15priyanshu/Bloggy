package bloggy.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bloggy.dao.RegisterAndLoginDao;
import bloggy.entities.User;

@Service
public class RegisterAndLoginService {
	
	@Autowired
	private RegisterAndLoginDao registerAndLoginDao;
	
	public boolean addNewUser(User user)
	{
		boolean flag=false;
		int result=registerAndLoginDao.addNewUser(user);
		if(result==0)
			flag=false;
		else
			flag=true;
		return flag;
	}
	
	public boolean findUserByUsername(String username)
	{
		System.out.println("findUserByUsername Service:"+username);
		boolean flag=false;
		try {
			registerAndLoginDao.findUserByUsername(username);
			flag=true;
		}catch (Exception e) {
			System.out.println("Exception occurred in findUserByUsername Service:"+username);
			flag=false;
		}
		return flag;
	}
	
	public User findUserById(int id)
	{
		User user=registerAndLoginDao.findUserById(id);
		return user;
	}
	
	public boolean findUserByEmail(String email)
	{
		System.out.println("findUserByEmail Service:"+email);
		boolean flag=false;
		try {
			registerAndLoginDao.findUserByEmail(email);
			flag=true;
		}catch (Exception e) {
			System.out.println("Exception occurred in findUserByEmail Service:"+email);
			flag=false;
		}
		return flag;
	}
	
	public User checkLogin(String email,String password)
	{
		System.out.println("checkLogin Service:"+email);
		User user=null;
		try {
			user=registerAndLoginDao.checkLogin(email,password);
		}catch (Exception e) {
			System.out.println("Exception occurred in checkLogin Service:"+email);
			user=null;
		}
		return user;
	}
}
