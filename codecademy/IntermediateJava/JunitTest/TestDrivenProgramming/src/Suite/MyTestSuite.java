package Suite;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;
 
import TestOne;
import TestTwo;

@RunWith(Suite.class)
@Suite.SuiteClasses({
  TestOne.java,
  TestTwo.java
})
 
public class MyTestSuite {
}