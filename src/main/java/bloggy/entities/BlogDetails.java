package bloggy.entities;

public class BlogDetails {

	private int postid;
	private String userfullname;
	private String blogtitle;
	private String blogbody;
	private String blogimage;
	private String blogpostdate;
	
	public int getPostid() {
		return postid;
	}

	public void setPostid(int postid) {
		this.postid = postid;
	}

	public String getUserfullname() {
		return userfullname;
	}

	public void setUserfullname(String username) {
		this.userfullname = username;
	}

	public String getBlogtitle() {
		return blogtitle;
	}

	public void setBlogtitle(String blogtitle) {
		this.blogtitle = blogtitle;
	}

	public String getBlogbody() {
		return blogbody;
	}

	public void setBlogbody(String blogbody) {
		this.blogbody = blogbody;
	}

	public String getBlogimage() {
		return blogimage;
	}

	public void setBlogimage(String blogimage) {
		this.blogimage = blogimage;
	}

	public String getBlogpostdate() {
		return blogpostdate;
	}

	public void setBlogpostdate(String blogpostdate) {
		this.blogpostdate = blogpostdate;
	}

	@Override
	public String toString() {
		return "BlogDetails [postid=" + postid + ", username=" + userfullname + ", blogtitle=" + blogtitle + ", blogbody="
				+ blogbody + ", blogimage=" + blogimage + ", blogpostdate=" + blogpostdate + "]";
	}

	public BlogDetails() {
	}

}
