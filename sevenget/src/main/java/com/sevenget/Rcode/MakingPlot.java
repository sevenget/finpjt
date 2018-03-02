package com.sevenget.Rcode;

import java.util.ArrayList;
import java.util.List;

import org.rosuda.REngine.REXPMismatchException;
import org.rosuda.REngine.REngineException;
import org.rosuda.REngine.RList;
import org.rosuda.REngine.Rserve.RConnection;

import model.companySco.CompanyScoDto;

// 실행 전 Rserve.R 반드시 실행시키기

public class MakingPlot {
	
	public String mPlot(CompanyScoDto CScoDto) throws REXPMismatchException, REngineException {
		System.out.println("mplot "+CScoDto.getCid());
		RConnection connection = null;
		connection = new RConnection();
		
		// library
		connection.eval("library(ggplot2)");
		connection.eval("library(fmsb)");
		
		// DB에서 받아온 데이터 집어넣기
		System.out.println("데이터 집어넣기1");
		RList dataframe = connection.eval("{data=as.data.frame(rbind( c(1,2,3,4,5,6,7), c("
		+CScoDto.getDateSco()+","+CScoDto.getMarrySco()+","+CScoDto.getBabySco()+","+CScoDto.getHouseSco()+","+CScoDto.getRelationSco()+","+CScoDto.getDreamSco()+","+CScoDto.getHopeSco()+
		")))}").asList();
		System.out.println("데이터 집어넣기2");
		connection.eval("colnames(data)=c('연애' , '결혼' , '육아 및 출산', '인간관계' , '내집마련', '꿈' , '희망' )"); // 컬럼명은 이것으로 고정.
		connection.eval("rownames(data)=paste('mister' , letters[1:2] , sep='-')"); //회사와 사용자로 변경하기
		connection.eval("data=rbind(rep(10,7) , rep(0,7) , data)"); //DB에서 받아온 데이터 삽입 구간. 회사와 사용자의 7가지 점수가 들어갈 예정.
		
		// plot 그래픽 설정 및 파일 저장
		connection.eval("colors_border=c(rgb(173/255, 215/255, 46/255,0.9), rgb(101/255, 78/255, 163/255,0.9))");
		connection.eval("colors_in=c( rgb(193/255, 239/255, 56/255,0.4), rgb(195/255, 188/255, 210/255,0.4))");
		connection.eval("setwd('C:/Users/user/git/finpjt/sevenget/src/main/webapp/resources/img/plots')"); // 저장 장소 설정
		
		System.out.println("=====================");
		System.out.println(CScoDto.getCid());
		System.out.println("=====================");
		
		
		
		connection.eval("png(filename = 'radarchart"+CScoDto.getCid()+".png', width = 510, height = 400)"); // plot의 너비와 높이는 언제든지 변경가능!
		connection.eval("par(mar=c(1,1,1,1))");
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
		/*List<Object> data = new ArrayList<Object>();
		data.add("radarchart"+CScoDto.getCid()+".png");
		data.add(CScoDto.getCid());*/
		return "radarchart"+CScoDto.getCid()+".png";//data
	}
}
