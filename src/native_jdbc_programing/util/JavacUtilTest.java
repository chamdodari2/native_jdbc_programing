package native_jdbc_programing.util;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Map.Entry;
import java.util.Properties;
import java.util.Set;
public class JavacUtilTest {
	public static void main(String[] args) {
		JdbcUtil.getConnection();
	}

	public static Connection getConnection() { // 경로를 정해주면 파일 읽어오기 가능!!
		String propertiesPath = "db.properties";// resouces폴더의 db.properties를 읽어오려면  이방법 써야한당!!!
		try (InputStream in = ClassLoader.getSystemResourceAsStream(propertiesPath)) { // resouces폴더의 db.properties를 읽어오려면  이 이름  동일해야한다.이름이 조금이라도 틀리면 못읽어온다.
			Properties prop = new Properties();
			prop.load(in); // db.properties 파일을 읽어와서 여기에 담을거다
		System.out.println("실습1.prop > " + prop); // 읽어온걸 찍어보기
		
			//방법2
//			for(Entry<Object, Object> e :prop.entrySet()) {     //key =values 에 각각 <Object> <Object>로 ?? //entry를 쌍으로 출력하는것
//				System.out.printf("실습2.%s -> %s%n", e.getKey(),e.getValue());
//			}   
//			//방법3
//			for(Object key : prop.keySet()) {  //key만 받는거
//				System.out.print("실습3"+key + " - >");
//				System.out.println(prop.get(key));  // 키만 받는건디 왜 벨류가 출력되나?? 해시테이블의 특징임 --> 키값을 가지고 메모리 jvm에 올라와있는 주소를 함수를 통해서 주소값을 전해주면  ㅇㅇ??? 암튼 주소를 계산해서 바로 저장된 값을 가져올수 있는거임
//			}
		} catch (IOException e) {

			e.printStackTrace();
		}
		return null;
	}

}