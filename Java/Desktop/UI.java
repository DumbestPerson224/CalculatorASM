import javax.swing.JFrame;
import javax.swing.JButton;
import javax.swing.JTextField;
public class UI{
     public static JFrame window = new JFrame();
     public static JButton button = new JButton();
     public static JTextField textField = new JTextField();
     
     public static void setVisible (boolean visible){
          window.setVisible(visible);
     }
     
     public static void addButton(){
          window.add(button);
     }

     public static void addTextField(){
          window.add(textField);
     }

     public static void setSize(int width, int height){
          window.setSize(width, height);
     }
}