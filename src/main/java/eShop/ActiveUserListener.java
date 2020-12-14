package eShop;
import java.util.concurrent.atomic.AtomicInteger;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;


@WebListener
public class ActiveUserListener implements HttpSessionListener  {
    private static final AtomicInteger activeSessions = new AtomicInteger(0);
    @Override
    public void sessionCreated(HttpSessionEvent se) {
        activeSessions.incrementAndGet();
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        // activeSessions.decrementAndGet();
    }

    public static int getActiveSessions() {
        return activeSessions.get();
    }   
}
