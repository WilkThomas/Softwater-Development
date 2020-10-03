/*
   Softwater Development
   Demo GUI
   DEMOgui.java
   
   Created by: Austin Fritz
   Edited by: Austin Fritz
   10-3-2020
*/

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class DEMOgui{
   
   public static void main(String args[]){
   
      //Main frame
      JFrame mainFrame = new JFrame();
      
      //FlowLayout generates a Left to Right layout
      FlowLayout mainLayout = new FlowLayout();
      mainFrame.setLayout(mainLayout);
      
      //Array of Strings
      String[] states = {"New Mexico", "Texas", "Utah", "Arizona", "Colorado"};
      
      //Creates ComboBox component to display elements of states
      //note: ComboBox is a generic type. Be sure to specify Object type when using JComboBox
      JComboBox<String> southwest = new JComboBox<String>(states);
      
      //Creates JButton Confirm
      //Will need to be given an ActionListener
      JButton confirm = new JButton("Confirm");
      
      //Creates JLabel
      JLabel display = new JLabel("Display info here");
   
      //experiment buttons
      mainFrame.add(southwest);
      mainFrame.add(confirm);
      mainFrame.add(display);
   
      //creates and handles frame and its components
      mainFrame.setComponentOrientation(ComponentOrientation.LEFT_TO_RIGHT);
      
      mainFrame.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE); //avoid using in final program
      
      mainFrame.setTitle("Softwater Development PROTOTYPE 0.0");
   
      //sets frame size to 480 px X 320 px and makes it visible
      mainFrame.setSize(480, 320);
      mainFrame.setVisible(true);
   
   }//end main
   
}//end class