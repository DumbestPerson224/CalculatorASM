import javax.swing.JFrame;
public class UI{
     public static JFrame frame;
     
     public static void setSize(int width, int height){
          frame.setSize(width, height);
     }

     public static void setVisible(boolean visible){
          frame.setVisible(visible);
     }

     public static boolean isVisible(){
          return frame.isVisible();
     }

     public static void show(){
          frame.show();
     }
}
