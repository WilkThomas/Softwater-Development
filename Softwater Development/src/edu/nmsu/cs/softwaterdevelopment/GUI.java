/*
Softwater Development
Demo GUI
DEMOgui.java

Created by: Austin Fritz
Edited by: Thomas Wilkinson
10-4-2020
*/

package edu.nmsu.cs.softwaterdevelopment;

import java.io.*;
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class GUI
{
	public static void main( String args[] )
	{
		//Main frame
		JFrame mainFrame = new JFrame();
   
		//FlowLayout generates a Left to Right layout
		FlowLayout mainLayout = new FlowLayout();
		mainFrame.setLayout( mainLayout );
   
		//Array of Strings for filter
		String[] filter = { "Name", "Employee Number", "Age", "State", "Zip Code" };
   
		//Creates ComboBox component to display elements of states
		//note: ComboBox is a generic type. Be sure to specify Object type when using JComboBox
		JComboBox<String> filters = new JComboBox<String>( filter );
   
		//Creates JButton Search
		JButton search = new JButton( "Search" );
		
		//Creates default list
		DefaultListModel<String> l1 = new DefaultListModel<>();
		
		//ActionListener for search button
		search.addActionListener( new ActionListener()
		{
			public void actionPerformed( ActionEvent e )
			{
				l1.clear(); //clears a possible previously made list
				int no = 0; //line number in file
				String filter = filters.getItemAt( filters.getSelectedIndex() ); //tells what the filter selection is
				String line = ""; //saves one whole line of the file at a time
				
				try
				{
					//Uses a file reader wrapped by a bufferedreader to read the file
					FileReader fileReader = new FileReader( "test.csv" );
					BufferedReader bufferedReader = new BufferedReader( fileReader );
					
					//while the line isnt null (end of file)
					while( ( line = bufferedReader.readLine() ) != null )
					{
						//skips the first line with the column headings
						if( no == 0 )
						{
							bufferedReader.readLine();
						} //end if
						else
						{
							//saves one line of the file minus the commas
							String[] lineStr = line.split( "," );
							
							//goes through to see what the filter was and add the correct data to the list according to the filter
							if( filter.equals( "Name" ) )
							{
								l1.addElement( lineStr[ 0 ] );
							} //end if
							else if( filter.equals( "Employee Number" ) )
							{
								l1.addElement( lineStr[ 1 ] );
							} //end else if
							else if( filter.equals( "Age" ) )
							{
								l1.addElement( lineStr[ 2 ] );
							} //end else if
							else if( filter.equals( "State" ) )
							{
								l1.addElement( lineStr[ 3 ] );
							} //end else if
							else
							{
								l1.addElement( lineStr[ 4 ] );
							} //end else	
						} //end else
						
						//increase file line number to read next line
						no++;
					} //end while
					
					bufferedReader.close();
				} //end try
				catch( FileNotFoundException ex )
				{
					System.out.println( "Unable to open file 'test.csv'" );
				} //end catch
				catch( IOException ex )
				{
					System.out.println( "Error in file '" + ex.getMessage() + "'" );
				} //end catch
			} //end actionPerformed
		} ); //end actionListener
		
		// makes the list1 using l1; wrapper
		JList<String> list1 = new JList<>( l1 );
		
		//add the filter list, search button, and results list to the main frame
		mainFrame.add( filters );
		mainFrame.add( search );
		mainFrame.add( list1 );

		//creates and handles frame and its components
		mainFrame.setComponentOrientation( ComponentOrientation.LEFT_TO_RIGHT );
   
		mainFrame.setDefaultCloseOperation( WindowConstants.EXIT_ON_CLOSE ); //avoid using in final program
   
		mainFrame.setTitle( "Softwater Development PROTOTYPE 0.0" );

		//sets frame size to 480 px X 320 px and makes it visible
		mainFrame.setSize( 480, 320 );
		mainFrame.setVisible( true );
	}//end main
}//end class