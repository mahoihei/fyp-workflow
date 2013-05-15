package edu.fyp.test;

import javax.jdo.PersistenceManager;

import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.google.appengine.tools.development.testing.LocalDatastoreServiceTestConfig;
import com.google.appengine.tools.development.testing.LocalServiceTestHelper;

import edu.fyp.bean.Department;
import edu.fyp.bean.Employee;
import edu.fyp.manager.UserManager;
import edu.fyp.repository.PMF;
import edu.fyp.repository.UserRepository;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:**/dispatcherServlet-servlet.xml"})
public class UserEmployeeTest {

	
	@Autowired
	UserRepository userRepo;

    private final LocalServiceTestHelper helper =
        new LocalServiceTestHelper(new LocalDatastoreServiceTestConfig());

    @Before
    public void setUp() {
        helper.setUp();
    }

    @After
    public void tearDown() {
        helper.tearDown();
    }
    
    @Test
    public void testQueryByDeptAndLevel(){
    	PersistenceManager pm = PMF.get().getPersistenceManager();
    	Employee emp = new Employee();
    	Department dept = new Department();
    	pm.makePersistent(dept);
    	emp.setDepartment(dept.getDeptKey());
    	emp.setSuperLevel(100);
    	pm.makePersistent(emp);
    	Assert.assertTrue(userRepo.queryEmployeeByDeptKeyAndLevel(dept.getDeptKey(), 100)!=null);
    	
    }
}