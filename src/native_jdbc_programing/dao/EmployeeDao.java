package native_jdbc_programing.dao;

import java.util.List;

import native_jdbc_programing.dto.Employee;

public interface EmployeeDao { //인터페이스 선언
	
	//멤버메소드 선언
	
	List<Employee> selectEmployeeByAll();  //반환타입 : Employee dto 타입의 List  메소드: employee의 모든것을 검색하는 메소드. 매개변수 없다
	Employee selectEmployeeByNo(Employee Employee);    // employee에 대한것을 숫자로 검색하는 메소드 매개변수는 employee로 받는다.
	
	int insertEmployee(Employee employee);  // 반환타입 : int 매개변수를 받아서 검색한다
	int updateEmployee(Employee employee);
	int deleteEmployee(Employee employee); //int에서 변경
	
	
	

}
