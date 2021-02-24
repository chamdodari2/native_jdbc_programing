package native_jdbc_programing.util;

//import static org.junit.Assert.*;  //빼
import java.sql.Connection;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Assert; // ???
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

public class JdbcUtilTest {

	@BeforeClass
	public static void setUpBeforeClass() throws Exception { //1 수행순서
		System.out.printf("%s()%n","setUpBeforeClass");
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {//5
		System.out.printf("%s()%n","tearDownAfterClass");
	}

	@Before
	public void setUp() throws Exception {//2 메소드 실행되면 이게 호출
		System.out.printf("%s()%n","setUp");
	}

	@After
	public void tearDown() throws Exception {//4
		System.out.printf("%s()%n","tearDown");
	}

	@Test
	public void testGetConnection() {//3
		System.out.printf("%s()%n","testGetConnection");
		Connection con = null;//JdbcUtil.getConnection();
		System.out.println("con >" + con);
		Assert.assertNull(con);
	}

}
