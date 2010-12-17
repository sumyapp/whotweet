package whoTweetFrequently.service;

import org.slim3.tester.AppEngineTestCase;
import org.junit.Test;
import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;

public class WhoTweetFrequentlyServiceTest extends AppEngineTestCase {

    private WhoTweetFrequentlyService service = new WhoTweetFrequentlyService();

    @Test
    public void test() throws Exception {
        assertThat(service, is(notNullValue()));
    }
}
