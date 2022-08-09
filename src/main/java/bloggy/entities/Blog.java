package bloggy.entities;

public class Blog {
	private int id;
	private String title;
	private String body;
	private String image;
	private int userid;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	@Override
	public String toString() {
		return "Blog [id=" + id + ", title=" + title + ", body=" + body + ", image=" + image + ", userid=" + userid
				+ "]";
	}

	public Blog(String title, String body, String image, int userid) {
		super();
		this.title = title;
		this.body = body;
		this.image = image;
		this.userid = userid;
	}

	public Blog() {
		// TODO Auto-generated constructor stub
	}

}
