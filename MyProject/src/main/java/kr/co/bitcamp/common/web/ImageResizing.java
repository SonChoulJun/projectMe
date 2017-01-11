package kr.co.bitcamp.common.web;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.MediaTracker;
import java.awt.Toolkit;
import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
 
import javax.imageio.ImageIO;
import javax.swing.ImageIcon;
 
public class ImageResizing {
       public static Image resizing(Image soruce, int width, int height)
                    throws Exception {
             int newW = width;
             int newH = height;
 
             return soruce.getScaledInstance(newW, newH, Image.SCALE_SMOOTH);
       }
 
       public static void photoResizeing(String imgref,int size) {
             String imgResdFile = imgref;
             String imgWriteFile = imgref;
 
             try {
                    // img = ImageIO.read( new File(fName));
                    FileInputStream fis = new FileInputStream(imgResdFile);
                    byte[] data = new byte[fis.available()];
                    System.out.println(fis.available());
                    fis.read(data);
                    fis.close();
                    Image img = new ImageIcon(imgResdFile).getImage();
                    System.out.println( img.getWidth(null) + "," +img.getHeight(null) );
                    double w =img.getWidth(null);
                    double h =img.getHeight(null);
                    while(true){
                      if(w>=size || h>=size){
                          w =w*0.8;
                          h =h*0.8;
                          
                      }else{
                          break;
                      }
                    }
                    int ww=(int)w;
                    int hh=(int)h;
                    System.out.println(ww+"ss"+hh);
                    Image image = Toolkit.getDefaultToolkit().createImage(data);
                    Image rtnImage = resizing(image, ww, hh);
 
                    MediaTracker tracker = new MediaTracker(new java.awt.Frame());
                    tracker.addImage(rtnImage, 0);
                    tracker.waitForAll();
 
                    BufferedImage bi = new BufferedImage(rtnImage.getWidth(null),
                                 rtnImage.getHeight(null), BufferedImage.TYPE_INT_RGB);
                    Graphics g = bi.getGraphics();
                    g.drawImage(rtnImage, 0, 0, null);
                    g.dispose();
                    ByteArrayOutputStream bas = new ByteArrayOutputStream();
                    ImageIO.write(bi, "jpeg", bas);
                    byte[] writeData = bas.toByteArray();
 
                    DataOutputStream dos = new DataOutputStream(
                                 new BufferedOutputStream(new FileOutputStream(imgWriteFile)));
                    dos.write(writeData);
                    dos.close();
 
             } catch (Exception e) {
                    e.printStackTrace();
             }
       }
}