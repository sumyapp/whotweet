package whoTweetFrequently.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.slim3.controller.Controller;
import org.slim3.datastore.Datastore;

import whoTweetFrequently.meta.TwitterUserMeta;
import whoTweetFrequently.model.TwitterUser;

import com.google.appengine.api.datastore.Transaction;

public class WhoTweetFrequentlyService {

    private TwitterUserMeta t = new TwitterUserMeta();
    private static final Logger logger = Logger.getLogger(Controller.class
        .getName());

    public boolean addTwitterUser(Long twitterId, String screenName) {
        try {
            TwitterUser user =
                Datastore.query(t).filter(t.twitterId.equal(twitterId)).asSingle();
            if (user == null) {
                user = new TwitterUser();
                user.setTwitterId(twitterId);
            }
            if(user.getAccessCount() != null){
                user.setAccessCount(user.getAccessCount()+1);
            } else{
                user.setAccessCount(new Long(1));
            }
            user.setScreenName(screenName);
            user.setUpdatedAt(new Date());
            Transaction tx = Datastore.beginTransaction();
            Datastore.put(user);
            tx.commit();
        } catch (Exception e) {
            if (logger.isLoggable(Level.WARNING)) {
                logger.log(Level.WARNING, "Exception", e);
            }
            return false;
        }

        return true;
    }
    
    public ArrayList<TwitterUser> getAll(){
        ArrayList<TwitterUser> userList = (ArrayList<TwitterUser>) Datastore.query(t).asList();
        
        return userList;
    }
}
