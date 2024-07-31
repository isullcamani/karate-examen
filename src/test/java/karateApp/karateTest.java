package karateApp;

import com.intuit.karate.junit5.Karate;

class karateTest {
    
    @Karate.Test
    Karate testAll() {
        return Karate.run().relativeTo(getClass());
    } 

}
