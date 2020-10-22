/*
Softwater Development
Demo GUI
DEMOgui.java

Created by: Austin Fritz
Edited by: Thomas Wilkinson
10-4-2020
*/

package edu.nmsu.cs.softwaterdevelopment;

import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.sql.*;
import java.io.*;
import tech.tablesaw.api.*;
import tech.tablesaw.io.csv.CsvReadOptions;
import tech.tablesaw.plotly.Plot;
import tech.tablesaw.plotly.api.AreaPlot;
import tech.tablesaw.plotly.api.VerticalBarPlot;
import tech.tablesaw.plotly.components.Figure;
import tech.tablesaw.plotly.components.Layout;

import java.io.IOException;
import java.time.LocalDate;
import java.util.Collection;

//public class GUI {

//	private JFrame frame;

	/**
	 * Launch the application.
	 */
//	public static void main(String[] args) {
//		EventQueue.invokeLater(new Runnable() {
//			public void run() {
//				try {
//					GUI window = new GUI();
//					window.frame.setVisible(true);
//				} catch (Exception e) {
//					e.printStackTrace();
//				}
//			}
//		});
//	}
	//call the database connection class with a global connection variable
//	Connection connection = null;
	/**
	 * Create the application.
	 */
	//database connection
//	public GUI() {
//		initialize();
		//call the connection class
//		connection = sqliteConnection.dbConnector(); 
//	}

	/**
	 * Initialize the contents of the frame.
	 */
//	private void initialize() {
//		frame = new JFrame();
//		frame.setBounds(100, 100, 450, 300);
//		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
//	}

//}

public class GUI
{
	public static void main( String args[] )
	{
		/*This window opens the small window to verify the database connection
		*It can be deleted later as it is not needed -- just wanted a way to verify connection.
		*/ 
//		EventQueue.invokeLater(new Runnable() {
//			public void run() {
//				try {
//					GUI window = new GUI();
//					window.frame.setVisible(false);
//				} catch (Exception e) {
//					e.printStackTrace();
//				}
//			}
//		});
		
		//Main frame
		JFrame mainFrame = new JFrame();

		//FlowLayout generates a Left to Right layout
		FlowLayout mainLayout = new FlowLayout();
		mainFrame.setLayout( mainLayout );
   
		//Array of Strings for filter
		String[] filter = { "Table", "Chart", "Age", "State", "Zip Code" };
   
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
					FileReader fileReader = new FileReader( "/Users/ll2020/CS371/Softwater-Development/src/main/java/test.csv" );
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
							if( filter.equals( "Table" ) )
							{
								l1.addElement(createTable());

							} //end if
							else if( filter.equals( "Chart" ) )
							{
//								l1.addElement( lineStr[ 1 ] );
								createChart();
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

			public String createTable() throws IOException {
				Table table = Table.read().csv("/Users/ll2020/Desktop/USGS/test.csv");
				Table result = table.select("DATESAMPLE","TDS");
//				result.write().csv("TDSSummaryTable.csv");
				String res = result.print();
				return res;
			}

			public void createChart() throws IOException {
				Table table = Table.read().csv("/Users/ll2020/Desktop/USGS/test.csv");
				Plot.show(
						VerticalBarPlot.create(
								"TDS Summary Chart",
								table,
								"DATESAMPLE",
								Layout.BarMode.GROUP,
								"TDS"));
			}

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
	
//	private JFrame frame;
//	//call the database connection class with a global connection variable
//	Connection connection = null;
//	/**
//	 * Create the application.
//	 */
//	//database connection
//	public GUI() {
//		initialize();
//		//call the connection class
//		connection = sqliteConnection.dbConnector();
//	}
//
//	/**
//	 * Initialize the contents of the frame.
//	 */
//	private void initialize() {
//		frame = new JFrame();
//		frame.setBounds(100, 100, 450, 300);
//		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
//	}
//
//
	
}//end class


