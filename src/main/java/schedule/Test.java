package schedule;

import java.awt.AWTException;
import java.awt.Rectangle;
import java.awt.Robot;
import java.awt.Toolkit;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

public class Test {
	static String filew;//파일 위치 저장할 문자열
	public static void main(String[] args) {

		try {
			Robot rb=new Robot();//Robot클래스 객체생성
			Rectangle rect=new Rectangle(Toolkit.getDefaultToolkit().getScreenSize());//윈도우의 사이즈로 Rectangle만들기
			BufferedImage img=rb.createScreenCapture(rect);//BufferedImag 레퍼런스에 윈도우크기만큼 캡쳐한 이미지 담기
			filew="exercise.jpg";//파일 이름 설정
			File file=new File("d:\\ex\\",filew);//파일 생성
			try {
				ImageIO.write(img, "jpg", file);//jpg파일로 만들기
			} catch (IOException e) {
				e.printStackTrace();
			}
		} 
		catch (AWTException e) {
			e.printStackTrace();
		}

	}
}
