package TestDrivenProgramming;

import org.junit.Test;

import static org.junit.Assert.fail;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.CoreMatchers.equalTo;

public class TestExample2 {
  Example ex = new Example2();

  @Test
  public void testFactorial() {
    assertThat(ex.factorial(4), equalTo(24));
    assertThat(ex.factorial(5), equalTo(120));
    assertThat(ex.factorial(1), equalTo(1));
    assertThat(ex.factorial(0), equalTo(1));
  }
}