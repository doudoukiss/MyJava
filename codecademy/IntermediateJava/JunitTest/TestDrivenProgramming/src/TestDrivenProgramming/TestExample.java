package TestDrivenProgramming;

import org.junit.Test;

import static org.junit.Assert.fail;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.CoreMatchers.equalTo;

public class TestExample {
  int a = 10;
  int b = -5;
  int c = 0;

  Example ex = new Example();

  @Test
  public void testIsPositive() {
    assertThat(ex.isPositive(a), equalTo(1));
    assertThat(ex.isPositive(b), equalTo(0));
    assertThat(ex.isPositive(c), equalTo(-1));
  }
}
