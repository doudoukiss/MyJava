package com.seattle.mhl.service;

import com.seattle.mhl.dao.EmployeeDAO;
import com.seattle.mhl.domain.Employee;

public class EmployeeService {

    private EmployeeDAO employeeDAO = new EmployeeDAO();

    public Employee getEmployeeByIdAndPwd(String empId, String pwd) {
        return employeeDAO.querySingle("select * from employee where empId=? and pwd=md5(?)", Employee.class, empId, pwd);

    }
}
