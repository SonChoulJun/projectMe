package test;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.apache.sanselan.ImageReadException;

import kr.co.bitcamp.common.util.MetadataExample;

public class PhotoMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		    // retrieve image
		    File outputfile = new File("C:/Users/BitCamp/git-realProject/projectMe/MyProject/src/main/webapp/html/assets/img/uploadedPhoto/20161122_113233.jpg");
		    
		    try {
				MetadataExample.metadataExample(outputfile);
			} catch (ImageReadException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	

	}

}
