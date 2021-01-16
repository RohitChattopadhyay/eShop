# Internet Technology Lab: Assignment 4 Report
Name: *Rohit Rajat Chattopadhyay*  
Roll: *001710501073*  
Date: *21st December,2020*  
Batch: *A3*  

## Problem Statement
Design an online apparel store using servlets. The store keeps records for its items in a database where some items may be discounted and some other items should be displayed as “new arrivals”. A user may search for a specific item. By default, when a user signs in, based on his/her profile (male/female etc.), show him/her preferred set of clothing. Users will be divided into two groups: some users looking for discounted items mainly, some others looking for new arrivals. So, depending on their preference already set in the database, their shopping experience would be different. 

You may apply the concept of session and cookies for tracking user behaviour. You may use *SessionListener* and/or *ServletContextListener*. Database connectivity code should not be hardcoded in any servlet.

## Solution Approach

The solution follows a MVC pattern.

Authentication is handled using `WebFilter`. All requests are passed through the filter and on accessing restricted pages, the unauthorized users is redirected to the Login/Register page.

Database connectivity, context parameters are taken from `web.xml` file and the connection is made by `ServletContextListener`  and stored in context attribute for further use.

The database is a `MySQL` database.

### Database Schema
![](https://i.imgur.com/bgp2fbk.png)

### User Tracking
The Recommendations in home page is shuffled as per user search history, by calculating the categories of the results returned by search requests.

### Online User Counter
Implemented using `HttpSessionListener`  
```java
@WebListener
public class ActiveUserListener implements HttpSessionListener  {
    private static final AtomicInteger activeSessions = new AtomicInteger(0);
    @Override
    public void sessionCreated(HttpSessionEvent se) {
        activeSessions.incrementAndGet();
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        activeSessions.decrementAndGet();
    }

    public static int getActiveSessions() {
        return activeSessions.get();
    }   
}
```

## User Interface

**UI Components**  
![](https://i.imgur.com/RDHR3Xb.png)

**Registration Page**  
![](https://i.imgur.com/csqzdpv.png)

**Login Page**  
![](https://i.imgur.com/qCkTwFt.png)

**Form Validation**  
![](https://i.imgur.com/3brvyXL.png)

**Search Page**  
![](https://i.imgur.com/Oixy46G.png)
