package com.sevenget.makeplot;

import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.RList;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;

public class MakingPlot {
	public static void main(String[] args) throws REXPMismatchException{

		
		 RConnection connection = null;

		 try {
			connection = new RConnection();

			RList userData = connection.eval("data=as.data.frame(matrix( sample( 0:10 , 14 , replace=T) , ncol=7))").asList();
			double ts[] = userData.at(0).asDoubles();
			double anom[] = userData.at(1).asDoubles();
			connection.eval("meanVal <- mean("+userData+")");
			for (int i = 0; i < ts.length; i++)
			    System.out.println(new java.util.Date((long)(ts[i]*1000.0)) + ": " + anom[i]);
			
			//double mean = connection.eval("meanVal").asDouble();
			//System.out.println(mean);
		} catch (RserveException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


		/*
		 * String dirPath = System.getProperty("user.dir"); //save current
		 * directory String x = "1:10"; //save R command to variable x String y
		 * = "3*x+1+e"; //save R command to variable y
		 * 
		 * StringBuffer cmd = new StringBuffer(); //StringBuffer for cmd command
		 * cmd.append("Rscript"); cmd.append(" "); cmd.append(dirPath);
		 * cmd.append("\\"); cmd.append("savewordcloud.R"); cmd.append(" ");
		 * cmd.append(dirPath); cmd.append(" "); cmd.append(x); cmd.append(" ");
		 * cmd.append(y);
		 * 
		 * System.out.println(cmd.toString());
		 * 
		 * 
		 * Process proc = Runtime.getRuntime().exec(cmd.toString()); //execute
		 * on cmd, save process into variable proc (interaction.R is running
		 * hear)
		 * 
		 * int resultSign = proc.waitFor(); //wait for R process is over, if
		 * success return 0, else 1 or 2 or etc
		 * 
		 * if(resultSign==0){ //case success
		 * System.out.println("R operation success"); //show success message,
		 * System.out.println();
		 * 
		 * StringBuffer rOut = new StringBuffer(); //create variable rOut to get
		 * result from R String inputLine; BufferedReader inputBuf = new
		 * BufferedReader(new InputStreamReader(proc.getInputStream(),
		 * "UTF-8")); //open input stream with encoding UTF-8 while (((inputLine
		 * = inputBuf.readLine()) != null)) { //get data until the end
		 * rOut.append(inputLine); //write on variable "rOut" rOut.append("\n");
		 * //line seperator : "\n" } inputBuf.close(); //close input stream
		 * 
		 * System.out.println(rOut.toString()); //show R response }else{ //case
		 * failure System.out.println("R error : "+resultSign); }
		 */
	}
}
