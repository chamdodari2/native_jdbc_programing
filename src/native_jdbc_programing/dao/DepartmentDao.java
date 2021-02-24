package native_jdbc_programing.dao; //데이터에 접근하는 객체쓰  인터페이쓰

import java.util.List;

import native_jdbc_programing.dto.Department;
import native_jdbc_programing.dto.Employee;

public interface DepartmentDao {
	List<Department> selectDepartmentByAll();
	Department selectDepartmentByNo(Department department);
	List<Employee> selectEmplist(Department dept);
	
	int intsertDepartment(Department department); 
	int updateDepartment(Department department); 
	int deleteDepartment(int deptNo); 
//	Department selectEmplist(Department department);
	

}
