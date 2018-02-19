package com.sevenget.makeplot;

// 실행 전 Rserve.R 반드시 실행시키기
import org.rosuda.REngine.REXP;
import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.REngineException;
import org.rosuda.REngine.RList;
import org.rosuda.REngine.Rserve.RConnection;
import org.rosuda.REngine.Rserve.RserveException;

public class MakingPlot {
	
	public static void main(String[] args) throws REXPMismatchException, REngineException {

		RConnection connection = null;
		connection = new RConnection();

		RList dataframe = connection.eval("{data=as.data.frame(matrix( sample( 0:10 , 14 , replace=T) , ncol=7))}").asList();
		connection.eval("colnames(data)=c('연애' , '결혼' , '육아 및 출산' , '꿈' , '희망', '내집마련', '인간관계' )");
		connection.eval("rownames(data)=paste('mister' , letters[1:2] , sep='-')");
		connection.eval("data=rbind(rep(10,7) , rep(0,7) , data)");
		connection.eval("colors_border=c(rgb(173/255, 215/255, 46/255,0.9), rgb(101/255, 78/255, 163/255,0.9))");
		connection.eval("colors_in=c( rgb(193/255, 239/255, 56/255,0.4), rgb(195/255, 188/255, 210/255,0.4))");
		connection.eval("library(ggplot2)");
		connection.eval("library(fmsb)");
		connection.eval("setwd('C:/Users/user/git/finpjt/sevenget/src/main/webapp/resources/img/plots')"); // 저장 장소 설정
		connection.eval("png(filename = 'radarchart.png', width = 510, height = 400)"); // plot의 너비와 높이는 언제든지 변경가능!
		connection.eval("radarchart( data  , axistype=1 , seg = 5, pcol=colors_border , pfcol=colors_in , plwd=4 , plty=1, cglcol='grey', cglty=1, axislabcol='grey', caxislabels=seq(0,10,2), cglwd=0.8,vlcex=0.8)");
		connection.eval("legend(x=0.7, y=1.3, legend = rownames(data[-c(1,2),]), bty = 'n', pch=20 , col=colors_in , text.col = 'grey', cex=1.2, pt.cex=3)");
		connection.eval("dev.off ()");
		System.out.println("=========================");

		int cols = dataframe.size();
		int rows = dataframe.at(0).length();
		String[][] s = new String[cols][];

		for (int i = 0; i < cols; i++) {
			s[i] = dataframe.at(i).asStrings();
		}

		for (int i = 0; i < cols; i++) {
			for (int j = 0; j < rows; j++) {
				System.out.print(s[i][j]+" ");
			}
			System.out.println();
		}
		
		
		//double[] userData = { 6, 7, 5, 7, 3, 6, 2 };
		//double[] companyData = { 1, 10, 10, 3, 1, 5, 7 };
		
	}
}
