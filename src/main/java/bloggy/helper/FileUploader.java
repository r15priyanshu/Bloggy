package bloggy.helper;

import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class FileUploader {

	public FileUploader() {
		// TODO Auto-generated constructor stub
	}
	
	public static boolean uploadFile(CommonsMultipartFile file,String path)
	{
		try {
			byte[] data = file.getBytes();
			FileOutputStream fos=new FileOutputStream(path);
			fos.write(data);
			return true;
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
	}
}
