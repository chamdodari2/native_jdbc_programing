package native_jdbc_programing.ui;

import java.awt.BorderLayout;
import java.awt.EventQueue;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.List;

import javax.swing.BoxLayout;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.SwingConstants;
import javax.swing.border.EmptyBorder;
import javax.swing.table.DefaultTableModel;

import native_jdbc_programing.dao.impl.DepartmentDaoImpl;
import native_jdbc_programing.dto.Department;

public class DepartmentUI extends JFrame implements ActionListener{

	private JPanel contentPane;
	private JPanel pDept;
	private JPanel pBtn;
	private JPanel pList;
	private JLabel lblDeptNo;
	private JTextField tfDeptNo;
	private JLabel lblDeptName;
	private JTextField tfFloor;
	private JLabel lblFloor;
	private JTextField tflblDeptName;
	private JButton btnAdd;
	private JButton btnCancel;
	private JScrollPane scrollPane;
	private JTable depttable;
	private JButton btnNewButton;
	private JButton btnNewButton_1;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					DepartmentUI frame = new DepartmentUI();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the frame.
	 */
	public DepartmentUI() {
		setTitle("부서정보");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 450, 300);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(new BoxLayout(contentPane, BoxLayout.Y_AXIS));

		//
		JPanel pDept = new JPanel();
		contentPane.add(pDept);
		pDept.setLayout(new GridLayout(0, 2, 10, 0));

		JLabel lblDeptNo = new JLabel("부서번호");
		lblDeptNo.setHorizontalAlignment(SwingConstants.RIGHT);
		pDept.add(lblDeptNo);

		tfDeptNo = new JTextField();
		pDept.add(tfDeptNo);
		tfDeptNo.setColumns(10);

		JLabel lblDeptName = new JLabel("부서명");
		lblDeptName.setHorizontalAlignment(SwingConstants.RIGHT);
		pDept.add(lblDeptName);

		tflblDeptName = new JTextField();
		tflblDeptName.setColumns(10);
		pDept.add(tflblDeptName);

		JLabel lblFloor = new JLabel("위치");
		lblFloor.setHorizontalAlignment(SwingConstants.RIGHT);
		pDept.add(lblFloor);

		tfFloor = new JTextField();
		pDept.add(tfFloor);
		tfFloor.setColumns(10);

		pBtn = new JPanel();
		contentPane.add(pBtn);

		JButton btnAdd = new JButton("추가");
		btnAdd.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				Department newdept = getDepartment();
				DepartmentDaoImpl.getInstance().intsertDepartment(newdept);
				depttable.setModel(getModel());
				JOptionPane.showMessageDialog(null, "추가 완료");
				clearTf();
			}
		});

		pBtn.add(btnAdd);
		//
		btnNewButton = new JButton("수정");
		btnNewButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				Department deptupdate = getDepartment();
				DepartmentDaoImpl.getInstance().updateDepartment(deptupdate);
				depttable.setModel(getModel());
				JOptionPane.showMessageDialog(null, "수정 완료");
				
				clearTf();
				
				
			}
			
			
			
		});
		pBtn.add(btnNewButton);
		
		btnNewButton_1 = new JButton("삭제");
		pBtn.add(btnNewButton_1);

		btnCancel = new JButton("취소");
		pBtn.add(btnCancel);

		pList = new JPanel();
		contentPane.add(pList);
		pList.setLayout(new BorderLayout(0, 0));

		scrollPane = new JScrollPane();
		pList.add(scrollPane, BorderLayout.CENTER);

		depttable = new JTable();

		depttable.setModel(getModel()); /*
									 * ;(
									 * 
									 * //값 넣기 new Object[][] { {1, "개발", 8},
									 * 
									 * }, new String[] { "부서번호", "부서명", "위치" } ));
									 */
		scrollPane.setViewportView(depttable);
	}

	public  DefaultTableModel getModel() {

		return new  DefaultTableModel(getDepartments(), getColumnnames());
	}

	public String[] getColumnnames() {

		return new String[] { "부서번호", "부서명", "위치" };
	}

	
	
	public Object[][] getDepartments() {
		List<Department> list = DepartmentDaoImpl.getInstance().selectDepartmentByAll();
		Object[][] arr = new Object[list.size()][];
		for (int i = 0; i < list.size(); i++) {
			Department dept = list.get(i);
			arr[i] = new Object[] { dept.getDeptNo(), dept.getDeptName(), dept.getFloor()

			};
		}
		return arr;
	}

//	@Override
//	public void actionPerformed(ActionEvent e) {
////		System.out.println("버튼 누름");
//		
//}

	private Department getDepartment() {
		// dept.getDeptNo(), dept.getDeptName(), dept.getDeptNo(), dept.getFloor()
		int deptno = Integer.parseInt(tfDeptNo.getText().trim());
		String depaname = tflblDeptName.getText().trim();
		int floor = Integer.parseInt(tfFloor.getText().trim());
		
		return new Department(deptno, depaname, floor);
	}


	private void clearTf() {
		tfDeptNo.setText("");
		tflblDeptName.setText("");
		tfFloor.setText("");
		
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		
	}
	}
