package whoTweetFrequently.model;

import org.slim3.tester.AppEngineTestCase;
import org.junit.Test;
import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;

public class TweetCountTest extends AppEngineTestCase {

    private TweetCount model = new TweetCount();

    @Test
    public void test() throws Exception {
        assertThat(model, is(notNullValue()));
    }
}
